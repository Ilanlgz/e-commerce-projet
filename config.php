<?php
define('DB_HOST', 'localhost');
define('DB_USER', 'root'); // Utilisateur par défaut de XAMPP
define('DB_PASS', ''); // Mot de passe par défaut de XAMPP est vide
define('DB_NAME', 'e-commerce');

try {
    $pdo = new PDO('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME, DB_USER, DB_PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion à la base de données : " . $e->getMessage());
}
?>