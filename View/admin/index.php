<?php
if (!is_admin()) {
    header('Location: index.php?action=login');
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Admin Dashboard</h1>
        <p>Bienvenue, <?php echo htmlspecialchars($_SESSION['username']); ?>!</p>
        <a href="index.php?action=users" class="btn btn-primary">Gérer les utilisateurs</a>
        <a href="index.php?action=logout" class="btn btn-secondary">Déconnexion</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>