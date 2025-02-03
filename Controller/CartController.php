<?php
session_start();
require_once __DIR__ . '/../config.php';

function addToCart($pdo, $product_id, $category, $quantity = 1) {
    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'] = array();
    }
    
    $cart_key = $category . '_' . $product_id;

    $stmt = $pdo->prepare("SELECT * FROM products WHERE id = ?");
    $stmt->execute([$product_id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($product) {
        if (isset($_SESSION['cart'][$cart_key])) {
            $_SESSION['cart'][$cart_key]['quantity'] += $quantity;
        } else {
            $_SESSION['cart'][$cart_key] = [
                'id' => $product_id,
                'name' => $product['name'],
                'price' => $product['price'],
                'quantity' => $quantity
            ];
            
            if ($category === 'promos') {
                $stmt = $pdo->prepare("SELECT discounted_price, original_price FROM promos WHERE product_id = ?");
                $stmt->execute([$product_id]);
                $promo = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($promo) {
                    $_SESSION['cart'][$cart_key]['discounted_price'] = $promo['discounted_price'];
                    $_SESSION['cart'][$cart_key]['original_price'] = $promo['original_price'];
                }
            }
        }
        return true;
    }
    return false;
}

function removeFromCart($product_id, $category) {
    $cart_key = $category . '_' . $product_id;
    if (isset($_SESSION['cart'][$cart_key])) {
        unset($_SESSION['cart'][$cart_key]);
        return true;
    }
    return false;
}

function updateCartQuantity($product_id, $category, $quantity) {
    $cart_key = $category . '_' . $product_id;
    if (isset($_SESSION['cart'][$cart_key])) {
        if ($quantity > 0) {
            $_SESSION['cart'][$cart_key]['quantity'] = $quantity;
        } else {
            unset($_SESSION['cart'][$cart_key]);
        }
        return true;
    }
    return false;
}

function getCartTotal() {
    $total = 0;
    if (isset($_SESSION['cart'])) {
        foreach ($_SESSION['cart'] as $item) {
            $price = isset($item['discounted_price']) ? $item['discounted_price'] : $item['price'];
            $total += $price * $item['quantity'];
        }
    }
    return $total;
}

function clearCart() {
    $_SESSION['cart'] = array();
    return true;
}
?>