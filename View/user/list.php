<?php
require_once '../../Controller/ProductController.php';
$controller = new ProductController($pdo);
$products = $controller->listProducts();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Liste des produits</title>
</head>
<body>
    <h1>Liste des produits</h1>
    <ul>
        <?php foreach ($products as $product): ?>
            <li><?php echo htmlspecialchars($product['name']); ?> - <?php echo htmlspecialchars($product['price']); ?> €</li>
        <?php endforeach; ?>
    </ul>
    <a href="form.php">Ajouter un produit</a>
</body>
</html>