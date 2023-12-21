-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 21 déc. 2023 à 12:48
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbsoafa`
--

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `amount` double NOT NULL,
  `date_facture` date DEFAULT NULL,
  `payer` bit(1) DEFAULT NULL,
  `totalht` int(11) NOT NULL,
  `tva` int(11) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `payment_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`amount`, `date_facture`, `payer`, `totalht`, `tva`, `client_id`, `invoice_id`, `payment_id`) VALUES
(160, '2023-12-13', b'1', 190, 30, 1, 1, NULL),
(180, '2023-12-13', b'1', 214, 34, 1, 2, NULL),
(500, '2023-12-13', b'0', 595, 95, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `facture_produit`
--

CREATE TABLE `facture_produit` (
  `facture_invoice_id` bigint(20) NOT NULL,
  `produit_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture_produit`
--

INSERT INTO `facture_produit` (`facture_invoice_id`, `produit_id`) VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(3, 6),
(3, 7);

-- --------------------------------------------------------

--
-- Structure de la table `facture_qte`
--

CREATE TABLE `facture_qte` (
  `qte` int(11) DEFAULT NULL,
  `facture_invoice_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture_qte`
--

INSERT INTO `facture_qte` (`qte`, `facture_invoice_id`) VALUES
(2, 1),
(1, 2),
(1, 2),
(1, 3),
(1, 3),
(1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `amount` double NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_id` bigint(20) NOT NULL,
  `card_holder_name` varchar(255) DEFAULT NULL,
  `credit_card_number` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`amount`, `client_id`, `payment_date`, `payment_id`, `card_holder_name`, `credit_card_number`, `cvv`, `expiration_date`) VALUES
(340, 1, '2023-12-13 01:00:00.000000', 1, 'mimi', 'hhhh', '121', '2023-12-31');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `price` double NOT NULL,
  `id` bigint(20) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`price`, `id`, `image`, `name`) VALUES
(80, 1, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702456485/images/S5629f78e240147968e8ab6e2f887d1e5n.jpg_640x640Q90.jpg.webp', 'Pantalon Large Noir'),
(100, 2, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702456587/images/tommy-hilfiger_379412_WW0WW39673_YCF_20230816T152016_01.jpg.jpg', 'Chemise Blanche Tommy '),
(250, 4, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702458577/images/manteau-souple-a-capuche.jpg.webp', 'Manteau Caramel'),
(50, 5, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702458601/images/sweatshirt-rose-avec-une-impression-faience.jpg.jpg', 'Sweatshirt rose avec impression'),
(150, 6, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702458634/images/1.jpg.jpg', 'Jogging Gris'),
(250, 7, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702458913/images/e5803a53a47f416a9fb2fda271ed6cd2.jpg.webp', 'Manteau Gris'),
(60, 8, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702458971/images/209hx00-fd3x-bb0bb1_vertemerau___01.jpg.jpg', 'Jeans Noue Carotte'),
(99, 9, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702459114/images/61DbhRAiowL._AC_UY780_.jpg.jpg', 'Robe Noir Floral'),
(120, 10, 'http://res.cloudinary.com/dkxnefolq/image/upload/v1702463917/images/pull-mariniere-grossesse-et-allaitement-noir-akq53_1_fr5.jpg.webp', 'pill');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `role` int(11) NOT NULL,
  `id` bigint(20) NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`role`, `id`, `adresse`, `email`, `nom`, `password`, `prenom`) VALUES
(0, 1, 'sfax', 'mariem@gmail.com', 'ben slim', 'mimi', 'mariem'),
(1, 2, 'sfax', 'admin', 'admin', 'admin', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `FKq6ligbdpus5rsqiu3yuqo7r7o` (`client_id`),
  ADD KEY `FKjs8a4a2k3b922m8gdysv5cy0m` (`payment_id`);

--
-- Index pour la table `facture_produit`
--
ALTER TABLE `facture_produit`
  ADD KEY `FKilsgkv3gjwvkh1v2ad78rdc4q` (`produit_id`),
  ADD KEY `FKc0xpb4jwqxbvwdcmvhyvlo0g2` (`facture_invoice_id`);

--
-- Index pour la table `facture_qte`
--
ALTER TABLE `facture_qte`
  ADD KEY `FK14j205mkjaa439t38rri5jqx` (`facture_invoice_id`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `FK6vewpujhkrtd6u026ufs8bm6l` (`client_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `invoice_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `payment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `FKjs8a4a2k3b922m8gdysv5cy0m` FOREIGN KEY (`payment_id`) REFERENCES `paiement` (`payment_id`),
  ADD CONSTRAINT `FKq6ligbdpus5rsqiu3yuqo7r7o` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `facture_produit`
--
ALTER TABLE `facture_produit`
  ADD CONSTRAINT `FKc0xpb4jwqxbvwdcmvhyvlo0g2` FOREIGN KEY (`facture_invoice_id`) REFERENCES `facture` (`invoice_id`),
  ADD CONSTRAINT `FKilsgkv3gjwvkh1v2ad78rdc4q` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`);

--
-- Contraintes pour la table `facture_qte`
--
ALTER TABLE `facture_qte`
  ADD CONSTRAINT `FK14j205mkjaa439t38rri5jqx` FOREIGN KEY (`facture_invoice_id`) REFERENCES `facture` (`invoice_id`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `FK6vewpujhkrtd6u026ufs8bm6l` FOREIGN KEY (`client_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
