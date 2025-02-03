<?php

require_once __DIR__ . '/../config.php';


function getProductPrice($pdo, $product_id, $original_price) {
    $stmt = $pdo->prepare('SELECT discounted_price FROM promos 
                          WHERE product_id = ? 
                          AND start_date <= CURRENT_DATE 
                          AND end_date >= CURRENT_DATE');
    $stmt->execute([$product_id]);
    $promo = $stmt->fetch(PDO::FETCH_ASSOC);
    
    return $promo ? $promo['discounted_price'] : $original_price;
}



function addToCart($pdo, $product_id, $category, $quantity = 1) {
    $stmt = $pdo->prepare('SELECT * FROM products WHERE id = ?');
    $stmt->execute([$product_id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($product) {
        $cart_key = $category . '_' . $product_id;
        $_SESSION['cart'][$cart_key] = [
            'id' => $product_id,
            'name' => $product['name'],
            'price' => $product['price'],
            'quantity' => $quantity
        ];
    }
}

function getAllProducts($pdo) {
    $query = 'SELECT * FROM products';
    $stmt = $pdo->query($query);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getProductById($pdo, $id) {
    $query = 'SELECT id, name, description, image, price FROM products WHERE id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function getPromotionalProducts($pdo) {
    $stmt = $pdo->query('SELECT p.id, p.name, p.description, p.image, p.price AS original_price, pr.discounted_price, pr.start_date, pr.end_date 
                         FROM products p 
                         JOIN promos pr ON p.id = pr.product_id 
                         WHERE pr.discounted_price IS NOT NULL');
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getPromotionalProductById($pdo, $id) {
    $query = 'SELECT p.id, p.name, p.description, p.image, p.price AS original_price, pr.discounted_price, pr.start_date, pr.end_date 
              FROM products p 
              JOIN promos pr ON p.id = pr.product_id 
              WHERE p.id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function createProduct($pdo, $name, $description, $image, $original_price, $discounted_price, $category_id) {
    $query = 'INSERT INTO products (name, description, image, price, category_id, created_at) VALUES (:name, :description, :image, :price, :category_id, NOW())';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':image', $image);
    $stmt->bindParam(':price', $original_price);
    $stmt->bindParam(':category_id', $category_id);
    $stmt->execute();

    $product_id = $pdo->lastInsertId();

    if ($discounted_price !== null) {
        $query = 'INSERT INTO promos (product_id, discounted_price, start_date, end_date) VALUES (:product_id, :discounted_price, NOW(), DATE_ADD(NOW(), INTERVAL 1 MONTH))';
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':product_id', $product_id);
        $stmt->bindParam(':discounted_price', $discounted_price);
        $stmt->execute();
    }

    return $product_id;
}
?>