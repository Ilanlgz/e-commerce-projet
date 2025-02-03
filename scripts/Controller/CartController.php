<?php

require_once '../Model/Cart.php';
require_once 'config.php';

class CartController {
    private $cartModel;

    public function __construct($pdo) {
        $this->cartModel = new Cart($pdo);
    }

    public function viewCart($user_id) {
        return $this->cartModel->getCart($user_id);
    }

    public function addToCart($cart_id, $product_id, $quantity) {
        if ($this->cartModel->addToCart($cart_id, $product_id, $quantity)) {
            echo "Produit ajouté au panier avec succès.";
        } else {
            echo "Erreur lors de l'ajout du produit au panier.";
        }
    }
}
?>