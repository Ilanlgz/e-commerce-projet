<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/Controller/auth.php';
require_once __DIR__ . '/Controller/UserController.php';
require_once __DIR__ . '/Controller/ProductController.php';



// Déterminer l'action à effectuer
$action = isset($_GET['action']) ? $_GET['action'] : 'accueil';

ob_start();
switch ($action) {
    case 'home':
        include 'View/home.php';
        break;
    case 'accueil':
        include 'View/accueil.php';
        break;
        case 'promos':
            include 'View/promos.php';
            break;
            case 'login':
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    $username = $_POST['username'];
                    $password = $_POST['password'];
                    if (authenticate_user($username, $password)) {
                        $_SESSION['username'] = $username;
                        header('Location: index.php?action=accueil');
                        exit();
                    } else {
                        $_SESSION['error'] = "Identifiants invalides";
                        header('Location: index.php?action=login');
                        exit();
                    }
                } else {
                    include __DIR__ . '/View/user/login.php';
                }
                break;
                case 'logout':
                    include 'View/logout.php';
                    break;
    case 'category':
        require_once 'Controller/CategoryController.php';
        $categoryId = isset($_GET['id']) ? (int)$_GET['id'] : 1;
        $products = getProductsByCategory($pdo, $categoryId);
        $categoryName = getCategoryName($pdo, $categoryId);
        include 'View/user/category.php';
        break;
    case 'panier':
        include 'View/cart/view.php';
        break;
        case 'users_list':
            if (isset($_SESSION['admin']) && $_SESSION['admin'] === true) {
                require_once 'Controller/UserController.php';
                $users = get_all_users();
                include __DIR__ . '/View/admin/users_list.php';
            } else {
                header('Location: index.php?action=admin_login');
                exit();
            }
            break;
        
            case 'admin_login':
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    $username = $_POST['username'];
                    $password = $_POST['password'];
                    
                    if (authenticate_admin($username, $password)) {
                        $_SESSION['admin'] = true;
                        header('Location: index.php?action=users_list');
                        exit();
                    } else {
                        $_SESSION['error'] = "Identifiants invalides";
                        header('Location: index.php?action=admin_login');
                        exit();
                    }
                } else {
                    include __DIR__ . '/View/admin/login.php';
                }
                break;
            
    case 'admin_dashboard':
        if (is_admin()) {
            include 'View/admin/dashboard.php';
        } else {
            header('Location: index.php?action=admin_login');
        }
        break;
        case 'admin_users':
            if (isset($_SESSION['admin']) && $_SESSION['admin'] === true) {
                require_once 'Controller/UserController.php';
                $users = get_all_users();
                include __DIR__ . '/View/admin/users_list.php';
            } else {
                header('Location: index.php?action=admin_login');
                exit();
            }
            break;
        
        case 'edit_user':
            if (isset($_SESSION['admin']) && $_SESSION['admin'] === true) {
                require_once 'Controller/UserController.php';
                $user_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
                $stmt = $pdo->prepare('SELECT * FROM users WHERE id = ?');
                $stmt->execute([$user_id]);
                $user = $stmt->fetch(PDO::FETCH_ASSOC);
                if ($user) {
                    include __DIR__ . '/View/admin/edit_user.php';
                } else {
                    header('Location: index.php?action=users_list');
                    exit();
                }
            } else {
                header('Location: index.php?action=admin_login');
                exit();
            }
            break;
        
        case 'update_user':
            if (isset($_SESSION['admin']) && $_SESSION['admin'] === true) {
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    $user_id = $_POST['user_id'];
                    $username = $_POST['username'];
                    $email = $_POST['email'];
                    $role = $_POST['role'];
                    
                    $stmt = $pdo->prepare('UPDATE users SET username = ?, email = ?, role = ? WHERE id = ?');
                    if($stmt->execute([$username, $email, $role, $user_id])) {
                        header('Location: index.php?action=users_list');
                        exit();
                    }
                }
            } else {
                header('Location: index.php?action=admin_login');
                exit();
            }
            break;
    case 'delete_user':
        if (is_admin()) {
            if (isset($_POST['user_id'])) {
                $user_id = $_POST['user_id'];
                $stmt = $pdo->prepare('DELETE FROM users WHERE id = ?');
                $stmt->execute([$user_id]);
            }
            header('Location: index.php?action=admin_users');
        }
        break;
    case 'addToCart':
        if (isset($_POST['product_id']) && isset($_POST['category'])) {
            $product_id = $_POST['product_id'];
            $category = $_POST['category'];

            if ($category === 'promos') {
                $product = getPromotionalProductById($pdo, $product_id);
            } else {
                $product = getProductById($pdo, $product_id);
            }

            if ($product) {
                if (!isset($_SESSION['cart'])) {
                    $_SESSION['cart'] = [];
                }
                $cart_key = $category . '_' . $product_id;
                if (isset($_SESSION['cart'][$cart_key])) {
                    $_SESSION['cart'][$cart_key]['quantity']++;
                } else {
                    $_SESSION['cart'][$cart_key] = [
                        'name' => $product['name'],
                        'price' => $product['discounted_price'] ?? $product['price'],
                        'original_price' => $product['original_price'] ?? null,
                        'quantity' => 1
                    ];
                }
            }
        }
        header('Location: index.php?action=panier');
        break;
    case 'updateCart':
        if (isset($_POST['product_id']) && isset($_POST['quantity']) && isset($_POST['category'])) {
            $product_id = $_POST['product_id'];
            $quantity = intval($_POST['quantity']);
            $category = $_POST['category'];
            $cart_key = $category . '_' . $product_id;
            if (isset($_SESSION['cart'][$cart_key])) {
                if ($quantity > 0) {
                    $_SESSION['cart'][$cart_key]['quantity'] = $quantity;
                } else {
                    unset($_SESSION['cart'][$cart_key]);
                }
            }
        }
        header('Location: index.php?action=panier');
        break;
    case 'updateCart':
        if (isset($_POST['product_id']) && isset($_POST['quantity']) && isset($_POST['category'])) {
            $product_id = $_POST['product_id'];
            $quantity = intval($_POST['quantity']);
            $category = $_POST['category'];
            $cart_key = $category . '_' . $product_id;
            if (isset($_SESSION['cart'][$cart_key])) {
                if ($quantity > 0) {
                    $_SESSION['cart'][$cart_key]['quantity'] = $quantity;
                } else {
                    unset($_SESSION['cart'][$cart_key]);
                }
            }
        }
        header('Location: index.php?action=panier');
        break;
    case 'updateCart':
        if (isset($_POST['product_id']) && isset($_POST['quantity']) && isset($_POST['category'])) {
            $product_id = $_POST['product_id'];
            $quantity = intval($_POST['quantity']);
            $category = $_POST['category'];
            $cart_key = $category . '_' . $product_id;
            if (isset($_SESSION['cart'][$cart_key])) {
                if ($quantity > 0) {
                    $_SESSION['cart'][$cart_key]['quantity'] = $quantity;
                } else {
                    unset($_SESSION['cart'][$cart_key]);
                }
            }
        }
        include 'View/cart/view.php';
        break;
    case 'removeFromCart':
        if (isset($_POST['product_id']) && isset($_POST['category'])) {
            $product_id = $_POST['product_id'];
            $category = $_POST['category'];
            $cart_key = $category . '_' . $product_id;
            if (isset($_SESSION['cart'][$cart_key])) {
                unset($_SESSION['cart'][$cart_key]);
            }
        }
        include 'View/cart/view.php';
        break;
    case 'checkout':
        $_SESSION['cart'] = [];
        echo "<p class='text-center'>Merci pour votre commande !</p>";
        break;
    case 'logout':
        session_destroy();
        include 'View/user/login.php';
        break;
    default:
        include 'View/accueil.php';
        break;
}

$content = ob_get_clean();

if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
    echo $content;
} else {
    include 'View/layout.php';
}
?>