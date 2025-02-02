<?php
require_once __DIR__ . '/../config.php';

function getAllCategories($pdo) {
    $query = 'SELECT * FROM categories';
    $stmt = $pdo->query($query);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getCategoryById($pdo, $id) {
    $query = 'SELECT * FROM categories WHERE id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function updateCategory($pdo, $id, $name) {
    $query = 'UPDATE categories SET name = :name WHERE id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':name', $name);
    return $stmt->execute();
}

function deleteCategory($pdo, $id) {
    $query = 'DELETE FROM categories WHERE id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    return $stmt->execute();
}

function getProductsByCategory($pdo, $categoryId) {
    $query = 'SELECT p.*, pr.discount_price, pr.start_date, pr.end_date 
              FROM products p 
              LEFT JOIN promos pr ON p.id = pr.product_id 
              WHERE p.category_id = :category_id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':category_id', $categoryId);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}