<?php

class Cart {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function getCart($user_id) {
        // Récupérer le panier de l'utilisateur
        $query = 'SELECT * FROM carts WHERE user_id = :user_id';
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->execute();
        $cart = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($cart) {
            // Récupérer les articles du panier
            $query = 'SELECT p.id, p.nom, p.description, p.image, p.prix, ci.quantity 
                      FROM cart_items ci 
                      JOIN products p ON ci.product_id = p.id 
                      WHERE ci.cart_id = :cart_id';
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':cart_id', $cart['id']);
            $stmt->execute();
            $cart['items'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        return $cart;
    }

    public function addToCart($cart_id, $product_id, $quantity) {
        // Vérifier si l'article est déjà dans le panier
        $query = 'SELECT * FROM cart_items WHERE cart_id = :cart_id AND product_id = :product_id';
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':cart_id', $cart_id);
        $stmt->bindParam(':product_id', $product_id);
        $stmt->execute();
        $item = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($item) {
            // Mettre à jour la quantité de l'article existant
            $query = 'UPDATE cart_items SET quantity = quantity + :quantity WHERE cart_id = :cart_id AND product_id = :product_id';
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':quantity', $quantity);
            $stmt->bindParam(':cart_id', $cart_id);
            $stmt->bindParam(':product_id', $product_id);
        } else {
            // Ajouter un nouvel article au panier
            $query = 'INSERT INTO cart_items (cart_id, product_id, quantity) VALUES (:cart_id, :product_id, :quantity)';
            $stmt = $this->pdo->prepare($query);
            $stmt->bindParam(':cart_id', $cart_id);
            $stmt->bindParam(':product_id', $product_id);
            $stmt->bindParam(':quantity', $quantity);
        }

        return $stmt->execute();
    }
}
?>