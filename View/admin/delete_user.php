<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../config.php';
require_once __DIR__ . '/../../Controller/auth.php';

if (!is_admin()) {
    header('Location: index.php?action=login');
    exit;
}

$id = $_GET['id'];


$stmt = $pdo->prepare('DELETE oi FROM order_items oi JOIN orders o ON oi.order_id = o.id WHERE o.user_id = ?');
$stmt->execute([$id]);

$stmt = $pdo->prepare('DELETE FROM orders WHERE user_id = ?');
$stmt->execute([$id]);

$stmt = $pdo->prepare('DELETE FROM cart WHERE user_id = ?');
$stmt->execute([$id]);

$stmt = $pdo->prepare('DELETE FROM users WHERE id = ?');
$stmt->execute([$id]);

header('Location: index.php?action=users');
exit;
?>