<div class="container mt-4">
    <h2>Mon Panier</h2>
    <?php if (!empty($_SESSION['cart'])): ?>
        <table class="table">
            <thead>
                <tr>
                    <th>Produit</th>
                    <th>Prix</th>
                    <th>Quantité</th>
                    <th>Total</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $total = 0;
                foreach ($_SESSION['cart'] as $cart_key => $product): 
                    // Check if product has promo
                    $stmt = $pdo->prepare('SELECT discounted_price FROM promos WHERE product_id = ? AND start_date <= CURRENT_DATE AND end_date >= CURRENT_DATE');
                    $stmt->execute([explode('_', $cart_key)[1]]);
                    $promo = $stmt->fetch(PDO::FETCH_ASSOC);
                ?>
                    <tr>
                        <td><?php echo htmlspecialchars($product['name']); ?></td>
                        <td>
                            <?php if ($promo): ?>
                                <span class="text-decoration-line-through text-muted">
                                    <?php echo number_format($product['price'], 2); ?> €
                                </span><br>
                                <span class="text-danger">
                                    <?php echo number_format($promo['discounted_price'], 2); ?> €
                                </span>
                            <?php else: ?>
                                <?php echo number_format($product['price'], 2); ?> €
                            <?php endif; ?>
                        </td>
                        <td>
                            <form action="index.php?action=updateCart" method="post" class="d-flex align-items-center">
                                <input type="hidden" name="product_id" value="<?php echo explode('_', $cart_key)[1]; ?>">
                                <input type="number" name="quantity" value="<?php echo $product['quantity']; ?>" min="1" class="form-control me-2" style="width: 70px;">
                                <button type="submit" class="btn btn-sm btn-primary">Mettre à jour</button>
                            </form>
                        </td>
                        <td>
                            <?php 
                            $price = $promo ? $promo['discounted_price'] : $product['price'];
                            $subtotal = $price * $product['quantity'];
                            $total += $subtotal;
                            echo number_format($subtotal, 2); 
                            ?> €
                        </td>
                        <td>
                            <form action="index.php?action=removeFromCart" method="post">
                                <input type="hidden" name="product_id" value="<?php echo explode('_', $cart_key)[1]; ?>">
                                <button type="submit" class="btn btn-sm btn-danger">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="3" class="text-end"><strong>Total:</strong></td>
                    <td colspan="2"><strong><?php echo number_format($total, 2); ?> €</strong></td>
                </tr>
            </tfoot>
        </table>
   
</div>
        </table>
        <div class="text-end mt-3">
            <a href="index.php?action=checkout" class="btn btn-success">Passer la commande</a>
        </div>
    <?php else: ?>
        <div class="alert alert-info">Votre panier est vide</div>
    <?php endif; ?>
    <div class="mt-3">
        <a href="index.php?action=accueil" class="btn btn-primary">Continuer mes achats</a>
    </div>
</div>