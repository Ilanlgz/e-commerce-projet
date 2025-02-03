<?php

function getCart($pdo, $user_id) {
    $query = 'SELECT * FROM carts WHERE user_id = ?';
    $stmt = $pdo->prepare($query);
    $stmt->execute([$user_id]);
    $cart = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($cart) {
        $query = 'SELECT p.id, p.nom, p.description, p.image, p.prix, ci.quantity 
                  FROM cart_items ci 
                  JOIN products p ON ci.product_id = p.id 
                  WHERE ci.cart_id = ?';
        $stmt = $pdo->prepare($query);
        $stmt->execute([$cart['id']]);
        $cart['items'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $cart;
    }
    return null;
}

function addToCart($pdo, $user_id, $product_id, $quantity = 1) {
 
    $query = 'SELECT id FROM carts WHERE user_id = ?';
    $stmt = $pdo->prepare($query);
    $stmt->execute([$user_id]);
    $cart = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$cart) {
        $query = 'INSERT INTO carts (user_id) VALUES (?)';
        $stmt = $pdo->prepare($query);
        $stmt->execute([$user_id]);
        $cart_id = $pdo->lastInsertId();
    } else {
        $cart_id = $cart['id'];
    }

 
    $query = 'INSERT INTO cart_items (cart_id, product_id, quantity) 
              VALUES (?, ?, ?) 
              ON DUPLICATE KEY UPDATE quantity = quantity + ?';
    $stmt = $pdo->prepare($query);
    $stmt->execute([$cart_id, $product_id, $quantity, $quantity]);
}

function removeFromCart($pdo, $user_id, $product_id) {
    $query = 'DELETE ci FROM cart_items ci 
              JOIN carts c ON ci.cart_id = c.id 
              WHERE c.user_id = ? AND ci.product_id = ?';
    $stmt = $pdo->prepare($query);
    $stmt->execute([$user_id, $product_id]);
}

function updateCartQuantity($pdo, $user_id, $product_id, $quantity) {
    if ($quantity <= 0) {
        removeFromCart($pdo, $user_id, $product_id);
        return;
    }

    $query = 'UPDATE cart_items ci 
              JOIN carts c ON ci.cart_id = c.id 
              SET ci.quantity = ? 
              WHERE c.user_id = ? AND ci.product_id = ?';
    $stmt = $pdo->prepare($query);
    $stmt->execute([$quantity, $user_id, $product_id]);
}

function clearCart($pdo, $user_id) {
    $query = 'DELETE ci FROM cart_items ci 
              JOIN carts c ON ci.cart_id = c.id 
              WHERE c.user_id = ?';
    $stmt = $pdo->prepare($query);
    $stmt->execute([$user_id]);
}