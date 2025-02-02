<?php
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/../config.php';

$faker = Faker\Factory::create('fr_FR');

try {
    // Catégories prédéfinies
    $categories = [
        'Electronics',
        'Books',
        'Clothing',
        'Home & Kitchen',
        'Sports',
        'Toys',
        'Beauty',
        'Automotive',
        'Garden',
        'Music'
    ];

    // Insertion des catégories
    foreach ($categories as $category) {
        $stmt = $pdo->prepare('INSERT INTO categories (name) VALUES (?)');
        $stmt->execute([$category]);
    }

    echo "Catégories générées avec succès!\n";

} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage() . "\n";
}

try {
    // Récupérer les IDs des catégories existantes
    $stmt = $pdo->query('SELECT id FROM categories');
    $categoryIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

    // Générer 50 produits
    for ($i = 0; $i < 50; $i++) {
        $name = $faker->words(3, true); // Nom du produit
        $description = $faker->paragraph(2); // Description
        $price = $faker->randomFloat(2, 10, 1000); // Prix entre 10 et 1000
        $category_id = $faker->randomElement($categoryIds); // Catégorie aléatoire
        $image = 'product' . $faker->numberBetween(1, 10) . '.jpg'; // Image
        $created_at = $faker->dateTimeThisYear()->format('Y-m-d H:i:s');

        $stmt = $pdo->prepare('INSERT INTO products (name, description, price, image, category_id, created_at) VALUES (?, ?, ?, ?, ?, ?)');
        $stmt->execute([$name, $description, $price, $image, $category_id, $created_at]);
    }

    echo "Produits générés avec succès!\n";

} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage() . "\n";
}

try {
    // Récupérer les IDs des produits existants
    $stmt = $pdo->query('SELECT id, price FROM products');
    $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Générer des promos pour environ 30% des produits
    foreach ($products as $product) {
        if ($faker->boolean(30)) {
            $original_price = $product['price'];
            $discount_percentage = $faker->numberBetween(10, 50);
            $discount_price = round($original_price * (1 - $discount_percentage/100), 2);
            
            $start_date = $faker->dateTimeThisMonth()->format('Y-m-d H:i:s');
            $end_date = $faker->dateTimeBetween($start_date, '+1 month')->format('Y-m-d H:i:s');

            $stmt = $pdo->prepare('INSERT INTO promos (id, product_id, discounted_price, start_date, end_date) VALUES (NULL, ?, ?, ?, ?)');
            $stmt->execute([$product['id'], $discount_price, $start_date, $end_date]);
        }
    }

    echo "Promos générées avec succès!\n";

} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage() . "\n";
}

try {
    // Trouver le plus grand ID existant
    $stmt = $pdo->query('SELECT MAX(id) as max_id FROM categories');
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    $startId = $result['max_id'] + 1;

    // Générer des nouvelles catégories
    for ($i = 0; $i < 10; $i++) {
        $name = $faker->unique()->word();
        $stmt = $pdo->prepare('INSERT INTO categories (id, name) VALUES (?, ?)');
        $stmt->execute([$startId + $i, $name]);
    }

    echo "Nouvelles catégories générées avec succès!\n";

} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage() . "\n";
}

try {
    for ($i = 0; $i < 20; $i++) {
        $id = $i + 1;
        $username = $faker->userName;
        $password = password_hash('password123', PASSWORD_DEFAULT);
        $email = $faker->email;
        $role = $faker->randomElement(['user', 'admin']);
        $created_at = $faker->dateTimeThisYear()->format('Y-m-d H:i:s');

        $stmt = $pdo->prepare('INSERT INTO users (id, username, password, email, role, created_at) VALUES (?, ?, ?, ?, ?, ?)');
        $stmt->execute([$id, $username, $password, $email, $role, $created_at]);
    }

    echo "Utilisateurs générés avec succès!\n";

} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage() . "\n";
}