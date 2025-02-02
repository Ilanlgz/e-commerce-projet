<?php
require_once __DIR__ . '/../config.php';

function getProductsByCategory($pdo, $categoryId) {
    $stmt = $pdo->prepare('SELECT p.*, pr.discounted_price, pr.start_date, pr.end_date 
                          FROM products p 
                          LEFT JOIN promos pr ON p.id = pr.product_id 
                          WHERE p.category_id = ?');
    $stmt->execute([$categoryId]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getCategoryName($pdo, $categoryId) {
    $stmt = $pdo->prepare('SELECT name FROM categories WHERE id = ?');
    $stmt->execute([$categoryId]);
    return $stmt->fetch(PDO::FETCH_ASSOC)['name'];
}

function getAllCategories($pdo) {
    $stmt = $pdo->query('SELECT * FROM categories ORDER BY id');
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>