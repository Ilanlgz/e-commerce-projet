<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../Model/Product.php';

$products = getAllProducts($pdo);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="View/style.css">
    <title>DressShop</title>
</head>
<body>
    <div id="home">
        <h1>DressShop le meilleur site de vente en ligne</h1>
        <p>tu cherches des Vêtements ? Ou des produit divers ? Tout est ici ! </p>
    </div>
    <div class="content">
    <footer class="bg-dark text-white text-center py-4">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h5>DressShop</h5>
                <p>Le meilleur site de vente en ligne pour vous servir.</p>
            </div>
            <div class="col-md-4">
                <h5>Liens Utiles</h5>
                <ul class="list-unstyled">
                    <li><a href="index.php?action=accueil" class="text-white">Accueil</a></li>
                    <li><a href="index.php?action=promos" class="text-white">Les Promos</a></li>
                    <li><a href="index.php?action=contact" class="text-white">Contact</a></li>
                    <li><a href="index.php?action=about" class="text-white">À propos</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h5>Suivez-nous</h5>
                <a href="#" class="text-white me-2"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-white me-2"><i class="fab fa-twitter"></i></a>
                <a href="#" class="text-white me-2"><i class="fab fa-instagram"></i></a>
                <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <p>&copy; 2025 DressShop. Tous droits réservés.</p>
            </div>
        </div>
    </div>
</footer>
    </div>
</body>
</html>