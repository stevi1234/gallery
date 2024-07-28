-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 27 juil. 2024 à 11:56
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
-- Base de données : `gallery_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `album_list`
--

CREATE TABLE `album_list` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `user_id` int(30) NOT NULL,
  `delete_f` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `album_list`
--

INSERT INTO `album_list` (`id`, `name`, `user_id`, `delete_f`, `date_created`, `date_updated`) VALUES
(1, 'Avatars', 1, 0, '2021-08-09 10:23:50', '2021-08-09 13:09:06'),
(2, 'Sample Images', 1, 0, '2021-08-09 11:13:16', '2021-08-09 14:12:19'),
(4, 'Album 104', 1, 0, '2021-08-09 11:16:33', NULL),
(5, 'Album 105', 1, 0, '2021-08-09 11:16:41', '2021-08-09 16:15:17'),
(8, 'Mes photos', 10, 0, '2024-07-12 19:47:40', '2024-07-14 08:11:09'),
(9, 'Vaccances', 10, 0, '2024-07-13 09:02:13', '2024-07-14 08:49:17'),
(10, 'Mes Vaccances', 10, 0, '2024-07-13 09:02:23', '2024-07-14 08:15:47'),
(11, 'azhar', 10, 0, '2024-07-14 09:28:04', NULL),
(12, '', 10, 1, '2024-07-20 07:23:28', '2024-07-26 05:58:24');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` int(30) NOT NULL,
  `album_id` int(30) NOT NULL,
  `original_name` text NOT NULL,
  `path_name` text NOT NULL,
  `delete_f` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `album_id`, `original_name`, `path_name`, `delete_f`, `user_id`, `date_created`, `date_updated`) VALUES
(1, 1, 'avatar101.jpg', 'uploads/user_1/album_1/1628486640.jpg', 0, 1, '2021-08-09 13:24:44', '2021-08-09 13:45:39'),
(2, 1, 'avatar.jpg', 'uploads/user_1/album_1/1628486640_1.jpg', 0, 1, '2021-08-09 13:24:44', NULL),
(3, 1, 'avatar102.png', 'uploads/user_1/album_1/1628486640.png', 0, 1, '2021-08-09 13:24:44', '2021-08-09 13:45:50'),
(4, 2, '1.jpg', 'uploads/user_1/album_2/1628489520.jpg', 0, 1, '2021-08-09 14:12:31', NULL),
(5, 2, 'test.jpg', 'uploads/user_1/album_2/1628489520_1.jpg', 0, 1, '2021-08-09 14:12:31', '2021-08-09 14:13:46'),
(6, 2, '1850646 - Copy.jpg', 'uploads/user_1/album_2/1628489520_2.jpg', 0, 1, '2021-08-09 14:12:31', NULL),
(16, 8, 'PXL_20240318_034321415.NIGHT.jpg', 'uploads/user_10/album_8/1720802880.jpg', 0, 10, '2024-07-12 19:48:03', '2024-07-14 08:47:02'),
(17, 8, 'PXL_20240504_044240739.PORTRAIT.jpg', 'uploads/user_10/album_8/1720802880_1.jpg', 0, 10, '2024-07-12 19:48:37', '2024-07-14 08:16:08'),
(18, 8, 'prfl.png', 'uploads/user_10/album_8/1720802940.png', 0, 10, '2024-07-12 19:49:21', '2024-07-14 08:59:47'),
(19, 11, 'PXL_20240318_045813552.NIGHT.jpg', 'uploads/user_10/album_11/1720938720.jpg', 1, 10, '2024-07-14 09:32:19', '2024-07-26 05:54:30'),
(20, 8, 'PXL_20240318_050412793.jpg', 'uploads/user_10/album_8/1721444760.jpg', 0, 10, '2024-07-20 06:06:10', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Sarinaka'),
(6, 'short_name', 'Sary'),
(11, 'logo', 'uploads/gallery.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(10, 'Azhar ', 'Tsiavia', 'azboy', '485b100455226e5b8b5c6e77cde25bf4', 'uploads/1720769580_prfl.png', NULL, 0, '2024-07-12 10:33:49', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `album_list`
--
ALTER TABLE `album_list`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT pour la table `album_list`
--
ALTER TABLE `album_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
