<?php

require_once __DIR__ . '/../config.php';

function getUser($username, $password, $pdo) {
    $stmt = $pdo->prepare('SELECT * FROM users WHERE username = ?');
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
        return $user;
    }
    return false;
}


function getUserById($pdo, $id) {
    $query = 'SELECT * FROM users WHERE id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function createUser($pdo, $username, $password, $email, $role = 'user') {
    $query = 'INSERT INTO users (username, password, email, role) VALUES (:username, :password, :email, :role)';
    $stmt = $pdo->prepare($query);
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':password', $hashedPassword);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':role', $role);
    return $stmt->execute();
}

function updateUser($pdo, $id, $username, $email, $role) {
    $query = 'UPDATE users SET username = :username, email = :email, role = :role WHERE id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':role', $role);
    return $stmt->execute();
}

function deleteUser($pdo, $id) {
    $query = 'DELETE FROM users WHERE id = :id';
    $stmt = $pdo->prepare($query);
    $stmt->bindParam(':id', $id);
    return $stmt->execute();
}

function getAllUsers($pdo) {
    $query = 'SELECT * FROM users';
    $stmt = $pdo->query($query);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>