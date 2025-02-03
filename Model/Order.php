<?php

function getAllOrders($pdo) {
    $query = 'SELECT * FROM orders';
    $stmt = $pdo->query($query);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function createOrder($pdo, $user_id, $total) {
    $query = 'INSERT INTO orders (user_id, total) VALUES (:user_id, :total)';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':total', $total);
    return $stmt->execute();
}

?>