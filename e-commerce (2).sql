-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 28 jan. 2025 à 14:15
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
(1, 'Vêtements'),
(2, 'Accessoires'),
(3, 'Chaussures'),
(4, 'Montres'),
(5, 'Sacs');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
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
  `image` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `image`, `price`, `stock`, `category_id`, `created_at`) VALUES
(1, 'T-shirt rouge', 'Un t-shirt rouge en coton de haute qualité.', 'images/tshirt_rouge.jpg', 19.99, 50, 1, '2025-01-15 10:50:16'),
(2, 'Jeans bleu', 'Un jeans bleu confortable et durable.', 'images/jeans_bleu.jpg', 49.99, 30, 1, '2025-01-15 10:50:16'),
(3, 'Sweat à capuche', 'Un sweat à capuche chaud et stylé.', 'images/sweat_capuche.jpg', 39.99, 20, 1, '2025-01-15 10:50:16'),
(4, 'Chaussures de sport', 'Des chaussures de sport légères et résistantes.', 'images/chaussures_sport.jpg', 59.99, 40, 3, '2025-01-15 10:50:16'),
(5, 'Casquette noire', 'Une casquette noire élégante et ajustable.', 'images/casquette_noire.jpg', 14.99, 100, 2, '2025-01-15 10:50:16'),
(6, 'Veste en cuir', 'Une veste en cuir véritable pour un look chic.', 'images/veste_cuir.jpg', 99.99, 10, 1, '2025-01-15 10:50:16'),
(7, 'Robe d\'été', 'Une robe d\'été légère et colorée.', 'images/robe_ete.jpg', 29.99, 25, 1, '2025-01-15 10:50:16'),
(8, 'Montre en acier', 'Une montre en acier avec un design moderne.', 'images/montre_acier.jpg', 79.99, 15, 4, '2025-01-15 10:50:16'),
(9, 'Sac à dos', 'Un sac à dos spacieux et confortable.', 'images/sac_a_dos.jpg', 34.99, 60, 5, '2025-01-15 10:50:16'),
(10, 'Lunettes de soleil', 'Des lunettes de soleil avec protection UV.', 'images/lunettes_soleil.jpg', 24.99, 70, 2, '2025-01-15 10:50:16');

-- --------------------------------------------------------

--
-- Structure de la table `promos`
--

CREATE TABLE `promos` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `original_price` decimal(10,2) NOT NULL,
  `discounted_price` decimal(10,2) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `promos`
--

INSERT INTO `promos` (`id`, `name`, `description`, `image`, `original_price`, `discounted_price`, `category_id`, `created_at`) VALUES
(1, 'Ordinateur Portable', 'Ordinateur portable performant pour le travail et les loisirs.', 'ordinateur_portable.jpg', 1000.00, 800.00, 1, '2025-01-16 08:56:18'),
(2, 'Smartphone', 'Smartphone avec écran haute résolution et caméra de qualité.', 'smartphone.jpg', 700.00, 550.00, 1, '2025-01-16 08:56:18'),
(3, 'Casque Audio', 'Casque audio avec réduction de bruit pour une expérience immersive.', 'casque_audio.jpg', 150.00, 120.00, 1, '2025-01-16 08:56:18'),
(4, 'Télévision 4K', 'Télévision 4K avec une qualité d\'image exceptionnelle.', 'television_4k.jpg', 1200.00, 950.00, 1, '2025-01-16 08:56:18'),
(5, 'Tablette', 'Tablette légère et puissante pour le divertissement.', 'tablette.jpg', 500.00, 400.00, 1, '2025-01-16 08:56:18'),
(6, 'Montre Connectée', 'Montre connectée avec suivi de la condition physique.', 'montre_connectee.jpg', 200.00, 150.00, 1, '2025-01-16 08:56:18');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `created_at`) VALUES
(1, 'admin', '$2y$10$JkbVTKNfkEzlg1eIMCE8TOur4tqRGFKODLMsVyz2XTLi1jEy0xBFu', 'admin@example.com', 'admin', '2025-01-15 10:50:16'),
(2, 'ilan', '$2y$10$GDT.g8BHo077Jtd/4DDJkOVTqdCd/awzWTaw7HXDB3I21.HWKbu1m', 'ilan17langelez@gmail.com', 'user', '2025-01-15 12:43:21'),
(3, 'ilan', '$2y$10$1lqx.I/h2sexRDClDyEHKust8HlhICibv8Qo.Bv2ztIKCgDlgT01W', 'korityx.pro@gmail.com', 'user', '2025-01-15 12:43:34'),
(4, 'ilan', '$2y$10$azIYf2nn5KDkktOF.KcV8emaa0ZUa1WJmmkpjctaOxVJaxdLeZuZG', 'korityx.pro@gmail.com', 'user', '2025-01-15 12:44:20'),
(5, 'ilan', '$2y$10$YamzstKqn4ufy2UbcnZ53.VGch.3S9srKEQ3TOC6d.z6v.OuIY88G', 'korityx.pro@gmail.com', 'user', '2025-01-15 12:44:29'),
(6, 'ilan', '$2y$10$3kxexAJl.WfB/TKLnCNomOscdbWBAetdAWwkHml4bP30Y75lq9H8O', 'korityx.pro@gmail.com', 'user', '2025-01-15 12:45:57'),
(7, 'ilan', '$2y$10$y.RY2/PksLD5Y3TDVVI3.upJQg4z1BdbvSSerpD2NwC0VRJuwMpzy', 'korityx.pro@gmail.com', 'user', '2025-01-15 12:46:09'),
(8, 'ilan', '$2y$10$8iE0aQyo/Fwa9UAgVHrLlO.Tbni2fSFkfExnxYXwpJ86VXyIY4i86', 'korityx.pro@gmail.com', 'user', '2025-01-15 12:46:30'),
(9, 'ilan', '$2y$10$r5LBtHsKUW.CbeU7ztuQ5.i7aojEcVotUmD7qR9.yLDKxWmzWBZOS', 'korityx.pro@gmail.com', 'user', '2025-01-15 12:47:52'),
(10, 'ilan', '$2y$10$ccURZwV2NoV5ewUX4jLMJeEKRdrXS5H678YJP4KrgyUNOMR2/ayMS', 'korityx.pro@gmail.com', 'user', '2025-01-15 13:24:15'),
(11, 'Ilanlgz', '$2y$10$zkxLCRVNj4Md5ScUY3VUXu5e7xUs8nPEXo/s4fwdd17yiCoZerUNK', 'ilan.langelez@coda-student.school', 'user', '2025-01-16 14:35:43'),
(12, 'ilan', '$2y$10$hpkhFwJ4VvyrtaSu9YQBze1RlaLVJd4gMuYFhOvxDyZs.NZT3lkMa', 'korityx.pro@gmail.com', 'user', '2025-01-16 14:38:47'),
(13, 'ilan', '$2y$10$Aa2U8CVvFzEReMci0hYeKuYZ5.L3ReUVIZT4J1uLmgVxEeMmVy8uC', 'ilan17langelez@gmail.com', 'user', '2025-01-16 14:39:38');

--
-- Index pour les tables déchargées
--

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
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Contraintes pour les tables déchargées
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
