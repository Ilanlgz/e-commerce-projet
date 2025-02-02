<?php

require_once '../Model/Order.php';
require_once 'config.php';

class OrderController {
    private $orderModel;

    public function __construct($pdo) {
        $this->orderModel = new Order($pdo);
    }

    public function listOrders() {
        return $this->orderModel->getAllOrders();
    }

    public function createOrder($user_id, $total) {
        if ($this->orderModel->createOrder($user_id, $total)) {
            echo "Commande créée avec succès.";
        } else {
            echo "Erreur lors de la création de la commande.";
        }
    }
}
?>