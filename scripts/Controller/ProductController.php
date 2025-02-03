<?php

require_once __DIR__ . '/../Model/Product.php';
require_once 'config.php';

function listProducts($pdo) {
    return getAllProducts($pdo);
}

function createProductController($pdo, $name, $description, $image, $price, $stock, $category_id) {
    if (createProduct($pdo, $name, $description, $image, $price, $stock, $category_id)) {
        echo "Produit créé avec succès.";
    } else {
        echo "Erreur lors de la création du produit.";
    }
}

?>