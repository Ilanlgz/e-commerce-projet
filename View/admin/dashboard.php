<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../../Controller/auth.php';

if (!is_admin()) {
    header('Location: index.php?action=admin_login');
    exit;
}
?>
<div class="container mt-4">
    <h2>Administration</h2>
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Gestion des utilisateurs</h5>
                    <a href="index.php?action=admin_users" class="btn btn-primary">Gérer les utilisateurs</a>
                </div>
            </div>
        </div>
    </div>
</div>