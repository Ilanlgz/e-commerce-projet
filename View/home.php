<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../Model/Product.php';

$products = getAllProducts($pdo);
?>
<div class="home1">



<div class="container">
    <div class="row">
        <?php foreach ($products as $product): ?>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="<?php echo htmlspecialchars($product['image']); ?>" class="card-img-top" alt="<?php echo htmlspecialchars($product['name']); ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo htmlspecialchars($product['name']); ?></h5>
                        <p class="card-text"><?php echo htmlspecialchars($product['description']); ?></p>
                        <p class="card-text"><?php echo htmlspecialchars($product['price']); ?> €</p>
                        <form action="index.php?action=addToCart" method="post" data-ajax="true">
                            <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
                            <input type="hidden" name="category" value="products">
                            <button type="submit" class="btn btn-primary">Ajouter au panier</button>
                        </form>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
