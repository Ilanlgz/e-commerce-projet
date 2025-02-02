<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once '../../Controller/ProductController.php';
    $controller = new ProductController($pdo);
    $controller->createProduct($_POST['name'], $_POST['description'], $_POST['image'], $_POST['prix'], $_POST['stock'], $_POST['category_id']);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ajouter un produit</title>
</head>
<body>
    <form method="POST" action="">
        <label for="name">Nom du produit:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea>
        <br>
        <label for="image">Image:</label>
        <input type="text" id="image" name="image" required>
        <br>
        <label for="prix">Prix:</label>
        <input type="number" id="prix" name="prix" required>
        <br>
        <label for="stock">Stock:</label>
        <input type="number" id="stock" name="stock" required>
        <br>
        <label for="category_id">Catégorie:</label>
        <input type="number" id="category_id" name="category_id" required>
        <br>
        <button type="submit">Ajouter</button>
    </form>
</body>
</html>