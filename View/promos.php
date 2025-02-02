<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../Model/Product.php';

$promos = getPromotionalProducts($pdo);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Promotions</title>
    <link rel="stylesheet" href="View/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXhW+ALEwIH" crossorigin="anonymous">
</head>
<body>
 <div class="home1">
    <div class="container mt-5">
        <div class="row">
            <?php foreach ($promos as $promo): ?>
                <div class="col-md-4">
                    <div class="card mb-4">
                        <div class="img-container">
                            <img src="images/<?php echo htmlspecialchars($promo['image']); ?>" class="card-img-top" alt="<?php echo htmlspecialchars($promo['name']); ?>">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title"><?php echo htmlspecialchars($promo['name']); ?></h5>
                            <p class="card-text"><?php echo htmlspecialchars($promo['description']); ?></p>
                            <p class="card-text"><strong>Prix : </strong><?php echo htmlspecialchars($promo['discounted_price']); ?> €</p>
                            <p class="card-text"><del><?php echo htmlspecialchars($promo['original_price']); ?> €</del></p>
                            <p class="card-text"><small class="text-muted">Promotion valable jusqu'au <?php echo htmlspecialchars($promo['end_date']); ?></small></p>
                            <form action="index.php?action=addToCart" method="post" data-ajax="true">
                                <input type="hidden" name="product_id" value="<?php echo $promo['id']; ?>">
                                <input type="hidden" name="category" value="promos">
                                <button type="submit" class="btn btn-primary">Ajouter au panier</button>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</div>
</body>
</html>