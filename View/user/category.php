<?php
require_once 'Controller/CategoryController.php';

$categoryId = isset($_GET['id']) ? (int)$_GET['id'] : 1;
$products = getProductsByCategory($pdo, $categoryId);
$categoryName = getCategoryName($pdo, $categoryId);
?>

<div class="container mt-4">
    <h2><?php echo htmlspecialchars($categoryName); ?></h2>
    
    <div class="row">
        <?php foreach ($products as $product): ?>
            <div class="col-md-4">
                <div class="card mb-4">
                    <img src="images/<?php echo htmlspecialchars($product['image']); ?>" class="card-img-top" alt="<?php echo htmlspecialchars($product['name']); ?>">
                    <div class="card-body">
                        <h5 class="card-title"><?php echo htmlspecialchars($product['name']); ?></h5>
                        <p class="card-text"><?php echo htmlspecialchars($product['description']); ?></p>
                        <?php if (isset($product['discounted_price'])): ?>
                            <p class="card-text">
                                <del class="text-danger"><?php echo number_format($product['price'], 2); ?>€</del>
                                <span class="text-success fw-bold"><?php echo number_format($product['discounted_price'], 2); ?>€</span>
                            </p>
                        <?php else: ?>
                            <p class="card-text fw-bold"><?php echo number_format($product['price'], 2); ?>€</p>
                        <?php endif; ?>
                        <form method="post" action="index.php?action=addToCart">
    <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>">
    <input type="hidden" name="category" value="category">
    <div class="input-group mb-3">
        <button class="btn btn-primary" type="submit">Ajouter au panier</button>
    </div>
</form>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>