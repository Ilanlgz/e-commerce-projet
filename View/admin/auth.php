<?php
require_once __DIR__ . '/../config.php';

function is_admin() {
    return isset($_SESSION['admin']) && $_SESSION['admin'] === true;
}

function authenticate_admin($username, $password) {
    global $pdo;
    $stmt = $pdo->prepare('SELECT * FROM users WHERE username = ? AND role = "admin"');
    $stmt->execute([$username]);
    $admin = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($admin && password_verify($password, $admin['password'])) {
        $_SESSION['admin'] = true;
        $_SESSION['user_id'] = $admin['id'];
        return true;
    }
    return false;
}
?>