<?php
require_once __DIR__ . '/../config.php';



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

function authenticate_user($username, $password) {
    global $pdo;
    $stmt = $pdo->prepare('SELECT * FROM users WHERE username = ? AND role = "user"');
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['username'] = $user['username'];
        $_SESSION['user_id'] = $user['id'];
        return true;
    }
    return false;
}

function get_all_users() {
    global $pdo;
    $stmt = $pdo->prepare('SELECT id, username, email, role FROM users');
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function create_user($username, $password, $email) {
    global $pdo;
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    
    $stmt = $pdo->prepare('INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, "user")');
    return $stmt->execute([$username, $hashedPassword, $email]);
}

function verify_credentials($username, $password) {
    global $pdo;
    $stmt = $pdo->prepare('SELECT * FROM users WHERE username = ?');
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($user && password_verify($password, $user['password'])) {
        return $user;
    }
    return false;
}

function update_user($user_id, $username, $email, $role) {
    global $pdo;
    $stmt = $pdo->prepare('UPDATE users SET username = ?, email = ?, role = ? WHERE id = ?');
    return $stmt->execute([$username, $email, $role, $user_id]);
}

function delete_user($user_id) {
    global $pdo;
    $stmt = $pdo->prepare('DELETE FROM users WHERE id = ?');
    return $stmt->execute([$user_id]);
}


?>