<?php

class Order {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function getAllOrders() {
        $query = 'SELECT * FROM orders';
        $stmt = $this->pdo->query($query);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function createOrder($user_id, $total) {
        $query = 'INSERT INTO orders (user_id, total) VALUES (:user_id, :total)';
        $stmt = $this->pdo->prepare($query);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->bindParam(':total', $total);
        return $stmt->execute();
    }
}
?>