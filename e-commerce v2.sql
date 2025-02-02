-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 02 fév. 2025 à 15:48
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `email`, `created_at`) VALUES
(1, 'admin', '$2y$10$Wq5RRrM6U26cC7u9fbwxXO3LOwr0Stvi7h.CpV9CktaVuUwjaglFS', 'admin@example.com', '2025-02-02 13:39:36');

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Electronics'),
(2, 'Books'),
(3, 'Clothing'),
(4, 'Home & Kitchen'),
(5, 'Sports'),
(6, 'Toys'),
(7, 'Beauty'),
(8, 'Automotive'),
(9, 'Garden'),
(10, 'Music'),
(11, 'Electronics'),
(12, 'Books'),
(13, 'Clothing'),
(14, 'Home & Kitchen'),
(15, 'Sports'),
(16, 'Toys'),
(17, 'Beauty'),
(18, 'Automotive'),
(19, 'Garden'),
(20, 'Music'),
(21, 'Electronics'),
(22, 'Books'),
(23, 'Clothing'),
(24, 'Home & Kitchen'),
(25, 'Sports'),
(26, 'Toys'),
(27, 'Beauty'),
(28, 'Automotive'),
(29, 'Garden'),
(30, 'Music'),
(31, 'Electronics'),
(32, 'Books'),
(33, 'Clothing'),
(34, 'Home & Kitchen'),
(35, 'Sports'),
(36, 'Toys'),
(37, 'Beauty'),
(38, 'Automotive'),
(39, 'Garden'),
(40, 'Music'),
(41, 'quo'),
(42, 'molestias'),
(43, 'aut'),
(44, 'et'),
(45, 'dicta'),
(46, 'maiores'),
(47, 'qui'),
(48, 'maxime'),
(49, 'provident'),
(50, 'libero'),
(51, 'Electronics'),
(52, 'Books'),
(53, 'Clothing'),
(54, 'Home & Kitchen'),
(55, 'Sports'),
(56, 'Toys'),
(57, 'Beauty'),
(58, 'Automotive'),
(59, 'Garden'),
(60, 'Music'),
(61, 'est'),
(62, 'aperiam'),
(63, 'ipsa'),
(64, 'nisi'),
(65, 'vel'),
(66, 'sapiente'),
(67, 'et'),
(68, 'quia'),
(69, 'sunt'),
(70, 'aut'),
(71, 'Electronics'),
(72, 'Books'),
(73, 'Clothing'),
(74, 'Home & Kitchen'),
(75, 'Sports'),
(76, 'Toys'),
(77, 'Beauty'),
(78, 'Automotive'),
(79, 'Garden'),
(80, 'Music'),
(81, 'voluptas'),
(82, 'repellat'),
(83, 'laborum'),
(84, 'eaque'),
(85, 'aliquid'),
(86, 'tenetur'),
(87, 'at'),
(88, 'cupiditate'),
(89, 'non'),
(90, 'adipisci'),
(91, 'Electronics'),
(92, 'Books'),
(93, 'Clothing'),
(94, 'Home & Kitchen'),
(95, 'Sports'),
(96, 'Toys'),
(97, 'Beauty'),
(98, 'Automotive'),
(99, 'Garden'),
(100, 'Music'),
(101, 'odio'),
(102, 'animi'),
(103, 'aut'),
(104, 'deserunt'),
(105, 'veritatis'),
(106, 'laborum'),
(107, 'eum'),
(108, 'est'),
(109, 'vitae'),
(110, 'accusamus'),
(111, 'Electronics'),
(112, 'Books'),
(113, 'Clothing'),
(114, 'Home & Kitchen'),
(115, 'Sports'),
(116, 'Toys'),
(117, 'Beauty'),
(118, 'Automotive'),
(119, 'Garden'),
(120, 'Music'),
(121, 'optio'),
(122, 'temporibus'),
(123, 'vel'),
(124, 'corrupti'),
(125, 'repudiandae'),
(126, 'enim'),
(127, 'sit'),
(128, 'id'),
(129, 'unde'),
(130, 'dolor');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category_id`, `created_at`) VALUES
(1, 'non molestiae qui', 'Voluptatem qui nemo et et et. Omnis tempora ea illo. Accusantium natus voluptate similique velit et voluptas.', 415.04, 'product5.jpg', 1, '2025-01-07 03:18:45'),
(2, 'exercitationem laborum hic', 'Omnis ut et modi expedita quia quo et. Alias rerum eum dolores aliquam facere ad animi. Pariatur eum quod nostrum.', 332.09, 'product9.jpg', 1, '2025-01-08 02:29:07'),
(3, 'cupiditate recusandae non', 'Sunt aut quae est sed incidunt vel ut enim. Doloribus blanditiis ullam officiis sequi sit inventore soluta. Dolore magni amet ipsa maxime magnam amet.', 287.21, 'product3.jpg', 10, '2025-01-30 01:13:15'),
(4, 'dolor fugiat dolores', 'Ipsam aut placeat tenetur aspernatur aspernatur. At illum ipsa incidunt corrupti.', 677.03, 'product1.jpg', 3, '2025-01-14 22:11:50'),
(5, 'tempora enim aspernatur', 'Dolorem impedit sit nemo dolorum suscipit. Nostrum placeat ratione deleniti quos dolor. Dolorem autem voluptatem mollitia recusandae ea.', 588.73, 'product7.jpg', 14, '2025-01-15 12:24:44'),
(6, 'nihil voluptatem eligendi', 'Non quisquam optio labore qui ducimus iste. Consequatur aspernatur eius reprehenderit id ut consequatur itaque et. Suscipit quo voluptatibus saepe aliquid autem.', 657.95, 'product8.jpg', 7, '2025-01-21 09:46:38'),
(7, 'delectus dolores et', 'Illum aut a doloremque doloribus voluptatem nemo accusantium. Eos in non culpa fugit modi id ut.', 69.40, 'product9.jpg', 14, '2025-01-13 23:04:36'),
(8, 'dolorem mollitia et', 'Doloremque voluptatem dolorem quisquam est et. Facere ullam nihil ducimus est.', 292.26, 'product6.jpg', 14, '2025-01-09 18:05:14'),
(9, 'distinctio nostrum quasi', 'Cum quos illum placeat modi commodi ut at. Sit deserunt quasi ipsa non sed id. Cupiditate consectetur porro pariatur consequatur labore eius.', 658.54, 'product10.jpg', 1, '2025-01-16 13:02:48'),
(10, 'quam cumque suscipit', 'Numquam asperiores non id nostrum commodi autem. Qui maxime ipsa nemo distinctio est. Qui sed culpa aut unde quis.', 888.38, 'product4.jpg', 15, '2025-01-28 20:39:20'),
(11, 'nihil dolorem necessitatibus', 'Quam dolorem ullam ea officiis doloremque ipsa repellat. Nihil ad velit quo laudantium excepturi sunt.', 413.83, 'product10.jpg', 9, '2025-01-14 21:00:57'),
(12, 'corporis ea velit', 'Consequatur commodi similique modi quo occaecati eum aliquam. Ut molestiae eligendi officia expedita.', 512.84, 'product6.jpg', 7, '2025-01-20 10:54:42'),
(13, 'id sint eligendi', 'Asperiores velit est eveniet laudantium fuga debitis vero. Repudiandae mollitia et ut dolorum cumque nesciunt. Quia amet itaque officia sunt.', 271.85, 'product2.jpg', 17, '2025-01-24 20:52:41'),
(14, 'in cum sint', 'A exercitationem expedita possimus sint quo laborum veritatis ipsam. Enim mollitia sed accusantium delectus velit.', 402.61, 'product6.jpg', 14, '2025-01-30 09:21:42'),
(15, 'eum iusto reiciendis', 'Alias libero qui cupiditate modi repudiandae. Tempore modi sit dolor fugit delectus aliquid inventore ab.', 759.64, 'product10.jpg', 17, '2025-01-11 17:31:54'),
(16, 'consequuntur saepe error', 'Quam totam autem commodi commodi eos sit. Explicabo ea placeat molestiae eveniet consequatur et.', 845.93, 'product9.jpg', 16, '2025-01-10 16:10:08'),
(17, 'est sit tempora', 'Excepturi sit est ut quod omnis. Sit provident culpa asperiores sed inventore. Natus sunt consectetur fuga.', 612.34, 'product3.jpg', 18, '2025-01-15 16:15:31'),
(18, 'beatae nesciunt ad', 'Id non voluptatem sapiente qui. Voluptas tenetur voluptas quis at occaecati.', 229.01, 'product10.jpg', 4, '2025-01-11 15:44:30'),
(19, 'et deserunt qui', 'Dolor et aut architecto veritatis ab alias. Praesentium et sunt aliquam vel laudantium rerum in. Consequatur voluptas occaecati expedita ea alias.', 701.34, 'product3.jpg', 18, '2025-01-19 16:40:57'),
(20, 'sed ipsum quidem', 'Voluptas tempora aut accusantium consequatur fugiat debitis at totam. Expedita pariatur necessitatibus et voluptas consequatur optio.', 94.29, 'product6.jpg', 17, '2024-12-31 23:20:30'),
(21, 'eaque suscipit voluptatem', 'Adipisci eaque facere placeat earum vero itaque eaque. Explicabo in aut rerum molestiae consequatur eius nulla. Fuga qui eaque aut et error adipisci.', 51.11, 'product7.jpg', 11, '2025-01-12 08:51:48'),
(22, 'et tempora ipsa', 'Occaecati reprehenderit aut a eos voluptatem quae consectetur est. Veritatis velit dolores ducimus.', 168.01, 'product1.jpg', 15, '2025-01-26 14:36:32'),
(23, 'voluptas repudiandae magnam', 'Error eligendi cupiditate corrupti voluptates impedit dolore. Occaecati minus amet unde consequatur dolorum. Doloremque aut aut quia saepe et libero voluptatem.', 84.45, 'product6.jpg', 5, '2025-01-06 14:01:44'),
(24, 'fugiat tempora nam', 'Animi magni numquam nihil corporis amet. Quaerat nobis dolor asperiores veniam qui quasi nisi. Dicta et et et omnis.', 539.23, 'product6.jpg', 18, '2025-01-01 14:29:00'),
(25, 'commodi consequatur maiores', 'Et provident nam tenetur. Est est aut sint. Quam ex illo minima adipisci ad.', 948.86, 'product5.jpg', 16, '2025-01-21 15:11:08'),
(26, 'voluptatem et ipsam', 'Et quis ab illo provident. Dolore odit commodi atque quia.', 107.77, 'product6.jpg', 20, '2025-01-04 15:56:37'),
(27, 'nostrum maiores sequi', 'Porro animi quaerat omnis ducimus aut quos sint. Tempore atque perferendis est commodi ipsum.', 774.84, 'product3.jpg', 4, '2025-01-16 16:09:06'),
(28, 'porro quo ea', 'Et maxime iure aperiam esse. Sunt ipsa illo magnam. Reprehenderit corrupti quae sint eos cumque omnis minima vel.', 262.76, 'product10.jpg', 20, '2025-01-13 06:27:09'),
(29, 'asperiores sit doloremque', 'Ducimus enim qui eveniet tenetur sed veniam illum. Consequatur voluptas est aliquid voluptatum repellat ipsa.', 250.60, 'product4.jpg', 1, '2025-01-28 15:16:14'),
(30, 'qui veniam rerum', 'Debitis id nobis non et doloribus non. Ipsa sint doloribus sapiente facilis. Aperiam alias dicta architecto nam voluptatem illo.', 895.12, 'product8.jpg', 5, '2025-01-24 13:00:11'),
(31, 'atque id ut', 'Aut nam quasi incidunt velit et sit earum. Dolorum sit quis et placeat aut.', 910.37, 'product7.jpg', 6, '2025-01-10 20:46:03'),
(32, 'excepturi molestiae modi', 'Eveniet ducimus laborum molestias voluptas sapiente fuga. Tempore sapiente rerum quaerat deleniti.', 970.98, 'product7.jpg', 18, '2025-01-04 10:37:21'),
(33, 'dolor atque ut', 'Velit nemo et molestias rerum suscipit. Nisi et et omnis in harum ab eveniet. Itaque impedit sunt hic et omnis.', 186.85, 'product3.jpg', 16, '2025-01-27 14:05:28'),
(34, 'dolores nobis dolorem', 'Et velit placeat neque voluptates non et architecto. Dolorum voluptatem cum deleniti sit recusandae fugiat.', 528.70, 'product9.jpg', 17, '2025-01-04 01:30:20'),
(35, 'et possimus magni', 'Corporis occaecati vero nobis nemo. Iste assumenda consequatur quis cum voluptatem. Quas iusto unde suscipit facilis voluptas.', 837.00, 'product1.jpg', 12, '2025-01-07 20:33:29'),
(36, 'illum sint quia', 'Eius sed est nisi aspernatur sunt velit cumque. Esse et labore rem.', 715.48, 'product4.jpg', 18, '2025-01-12 23:18:55'),
(37, 'sed natus laudantium', 'Beatae voluptas saepe quisquam blanditiis qui alias. Autem consequatur ipsum nulla alias inventore omnis ad. Eum id consectetur sapiente qui.', 866.17, 'product7.jpg', 20, '2025-01-12 21:58:19'),
(38, 'id voluptatem accusantium', 'Nostrum maiores qui dignissimos a assumenda omnis qui. Deleniti nihil doloremque illum sed. Consequatur necessitatibus occaecati sit autem velit ipsa repudiandae.', 208.87, 'product8.jpg', 5, '2025-01-09 01:52:39'),
(39, 'quod voluptatem voluptas', 'Earum culpa qui excepturi error et similique alias. Natus necessitatibus nemo totam sit mollitia consequatur.', 425.80, 'product2.jpg', 17, '2025-01-06 12:39:04'),
(40, 'non labore modi', 'Quasi et repellat officia dolor nisi. Officiis et quam explicabo ipsum eum rerum harum.', 997.94, 'product10.jpg', 14, '2025-01-11 07:54:26'),
(41, 'eum rerum eaque', 'Est suscipit quo architecto doloribus maxime. Laudantium maiores debitis molestiae officia cum.', 987.37, 'product5.jpg', 8, '2025-01-04 02:52:24'),
(42, 'consequatur dolorum minus', 'Commodi tenetur labore sint facere. Eius suscipit nesciunt nemo expedita.', 748.89, 'product9.jpg', 10, '2025-01-16 07:14:31'),
(43, 'deserunt quis aliquid', 'Expedita repellendus sequi debitis neque reprehenderit. Suscipit molestias eaque qui fuga dignissimos quis. Fugiat at cum ratione ea deleniti earum voluptatem in.', 37.34, 'product4.jpg', 12, '2025-01-21 06:48:04'),
(44, 'veritatis quisquam incidunt', 'Tenetur quae perspiciatis error pariatur nisi. Nihil delectus ut dolorem vitae voluptate quia. Quos unde repellendus ducimus tempora.', 302.28, 'product1.jpg', 14, '2025-01-17 05:34:06'),
(45, 'natus vel nobis', 'Velit dolorem qui eius aut omnis ut. Distinctio doloribus necessitatibus eligendi blanditiis distinctio.', 190.83, 'product1.jpg', 5, '2025-01-26 15:33:45'),
(46, 'quo mollitia laudantium', 'Et rerum voluptatem omnis iusto. Dolor qui dolor veritatis explicabo quos.', 649.71, 'product10.jpg', 15, '2025-01-13 01:39:44'),
(47, 'minus facilis repellat', 'Aliquid ab assumenda beatae quis quo. Ipsam omnis porro dolore et.', 597.39, 'product1.jpg', 19, '2025-01-13 13:21:57'),
(48, 'necessitatibus eaque ut', 'Eveniet cupiditate amet vel. Ut iusto iste dignissimos recusandae dolor totam fugit.', 960.32, 'product10.jpg', 19, '2025-01-12 23:38:11'),
(49, 'non et deleniti', 'Deserunt dicta quia error distinctio illum sint. Dolore qui accusantium qui rem alias qui.', 382.37, 'product2.jpg', 6, '2025-01-26 10:46:15'),
(50, 'vel fugit nesciunt', 'Sapiente ab et excepturi culpa consectetur accusamus nulla. Et exercitationem nulla iure tempore sit iste omnis. Et est corporis in repellat.', 419.15, 'product6.jpg', 19, '2025-01-06 19:52:54'),
(51, 'dolor aut ea', 'Sint consectetur sit quis eos. Quia facilis quos dolor molestiae vero.', 651.57, 'product10.jpg', 8, '2025-01-17 09:01:18'),
(52, 'ut possimus qui', 'Expedita sit dolores omnis consequuntur. Earum aut accusamus dignissimos alias sit consequatur.', 487.84, 'product6.jpg', 2, '2025-01-16 17:27:49'),
(53, 'voluptas temporibus odit', 'Quaerat omnis sint aut facilis sit. Officia quia et laboriosam quis aut.', 533.59, 'product7.jpg', 16, '2025-01-09 02:16:42'),
(54, 'itaque vero provident', 'Dolorum ratione qui eveniet ut officia sapiente. Expedita consequatur iusto veniam autem.', 703.98, 'product10.jpg', 30, '2025-01-03 08:42:23'),
(55, 'mollitia odit amet', 'Quo sint molestiae aut eum. Ut ut reprehenderit nesciunt omnis molestiae. Odio veniam et neque ab deserunt quas eligendi aut.', 112.70, 'product2.jpg', 19, '2025-01-05 17:37:45'),
(56, 'explicabo illum corporis', 'Non et sint iure ipsam libero hic qui optio. Ipsa dolor qui aut qui neque. Error quos doloribus aut.', 23.77, 'product7.jpg', 18, '2025-01-16 07:48:01'),
(57, 'nihil tempora doloribus', 'Amet voluptas totam nihil velit consequatur. Ipsum eaque omnis minima doloribus.', 199.58, 'product4.jpg', 6, '2025-01-22 00:16:15'),
(58, 'quibusdam voluptatem error', 'Deleniti eaque iusto delectus iure quia molestiae quos. Ad quia recusandae repellat ut.', 174.56, 'product10.jpg', 29, '2025-01-19 06:21:19'),
(59, 'sed nam aut', 'Aliquam est voluptatum et minus eos voluptas quibusdam. Tenetur dicta tempore molestiae error animi sint.', 490.57, 'product4.jpg', 29, '2025-01-28 10:51:41'),
(60, 'cum et non', 'Doloribus aut ipsa et tempora totam cumque molestiae. Enim inventore et veniam aut. Minus voluptatem facere fuga nihil.', 246.59, 'product10.jpg', 10, '2025-01-08 10:05:16'),
(61, 'qui similique explicabo', 'Tenetur sit dolor ut. Sint libero eos quibusdam neque.', 716.26, 'product5.jpg', 13, '2025-01-23 06:30:42'),
(62, 'assumenda quia tempora', 'Consequatur voluptatum quasi autem quia perspiciatis est. Ipsam quam laborum quia modi.', 128.43, 'product1.jpg', 20, '2025-01-07 16:30:36'),
(63, 'saepe cum dolorem', 'Officia repellat aut voluptatum natus explicabo molestias. Soluta soluta inventore cum error qui quo reprehenderit totam. Odit officia asperiores aliquid quos nam assumenda aut.', 622.13, 'product8.jpg', 25, '2025-01-26 02:57:39'),
(64, 'sed voluptatem exercitationem', 'Quis aut accusamus dolore ea impedit. Impedit quam voluptatem culpa facilis impedit laboriosam.', 688.96, 'product5.jpg', 22, '2025-01-27 02:33:18'),
(65, 'odio facilis dolor', 'Eveniet nulla alias at velit numquam. Itaque unde rem nemo impedit molestias sapiente fugit.', 26.10, 'product5.jpg', 30, '2025-01-28 02:07:20'),
(66, 'soluta est iusto', 'Sapiente ut et qui saepe inventore ut et. Laudantium earum repellat sint omnis non. Debitis fugiat ex voluptate quia sit.', 335.59, 'product3.jpg', 21, '2025-01-22 06:18:01'),
(67, 'non eum dolor', 'Aspernatur explicabo saepe nesciunt blanditiis numquam ut qui. Cumque cumque aliquam quos hic.', 533.07, 'product9.jpg', 3, '2025-01-12 03:40:23'),
(68, 'ab nobis id', 'Nihil similique non sapiente voluptatem debitis dolores fugiat. Sunt aut recusandae aut quam.', 179.26, 'product2.jpg', 6, '2025-01-25 07:11:29'),
(69, 'nostrum est non', 'Totam consectetur beatae totam fuga et. Aperiam dolorem et modi mollitia aut autem.', 338.61, 'product10.jpg', 1, '2025-01-09 08:16:43'),
(70, 'et facilis eaque', 'Eum ipsa et dolorem recusandae quia. Sed vero provident id sit dolor sapiente enim. Voluptatibus temporibus et consectetur molestiae dolores et magni.', 224.91, 'product6.jpg', 8, '2025-01-24 15:04:21'),
(71, 'laudantium deserunt et', 'A asperiores veritatis qui quo voluptatem quo neque. Nisi sunt omnis dignissimos veniam vel et. Commodi et nam ut et.', 517.80, 'product4.jpg', 28, '2025-01-26 14:16:42'),
(72, 'magni inventore nemo', 'Quia qui aliquid ipsa aut doloribus et voluptatibus. Voluptatem deleniti est consequatur hic qui. Et quis eveniet velit rem voluptas quaerat iste.', 793.71, 'product1.jpg', 16, '2025-01-24 04:55:15'),
(73, 'fugiat est et', 'Omnis mollitia nulla nobis commodi. Ut necessitatibus dolores quisquam mollitia nostrum.', 967.13, 'product4.jpg', 26, '2025-01-25 12:09:36'),
(74, 'labore culpa odio', 'Qui ut officiis dolore voluptatem molestias. Quidem id velit officia eaque dolor dolores sit.', 648.36, 'product10.jpg', 22, '2025-01-13 15:29:07'),
(75, 'debitis pariatur et', 'Sapiente dolore molestias eum quisquam. Quasi enim enim eligendi nemo.', 725.79, 'product4.jpg', 16, '2025-01-24 07:57:31'),
(76, 'laudantium sint aspernatur', 'Veritatis dolor nisi maxime quibusdam. Pariatur ut odit similique. Vero velit quas doloremque ipsum laudantium doloribus quisquam.', 278.17, 'product4.jpg', 10, '2025-01-26 10:27:41'),
(77, 'commodi porro quae', 'Maiores rem corporis beatae et. Repudiandae autem nobis reprehenderit quidem.', 909.01, 'product2.jpg', 4, '2025-01-12 10:35:10'),
(78, 'est voluptates tempore', 'Similique voluptatem dolore at illo sit. Fugiat quo eveniet rerum repellat. Fugit quo fugit quidem ipsam vel non dolore.', 934.02, 'product4.jpg', 12, '2025-01-23 12:13:25'),
(79, 'perspiciatis earum numquam', 'In fuga recusandae voluptate autem maxime ut animi minus. Aut sint enim ipsa inventore ipsa numquam.', 401.18, 'product4.jpg', 13, '2025-01-14 01:49:11'),
(80, 'et voluptatem et', 'Eaque temporibus similique aliquam aut. Quis dolorum enim quia maxime ut.', 845.57, 'product3.jpg', 17, '2025-01-09 03:21:35'),
(81, 'veniam praesentium inventore', 'Ipsum reprehenderit placeat est dicta et incidunt excepturi optio. Sit ut eum ut repellendus.', 305.38, 'product2.jpg', 4, '2025-01-02 18:01:54'),
(82, 'eius quo necessitatibus', 'Ex enim facere similique eos minus reprehenderit et sit. Ipsa facere iusto beatae veritatis. Minima quis id perspiciatis incidunt quos illum magnam.', 671.25, 'product8.jpg', 23, '2025-01-01 16:12:38'),
(83, 'velit delectus illum', 'Voluptatibus adipisci enim aut nemo architecto aut. Libero ut corporis beatae vitae quo suscipit sequi.', 991.33, 'product7.jpg', 11, '2025-01-29 18:05:03'),
(84, 'neque beatae ipsa', 'Cum possimus quam blanditiis. Placeat nulla ipsam voluptas sit. Recusandae est minima ratione qui.', 222.56, 'product5.jpg', 3, '2025-01-19 07:04:48'),
(85, 'deleniti deleniti quam', 'Molestias commodi quam quia consequatur ab consequatur eum. Sunt pariatur cum quia fugit sed possimus nihil. Accusamus placeat eos dolore ad.', 197.63, 'product5.jpg', 26, '2025-01-19 09:51:39'),
(86, 'dolorem recusandae minima', 'Autem esse et iusto enim deserunt. Eos saepe iusto in rerum minima.', 399.89, 'product2.jpg', 27, '2025-01-11 21:42:12'),
(87, 'id ipsa sit', 'Debitis et quasi nam aliquam commodi pariatur. Iste esse eos ex dolorem at maxime.', 381.88, 'product5.jpg', 10, '2025-01-21 04:12:23'),
(88, 'ea cum ut', 'Necessitatibus ratione corrupti repellendus qui. Aspernatur officia odio pariatur possimus explicabo dolore quod.', 913.66, 'product2.jpg', 8, '2025-01-12 02:25:01'),
(89, 'quasi et amet', 'Illo est eveniet delectus hic. Excepturi aut facere iusto ut aliquam. Ut modi rerum dolores sunt itaque.', 807.07, 'product6.jpg', 8, '2025-01-22 00:35:23'),
(90, 'sunt et ut', 'Et non perspiciatis enim in repellat. Ratione quis aut non qui esse sit molestias.', 636.38, 'product2.jpg', 26, '2025-01-22 00:56:48'),
(91, 'natus doloremque qui', 'Sunt alias tempore voluptatem et voluptatem. Facere voluptas cum ea quas ipsum.', 594.48, 'product3.jpg', 10, '2025-01-03 11:57:46'),
(92, 'enim minima consequuntur', 'Distinctio molestiae qui rerum aliquid quasi corporis. Laborum ab sed atque laborum. Porro quo quod dolores corporis neque totam quos.', 741.37, 'product8.jpg', 20, '2025-01-23 02:10:46'),
(93, 'id dolores quasi', 'Voluptatibus recusandae fugiat optio ut magni sint atque. Unde similique expedita sint iure quod omnis. Error laborum est autem quia exercitationem facilis dignissimos.', 739.57, 'product9.jpg', 12, '2025-01-27 17:12:02'),
(94, 'ipsam rerum culpa', 'Nulla assumenda sint et et rerum eligendi. Molestias optio consequuntur alias et voluptatibus nihil iste.', 649.50, 'product9.jpg', 15, '2025-01-17 02:13:14'),
(95, 'rerum neque qui', 'Quis molestiae est temporibus magni occaecati odit. Voluptates consequatur id voluptas aperiam nulla doloribus non molestias.', 645.69, 'product6.jpg', 21, '2025-01-27 02:12:05'),
(96, 'est reprehenderit alias', 'Voluptate totam qui distinctio nihil id. Rerum quae quam culpa. Doloremque ut vitae dolorem magnam nihil.', 527.10, 'product1.jpg', 13, '2025-01-10 20:25:30'),
(97, 'sed in quas', 'Molestiae id iure aspernatur sed non. Reiciendis sed suscipit sequi enim voluptatem nihil similique. Laboriosam ut aliquam eius rerum quo voluptatibus.', 665.75, 'product6.jpg', 8, '2025-01-14 05:45:28'),
(98, 'fuga quia et', 'Ex itaque beatae et aut dolorem voluptas sint. Nisi dolor nostrum sint quibusdam eum vel repellat. Rerum voluptatem voluptatem inventore.', 882.53, 'product5.jpg', 23, '2025-01-23 12:23:00'),
(99, 'vel unde consequatur', 'Quia sequi debitis quas architecto velit rerum nostrum laudantium. Impedit suscipit quis et est.', 440.34, 'product2.jpg', 15, '2025-01-19 04:51:44'),
(100, 'expedita non dolore', 'Atque quis omnis et. Perferendis occaecati omnis placeat sit praesentium beatae tenetur excepturi. Corrupti voluptates harum nisi sunt aliquid consequuntur enim.', 706.71, 'product10.jpg', 12, '2025-01-06 03:34:51'),
(101, 'explicabo autem repellat', 'Et sit quisquam rerum tempora sunt aliquid magni. Aliquid ex voluptatem quod molestiae error aut.', 480.99, 'product3.jpg', 3, '2025-01-26 02:22:22'),
(102, 'eos voluptatem rerum', 'Voluptatum illum dolor omnis a totam quia ut. Quae ipsa et consequuntur ut quia est.', 658.00, 'product2.jpg', 9, '2025-01-02 12:01:28'),
(103, 'culpa sint iure', 'Sed laudantium animi aperiam. Ad molestiae sit ut qui.', 267.71, 'product1.jpg', 27, '2025-01-04 17:19:24'),
(104, 'rerum sed corporis', 'Accusantium tenetur nobis quaerat ea recusandae exercitationem. Reprehenderit illum rerum officiis laboriosam deserunt.', 328.38, 'product6.jpg', 25, '2025-01-15 13:08:58'),
(105, 'et placeat quaerat', 'Aut quia in velit aspernatur optio eos. Aut at voluptas quam quam qui. Ut officia dolor eaque quisquam.', 786.14, 'product10.jpg', 12, '2025-01-28 22:02:32'),
(106, 'sit totam accusantium', 'Consequatur consectetur reiciendis ipsam voluptatum modi. Et ratione aut impedit ea doloremque labore eaque.', 769.16, 'product5.jpg', 27, '2025-01-29 23:56:16'),
(107, 'et earum expedita', 'Fuga minus soluta sequi rerum voluptatem quia placeat. Dolorem ut illum et aut.', 525.16, 'product1.jpg', 22, '2025-01-19 02:20:18'),
(108, 'optio repellendus voluptatum', 'Dolores labore distinctio quas eum. Animi veritatis beatae aut eum fuga quisquam enim voluptas. Sint id quis fuga voluptas tenetur.', 651.39, 'product4.jpg', 18, '2025-01-02 11:11:43'),
(109, 'ut debitis eveniet', 'Aliquam quae id perferendis ea veniam. Temporibus architecto blanditiis rerum quo inventore.', 706.18, 'product3.jpg', 34, '2025-01-19 00:06:52'),
(110, 'qui aperiam magni', 'Natus sit corrupti laborum accusamus accusantium nisi. Quis quod omnis deserunt eveniet aut. Dolores quia minus vel nam.', 711.59, 'product4.jpg', 10, '2025-01-20 20:16:57'),
(111, 'temporibus nesciunt et', 'Iste ea qui non atque animi. Tempore iure omnis iste ut. Incidunt aliquam ut sunt ipsam est consequatur quam.', 288.61, 'product4.jpg', 2, '2025-01-18 19:59:12'),
(112, 'ut id ratione', 'Maxime ullam ut ab iure. Expedita excepturi debitis corporis beatae est est eius.', 632.95, 'product4.jpg', 5, '2025-01-25 08:27:04'),
(113, 'sunt quis id', 'Odit ipsa recusandae alias eligendi repellendus aut. Vel corrupti nihil aliquam officia sunt. Provident placeat rem et aspernatur.', 999.84, 'product8.jpg', 12, '2025-01-12 01:37:34'),
(114, 'ex recusandae cumque', 'Veniam itaque ut itaque quia. Perspiciatis voluptatem natus porro reprehenderit accusamus ut. Temporibus voluptate quidem laborum totam.', 748.73, 'product3.jpg', 18, '2025-01-01 23:44:46'),
(115, 'voluptas dicta accusantium', 'Necessitatibus alias suscipit voluptatibus dolores ea praesentium architecto. Impedit officiis explicabo odit in sunt eius modi.', 536.07, 'product9.jpg', 34, '2025-01-22 09:38:40'),
(116, 'ut qui itaque', 'Expedita minus ratione tenetur delectus mollitia et et. Est illo aut et consectetur eum. Et eum eos sit quia voluptatum est.', 556.02, 'product1.jpg', 10, '2025-01-03 08:41:22'),
(117, 'aperiam et molestiae', 'Aspernatur eaque voluptatem architecto necessitatibus praesentium. Consequuntur unde ut rerum quia neque. Dolorem non reiciendis itaque vitae.', 230.22, 'product6.jpg', 21, '2025-01-05 05:35:41'),
(118, 'dolore blanditiis error', 'Hic necessitatibus culpa iste aut et. Voluptas reprehenderit modi nostrum eligendi nihil nobis. Nobis aliquam rerum maxime velit commodi.', 513.91, 'product5.jpg', 9, '2025-01-29 18:34:49'),
(119, 'ut molestiae accusantium', 'Occaecati ex fugiat exercitationem ut deserunt. Rerum ipsum in libero reprehenderit omnis consequatur.', 910.11, 'product2.jpg', 28, '2025-01-20 19:27:13'),
(120, 'maiores sunt consequuntur', 'Laborum nobis quia sunt in adipisci esse repellendus. Molestiae libero consectetur aut voluptatem mollitia sit molestiae.', 300.55, 'product10.jpg', 35, '2025-01-09 04:18:28'),
(121, 'aut tenetur non', 'Repudiandae sed nulla deserunt reiciendis ab mollitia. Natus dolor quia necessitatibus dolorem suscipit aliquam.', 494.58, 'product8.jpg', 3, '2025-01-11 03:36:18'),
(122, 'voluptatem maxime sed', 'Quia voluptas et est sit nulla. Consectetur occaecati natus quo autem.', 546.14, 'product4.jpg', 18, '2025-01-29 01:05:22'),
(123, 'modi non sed', 'Eos aut cupiditate fuga. Est et et quia voluptas aut saepe. Suscipit atque perferendis voluptas doloribus accusamus quos harum.', 583.25, 'product4.jpg', 36, '2025-01-01 03:53:50'),
(124, 'molestias magnam reiciendis', 'Laboriosam minima consequatur et ex omnis quia provident aut. Praesentium porro occaecati sed et et ea facere quasi.', 856.84, 'product2.jpg', 15, '2025-01-12 04:17:55'),
(125, 'aliquam cupiditate saepe', 'Deleniti nemo eligendi vel omnis aut. At rerum aut id accusamus occaecati.', 740.10, 'product5.jpg', 8, '2025-01-29 17:41:40'),
(126, 'soluta est sed', 'Eius voluptas tempora quia voluptatum vitae aliquam. Consequatur voluptatem quia molestiae aut recusandae ipsa. Mollitia est ut iste ab quo.', 784.67, 'product9.jpg', 24, '2025-01-29 21:29:28'),
(127, 'eaque voluptate quae', 'Dolor optio eius qui neque et eum. Aperiam quia maiores eos inventore ex. Nisi explicabo dignissimos harum nesciunt.', 101.42, 'product10.jpg', 27, '2025-01-10 08:47:17'),
(128, 'occaecati velit eligendi', 'Et quis hic consequatur voluptates. Aut voluptas ad laboriosam ad nihil. Ratione laudantium veritatis dolor necessitatibus et quod minus.', 293.57, 'product2.jpg', 5, '2025-01-21 16:45:45'),
(129, 'aut nihil odio', 'Amet voluptatem nulla a. Enim ut consequatur reiciendis ut quas adipisci enim. Sed qui qui vero est incidunt sint qui modi.', 874.00, 'product6.jpg', 27, '2025-01-30 04:39:54'),
(130, 'nisi eos et', 'Minima beatae necessitatibus id iusto. Dolores maxime et eum temporibus porro sint.', 233.20, 'product3.jpg', 3, '2025-01-04 05:14:41'),
(131, 'temporibus iste aut', 'Voluptas voluptatum voluptatem quia dignissimos est quam. Rerum autem porro aut tempora occaecati quam aut. Recusandae minima in et dicta.', 136.86, 'product2.jpg', 9, '2025-01-04 19:18:40'),
(132, 'id commodi voluptas', 'Esse molestiae iste quis tempora ratione vero non sit. Sit natus omnis voluptatem est in et. Sequi ut tempora enim totam non voluptatem.', 286.06, 'product7.jpg', 33, '2025-01-04 05:39:48'),
(133, 'nesciunt consequatur ex', 'Qui cum autem odio. Totam est dolorum ex ab qui voluptas. Non enim laborum fugiat.', 253.12, 'product2.jpg', 37, '2025-01-24 14:55:55'),
(134, 'commodi non blanditiis', 'Repudiandae qui et fugit ea ratione culpa. Quia nihil iure tenetur natus.', 858.53, 'product10.jpg', 29, '2025-01-01 19:54:37'),
(135, 'voluptatem magni dolorem', 'Animi et maiores nobis omnis dicta. Accusantium aperiam dolor nulla molestiae incidunt enim aut.', 973.24, 'product4.jpg', 2, '2025-01-22 20:54:35'),
(136, 'natus corporis soluta', 'Quos ducimus quae est tempora ratione voluptatem. Sunt commodi molestias facilis blanditiis magnam cum ut. Voluptatem rem placeat ratione repellat ut.', 625.86, 'product7.jpg', 39, '2025-01-20 14:52:08'),
(137, 'non fugiat architecto', 'Autem voluptatum corporis totam et. Et aut cum quis adipisci dolores voluptate maxime delectus.', 793.87, 'product7.jpg', 31, '2025-01-28 23:07:46'),
(138, 'et id eos', 'Laboriosam sunt mollitia quos quia ad iure. Dolorem porro est sed ad. Excepturi esse autem quis qui dolores velit.', 976.68, 'product10.jpg', 34, '2025-01-19 05:45:09'),
(139, 'culpa dicta laboriosam', 'Eum officiis deleniti tenetur deleniti. Eos incidunt autem recusandae quis rerum id.', 736.57, 'product2.jpg', 13, '2025-01-27 04:01:58'),
(140, 'impedit temporibus qui', 'Consequatur omnis voluptatibus ex eaque ab iste. Laudantium blanditiis quia qui magnam eum est. Beatae consequatur ipsa ut sapiente autem saepe eos.', 350.41, 'product4.jpg', 14, '2025-01-13 21:26:54'),
(141, 'omnis neque corporis', 'Sit omnis consequatur eaque et atque fugit est. Ipsam sunt fuga possimus et facere reiciendis cumque. Ut sunt est vel deserunt voluptatibus.', 196.19, 'product8.jpg', 9, '2025-01-04 14:49:45'),
(142, 'ducimus et dolorem', 'Voluptatem vel laborum laboriosam et sit. Incidunt qui qui ut iure laborum omnis.', 629.09, 'product3.jpg', 36, '2025-01-01 10:36:07'),
(143, 'dolorem quaerat enim', 'Corrupti provident quasi aut placeat illum omnis ea ipsa. Et numquam ad id voluptas voluptates facilis.', 684.04, 'product6.jpg', 9, '2025-01-30 01:37:20'),
(144, 'eum aliquam sed', 'Recusandae voluptas voluptatem tenetur dolores voluptate voluptatum. Libero non id soluta quidem dolor.', 488.74, 'product6.jpg', 5, '2025-01-26 12:18:05'),
(145, 'incidunt modi eos', 'Est ducimus voluptate eius necessitatibus cum. Placeat accusantium nobis asperiores consequatur dolore laboriosam velit. Cupiditate perferendis saepe aut aliquid in modi.', 870.09, 'product7.jpg', 2, '2025-01-28 12:15:35'),
(146, 'at aspernatur ipsum', 'Accusantium ipsam porro et dignissimos possimus. Eveniet cumque quae voluptas ratione. Veniam autem voluptatem molestiae et commodi facere illo.', 141.00, 'product5.jpg', 39, '2025-01-04 08:54:22'),
(147, 'possimus voluptates laboriosam', 'Quisquam in ullam sit aut expedita earum. Nesciunt nemo ut consequatur maiores quia et.', 47.41, 'product2.jpg', 31, '2025-01-29 01:32:54'),
(148, 'iste quis eaque', 'Sit nemo et libero sunt voluptatem quam. Voluptatem quia repudiandae aut est ea quia. Sequi qui aliquid quia veniam alias molestiae.', 562.88, 'product5.jpg', 13, '2025-01-17 18:30:49'),
(149, 'facere assumenda placeat', 'Debitis optio non aspernatur doloribus. Sapiente voluptas sint incidunt distinctio cum similique. Sed veniam aliquam mollitia facere qui eveniet ipsam accusamus.', 323.50, 'product4.jpg', 1, '2025-01-03 18:58:09'),
(150, 'deserunt culpa pariatur', 'Consequuntur eligendi facilis recusandae deserunt. Illum quidem tenetur corrupti temporibus voluptatem.', 851.02, 'product3.jpg', 20, '2025-01-04 20:28:34'),
(151, 'nostrum id beatae', 'Vero culpa qui id quas. Nulla repudiandae deserunt esse ut aut quibusdam.', 706.82, 'product2.jpg', 36, '2025-01-01 17:40:19'),
(152, 'et reprehenderit eum', 'Quasi aut et autem eos at fugit. Optio voluptas et maxime quibusdam temporibus qui.', 783.68, 'product2.jpg', 36, '2025-01-21 02:00:30'),
(153, 'consequatur error minima', 'Laboriosam fugit qui eos praesentium dolor debitis repudiandae. Adipisci accusantium quaerat magni similique. Facere consequatur porro tenetur reiciendis vero excepturi possimus commodi.', 240.10, 'product10.jpg', 34, '2025-01-21 05:27:51'),
(154, 'veniam non optio', 'Iure est quia illum praesentium sint sequi. Consequatur voluptatem et rem natus quam amet dolorem saepe.', 77.76, 'product9.jpg', 46, '2025-01-24 14:07:30'),
(155, 'voluptatum ut praesentium', 'Id quos minus odio incidunt nam necessitatibus. Minus nobis eos vel culpa. Dolor et vero suscipit pariatur harum.', 324.77, 'product5.jpg', 60, '2025-01-20 22:49:45'),
(156, 'adipisci magni labore', 'Omnis voluptatem nulla et quibusdam veritatis quis. Excepturi assumenda blanditiis similique hic impedit facere sint et.', 233.90, 'product3.jpg', 12, '2025-01-21 07:36:48'),
(157, 'quasi et aut', 'Earum odio voluptatum earum nihil ad sint exercitationem. Corporis animi doloribus ducimus officiis. Commodi eum nihil laborum velit.', 981.89, 'product5.jpg', 44, '2025-01-26 19:56:22'),
(158, 'est vel perspiciatis', 'A laudantium totam optio delectus beatae modi ea omnis. Assumenda iure eveniet neque id tempora. Ducimus et nesciunt officia cupiditate consectetur.', 173.83, 'product8.jpg', 31, '2025-01-27 12:54:55'),
(159, 'nihil laborum ex', 'Possimus cupiditate cumque illum quasi iste voluptas esse. Et sint eveniet laborum repudiandae ea nostrum ea.', 609.86, 'product4.jpg', 6, '2025-01-21 06:58:05'),
(160, 'exercitationem ex est', 'Rerum velit ducimus et amet reprehenderit. Ut vitae in vel in id iure.', 476.08, 'product2.jpg', 55, '2025-01-31 16:31:42'),
(161, 'ratione totam et', 'Error ipsam fugit assumenda cumque ut. Dolores quo perferendis porro et. Expedita earum dolor saepe voluptatem debitis.', 949.78, 'product10.jpg', 39, '2025-01-28 00:48:24'),
(162, 'quibusdam magnam aut', 'Possimus molestiae possimus sed accusantium et enim magnam. Voluptates est optio et cupiditate natus voluptates.', 798.68, 'product2.jpg', 39, '2025-01-28 07:09:10'),
(163, 'in officiis asperiores', 'Qui eveniet velit numquam sit laudantium est deserunt. Natus illum eos beatae.', 389.04, 'product7.jpg', 7, '2025-01-29 22:06:02'),
(164, 'tempora ratione tempore', 'Odio cumque porro et. Autem rerum voluptatem qui reprehenderit tempora ut. Quia aspernatur autem tempore id eius.', 662.87, 'product8.jpg', 27, '2025-01-19 16:30:14'),
(165, 'officiis dolorem ut', 'Eum consequuntur illum recusandae est repellendus quia. Corrupti nihil harum eius quo eaque ut quo.', 817.65, 'product3.jpg', 50, '2025-01-26 15:11:36'),
(166, 'beatae quisquam repellendus', 'Placeat hic sunt aut voluptas sunt quia in. A fugiat voluptas porro magni.', 375.96, 'product9.jpg', 22, '2025-01-01 12:43:18'),
(167, 'molestiae fugit aliquid', 'Distinctio nemo recusandae non maiores suscipit est. Error ullam facilis aut aliquam qui esse dolores.', 759.76, 'product5.jpg', 45, '2025-01-12 19:03:29'),
(168, 'enim vero tempora', 'Delectus accusamus reiciendis rerum perferendis magni fugit enim praesentium. Facilis ut impedit repudiandae eveniet.', 396.10, 'product8.jpg', 55, '2025-01-24 11:40:01'),
(169, 'ex quisquam excepturi', 'Commodi adipisci quae et amet a rerum architecto. Minus ut praesentium et cum quae rerum. Aut sapiente dolores optio voluptas velit deserunt totam.', 624.82, 'product9.jpg', 7, '2025-01-31 01:25:25'),
(170, 'et reiciendis eum', 'Rerum voluptates sequi ipsum autem voluptas. Accusamus eos voluptatibus aut.', 544.34, 'product6.jpg', 26, '2025-01-24 16:40:31'),
(171, 'aut aut est', 'Molestiae iusto et odio aut dolores temporibus magni reprehenderit. Deserunt ratione ducimus amet.', 341.09, 'product10.jpg', 16, '2025-01-23 13:28:45'),
(172, 'repellendus rerum adipisci', 'Dolor ex commodi est earum velit. Aut dolor cum tempore.', 916.71, 'product3.jpg', 17, '2025-01-15 12:21:18'),
(173, 'inventore odio vel', 'Occaecati dolor consequatur quis ea vel vel. Non eos accusantium ab explicabo odit ea.', 535.01, 'product2.jpg', 46, '2025-01-22 03:57:02'),
(174, 'ipsa eius eos', 'Quidem corporis autem provident voluptatem. Et iure laborum ducimus.', 711.91, 'product9.jpg', 3, '2025-01-22 08:01:16'),
(175, 'odit est vero', 'Est distinctio sunt natus doloremque et fugit ut. Fugit doloremque quam earum consequuntur aspernatur qui dolor odio.', 892.59, 'product1.jpg', 21, '2025-01-08 06:09:58'),
(176, 'eius necessitatibus qui', 'Qui laboriosam quam non quia rem quidem rerum exercitationem. Vel hic enim ipsum illum autem natus at.', 551.35, 'product6.jpg', 27, '2025-01-15 22:10:36'),
(177, 'dolor molestiae nulla', 'Aut repudiandae non deserunt iste. Fugit recusandae alias eos accusamus molestiae. Maiores distinctio ipsa itaque saepe.', 858.94, 'product4.jpg', 3, '2025-01-28 21:18:38'),
(178, 'voluptatem saepe id', 'Nihil eius deserunt quae repellendus possimus error voluptatem. Est aperiam qui animi esse maiores deserunt ad.', 528.77, 'product8.jpg', 38, '2025-01-02 23:20:48'),
(179, 'neque soluta ea', 'Consequuntur dignissimos eaque necessitatibus omnis cupiditate. Neque aspernatur ad mollitia sit. Debitis reiciendis ad beatae tenetur reiciendis.', 554.02, 'product3.jpg', 39, '2025-01-03 19:34:32'),
(180, 'repellendus minus architecto', 'Molestiae eaque voluptatibus recusandae tempora molestiae. Occaecati iure et atque consequatur distinctio aliquid. In aut cumque aliquid in.', 553.29, 'product10.jpg', 25, '2025-01-17 06:07:07'),
(181, 'magnam in fugit', 'Dolorum earum reprehenderit aperiam voluptatem nostrum delectus. Eaque et et accusamus odio.', 163.35, 'product10.jpg', 26, '2025-01-24 15:43:37'),
(182, 'assumenda debitis cum', 'Qui sint fugiat sapiente corrupti maxime dolores sit. Minima quam incidunt tempore eligendi hic minima. Iste ea accusantium explicabo voluptates similique dolores.', 971.52, 'product5.jpg', 57, '2025-01-14 05:52:44'),
(183, 'numquam est aut', 'Ut quos provident molestiae in vero et sint. Qui ut quas illo. At et recusandae nihil est animi.', 839.23, 'product5.jpg', 11, '2025-01-27 16:42:14'),
(184, 'ex magni iste', 'Voluptatum quae hic laudantium dolorum qui. Quia vero sit tenetur est ratione. Molestiae et nostrum excepturi corporis.', 47.98, 'product8.jpg', 55, '2025-01-09 22:02:51'),
(185, 'sit eveniet voluptas', 'Quo asperiores et quo quo quis. Id magnam sed eaque soluta sunt ut totam occaecati. Quas iste explicabo ipsum aliquam et laborum eveniet.', 450.89, 'product4.jpg', 19, '2025-01-08 10:04:21'),
(186, 'ut voluptatem nam', 'Nisi voluptatum architecto labore beatae ipsum. Veritatis quis modi voluptatem.', 491.93, 'product10.jpg', 38, '2025-01-09 23:14:43'),
(187, 'mollitia architecto qui', 'Cumque repudiandae facere molestiae hic enim tempore. Natus ut sequi aut aut porro laborum.', 825.66, 'product5.jpg', 41, '2025-01-12 00:09:36'),
(188, 'soluta et amet', 'Alias consectetur impedit sed veniam dolore perferendis. Dolore atque eligendi eos doloribus. Cum minima et aut aliquam ut ipsum cumque ea.', 643.61, 'product5.jpg', 45, '2025-01-24 21:26:09'),
(189, 'sapiente dolore quia', 'Ut quidem eaque nam enim error. Doloribus nobis est libero quia.', 244.26, 'product7.jpg', 19, '2025-01-13 20:25:24'),
(190, 'sequi quis quis', 'Eos architecto assumenda aspernatur voluptates hic omnis molestiae. Similique voluptatum non nesciunt officiis ea ut. Adipisci et sit quisquam facilis similique tempora fuga itaque.', 900.31, 'product1.jpg', 34, '2025-01-26 04:38:16'),
(191, 'nobis qui recusandae', 'Doloribus ducimus veritatis illo officiis. Soluta neque ut porro. Commodi temporibus harum amet libero ipsa dolorem dolor similique.', 773.69, 'product10.jpg', 9, '2025-01-09 05:23:13'),
(192, 'voluptate dolorum sequi', 'Voluptas laudantium fugit dolorem provident aut et quia. Illum omnis ducimus adipisci aliquam velit similique cum. Voluptatem eligendi enim modi adipisci et consequuntur eaque suscipit.', 431.00, 'product1.jpg', 29, '2025-01-17 04:30:03'),
(193, 'aut maiores alias', 'Eligendi dolor eos reiciendis maiores tenetur pariatur. Saepe ipsa voluptas quisquam molestiae fugit ut debitis. Magni dolores eos qui deleniti voluptas.', 663.35, 'product7.jpg', 5, '2025-01-17 04:30:06'),
(194, 'nam qui sit', 'Ea sed consequuntur sit aut quidem ad rerum. Non et quaerat vel earum repudiandae.', 482.51, 'product4.jpg', 40, '2025-01-06 14:51:15'),
(195, 'excepturi eos maxime', 'Totam voluptatibus et quia eum autem eum neque delectus. Quisquam modi sapiente qui ex similique repellendus cupiditate. Hic aliquid sint deleniti a est.', 45.94, 'product9.jpg', 58, '2025-01-22 12:37:56'),
(196, 'explicabo quod assumenda', 'Ea sint et consequatur cum sit vero et. Voluptas quisquam alias nam earum quidem vero.', 144.81, 'product3.jpg', 59, '2025-01-07 01:11:17'),
(197, 'magni autem dolores', 'Labore expedita quasi est corrupti corporis iste est eos. Nulla est eos modi.', 452.10, 'product3.jpg', 52, '2025-01-28 13:05:52'),
(198, 'dolores nisi qui', 'Recusandae sint sunt enim non quas minus. Perspiciatis distinctio blanditiis adipisci nemo.', 444.38, 'product6.jpg', 23, '2025-01-06 07:48:31'),
(199, 'sed repellendus quidem', 'Et officiis maiores voluptas facere impedit. Iure tempora cum corporis ad voluptatibus sequi at repellendus. Dolores aliquam sit neque est saepe adipisci quasi.', 735.66, 'product1.jpg', 54, '2025-01-05 22:44:58'),
(200, 'dicta exercitationem et', 'Et dicta quod quia expedita. Nihil earum cupiditate dignissimos delectus. Itaque adipisci et et quidem qui consequatur.', 19.64, 'product8.jpg', 13, '2025-01-30 04:59:27'),
(201, 'nam velit sed', 'Quae officia porro doloribus consequatur. Aspernatur quia quisquam harum ea.', 879.93, 'product1.jpg', 15, '2025-01-07 22:46:54'),
(202, 'saepe et neque', 'Ratione neque cum ut iusto eaque dolor. Accusantium accusantium atque quas delectus.', 976.66, 'product4.jpg', 22, '2025-01-02 23:21:39'),
(203, 'ut aspernatur consequuntur', 'Ea illum rem quo magni voluptatibus nobis maiores quis. Voluptatibus occaecati similique et non velit accusantium. Perspiciatis voluptas neque et ut.', 326.99, 'product4.jpg', 3, '2025-01-15 14:55:39'),
(204, 'et dolorum autem', 'Repudiandae ut doloribus assumenda tempore. Provident ducimus similique temporibus dolore dolor. Iusto itaque maiores ea doloremque.', 512.19, 'product7.jpg', 68, '2025-01-23 05:59:35'),
(205, 'pariatur laudantium voluptatem', 'Ullam voluptatem veniam impedit eius. Velit neque rerum porro tempora corrupti numquam amet odio. Consequatur inventore quaerat ipsum nihil.', 32.20, 'product5.jpg', 40, '2025-01-23 17:53:27'),
(206, 'deserunt quia occaecati', 'Dicta molestias magni vitae eum sint. Sit ut inventore saepe rerum quis.', 122.55, 'product9.jpg', 48, '2025-01-19 12:43:16'),
(207, 'quo odit mollitia', 'Et dicta est recusandae eligendi. Assumenda sapiente rerum alias libero culpa sequi et.', 369.86, 'product5.jpg', 80, '2025-01-18 15:36:57'),
(208, 'ipsam aperiam cum', 'Ex in et a. Voluptatem consequuntur numquam molestiae et ducimus assumenda incidunt. Doloremque dolorem numquam minima quam asperiores consequatur.', 403.72, 'product2.jpg', 28, '2025-01-20 05:54:26'),
(209, 'est explicabo error', 'Et quia corrupti voluptatem fuga vel omnis sit exercitationem. Ea eos laboriosam ab libero asperiores dolorem. Eius sint autem dolores saepe.', 940.97, 'product9.jpg', 9, '2025-01-08 09:37:46'),
(210, 'aut molestiae cupiditate', 'Sint consequatur dolorum eos ipsum. Sed assumenda nam ex fugit nesciunt consequatur voluptatem.', 530.62, 'product3.jpg', 73, '2025-01-04 18:38:11'),
(211, 'rem eveniet eum', 'Enim voluptas doloribus totam. Pariatur velit occaecati sunt quo enim in ut.', 887.90, 'product6.jpg', 39, '2025-01-07 11:17:58'),
(212, 'doloremque est aut', 'Ea doloribus vel eaque assumenda error nesciunt et. Quis et perspiciatis culpa nisi doloribus nostrum amet.', 155.20, 'product7.jpg', 64, '2025-01-28 12:48:05'),
(213, 'rem in explicabo', 'Molestiae sit consequatur provident ex sunt consequuntur ut. Alias nobis omnis numquam ut reiciendis illum quis. Corporis sit minus omnis magnam doloremque officiis libero.', 710.20, 'product8.jpg', 63, '2025-01-04 03:00:32'),
(214, 'ipsum quia repellat', 'Quia voluptate consequuntur quis harum. Rem et reiciendis deleniti rerum praesentium totam fugit. Aut et voluptas ab blanditiis deleniti dolore.', 584.93, 'product9.jpg', 10, '2025-01-11 14:08:25'),
(215, 'quo qui voluptas', 'Et quibusdam ut optio esse illo occaecati. Totam in aut voluptatem veritatis vitae.', 567.82, 'product10.jpg', 59, '2025-01-28 06:22:52'),
(216, 'velit omnis sapiente', 'Beatae odit et cumque nam blanditiis molestias ut. Nam est libero voluptas quod.', 976.08, 'product10.jpg', 58, '2025-01-30 06:47:06'),
(217, 'beatae aut voluptas', 'Sunt maxime fugiat at ipsum necessitatibus. Quod sit libero voluptatem sapiente quis.', 342.70, 'product3.jpg', 5, '2025-01-23 10:04:14'),
(218, 'enim occaecati possimus', 'Illum sit vel est alias. Aut sunt voluptas animi et et dolor. Tempore modi tenetur non quas.', 862.32, 'product2.jpg', 11, '2025-01-19 17:06:09'),
(219, 'omnis occaecati porro', 'Aut natus qui libero dignissimos. Dolor aliquid dolor sit qui voluptatibus.', 366.92, 'product4.jpg', 61, '2025-01-28 15:17:21'),
(220, 'ullam fugit enim', 'Odit suscipit error reprehenderit qui et necessitatibus. Asperiores officiis voluptatibus qui voluptatem dolor est. Dolores dolorem laudantium sed ut.', 774.64, 'product1.jpg', 47, '2025-01-29 12:45:42'),
(221, 'eius qui aut', 'Et quo itaque consectetur occaecati beatae ut. Voluptatibus quia quo ullam. Incidunt ipsa numquam omnis porro.', 221.45, 'product4.jpg', 6, '2025-01-12 03:39:40'),
(222, 'saepe natus nemo', 'Sit animi ratione sed. Quasi at animi est sunt tempora. Optio eos ad suscipit dolorem nam repudiandae sed.', 396.26, 'product10.jpg', 1, '2025-02-01 05:23:58'),
(223, 'dolor quis vel', 'Nostrum adipisci eum quos id dolores sit non. Est sunt dolore ut quibusdam mollitia aspernatur. Harum voluptatem molestiae cumque praesentium distinctio fugit.', 34.67, 'product2.jpg', 61, '2025-01-07 04:11:28'),
(224, 'adipisci esse soluta', 'Atque et tempore culpa fugiat reiciendis culpa aut. In esse deleniti cumque necessitatibus accusamus et. Voluptatibus placeat et sed vel laudantium nihil.', 780.55, 'product8.jpg', 79, '2025-01-01 04:14:39'),
(225, 'veniam cupiditate dolorem', 'Aspernatur et aspernatur rem dolorum et et magni. Iste suscipit ut quia consequatur. Et et maxime asperiores repudiandae neque in.', 74.95, 'product3.jpg', 46, '2025-01-21 22:12:02'),
(226, 'et placeat atque', 'Doloremque possimus labore praesentium quam. Quia enim minus perferendis qui dolore quo voluptatem. Quod neque voluptatem fuga tempora debitis praesentium est.', 574.84, 'product3.jpg', 74, '2025-01-07 21:08:51'),
(227, 'tempore qui consequuntur', 'Amet maxime eum ipsum magni necessitatibus qui et magni. Ex voluptates recusandae maxime modi.', 770.73, 'product7.jpg', 73, '2025-01-14 06:35:37'),
(228, 'sed vel deserunt', 'Culpa eum asperiores non facilis qui veritatis id. Ad at ratione quo recusandae. Quod doloribus voluptatum possimus hic.', 514.36, 'product4.jpg', 11, '2025-01-28 20:29:21'),
(229, 'ut quis quo', 'Dolores asperiores velit blanditiis ipsam quidem dolores voluptatibus. Voluptatum repellendus nam assumenda voluptatibus. Cupiditate incidunt dolore nulla rem eius ea optio dolorem.', 712.68, 'product6.jpg', 57, '2025-01-21 12:53:29'),
(230, 'aut est necessitatibus', 'Eum qui odio sed et sit officiis. Quasi velit beatae occaecati ipsa totam.', 258.53, 'product2.jpg', 2, '2025-01-13 10:20:11'),
(231, 'alias aut impedit', 'Consequatur expedita et nihil tenetur saepe sunt. Sed minus eum et optio cum.', 213.85, 'product2.jpg', 2, '2025-01-30 04:10:54'),
(232, 'qui doloribus ea', 'Dolorem eligendi iusto facere numquam. Amet aut recusandae deserunt eveniet animi minima pariatur.', 827.31, 'product10.jpg', 40, '2025-01-26 22:46:35'),
(233, 'vero id non', 'Unde asperiores illum autem ullam. Officiis aliquam itaque qui. Consectetur dolores consequatur omnis tempore quaerat.', 511.07, 'product6.jpg', 31, '2025-01-06 11:30:27'),
(234, 'incidunt incidunt unde', 'Iusto vitae quod ad consequatur natus et autem repudiandae. Rem dicta quia quo est quibusdam dolores ipsum.', 938.40, 'product6.jpg', 34, '2025-01-24 01:16:22'),
(235, 'quia et porro', 'Et et enim modi repellendus ut. Consectetur cum omnis aut non nam et ratione odit. Sed expedita quia ducimus eligendi repellat numquam voluptas dolor.', 578.46, 'product7.jpg', 72, '2025-01-08 21:21:20'),
(236, 'sequi aspernatur pariatur', 'Consequatur et vitae voluptas est sunt. Quia rerum qui dignissimos atque.', 867.09, 'product2.jpg', 43, '2025-01-07 14:31:23'),
(237, 'modi cum cupiditate', 'Et delectus esse qui neque distinctio ut veritatis. Aut minus unde inventore nostrum ut omnis hic magni. Magnam qui consequatur nostrum dolor distinctio ut consequatur.', 296.14, 'product1.jpg', 4, '2025-01-26 12:13:32'),
(238, 'eius vel consectetur', 'Esse officia ullam itaque molestiae itaque reprehenderit. Non reprehenderit earum qui et quia.', 973.55, 'product10.jpg', 45, '2025-02-01 12:13:03'),
(239, 'dolorem provident exercitationem', 'Illum laboriosam et eos explicabo. Tenetur dolorem nostrum qui itaque perferendis perferendis pariatur.', 409.02, 'product2.jpg', 26, '2025-01-10 07:34:05'),
(240, 'dolor aliquam molestiae', 'Aut sed a non et. Consequatur omnis aut ea corporis in. Minus cupiditate accusantium placeat iste.', 455.92, 'product2.jpg', 65, '2025-01-28 20:08:33'),
(241, 'repellendus fuga qui', 'Alias non et itaque optio explicabo sit. Voluptate dolorum reprehenderit aut. Unde sunt modi placeat cumque.', 189.87, 'product4.jpg', 61, '2025-01-01 02:27:30'),
(242, 'sunt eos esse', 'Hic natus qui veniam est. Sint et sunt ducimus necessitatibus aperiam saepe mollitia. Est voluptatibus aspernatur odio eligendi voluptatum quis non similique.', 160.81, 'product5.jpg', 63, '2025-01-07 11:40:49'),
(243, 'praesentium minima nisi', 'Dolorum libero saepe sit ut et aut voluptas. Tempore pariatur dolores ab non qui similique.', 191.73, 'product4.jpg', 8, '2025-01-12 15:06:11'),
(244, 'id reprehenderit dolores', 'Aut ipsam unde aut officiis. Ipsum provident sit eaque nihil doloribus.', 833.13, 'product8.jpg', 68, '2025-01-14 04:29:40'),
(245, 'eius reprehenderit aut', 'Nemo eum hic rerum magni quia earum. Quod repudiandae sint numquam velit rem ratione et. Blanditiis mollitia voluptatibus fugiat assumenda eveniet deleniti occaecati.', 810.71, 'product3.jpg', 11, '2025-01-17 10:13:17'),
(246, 'fugiat accusantium eum', 'Sapiente harum est saepe omnis debitis quia quia. Veritatis voluptatibus qui iure.', 962.37, 'product7.jpg', 71, '2025-01-26 04:12:17'),
(247, 'et necessitatibus et', 'Ipsa pariatur voluptate non architecto quod amet. Quisquam totam voluptatem enim nemo numquam. Totam occaecati sequi est sit.', 782.25, 'product1.jpg', 75, '2025-01-06 08:23:46'),
(248, 'sunt eius dolorum', 'Atque earum accusamus sapiente qui minus saepe. Veritatis nostrum necessitatibus labore qui hic.', 140.21, 'product1.jpg', 17, '2025-01-20 23:59:54'),
(249, 'ratione dolores exercitationem', 'Sit hic dolor provident. Totam deleniti sit dolor dolore quia. Sint dolorem reprehenderit voluptate quia nisi qui voluptatum.', 478.90, 'product8.jpg', 66, '2025-01-11 11:16:40'),
(250, 'fugiat repudiandae consequuntur', 'Similique quia id et ut nulla corrupti. Voluptatem ut velit iusto repellat illum et vitae. Nostrum perferendis voluptates ad ex rerum facilis occaecati.', 945.71, 'product8.jpg', 1, '2025-01-17 20:07:13'),
(251, 'velit illum labore', 'Soluta autem eius non magnam assumenda a. Fugit rerum pariatur quaerat quisquam aperiam autem.', 721.98, 'product4.jpg', 74, '2025-01-14 10:04:13'),
(252, 'culpa atque qui', 'Quis eum sint est ad accusantium. Ut expedita exercitationem ex dolor. Eos non sed quibusdam error corporis minima et.', 312.11, 'product4.jpg', 73, '2025-01-08 04:37:20'),
(253, 'consequuntur itaque non', 'Est consequuntur perferendis enim consequatur. Nesciunt tempore est deleniti numquam qui.', 188.43, 'product10.jpg', 53, '2025-01-23 10:19:40'),
(254, 'ut impedit qui', 'Accusamus voluptatem earum amet accusantium error molestiae quia earum. Modi possimus atque vero id voluptas voluptas.', 840.64, 'product5.jpg', 20, '2025-01-26 14:11:30'),
(255, 'ut et iure', 'Omnis corrupti libero ea temporibus aut odit. Hic aut numquam qui sunt natus quaerat.', 504.49, 'product7.jpg', 34, '2025-01-31 10:36:22'),
(256, 'laudantium consequatur dignissimos', 'Voluptatem consequatur nesciunt laudantium quisquam quas nulla ut. A odio reprehenderit quisquam quisquam.', 858.22, 'product7.jpg', 17, '2025-01-04 22:25:21'),
(257, 'qui dolore esse', 'Accusantium quisquam quaerat id tempore in quas voluptate. Porro et dolores veniam omnis laborum doloremque. Optio laudantium aliquid ut nostrum eos.', 87.93, 'product1.jpg', 21, '2025-01-29 01:08:53');
INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category_id`, `created_at`) VALUES
(258, 'doloremque ratione ut', 'Aliquid deleniti delectus voluptas vel. Sed quos atque molestias natus et.', 498.32, 'product4.jpg', 59, '2025-01-24 09:45:16'),
(259, 'voluptatem natus ea', 'Enim rem qui ea quia et. Recusandae sapiente quo ut nam voluptate.', 277.29, 'product8.jpg', 72, '2025-01-14 01:48:13'),
(260, 'voluptates officia modi', 'Similique error reprehenderit deleniti necessitatibus eum rerum quam. Eos voluptatem perspiciatis aut. Similique commodi eos nostrum autem necessitatibus.', 63.28, 'product8.jpg', 99, '2025-01-27 05:11:25'),
(261, 'hic ullam cupiditate', 'Nesciunt soluta tenetur nemo neque id. Odio earum est exercitationem provident rerum. Vel a velit culpa dolore laudantium minima sit.', 694.98, 'product8.jpg', 11, '2025-01-12 20:26:26'),
(262, 'officiis debitis ut', 'Quibusdam in debitis beatae amet similique. Autem aliquam ullam nihil qui.', 774.49, 'product6.jpg', 7, '2025-01-28 08:04:13'),
(263, 'quia beatae beatae', 'Tempora voluptatem et repellat repellendus. Qui doloribus ea veritatis non sint amet laboriosam. Ut debitis animi quod laboriosam alias voluptates nemo.', 736.71, 'product2.jpg', 66, '2025-01-03 23:49:54'),
(264, 'odio commodi aut', 'Eligendi provident earum odit excepturi animi. Quis culpa id eos deserunt.', 707.50, 'product1.jpg', 12, '2025-01-21 09:57:42'),
(265, 'cupiditate tempore saepe', 'Quam officiis voluptas eos. Vitae omnis tenetur rerum quam placeat numquam distinctio explicabo.', 313.71, 'product5.jpg', 11, '2025-01-20 07:10:58'),
(266, 'molestiae culpa tempore', 'Laboriosam illo qui provident facilis modi quis repudiandae. Et fugit rerum autem ex minus. Sit ut delectus quaerat incidunt culpa quas blanditiis.', 29.56, 'product10.jpg', 51, '2025-01-22 20:21:49'),
(267, 'quod rerum omnis', 'Adipisci veritatis sed voluptas quia aut. Ipsam asperiores aspernatur omnis minus est incidunt consequatur.', 191.77, 'product10.jpg', 89, '2025-01-08 14:43:12'),
(268, 'repellendus quo nihil', 'Officia voluptatibus ut architecto amet. Voluptates aut quia excepturi vel. Rem mollitia omnis quia similique dolores architecto veniam.', 216.75, 'product3.jpg', 18, '2025-01-30 03:12:39'),
(269, 'asperiores voluptatem qui', 'Consequatur debitis quas qui quos. Nihil nesciunt vero cupiditate aliquam est et modi. Et enim asperiores minus maiores officia.', 985.57, 'product4.jpg', 54, '2025-01-20 04:38:22'),
(270, 'temporibus ab nemo', 'Dignissimos et nesciunt vel error vel fugit. Praesentium iste aliquam ut et rerum.', 253.55, 'product1.jpg', 34, '2025-01-23 10:51:36'),
(271, 'voluptatem deserunt voluptatem', 'Amet ut sed debitis ea dolores porro et. Qui ut optio omnis qui accusantium quos. Cum nihil ipsam velit est aut beatae quidem.', 708.15, 'product2.jpg', 6, '2025-01-07 20:06:52'),
(272, 'dolor itaque ea', 'Dolorum et vel sit maxime accusamus aut quia. Sed atque sint doloribus voluptas eum magnam vel recusandae. Rerum repudiandae dicta ullam optio eum repellendus.', 230.41, 'product2.jpg', 51, '2025-01-05 12:42:49'),
(273, 'et et temporibus', 'Qui explicabo iste beatae veniam. Rerum et nulla ut debitis harum. Et nulla at iusto.', 963.00, 'product4.jpg', 5, '2025-01-16 18:57:29'),
(274, 'aut nesciunt dolorum', 'Quia dolore et nobis quisquam ut vitae asperiores. Pariatur dolorem minima corporis blanditiis vel.', 732.55, 'product4.jpg', 51, '2025-01-01 12:18:37'),
(275, 'odio harum praesentium', 'Et reprehenderit incidunt ipsam et sit. Et id ea enim voluptatem veritatis neque.', 336.41, 'product3.jpg', 14, '2025-01-12 00:46:48'),
(276, 'vel aliquam maxime', 'Dolor molestiae repellat repudiandae nam dolores. Assumenda neque nam veritatis porro.', 725.22, 'product8.jpg', 45, '2025-01-04 08:32:19'),
(277, 'ex sit a', 'Ut quisquam omnis maxime eveniet amet excepturi sunt. Provident odio consequatur accusantium consequatur quis nam.', 915.05, 'product7.jpg', 61, '2025-01-23 03:50:21'),
(278, 'corporis natus aspernatur', 'Amet ut voluptates possimus officiis voluptas illo est. Aut consequuntur cupiditate illum. Ea magni iure perspiciatis voluptatem eos aut.', 813.59, 'product9.jpg', 78, '2025-01-21 11:32:49'),
(279, 'aut officiis ratione', 'Quo nobis commodi labore delectus perspiciatis autem suscipit. Non sed asperiores aperiam dolor officia. Eveniet sed quas ut qui ut occaecati atque.', 133.22, 'product9.jpg', 79, '2025-01-05 20:41:02'),
(280, 'accusantium ullam hic', 'Voluptas ut eum et corrupti in. Veniam odio et veniam non. Fugit atque mollitia rerum.', 77.06, 'product2.jpg', 43, '2025-01-27 13:13:36'),
(281, 'officia consectetur sapiente', 'Nam blanditiis sit eveniet. Quo fuga incidunt natus ea aut cum.', 124.32, 'product2.jpg', 31, '2025-01-21 16:57:57'),
(282, 'aut deleniti voluptas', 'Est facilis voluptatem expedita. Molestiae blanditiis provident dolores dignissimos quis eveniet iure. Et atque ratione et repudiandae a nesciunt autem.', 845.60, 'product2.jpg', 18, '2025-02-01 05:55:27'),
(283, 'esse aliquam aliquid', 'Pariatur atque labore nihil et. Qui repellat sint cupiditate. Eius sit at et et.', 275.31, 'product7.jpg', 48, '2025-01-24 12:36:54'),
(284, 'facilis non vel', 'Minus deserunt adipisci animi iusto sunt voluptas. Aspernatur possimus omnis aut nulla et qui in consequatur. Laboriosam repellendus sunt aut ratione blanditiis dolorem nostrum.', 761.63, 'product5.jpg', 93, '2025-01-29 16:17:21'),
(285, 'illo cupiditate eos', 'Aut distinctio aliquid est occaecati et. Officia possimus et maiores nobis. Ipsum accusantium quaerat veritatis.', 132.63, 'product5.jpg', 7, '2025-01-21 06:54:58'),
(286, 'molestiae sint et', 'Consequuntur dolor architecto laudantium rem commodi. Consequatur asperiores quo et. Adipisci voluptatem ea omnis.', 352.24, 'product2.jpg', 92, '2025-01-25 17:42:13'),
(287, 'magni porro hic', 'Tenetur nostrum earum et aut. Non libero ab placeat qui nulla porro. Quia omnis debitis dolorem voluptatem.', 641.12, 'product9.jpg', 7, '2025-01-21 22:06:35'),
(288, 'et voluptatem quod', 'Reiciendis laborum blanditiis est voluptatem. Qui doloremque voluptatem dolores dolor ut. Officiis quos cupiditate adipisci placeat illo.', 394.75, 'product9.jpg', 22, '2025-01-27 08:46:32'),
(289, 'quo quis labore', 'Excepturi placeat optio est totam repellat ex. Exercitationem sequi et dolore hic veritatis laborum. Aspernatur qui minus a ut et.', 713.25, 'product9.jpg', 17, '2025-01-13 13:13:35'),
(290, 'nihil voluptatem quae', 'Qui omnis occaecati aut aliquid provident. Quod sit quibusdam et cum quia nisi. Explicabo nulla quidem ut pariatur natus facere cumque.', 664.32, 'product8.jpg', 22, '2025-01-20 17:18:53'),
(291, 'dolor voluptas odit', 'Iste neque neque dicta deserunt voluptas quidem repudiandae. Veniam et deserunt qui est repudiandae id quo corporis.', 384.11, 'product4.jpg', 96, '2025-01-14 14:45:25'),
(292, 'deserunt aut est', 'Velit et sed tempore architecto sit tenetur amet. Qui delectus voluptas quia consectetur cupiditate veritatis excepturi. Earum cumque accusamus aliquid voluptatem quis quae inventore eveniet.', 936.08, 'product3.jpg', 63, '2025-01-20 10:21:53'),
(293, 'itaque maiores temporibus', 'Possimus soluta inventore distinctio. Id explicabo harum a quis ut placeat corporis.', 331.50, 'product9.jpg', 3, '2025-01-01 04:07:27'),
(294, 'excepturi voluptas perferendis', 'Provident cumque iste voluptatibus veniam suscipit repellat repudiandae. Minus aut non sapiente blanditiis rem unde ad. Est quasi officia fugit eum voluptatem eveniet.', 161.60, 'product9.jpg', 66, '2025-01-16 10:57:22'),
(295, 'tempore et modi', 'Et repellat ipsa non eum qui debitis. Iusto expedita esse et omnis aliquid molestias. Voluptas quam voluptatem voluptatem porro illo id ea.', 819.92, 'product6.jpg', 79, '2025-01-14 19:59:03'),
(296, 'sed expedita eius', 'Harum porro voluptatem non vitae accusantium blanditiis officia ducimus. Impedit voluptatem aspernatur quo quo non.', 152.20, 'product7.jpg', 27, '2025-01-29 09:07:52'),
(297, 'quae totam possimus', 'Iusto earum fugit ut quisquam et. Praesentium saepe mollitia dicta autem aut occaecati. Qui dolorem nihil laudantium quia assumenda sunt.', 760.54, 'product10.jpg', 16, '2025-01-28 23:03:15'),
(298, 'perferendis voluptas ipsum', 'Vel magni vitae a dignissimos eius voluptas. Accusamus neque voluptatem sed accusamus. Voluptates mollitia qui ut id architecto.', 636.90, 'product9.jpg', 41, '2025-01-05 09:56:12'),
(299, 'qui possimus sed', 'Dolores ratione delectus accusamus magni voluptas ab aut. Minima doloremque porro excepturi quia qui. Ipsum optio quia sapiente nesciunt qui mollitia.', 142.02, 'product6.jpg', 65, '2025-01-18 05:20:41'),
(300, 'tempora aut et', 'Quis non sed nihil voluptates. Fugiat delectus quis qui praesentium error.', 595.27, 'product3.jpg', 49, '2025-01-24 11:26:46'),
(301, 'ex sit quod', 'Eaque dolor eaque molestiae aliquid odio. Doloribus consequatur voluptatem hic saepe qui.', 291.14, 'product8.jpg', 71, '2025-01-28 11:04:23'),
(302, 'ut quisquam magnam', 'Ab ducimus delectus quia. Adipisci autem eius odit id tenetur dolores. Labore labore sapiente excepturi.', 58.92, 'product4.jpg', 47, '2025-01-07 15:13:33'),
(303, 'magnam nemo accusamus', 'Autem officiis et rerum deleniti et reiciendis dolore. Ratione et voluptatem dolor minus ut labore nisi possimus.', 528.22, 'product4.jpg', 105, '2025-01-19 01:19:53'),
(304, 'et nobis autem', 'Et non ab est vel cumque vero corrupti. At molestiae et eligendi iure neque.', 894.91, 'product4.jpg', 76, '2025-01-17 20:17:05'),
(305, 'accusantium accusantium nam', 'Est ut itaque totam distinctio qui dolorum voluptatibus. Officia quam porro quo qui quo veniam. Tenetur dolores corrupti et nisi cupiditate.', 442.43, 'product4.jpg', 22, '2025-01-24 19:44:47'),
(306, 'est omnis veritatis', 'Voluptatem recusandae laudantium voluptatibus fugit accusamus blanditiis distinctio quisquam. Voluptate ullam debitis nihil. Ducimus cupiditate maiores dolorum est enim quia.', 650.33, 'product4.jpg', 66, '2025-01-04 12:00:07'),
(307, 'totam amet et', 'Quis et aut provident qui provident velit at. Aperiam minus cumque eum magnam sed. Eaque id velit vel deserunt voluptas voluptatem provident.', 144.14, 'product10.jpg', 110, '2025-01-22 20:28:14'),
(308, 'est perspiciatis voluptas', 'Inventore placeat ut nesciunt cum. Eum in voluptas totam minima.', 109.22, 'product9.jpg', 61, '2025-01-23 02:21:00'),
(309, 'enim illum ut', 'Error labore nam minima assumenda tempora veniam. Qui earum deserunt aut quia quaerat. Aut eius aliquam adipisci impedit voluptatem ea occaecati eius.', 646.54, 'product10.jpg', 98, '2025-01-30 17:45:50'),
(310, 'voluptatibus ipsa voluptas', 'Ex error voluptates perspiciatis ipsum voluptas. Cumque est voluptatibus adipisci quisquam.', 586.12, 'product7.jpg', 67, '2025-01-08 20:41:40'),
(311, 'quidem eum voluptatum', 'Architecto deserunt maiores odit sint minus consequuntur placeat. Laboriosam velit error expedita ut ipsa amet sit.', 238.54, 'product10.jpg', 61, '2025-01-26 23:31:50'),
(312, 'iure voluptatem quam', 'Placeat inventore voluptatem dolor quis. Dolores rerum et quibusdam unde velit error. Tempore id et adipisci facilis eaque esse.', 614.95, 'product3.jpg', 8, '2025-01-21 10:42:36'),
(313, 'sunt sed animi', 'Aut quasi excepturi odio iure consequatur. Perspiciatis quae officia quia possimus dolores et aut reprehenderit. Pariatur sed autem odio rerum cumque.', 893.11, 'product4.jpg', 67, '2025-01-12 02:37:46'),
(314, 'ipsum nesciunt accusantium', 'Dolor at sit corrupti in rerum quae. Non voluptate deleniti quaerat illo.', 867.39, 'product5.jpg', 29, '2025-01-11 19:51:14'),
(315, 'consequatur atque doloremque', 'Dolores vero occaecati molestiae sunt quia. Id odit maxime aliquam voluptatum et. Aut doloremque ratione consectetur ipsa.', 651.50, 'product5.jpg', 119, '2025-01-04 20:28:35'),
(316, 'impedit qui maxime', 'Eos amet sunt modi quis aut explicabo velit. Sunt quae laborum ex amet voluptatem quia.', 607.22, 'product6.jpg', 87, '2025-01-04 12:29:41'),
(317, 'incidunt qui modi', 'Pariatur dolores et officia deserunt in nobis sequi. Iure sunt nisi facilis doloremque sequi.', 173.04, 'product8.jpg', 71, '2025-01-22 21:01:04'),
(318, 'hic possimus consequatur', 'Est consequatur amet accusamus ipsam aliquam et ea. Impedit est fugit sapiente quo non fuga.', 983.38, 'product10.jpg', 41, '2025-01-02 01:15:42'),
(319, 'illum quos possimus', 'Pariatur nihil voluptate optio perspiciatis similique non. Nulla voluptas excepturi mollitia nobis rem nisi unde.', 144.99, 'product8.jpg', 100, '2025-01-31 16:37:50'),
(320, 'id ipsa aut', 'Delectus est dolorem id minus. Sit aut aut a laudantium expedita qui. Tempore dolorum aliquid dolor et ea optio vitae reiciendis.', 887.79, 'product4.jpg', 23, '2025-01-21 20:37:19'),
(321, 'quia asperiores qui', 'Nihil sed ex quibusdam unde voluptatem. Dolore neque sequi sit consectetur voluptatem harum rerum.', 705.82, 'product2.jpg', 114, '2025-01-24 10:32:38'),
(322, 'voluptatem omnis aspernatur', 'Autem sunt non possimus tenetur. Atque cum atque et qui quos dolorem est ut. Voluptas eligendi vel atque nam officiis quia ea.', 632.33, 'product8.jpg', 3, '2025-01-25 20:48:38'),
(323, 'sunt excepturi tempora', 'Et itaque similique facere tempore totam nihil laboriosam assumenda. Ex maiores voluptate velit aperiam eligendi ut.', 302.19, 'product2.jpg', 39, '2025-02-01 07:58:05'),
(324, 'illo omnis voluptatum', 'Unde maxime dolores asperiores sint. Est omnis aperiam id doloribus est error.', 615.32, 'product2.jpg', 45, '2025-01-18 22:37:05'),
(325, 'perferendis dolorem libero', 'Modi quidem autem eaque porro accusantium. Placeat vel nam nesciunt facilis voluptas doloremque inventore. Esse sequi quia qui ullam maiores nemo.', 781.41, 'product2.jpg', 18, '2025-01-12 12:07:34'),
(326, 'ut ipsum et', 'Perferendis aliquam eum ea maxime ut. Non placeat ducimus fugiat nobis consequatur quasi aliquid aut. Quo et error quia omnis.', 723.14, 'product9.jpg', 69, '2025-01-24 12:40:02'),
(327, 'at itaque assumenda', 'Aliquam consequatur earum accusantium qui non natus. Sapiente dolores est sed sit et commodi. Et vel labore natus fugiat possimus quibusdam.', 878.72, 'product9.jpg', 74, '2025-01-16 18:07:37'),
(328, 'provident incidunt earum', 'Consectetur voluptas incidunt sint corporis dolore. Est at architecto odit magnam qui odit. Aut itaque assumenda qui rerum inventore illo eaque.', 895.74, 'product7.jpg', 117, '2025-01-27 03:37:43'),
(329, 'autem veritatis sit', 'Distinctio exercitationem nam ipsa. Similique beatae ducimus non.', 853.81, 'product1.jpg', 19, '2025-01-16 22:25:40'),
(330, 'nemo ut id', 'Eum voluptates quam ex excepturi minima repellat nisi. Veniam atque deleniti aut voluptas voluptas.', 603.17, 'product5.jpg', 56, '2025-01-24 11:25:36'),
(331, 'possimus quo praesentium', 'Tempore vitae fuga adipisci officia sunt mollitia enim. Sed non veniam hic fuga voluptatem. Quia veniam aut rerum molestias.', 491.84, 'product1.jpg', 27, '2025-01-03 18:48:29'),
(332, 'facilis est et', 'Tempora velit ab blanditiis officiis sequi dolor et. Quod et optio aut dignissimos ipsam placeat.', 439.80, 'product9.jpg', 117, '2025-01-30 15:03:59'),
(333, 'eum temporibus libero', 'In occaecati perferendis suscipit vero expedita. Possimus nemo aliquid ad vel.', 956.59, 'product2.jpg', 50, '2025-01-19 02:44:17'),
(334, 'accusantium inventore aut', 'Maxime vel aut magnam. Libero veniam et ex quam enim. Id quaerat est ratione ex qui autem quis.', 468.78, 'product5.jpg', 52, '2025-01-30 20:16:38'),
(335, 'quam animi aut', 'Quo error eum saepe voluptates reprehenderit sunt. Ducimus minus ut culpa similique.', 32.01, 'product4.jpg', 66, '2025-01-09 00:22:31'),
(336, 'quia autem eos', 'A tenetur sapiente aliquid eum. Quod dolore perspiciatis voluptatem libero cumque et quam.', 155.24, 'product2.jpg', 48, '2025-01-21 14:14:07'),
(337, 'sed non ut', 'Sed vel voluptatem quae in qui qui voluptatem. Vitae quo officia porro et atque commodi.', 894.89, 'product2.jpg', 15, '2025-01-26 21:04:08'),
(338, 'voluptatum vero doloremque', 'Dolores officia vero rerum accusamus error quas voluptas. Voluptatem quasi aspernatur aut.', 424.69, 'product8.jpg', 85, '2025-01-16 10:42:05'),
(339, 'nihil amet ab', 'Dolorum delectus nostrum iusto rem et aut alias voluptates. Eveniet occaecati quia quia id doloribus aliquam placeat. Commodi quia magnam numquam aut facilis ex nihil recusandae.', 422.37, 'product3.jpg', 103, '2025-01-10 06:41:33'),
(340, 'ad officia laudantium', 'Nulla et in est voluptas. Est voluptatum eveniet harum tempore. Ab nisi esse aut et est numquam.', 283.99, 'product4.jpg', 115, '2025-01-29 10:22:17'),
(341, 'accusantium nostrum est', 'Est libero omnis sequi id aut minus magnam. Molestiae et dolore qui rerum.', 939.99, 'product1.jpg', 60, '2025-01-21 09:25:05'),
(342, 'ipsa quia aut', 'Quas nihil minima tempore est tempora sunt eos. Laborum ea dignissimos eos sit quo. Ab rerum nam et aut incidunt et.', 891.44, 'product7.jpg', 78, '2025-01-17 10:04:32'),
(343, 'excepturi qui molestiae', 'Vel nulla iusto corporis exercitationem. Expedita aut consequuntur ea quia tenetur.', 710.88, 'product7.jpg', 112, '2025-01-08 19:33:58'),
(344, 'dicta dolor et', 'Sunt a perferendis rem molestias repudiandae. Alias animi voluptatem et. Animi in perferendis eum id autem inventore.', 442.69, 'product10.jpg', 50, '2025-02-01 05:51:47'),
(345, 'omnis commodi ipsum', 'Quod debitis culpa quia rerum cum. Hic exercitationem aut quis provident corporis est earum.', 954.25, 'product7.jpg', 21, '2025-01-18 03:20:48'),
(346, 'adipisci aperiam magni', 'Et amet neque voluptas dolorem qui velit. Ut quis neque itaque pariatur quo unde voluptatem inventore.', 967.80, 'product6.jpg', 84, '2025-01-23 11:16:55'),
(347, 'modi atque esse', 'Et doloremque corrupti velit molestias. Sed porro reiciendis occaecati omnis incidunt.', 600.22, 'product7.jpg', 102, '2025-02-01 00:10:10'),
(348, 'sunt et delectus', 'Laudantium dicta cum minima iusto rerum nemo. Blanditiis autem dicta ab dolorem. Id voluptatem accusamus odio et.', 288.59, 'product6.jpg', 117, '2025-01-27 15:17:59'),
(349, 'odio architecto aut', 'Et qui ex voluptas ratione minima aut repellendus ut. Odit quia possimus eaque non. Inventore nisi rerum et repellendus molestias voluptas voluptatem.', 935.90, 'product1.jpg', 5, '2025-01-24 23:00:15'),
(350, 'unde consequatur quae', 'Deleniti quia quia quisquam saepe ut sint consequatur pariatur. Et nisi numquam eum dolores recusandae deserunt. Aut iure voluptatem qui dolore tempore et.', 431.57, 'product4.jpg', 76, '2025-01-07 01:11:34'),
(351, 'consequatur id recusandae', 'Labore provident sequi voluptatem amet optio eveniet itaque corporis. Et reprehenderit eligendi consequuntur nam.', 764.82, 'product7.jpg', 7, '2025-01-05 20:34:42'),
(352, 'consectetur aut quisquam', 'Et aut aut aliquid minus velit. Alias assumenda et eos dolores repellendus culpa est aut. Vitae ratione molestiae ratione nisi.', 127.66, 'product1.jpg', 90, '2025-01-10 06:28:54');

-- --------------------------------------------------------

--
-- Structure de la table `promos`
--

CREATE TABLE `promos` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `discounted_price` decimal(10,2) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `promos`
--

INSERT INTO `promos` (`id`, `product_id`, `discounted_price`, `start_date`, `end_date`) VALUES
(1, 4, 392.68, '2025-01-11 08:21:24', '2025-02-18 06:43:48'),
(2, 9, 513.66, '2025-01-06 01:00:35', '2025-01-19 01:02:47'),
(3, 12, 430.79, '2025-01-18 20:21:09', '2025-02-26 17:10:18'),
(4, 13, 201.17, '2025-01-21 11:55:01', '2025-01-25 17:55:36'),
(5, 14, 245.59, '2025-01-30 01:02:23', '2025-02-04 04:14:22'),
(6, 16, 516.02, '2025-01-04 06:56:11', '2025-01-10 01:01:45'),
(7, 19, 603.15, '2025-01-19 19:38:25', '2025-02-11 14:26:05'),
(8, 22, 97.45, '2025-01-28 23:53:10', '2025-02-17 15:00:11'),
(9, 25, 483.92, '2025-01-15 20:35:25', '2025-02-04 20:15:52'),
(10, 28, 212.84, '2025-01-06 21:58:15', '2025-02-18 10:52:20'),
(11, 32, 495.20, '2025-01-20 15:18:18', '2025-02-18 01:57:44'),
(12, 37, 718.92, '2025-01-12 18:14:34', '2025-02-25 00:42:17'),
(13, 39, 255.48, '2025-01-21 18:02:20', '2025-02-16 07:23:10'),
(14, 41, 641.79, '2025-01-06 11:22:07', '2025-02-20 04:21:42'),
(15, 47, 346.49, '2025-01-04 11:18:30', '2025-02-25 09:22:52'),
(16, 51, 410.49, '2025-01-13 18:33:54', '2025-01-23 14:19:59'),
(17, 52, 336.61, '2025-01-23 20:49:28', '2025-02-04 05:53:30'),
(18, 3, 169.45, '2025-01-04 15:04:30', '2025-02-25 05:50:54'),
(19, 5, 418.00, '2025-01-16 17:41:09', '2025-01-30 19:08:40'),
(20, 7, 49.27, '2025-01-06 08:42:21', '2025-02-03 02:35:42'),
(21, 8, 175.36, '2025-01-03 06:14:39', '2025-01-17 14:00:23'),
(22, 11, 368.31, '2025-01-01 07:45:30', '2025-01-30 06:32:40'),
(23, 15, 600.12, '2025-01-06 23:55:51', '2025-03-01 06:24:02'),
(24, 18, 199.24, '2025-01-06 10:56:35', '2025-01-13 04:52:32'),
(25, 21, 26.58, '2025-01-12 07:11:38', '2025-02-10 11:58:02'),
(26, 30, 671.34, '2025-01-07 08:48:52', '2025-01-13 23:03:15'),
(27, 33, 119.58, '2025-01-07 22:49:24', '2025-01-20 12:57:45'),
(28, 39, 353.41, '2025-01-15 19:00:21', '2025-02-26 19:50:31'),
(29, 43, 26.14, '2025-01-03 09:40:20', '2025-01-23 03:32:36'),
(30, 45, 135.49, '2025-01-17 12:35:40', '2025-01-22 06:48:54'),
(31, 49, 260.01, '2025-01-15 02:45:13', '2025-01-26 06:53:41'),
(32, 50, 272.45, '2025-01-19 08:10:16', '2025-02-17 06:42:45'),
(33, 51, 371.39, '2025-01-08 15:03:30', '2025-02-04 22:44:03'),
(34, 56, 21.39, '2025-01-24 21:44:33', '2025-02-06 16:38:36'),
(35, 59, 274.72, '2025-01-14 23:02:24', '2025-02-06 16:21:52'),
(36, 60, 214.53, '2025-01-13 23:12:06', '2025-01-27 16:36:13'),
(37, 61, 422.59, '2025-01-10 04:11:02', '2025-01-10 23:29:15'),
(38, 63, 559.92, '2025-01-25 05:46:00', '2025-02-05 03:26:11'),
(39, 68, 120.10, '2025-01-14 20:54:36', '2025-03-01 09:34:13'),
(40, 69, 203.17, '2025-01-17 12:39:29', '2025-01-22 13:03:07'),
(41, 71, 300.32, '2025-01-19 00:09:13', '2025-02-23 04:55:17'),
(42, 72, 579.41, '2025-01-08 14:29:55', '2025-02-24 16:55:57'),
(43, 78, 784.58, '2025-01-12 02:55:04', '2025-02-21 12:38:35'),
(44, 81, 253.47, '2025-01-18 04:55:55', '2025-02-13 22:39:37'),
(45, 84, 149.12, '2025-01-21 03:54:39', '2025-02-27 21:52:21'),
(46, 88, 539.06, '2025-01-21 23:30:40', '2025-02-23 13:44:41'),
(47, 92, 459.65, '2025-01-30 06:23:00', '2025-02-08 11:04:10'),
(48, 93, 495.51, '2025-01-10 11:28:02', '2025-02-03 01:02:43'),
(49, 96, 432.22, '2025-01-14 23:00:30', '2025-02-08 15:00:38'),
(50, 97, 479.34, '2025-01-27 00:30:45', '2025-02-22 01:25:41'),
(51, 99, 250.99, '2025-01-25 08:33:26', '2025-02-25 14:11:15'),
(52, 1, 315.43, '2025-01-22 06:28:36', '2025-02-01 08:54:22'),
(53, 5, 347.35, '2025-01-30 11:29:49', '2025-02-25 16:18:10'),
(54, 6, 592.16, '2025-01-16 04:03:16', '2025-02-07 23:32:15'),
(55, 7, 51.36, '2025-01-09 09:04:30', '2025-02-07 13:09:23'),
(56, 9, 553.17, '2025-01-08 20:46:04', '2025-02-17 21:39:16'),
(57, 11, 277.27, '2025-01-07 09:09:12', '2025-02-15 17:53:20'),
(58, 13, 171.27, '2025-01-19 03:27:53', '2025-02-11 14:15:00'),
(59, 19, 420.80, '2025-01-19 23:35:07', '2025-02-23 17:04:15'),
(60, 21, 33.73, '2025-01-06 09:32:46', '2025-02-04 06:29:59'),
(61, 24, 463.74, '2025-01-12 02:39:32', '2025-01-22 09:49:41'),
(62, 28, 136.64, '2025-01-08 14:28:24', '2025-02-09 02:40:55'),
(63, 29, 140.34, '2025-01-30 13:19:29', '2025-02-03 15:25:22'),
(64, 36, 357.74, '2025-01-07 16:08:29', '2025-02-24 21:47:24'),
(65, 38, 123.23, '2025-01-06 20:43:28', '2025-02-16 05:10:08'),
(66, 39, 302.32, '2025-01-12 22:54:16', '2025-03-01 04:32:37'),
(67, 42, 584.13, '2025-01-02 15:50:32', '2025-01-31 22:37:21'),
(68, 46, 331.35, '2025-01-28 00:55:13', '2025-02-24 00:43:18'),
(69, 53, 282.80, '2025-01-15 18:48:32', '2025-02-04 11:02:29'),
(70, 54, 556.14, '2025-01-02 18:06:12', '2025-01-19 04:58:33'),
(71, 57, 155.67, '2025-01-09 19:26:10', '2025-01-11 05:23:39'),
(72, 59, 397.36, '2025-01-11 14:24:14', '2025-01-25 15:44:51'),
(73, 65, 17.49, '2025-01-02 11:39:26', '2025-01-16 15:50:46'),
(74, 66, 201.35, '2024-12-31 12:00:33', '2025-01-07 12:52:09'),
(75, 69, 209.94, '2025-01-24 22:00:10', '2025-02-14 16:06:39'),
(76, 71, 295.15, '2025-01-20 21:20:57', '2025-02-11 22:06:21'),
(77, 74, 479.79, '2025-01-09 05:07:19', '2025-01-17 02:48:29'),
(78, 75, 551.60, '2025-01-01 04:05:17', '2025-02-24 02:26:16'),
(79, 81, 256.52, '2025-01-22 11:12:43', '2025-02-27 03:25:06'),
(80, 84, 158.02, '2025-01-28 06:36:21', '2025-02-17 18:29:15'),
(81, 91, 392.36, '2025-01-27 16:18:10', '2025-02-11 07:19:57'),
(82, 93, 458.53, '2025-01-24 18:59:10', '2025-02-15 06:05:59'),
(83, 98, 564.82, '2025-01-26 03:48:25', '2025-02-13 17:02:32'),
(84, 100, 445.23, '2025-01-23 14:21:36', '2025-01-26 09:00:03'),
(85, 102, 381.64, '2025-01-16 20:59:24', '2025-02-25 20:55:38'),
(86, 109, 501.39, '2025-01-04 14:08:28', '2025-01-29 06:26:54'),
(87, 111, 248.20, '2025-01-06 03:18:26', '2025-02-06 11:30:05'),
(88, 120, 270.50, '2025-01-07 23:08:52', '2025-02-11 21:50:52'),
(89, 125, 414.46, '2025-01-03 05:39:44', '2025-02-15 02:53:28'),
(90, 134, 738.34, '2025-01-12 08:03:01', '2025-02-08 20:51:47'),
(91, 139, 603.99, '2025-01-02 04:57:08', '2025-03-01 19:27:08'),
(92, 141, 113.79, '2025-01-05 17:58:28', '2025-01-13 07:35:38'),
(93, 147, 30.82, '2025-01-24 02:54:17', '2025-02-26 11:11:08'),
(94, 148, 405.27, '2025-01-20 12:27:49', '2025-01-30 01:39:19'),
(95, 152, 658.29, '2025-01-08 19:19:38', '2025-02-05 12:39:31'),
(96, 2, 278.96, '2025-02-01 03:47:34', '2025-02-22 23:09:42'),
(97, 9, 474.15, '2025-01-02 18:46:10', '2025-01-06 18:01:40'),
(98, 12, 451.30, '2025-01-19 04:01:22', '2025-01-28 00:23:14'),
(99, 14, 249.62, '2025-02-01 09:25:39', '2025-02-28 12:21:50'),
(100, 16, 625.99, '2025-01-26 14:01:10', '2025-02-21 01:05:16'),
(101, 21, 31.69, '2025-01-20 11:47:02', '2025-01-21 23:53:57'),
(102, 23, 60.80, '2025-01-17 13:05:09', '2025-01-31 17:57:46'),
(103, 24, 463.74, '2025-01-30 16:30:46', '2025-02-18 13:48:19'),
(104, 34, 407.10, '2025-01-27 04:10:44', '2025-02-21 19:17:51'),
(105, 40, 648.66, '2025-01-05 11:01:55', '2025-01-09 17:52:49'),
(106, 41, 503.56, '2025-01-24 07:42:14', '2025-01-31 01:05:47'),
(107, 49, 202.66, '2025-01-25 06:48:33', '2025-02-15 16:31:56'),
(108, 50, 276.64, '2025-01-24 07:08:37', '2025-03-01 05:50:42'),
(109, 53, 330.83, '2025-01-08 01:34:47', '2025-01-28 05:14:32'),
(110, 56, 15.21, '2025-01-25 22:32:25', '2025-02-18 03:48:50'),
(111, 59, 412.08, '2025-01-31 15:02:43', '2025-02-03 02:32:07'),
(112, 60, 145.49, '2025-01-11 12:59:26', '2025-01-13 06:59:48'),
(113, 68, 93.22, '2025-01-07 13:58:16', '2025-02-02 11:30:45'),
(114, 69, 291.20, '2025-01-02 18:31:52', '2025-01-19 13:57:11'),
(115, 70, 141.69, '2025-01-09 17:34:53', '2025-02-15 07:21:57'),
(116, 77, 645.40, '2025-01-22 20:35:28', '2025-02-09 23:19:43'),
(117, 80, 507.34, '2025-01-16 12:19:55', '2025-01-21 11:36:58'),
(118, 83, 545.23, '2025-01-08 06:34:08', '2025-01-19 13:24:00'),
(119, 87, 198.58, '2025-01-21 21:13:55', '2025-02-27 02:27:13'),
(120, 93, 421.55, '2025-01-17 17:59:01', '2025-01-29 01:07:19'),
(121, 97, 545.92, '2025-01-06 14:54:16', '2025-01-14 21:10:23'),
(122, 99, 220.17, '2025-01-21 19:48:27', '2025-02-21 12:35:57'),
(123, 105, 660.36, '2025-01-02 21:38:53', '2025-02-03 18:41:40'),
(124, 107, 451.64, '2025-01-06 19:30:40', '2025-01-13 19:27:05'),
(125, 109, 564.94, '2025-01-12 05:44:35', '2025-01-13 11:31:58'),
(126, 110, 384.26, '2025-01-28 06:55:26', '2025-02-28 12:04:16'),
(127, 111, 248.20, '2025-01-14 01:16:06', '2025-03-01 11:48:04'),
(128, 114, 666.37, '2025-01-30 17:06:58', '2025-02-18 20:57:54'),
(129, 119, 618.87, '2025-01-07 20:01:30', '2025-02-03 13:51:33'),
(130, 129, 437.00, '2025-01-21 12:34:43', '2025-02-18 15:11:14'),
(131, 132, 246.01, '2025-01-05 06:30:12', '2025-02-05 19:02:12'),
(132, 133, 154.40, '2025-01-07 12:41:43', '2025-02-22 15:57:04'),
(133, 136, 456.88, '2025-01-01 17:53:17', '2025-02-04 13:22:11'),
(134, 141, 133.41, '2025-01-23 08:14:54', '2025-02-21 16:14:09'),
(135, 142, 320.84, '2025-01-17 11:06:19', '2025-02-19 08:59:48'),
(136, 146, 95.88, '2025-01-08 22:06:30', '2025-02-09 06:02:19'),
(137, 151, 607.87, '2025-01-18 05:56:09', '2025-02-25 00:19:25'),
(138, 154, 48.21, '2025-01-06 22:49:02', '2025-01-07 12:28:28'),
(139, 161, 816.81, '2025-01-13 06:21:28', '2025-01-16 05:06:45'),
(140, 162, 710.83, '2025-01-03 00:55:00', '2025-02-03 21:03:03'),
(141, 163, 338.46, '2025-01-10 20:23:34', '2025-02-24 05:18:19'),
(142, 175, 571.26, '2025-01-08 19:55:44', '2025-02-02 09:57:30'),
(143, 179, 398.89, '2025-01-30 14:52:38', '2025-02-02 08:45:26'),
(144, 184, 28.79, '2025-01-07 20:39:27', '2025-02-24 00:15:30'),
(145, 185, 329.15, '2025-01-08 01:13:26', '2025-02-01 16:26:45'),
(146, 188, 341.11, '2025-01-04 18:42:08', '2025-01-17 09:13:20'),
(147, 190, 747.26, '2025-01-17 22:01:52', '2025-01-21 15:29:00'),
(148, 191, 595.74, '2025-01-10 09:13:33', '2025-02-20 14:34:24'),
(149, 193, 378.11, '2025-01-11 23:53:54', '2025-01-17 09:39:27'),
(150, 194, 246.08, '2025-01-30 23:46:15', '2025-02-09 01:10:29'),
(151, 195, 41.35, '2025-01-05 02:03:00', '2025-01-07 10:49:59'),
(152, 196, 118.74, '2025-01-25 22:32:24', '2025-02-08 18:31:52'),
(153, 198, 239.97, '2025-01-17 08:25:25', '2025-01-28 23:46:13'),
(154, 1, 286.38, '2025-01-02 10:39:47', '2025-01-07 02:35:48'),
(155, 9, 388.54, '2025-01-15 16:38:34', '2025-02-23 13:08:49'),
(156, 14, 350.27, '2025-01-06 20:22:23', '2025-01-31 09:08:48'),
(157, 19, 434.83, '2025-01-05 16:47:43', '2025-02-08 13:29:32'),
(158, 22, 107.53, '2025-01-30 23:40:48', '2025-02-08 05:33:06'),
(159, 24, 469.13, '2025-01-16 19:31:43', '2025-01-23 09:41:53'),
(160, 26, 57.12, '2025-01-30 11:21:04', '2025-02-05 00:12:14'),
(161, 30, 769.80, '2025-02-01 06:14:26', '2025-02-27 02:09:40'),
(162, 34, 417.67, '2025-01-25 18:58:44', '2025-02-16 11:08:49'),
(163, 47, 531.68, '2025-01-08 11:33:55', '2025-02-08 18:58:08'),
(164, 49, 210.30, '2025-01-08 12:00:14', '2025-01-31 02:08:15'),
(165, 51, 501.71, '2025-02-01 03:27:28', '2025-02-25 13:34:12'),
(166, 54, 591.34, '2025-01-13 00:39:43', '2025-02-07 00:39:22'),
(167, 56, 14.26, '2025-01-22 07:00:10', '2025-02-15 10:59:12'),
(168, 58, 123.94, '2025-01-27 15:02:38', '2025-02-21 11:42:22'),
(169, 62, 88.62, '2025-01-03 06:27:34', '2025-02-01 03:57:09'),
(170, 64, 592.51, '2025-01-25 12:38:19', '2025-01-31 23:47:10'),
(171, 65, 20.62, '2025-01-13 09:26:10', '2025-01-15 23:35:13'),
(172, 66, 241.62, '2025-01-12 12:56:02', '2025-02-19 15:03:59'),
(173, 69, 230.25, '2025-01-29 16:21:26', '2025-02-16 18:22:12'),
(174, 78, 607.11, '2025-01-30 08:06:31', '2025-02-07 14:42:46'),
(175, 80, 566.53, '2025-01-17 08:07:14', '2025-02-26 18:36:19'),
(176, 81, 207.66, '2025-01-11 00:02:15', '2025-02-26 23:28:45'),
(177, 83, 852.54, '2025-01-29 19:42:43', '2025-02-19 00:05:05'),
(178, 87, 290.23, '2025-01-28 00:27:53', '2025-02-06 03:26:16'),
(179, 92, 385.51, '2025-01-27 09:47:46', '2025-02-16 03:54:01'),
(180, 93, 591.66, '2025-01-30 18:46:02', '2025-02-04 19:42:20'),
(181, 106, 430.73, '2025-01-22 14:27:55', '2025-02-26 07:21:04'),
(182, 107, 267.83, '2025-01-25 09:24:01', '2025-01-27 08:54:04'),
(183, 111, 230.89, '2025-01-03 03:52:12', '2025-01-17 05:13:56'),
(184, 116, 428.14, '2025-01-12 16:05:40', '2025-02-27 01:25:03'),
(185, 119, 482.36, '2025-01-07 17:37:24', '2025-01-30 10:13:42'),
(186, 123, 297.46, '2025-02-01 06:27:34', '2025-02-14 20:10:51'),
(187, 125, 532.87, '2025-01-08 23:26:51', '2025-02-01 03:55:47'),
(188, 127, 57.81, '2025-01-30 16:58:09', '2025-02-07 22:02:37'),
(189, 128, 196.69, '2025-01-31 00:03:01', '2025-02-18 21:17:33'),
(190, 132, 211.68, '2025-01-11 19:13:26', '2025-01-19 17:50:59'),
(191, 133, 156.93, '2025-01-04 12:20:42', '2025-02-23 08:38:42'),
(192, 139, 500.87, '2025-01-17 20:16:55', '2025-02-07 09:22:58'),
(193, 142, 440.36, '2025-01-18 04:05:21', '2025-02-13 02:31:42'),
(194, 143, 513.03, '2025-01-17 19:00:41', '2025-02-13 10:45:15'),
(195, 145, 643.87, '2025-01-16 06:36:17', '2025-02-09 05:36:46'),
(196, 146, 107.16, '2025-01-27 09:52:19', '2025-02-07 05:51:08'),
(197, 150, 714.86, '2025-01-07 22:59:25', '2025-02-05 22:28:24'),
(198, 153, 177.67, '2025-01-08 13:06:47', '2025-02-13 11:49:26'),
(199, 158, 114.73, '2025-01-24 06:18:21', '2025-02-10 12:54:30'),
(200, 159, 323.23, '2025-01-20 18:25:33', '2025-02-13 00:38:46'),
(201, 160, 357.06, '2025-01-21 20:42:00', '2025-01-30 11:25:46'),
(202, 168, 217.86, '2025-01-13 00:17:43', '2025-01-31 04:36:40'),
(203, 170, 435.47, '2025-01-06 18:02:17', '2025-02-01 03:24:02'),
(204, 171, 204.65, '2025-01-21 06:27:50', '2025-02-07 06:17:28'),
(205, 172, 614.20, '2025-01-18 03:34:48', '2025-01-27 02:47:17'),
(206, 173, 326.36, '2025-01-26 07:01:02', '2025-03-01 11:17:03'),
(207, 180, 315.38, '2025-01-16 11:46:22', '2025-02-05 14:37:12'),
(208, 182, 553.77, '2025-01-11 00:47:21', '2025-01-23 08:02:09'),
(209, 184, 31.67, '2025-01-11 06:40:35', '2025-02-15 03:05:07'),
(210, 185, 311.11, '2025-01-20 15:50:39', '2025-02-01 03:06:20'),
(211, 193, 384.74, '2025-01-11 13:45:18', '2025-02-26 06:22:57'),
(212, 196, 79.65, '2025-01-11 03:30:27', '2025-02-19 00:24:53'),
(213, 197, 397.85, '2025-01-19 10:31:12', '2025-02-18 00:14:37'),
(214, 201, 783.14, '2025-01-07 00:38:40', '2025-01-25 13:07:05'),
(215, 202, 625.06, '2025-01-07 08:05:33', '2025-02-28 12:31:23'),
(216, 204, 261.22, '2025-01-19 17:42:52', '2025-02-06 11:41:37'),
(217, 205, 26.08, '2025-01-25 04:44:15', '2025-02-03 22:23:11'),
(218, 207, 303.29, '2025-01-12 01:30:47', '2025-01-20 02:10:17'),
(219, 209, 639.86, '2025-01-06 08:57:38', '2025-01-17 11:56:35'),
(220, 212, 85.36, '2025-01-19 18:13:59', '2025-02-20 00:17:01'),
(221, 213, 639.18, '2025-01-30 02:17:00', '2025-02-13 22:00:02'),
(222, 217, 195.34, '2025-01-12 10:07:19', '2025-02-20 13:10:35'),
(223, 219, 253.17, '2025-01-26 02:54:41', '2025-02-21 03:58:14'),
(224, 222, 241.72, '2025-01-18 20:28:51', '2025-02-14 05:55:57'),
(225, 224, 593.22, '2025-01-25 09:12:33', '2025-02-17 22:41:59'),
(226, 226, 339.16, '2025-01-02 19:38:40', '2025-02-13 15:17:39'),
(227, 229, 612.90, '2025-01-06 17:47:24', '2025-01-31 10:08:06'),
(228, 231, 183.91, '2025-01-30 07:31:04', '2025-02-04 15:32:48'),
(229, 239, 220.87, '2025-01-22 01:15:45', '2025-02-16 20:52:04'),
(230, 244, 691.50, '2025-01-30 12:14:38', '2025-01-30 23:27:47'),
(231, 247, 508.46, '2025-01-30 21:16:09', '2025-02-10 04:09:57'),
(232, 248, 78.52, '2025-01-28 00:25:15', '2025-02-08 04:33:30'),
(233, 249, 292.13, '2025-01-25 15:05:21', '2025-02-16 19:43:05'),
(234, 251, 541.49, '2025-01-12 02:57:49', '2025-01-25 05:31:19'),
(235, 252, 165.42, '2025-01-22 07:56:00', '2025-02-28 06:57:40'),
(236, 3, 201.05, '2025-01-30 08:01:23', '2025-02-20 10:10:06'),
(237, 8, 189.97, '2025-01-10 22:43:27', '2025-01-19 10:57:19'),
(238, 10, 621.87, '2025-01-13 22:19:19', '2025-03-01 09:49:13'),
(239, 19, 518.99, '2025-01-17 16:20:47', '2025-01-24 23:18:21'),
(240, 21, 30.67, '2025-01-08 10:10:11', '2025-01-16 16:02:07'),
(241, 23, 73.47, '2025-01-28 05:15:53', '2025-02-16 03:59:40'),
(242, 27, 666.36, '2025-01-12 10:52:56', '2025-02-04 02:54:22'),
(243, 28, 204.95, '2025-01-11 08:11:06', '2025-01-13 00:01:21'),
(244, 29, 132.82, '2025-01-01 15:44:00', '2025-02-06 04:09:16'),
(245, 41, 513.43, '2025-01-20 14:46:38', '2025-01-25 02:04:50'),
(246, 43, 19.04, '2025-01-14 18:09:37', '2025-01-23 01:19:18'),
(247, 46, 435.31, '2025-01-30 21:41:44', '2025-02-24 01:29:49'),
(248, 47, 430.12, '2025-01-24 10:09:02', '2025-01-31 11:04:59'),
(249, 49, 298.25, '2025-01-24 19:18:41', '2025-02-21 05:57:05'),
(250, 55, 76.64, '2025-01-30 01:08:09', '2025-02-14 03:34:21'),
(251, 56, 16.88, '2025-01-05 19:55:23', '2025-01-31 05:19:44'),
(252, 59, 304.15, '2025-01-21 08:15:46', '2025-02-23 07:37:39'),
(253, 61, 558.68, '2025-01-08 09:28:44', '2025-01-09 09:29:01'),
(254, 63, 516.37, '2025-01-29 14:57:20', '2025-02-03 06:25:45'),
(255, 65, 18.01, '2025-01-11 13:16:38', '2025-02-20 10:09:02'),
(256, 69, 233.64, '2025-01-21 10:57:45', '2025-02-10 20:14:41'),
(257, 73, 773.70, '2025-01-03 10:34:04', '2025-01-31 01:07:03'),
(258, 78, 597.77, '2025-01-11 17:18:53', '2025-01-27 20:07:39'),
(259, 82, 590.70, '2025-01-08 05:36:37', '2025-02-11 06:32:00'),
(260, 83, 872.37, '2025-01-28 14:32:34', '2025-01-30 12:55:40'),
(261, 86, 339.91, '2025-02-01 08:37:13', '2025-02-24 05:16:02'),
(262, 93, 495.51, '2025-01-23 11:21:16', '2025-02-06 07:34:25'),
(263, 94, 363.72, '2025-01-19 04:32:05', '2025-02-05 01:58:30'),
(264, 98, 520.69, '2025-01-20 12:29:31', '2025-01-31 05:05:03'),
(265, 102, 546.14, '2025-01-13 09:27:45', '2025-01-25 18:18:25'),
(266, 103, 174.01, '2025-01-10 17:38:16', '2025-01-24 02:33:13'),
(267, 104, 288.97, '2025-01-21 20:54:21', '2025-01-24 06:06:35'),
(268, 107, 325.60, '2025-01-18 04:54:59', '2025-02-03 07:04:21'),
(269, 108, 469.00, '2025-01-17 19:32:19', '2025-02-28 15:07:31'),
(270, 112, 322.80, '2025-01-10 04:01:34', '2025-01-16 01:01:29'),
(271, 113, 629.90, '2025-01-12 13:23:09', '2025-01-28 01:02:13'),
(272, 116, 411.45, '2025-01-04 22:41:16', '2025-02-14 22:00:01'),
(273, 120, 186.34, '2025-01-24 05:41:57', '2025-02-03 01:06:03'),
(274, 121, 311.59, '2025-01-18 02:35:01', '2025-02-15 10:34:42'),
(275, 123, 314.96, '2025-01-24 15:34:48', '2025-02-18 07:27:06'),
(276, 125, 503.27, '2025-01-04 10:46:33', '2025-02-09 20:54:14'),
(277, 126, 478.65, '2025-01-17 02:55:40', '2025-01-30 15:05:35'),
(278, 128, 196.69, '2025-01-06 07:54:05', '2025-01-11 17:16:42'),
(279, 132, 174.50, '2025-01-18 14:39:03', '2025-01-24 20:02:28'),
(280, 133, 172.12, '2025-01-28 18:58:55', '2025-02-16 20:30:12'),
(281, 136, 369.26, '2025-01-24 17:48:19', '2025-02-28 13:56:33'),
(282, 146, 94.47, '2025-01-11 12:47:38', '2025-02-19 05:58:04'),
(283, 149, 229.69, '2025-01-10 14:32:07', '2025-02-26 22:25:58'),
(284, 153, 175.27, '2025-01-19 18:28:04', '2025-02-17 06:15:24'),
(285, 156, 145.02, '2025-01-28 00:19:09', '2025-02-15 11:13:21'),
(286, 159, 396.41, '2025-01-06 01:53:50', '2025-01-27 22:11:01'),
(287, 165, 490.59, '2025-01-14 16:10:42', '2025-01-22 17:43:35'),
(288, 169, 549.84, '2025-01-14 06:26:42', '2025-01-19 00:53:37'),
(289, 179, 448.76, '2025-01-17 06:07:51', '2025-01-22 21:04:06'),
(290, 182, 563.48, '2025-01-11 16:18:27', '2025-02-03 03:55:26'),
(291, 187, 536.68, '2025-01-07 16:05:12', '2025-02-14 00:46:32'),
(292, 194, 332.93, '2025-01-14 19:39:05', '2025-02-04 14:42:49'),
(293, 196, 111.50, '2025-01-30 04:56:49', '2025-02-26 20:30:02'),
(294, 197, 330.03, '2025-01-28 11:10:56', '2025-02-10 02:39:58'),
(295, 198, 355.50, '2025-01-27 10:06:03', '2025-02-14 20:55:27'),
(296, 202, 771.56, '2025-01-18 18:26:16', '2025-02-19 05:42:03'),
(297, 206, 66.18, '2025-01-13 05:18:55', '2025-01-15 00:34:18'),
(298, 208, 234.16, '2025-01-11 10:22:29', '2025-02-12 09:32:25'),
(299, 211, 550.50, '2025-01-10 17:35:24', '2025-02-13 00:04:06'),
(300, 215, 425.87, '2025-01-25 12:50:09', '2025-02-06 21:41:16'),
(301, 225, 54.71, '2025-01-18 12:43:02', '2025-01-30 18:53:26'),
(302, 226, 448.38, '2025-01-12 13:22:15', '2025-01-13 21:53:52'),
(303, 232, 595.66, '2025-01-04 23:26:43', '2025-01-23 05:38:02'),
(304, 235, 306.58, '2025-01-11 08:04:52', '2025-01-12 16:50:50'),
(305, 240, 241.64, '2025-01-22 23:42:42', '2025-02-26 21:28:12'),
(306, 244, 641.51, '2025-01-16 08:55:45', '2025-02-22 22:42:27'),
(307, 254, 470.76, '2025-01-21 23:24:18', '2025-01-24 03:24:43'),
(308, 257, 51.00, '2025-01-25 06:37:56', '2025-02-16 10:34:18'),
(309, 260, 32.91, '2025-01-30 06:52:55', '2025-02-11 17:56:34'),
(310, 262, 635.08, '2025-01-21 18:22:24', '2025-02-15 08:57:39'),
(311, 263, 478.86, '2025-01-29 00:11:46', '2025-02-11 04:36:50'),
(312, 267, 170.68, '2025-01-19 01:51:32', '2025-02-01 16:33:43'),
(313, 269, 591.34, '2025-01-29 09:53:12', '2025-02-07 01:36:35'),
(314, 271, 424.89, '2025-01-13 20:07:41', '2025-01-23 15:16:30'),
(315, 274, 608.02, '2025-01-10 16:18:59', '2025-02-06 05:05:29'),
(316, 275, 275.86, '2025-01-03 23:25:10', '2025-02-19 20:47:54'),
(317, 283, 203.73, '2025-01-22 14:44:07', '2025-01-31 14:25:25'),
(318, 296, 88.28, '2025-01-13 00:43:05', '2025-02-05 19:42:03'),
(319, 1, 319.58, '2025-01-02 19:23:11', '2025-01-24 17:58:41'),
(320, 20, 48.09, '2025-01-22 20:33:29', '2025-02-24 10:41:19'),
(321, 23, 60.80, '2025-01-07 13:04:24', '2025-01-29 11:23:25'),
(322, 27, 612.12, '2025-02-01 12:42:41', '2025-02-11 18:49:08'),
(323, 31, 792.02, '2025-01-21 00:36:09', '2025-02-09 22:04:08'),
(324, 34, 465.26, '2025-01-09 18:45:01', '2025-01-31 18:21:53'),
(325, 36, 436.44, '2025-01-11 23:44:01', '2025-01-17 17:11:38'),
(326, 41, 582.55, '2025-01-29 12:09:32', '2025-02-28 14:01:25'),
(327, 42, 666.51, '2025-01-18 21:55:55', '2025-01-26 22:51:39'),
(328, 44, 217.64, '2025-01-22 23:42:48', '2025-02-16 16:57:28'),
(329, 45, 148.85, '2025-01-05 09:12:13', '2025-01-16 12:05:59'),
(330, 53, 405.53, '2025-01-29 19:41:29', '2025-02-14 12:48:14'),
(331, 54, 527.99, '2025-01-14 06:08:11', '2025-02-07 16:23:21'),
(332, 55, 98.05, '2025-01-05 16:09:45', '2025-02-16 18:00:25'),
(333, 61, 615.98, '2025-01-06 20:30:57', '2025-01-22 13:23:35'),
(334, 67, 421.13, '2025-01-28 20:04:14', '2025-02-21 03:07:24'),
(335, 70, 112.46, '2025-01-07 00:19:41', '2025-02-15 21:22:29'),
(336, 77, 790.84, '2025-01-04 22:25:52', '2025-02-15 07:22:20'),
(337, 80, 507.34, '2025-01-22 18:33:28', '2025-02-22 06:51:46'),
(338, 85, 150.20, '2025-01-03 22:44:27', '2025-01-12 06:08:03'),
(339, 90, 458.19, '2025-01-27 10:53:58', '2025-02-18 01:40:32'),
(340, 92, 496.72, '2025-01-24 05:46:11', '2025-02-14 13:14:03'),
(341, 97, 505.97, '2025-01-29 23:57:57', '2025-02-09 19:23:46'),
(342, 99, 308.24, '2025-01-21 14:23:15', '2025-01-31 16:08:46'),
(343, 104, 295.54, '2025-01-05 01:24:37', '2025-01-09 10:14:34'),
(344, 106, 676.86, '2025-01-23 18:41:40', '2025-01-26 21:49:54'),
(345, 109, 550.82, '2025-01-03 01:33:07', '2025-02-09 15:30:06'),
(346, 110, 426.95, '2025-01-22 08:52:28', '2025-01-26 21:10:42'),
(347, 115, 305.56, '2025-01-03 17:58:43', '2025-01-18 08:27:38'),
(348, 117, 140.43, '2025-01-12 21:06:05', '2025-02-26 01:44:13'),
(349, 123, 425.77, '2025-01-29 04:37:19', '2025-02-23 06:17:04'),
(350, 125, 651.29, '2025-01-08 22:04:24', '2025-02-17 11:09:41'),
(351, 126, 588.50, '2025-01-20 13:12:31', '2025-02-23 06:18:17'),
(352, 127, 62.88, '2025-01-16 17:48:26', '2025-02-10 06:39:36'),
(353, 128, 246.60, '2025-01-10 22:55:06', '2025-01-17 09:10:54'),
(354, 131, 105.38, '2025-01-14 22:27:06', '2025-02-12 15:20:29'),
(355, 132, 248.87, '2025-01-04 04:56:55', '2025-02-07 05:56:23'),
(356, 133, 179.72, '2025-01-13 07:34:39', '2025-02-07 18:11:58'),
(357, 135, 515.82, '2025-01-24 13:38:20', '2025-02-03 13:07:17'),
(358, 141, 170.69, '2025-01-23 14:57:55', '2025-02-20 06:29:43'),
(359, 142, 452.94, '2025-01-13 14:03:28', '2025-02-22 00:44:45'),
(360, 144, 293.24, '2025-01-10 08:53:40', '2025-02-15 06:49:41'),
(361, 151, 487.71, '2025-01-30 16:03:22', '2025-02-23 13:20:26'),
(362, 153, 206.49, '2025-01-14 23:22:21', '2025-02-04 21:23:25'),
(363, 155, 253.32, '2025-01-13 19:36:18', '2025-01-20 15:09:22'),
(364, 161, 522.38, '2025-01-05 07:57:12', '2025-01-18 04:17:58'),
(365, 166, 244.37, '2025-01-03 05:40:02', '2025-02-12 17:55:28'),
(366, 167, 516.64, '2025-01-04 17:55:17', '2025-01-31 20:45:23'),
(367, 170, 419.14, '2025-01-02 23:07:18', '2025-01-03 09:25:44'),
(368, 172, 632.53, '2025-01-30 12:49:49', '2025-02-13 01:21:26'),
(369, 173, 379.86, '2025-01-14 06:02:26', '2025-02-16 16:20:53'),
(370, 177, 515.36, '2025-01-12 01:48:48', '2025-01-12 11:19:18'),
(371, 180, 475.83, '2025-01-29 19:29:17', '2025-02-26 05:59:44'),
(372, 181, 143.75, '2025-01-01 15:27:06', '2025-01-07 02:19:21'),
(373, 185, 243.48, '2025-01-12 21:56:02', '2025-02-16 04:17:45'),
(374, 199, 485.54, '2025-01-03 14:10:07', '2025-01-15 03:11:13'),
(375, 200, 16.30, '2025-01-29 04:49:55', '2025-02-10 20:31:48'),
(376, 201, 686.35, '2025-01-14 18:32:45', '2025-01-25 11:28:36'),
(377, 205, 26.73, '2025-01-09 07:56:57', '2025-02-27 15:00:47'),
(378, 212, 96.22, '2025-01-23 21:52:51', '2025-02-04 06:39:27'),
(379, 216, 712.54, '2025-01-23 02:51:30', '2025-01-26 22:31:44'),
(380, 218, 586.38, '2025-01-12 14:41:15', '2025-03-01 07:34:15'),
(381, 220, 534.50, '2025-01-16 12:57:48', '2025-02-26 15:08:53'),
(382, 221, 199.31, '2025-01-07 06:57:27', '2025-01-19 13:30:36'),
(383, 222, 340.78, '2025-01-24 10:40:01', '2025-02-27 04:46:31'),
(384, 223, 19.07, '2025-01-21 17:14:24', '2025-02-23 15:43:21'),
(385, 224, 702.50, '2025-01-08 21:55:56', '2025-01-18 19:13:08'),
(386, 225, 56.96, '2025-01-20 14:10:45', '2025-02-19 14:17:48'),
(387, 228, 452.64, '2025-01-09 01:48:39', '2025-02-12 10:43:32'),
(388, 231, 128.31, '2025-02-01 09:48:54', '2025-02-15 22:26:09'),
(389, 232, 579.12, '2025-01-29 02:54:12', '2025-02-18 00:16:56'),
(390, 235, 289.23, '2025-01-28 00:03:50', '2025-02-11 23:54:00'),
(391, 237, 230.99, '2025-01-30 06:42:33', '2025-01-30 07:47:52'),
(392, 247, 563.22, '2025-01-28 09:31:21', '2025-02-10 16:07:16'),
(393, 249, 330.44, '2025-01-07 12:06:56', '2025-02-15 08:49:29'),
(394, 253, 114.94, '2025-01-04 13:04:14', '2025-01-10 23:33:12'),
(395, 256, 540.68, '2025-01-07 00:31:15', '2025-01-16 11:16:47'),
(396, 260, 38.60, '2025-01-08 15:09:09', '2025-02-28 02:02:42'),
(397, 261, 444.79, '2025-01-07 18:44:45', '2025-01-09 02:52:13'),
(398, 267, 139.99, '2025-01-27 03:25:45', '2025-02-11 08:42:52'),
(399, 270, 185.09, '2025-01-02 05:29:39', '2025-01-28 19:58:50'),
(400, 271, 382.40, '2025-01-31 16:15:13', '2025-02-02 21:28:30'),
(401, 273, 847.44, '2025-01-28 06:43:48', '2025-02-14 08:54:48'),
(402, 279, 101.25, '2025-02-01 10:58:01', '2025-02-22 19:31:20'),
(403, 283, 162.43, '2025-01-22 10:29:11', '2025-02-28 07:33:03'),
(404, 284, 571.22, '2025-01-09 03:42:51', '2025-01-27 09:55:46'),
(405, 285, 95.49, '2025-01-31 21:28:19', '2025-02-18 20:35:24'),
(406, 286, 317.02, '2025-01-05 15:16:11', '2025-02-09 15:49:15'),
(407, 287, 359.03, '2025-01-16 08:08:23', '2025-02-10 10:21:47'),
(408, 300, 458.36, '2025-01-31 18:56:07', '2025-02-19 14:35:12'),
(409, 307, 72.07, '2025-01-29 09:22:23', '2025-02-23 02:21:29'),
(410, 308, 96.11, '2025-01-21 16:50:26', '2025-02-25 16:27:31'),
(411, 315, 325.75, '2025-01-03 19:57:34', '2025-01-18 11:05:38'),
(412, 317, 140.16, '2025-01-08 13:38:18', '2025-01-28 21:27:09'),
(413, 318, 570.36, '2025-01-23 12:13:46', '2025-01-31 12:50:05'),
(414, 323, 151.10, '2025-01-12 02:16:00', '2025-01-31 05:40:43'),
(415, 327, 465.72, '2025-01-04 19:59:48', '2025-02-20 05:13:51'),
(416, 331, 442.66, '2025-01-27 11:18:41', '2025-02-17 16:41:19'),
(417, 333, 793.97, '2025-01-06 14:04:09', '2025-02-27 22:58:10'),
(418, 334, 276.58, '2025-01-29 23:33:16', '2025-02-26 19:21:58'),
(419, 336, 113.33, '2025-01-19 12:12:47', '2025-02-03 00:02:18'),
(420, 338, 267.55, '2025-01-31 07:19:30', '2025-01-31 16:51:39'),
(421, 341, 545.19, '2025-01-16 22:38:31', '2025-02-27 03:28:56'),
(422, 342, 454.63, '2025-01-14 22:02:59', '2025-01-28 05:15:29'),
(423, 343, 405.20, '2025-01-28 11:25:00', '2025-02-28 01:26:36'),
(424, 347, 300.11, '2025-01-08 12:11:18', '2025-02-25 06:26:38'),
(425, 349, 580.26, '2025-01-07 17:52:27', '2025-01-12 07:25:04'),
(426, 351, 657.75, '2025-01-15 02:49:34', '2025-02-07 08:30:37');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `created_at`) VALUES
(1, 'kperret', '$2y$10$jutIsRxlQjltmW2O6/HpS.xs4.HfEEwfmECLm/64PD2c0fp4CNWvq', 'fguillaume@blin.fr', 'admin', '2025-01-10 20:36:12'),
(2, 'sleduc', '$2y$10$TWSiAo5sf7IV9Ms90QyRBeqhc82pz578muFH5W1/z/cVaj//tK1fq', 'lesage.aurelie@laposte.net', 'admin', '2025-01-08 01:40:23'),
(3, 'margaud02', '$2y$10$.PEEElbpL.ITxP717qFbG.1ga1Rm8HKrgzI24Crl//sebY1LCi5K6', 'fcamus@chretien.com', 'user', '2025-01-06 13:25:02'),
(4, 'marin.denis', '$2y$10$B.5GoOznST7KwiiGJk0k2.voYI6H6hgNDrRqQlRnwE9BT0rVh/56K', 'laurent.benard@club-internet.fr', 'user', '2025-01-09 15:02:58'),
(5, 'sylvie.jean', '$2y$10$KBFiemmYsydjSwkEok..cOAbbrAYRpynyWUEN94age4H63cUaCUx6', 'perrin.roger@launay.fr', 'user', '2025-01-14 16:28:46'),
(6, 'rodriguez.thibault', '$2y$10$MLMiYBlF6..Gq6tcrDQ0pei0l6BF3H8xcytgVZB6zYnMQUyIVErEe', 'hamel.pierre@club-internet.fr', 'admin', '2025-01-10 19:56:19'),
(7, 'adrien.gomes', '$2y$10$TnV0k.KhR3MuAMca4Li8.O4cZAI.8xCq3bmxdZGn/GyS2Cv4TCiYO', 'bouvier.maryse@barthelemy.fr', 'admin', '2025-01-06 05:18:00'),
(8, 'arthur74', '$2y$10$wlCGE5iJ8pqksudtLC7ajujoWONfQ3zQW0pdyd.I7MhmzVnEjvJzK', 'ilombard@leger.com', 'admin', '2025-01-25 04:59:23'),
(9, 'julien.roger', '$2y$10$r8Huz5nnP2GQ./4h/8AoiOCvt/ks0DOEMJU1XrmXSMU086IFiuiP2', 'nath48@free.fr', 'admin', '2025-01-10 18:46:11'),
(10, 'icollet', '$2y$10$OhM0tCke9YraofVm8qYfFOroyxkRs2CTE.3u6jfra1AaOhi2/qsk2', 'mace.alexandrie@nguyen.fr', 'user', '2025-01-29 16:34:10'),
(11, 'isabelle49', '$2y$10$JFcHDVmrVeZI0SG3lKRAUenAXhDY1itgVfPb2Hhy8VNksmQpKH9B.', 'alexandre05@orange.fr', 'admin', '2025-01-30 21:55:26'),
(12, 'victoire.desousa', '$2y$10$kYX7/dymuaCiqsYO.GaOge3K2xlRQZFj5Q0LYZ2ZxvowPNF/28vC2', 'sguibert@free.fr', 'user', '2025-01-08 06:55:35'),
(13, 'labbe.henri', '$2y$10$tmlAcyWi9YrcOSBq3AR14uS2uy2Rn.YTy4nqCJ8zsjoGx8Y90d5ru', 'eugene91@roux.fr', 'admin', '2025-01-22 03:44:48'),
(14, 'ndelannoy', '$2y$10$n1.xyIjt1X7k9Rhwum5.UOK492DFPmFGYi2aMpsBnFN82POWkZZ/6', 'vbouvet@laposte.net', 'admin', '2025-01-20 08:00:51'),
(15, 'marcel86', '$2y$10$JbSaJ8E.yEzEkuYpzQNjr.qqKcIrHe.eANFSdSZtyseDGiBJxvTLq', 'ufontaine@mahe.com', 'user', '2025-01-12 18:22:35'),
(16, 'corinne62', '$2y$10$erLhUJGx7XIoxs.z0wYXt.PlY3vCR0788TiNdfJuVDwJbHpBNSSJW', 'ugerard@fouquet.fr', 'admin', '2025-01-24 03:57:26'),
(17, 'fchauvin', '$2y$10$ntW8MAWJiUCPbX5FgA39Jud9FXeJ/Gvp1KAeHp7T4b8gwt/KabdB6', 'corinne.gimenez@gmail.com', 'user', '2025-01-15 01:50:09'),
(18, 'aime.menard', '$2y$10$qEXlxt7AAg6hnt368ypWGOt9Ov6KAW6GQR.EtTHtiGDd1dZs2VE12', 'marcelle71@lopez.fr', 'user', '2025-01-26 07:28:35'),
(19, 'legros.alice', '$2y$10$IgpIRD97nU4h0RB/V6NES.VuqgKbFoAN6dkq8BOlVR/uN.B7gnQ42', 'margaret55@tele2.fr', 'admin', '2025-01-14 01:34:12'),
(20, 'francoise53', '$2y$10$7AjADZEMsoFeFyFvueCG.OQzy.u.tgYexkbVoawQKztRs03HgFrFu', 'cmerle@faure.com', 'admin', '2025-01-24 08:57:38');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;

--
-- AUTO_INCREMENT pour la table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=427;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `promos`
--
ALTER TABLE `promos`
  ADD CONSTRAINT `promos_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
