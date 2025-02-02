<?php
require_once '../../Controller/OrderController.php';
$controller = new OrderController($pdo);
$orders = $controller->listOrders();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des commandes</title>
</head>
<body>
    <h1>Liste des commandes</h1>
    <ul>
        <?php foreach ($orders as $order): ?>
            <li>Commande #<?php echo htmlspecialchars($order['id']); ?> - Total : <?php echo htmlspecialchars($order['total']); ?> €</li>
        <?php endforeach; ?>
    </ul>
</body>
</html>