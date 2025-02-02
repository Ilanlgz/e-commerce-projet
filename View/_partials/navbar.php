<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

?>

<div id="navbar">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php?action=accueil" data-ajax="true">DressShop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Catégorie
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="index.php?action=category&id=1" data-ajax="true">Electronics</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=2" data-ajax="true">Books</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=3" data-ajax="true">Clothing</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=4" data-ajax="true">Home & Kitchen</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=5" data-ajax="true">Sports</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=6" data-ajax="true">Toys</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=7" data-ajax="true">Beauty</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=8" data-ajax="true">Automotive</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=9" data-ajax="true">Garden</a></li>
                            <li><a class="dropdown-item" href="index.php?action=category&id=10" data-ajax="true">Music</a></li>
                        </ul>
                    </li>
            
                    <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.php?action=accueil" data-ajax="true">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?action=promos" data-ajax="true">Les Promos</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <?php if (isset($_SESSION['username'])): ?>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://api.iconify.design/line-md:account.svg" alt="User" class="rounded-circle" width="30" height="30">
            <span class="ms-2"><?php echo htmlspecialchars($_SESSION['username']); ?></span>
        </a>
        <ul class="dropdown-menu" aria-labelledby="userDropdown">
            <li><a class="dropdown-item" href="index.php?action=profile">Mon profil</a></li>
            <li><a class="dropdown-item" href="index.php?action=logout">Se déconnecter</a></li>
        </ul>
    </li>
<?php elseif (isset($_SESSION['admin'])): ?>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="adminDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://api.iconify.design/line-md:account.svg" alt="Admin" class="rounded-circle" width="30" height="30">
            <span class="ms-2">Admin</span>
        </a>
        <ul class="dropdown-menu" aria-labelledby="adminDropdown">
            <li><a class="dropdown-item" href="index.php?action=users_list">Gérer les utilisateurs</a></li>
            <li><a class="dropdown-item" href="index.php?action=logout">Se déconnecter</a></li>
        </ul>
    </li>
<?php else: ?>
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="authDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Se connecter
        </a>
        <ul class="dropdown-menu" aria-labelledby="authDropdown">
            <li><a class="dropdown-item" href="index.php?action=login">Se connecter</a></li>
            <li><a class="dropdown-item" href="index.php?action=admin_login">Admin</a></li>
            <li><a class="dropdown-item" href="index.php?action=register">S'inscrire</a></li>
        </ul>
    </li>
<?php endif; ?>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?action=panier" data-ajax="true">Panier</a>
                    </li>
                </ul>
                <form class="d-flex ms-auto" role="search" action="index.php" method="get" data-ajax="true">
                    <input class="form-control me-2" type="search" placeholder="Rechercher" aria-label="Search" name="query">
                    <button class="btn btn-outline-success" type="submit">Rechercher</button>
                </form>
            </div>
        </div>
    </nav>
</div>     