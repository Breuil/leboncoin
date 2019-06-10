-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le :  lun. 10 juin 2019 à 07:28
-- Version du serveur :  8.0.13
-- Version de PHP :  7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `le_bon_coin`
--
CREATE DATABASE IF NOT EXISTS `le_bon_coin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `le_bon_coin`;

-- --------------------------------------------------------

--
-- Structure de la table `advert`
--

CREATE TABLE `advert` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `date` datetime NOT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `advert`
--

INSERT INTO `advert` (`id`, `category_id`, `owner_id`, `title`, `price`, `date`, `place`, `description`, `photo`) VALUES
(1, 1, 1, 'Vieille télé cassée', 100, '2019-06-09 19:59:54', 'Chamonix', 'Dans les exemples ci-avant, on peut voir plusieurs fonctionnalités de <textarea>. Le premier exemple illustre l\'utilisation la plus simple avec seul un attribut id qui permet d\'associer l\'élément <textarea> avec un élément <label> à des fins d\'accessibilité ainsi qu\'un attribut name qui permet de nommer la donnée qui sera envoyée au serveur lors de l\'envoi du formulaire.', '9c375024b6365eeda96583c2fc5759b6.jpeg'),
(2, 2, 1, 'Loue crocodile', 500, '2019-06-09 20:01:06', 'Tokyo', 'Si vous êtes un collectionneur de montures et que certaines font encore de la résistance pour vous appartenir alors cette nouvelle vous intéressera peut-être. En effet, de nombreux joueurs ont souligné que le temps de réapparition pour les deux world boss, Galion et Oondasta était excessivement long.', '15e963a44850ecc43a8fb35ba6d343d3.jpeg'),
(3, 1, 1, 'Pantoufle à peine usée', 2, '2019-06-09 20:37:44', 'Tokyo', 'In Internet Explorer 10, SVG images with .img-fluid are disproportionately sized. To fix this, add width: 100% \\9; where necessary. This fix improperly sizes other image formats, so Bootstrap doesn’t apply it automatically.', '27dc50e00a3f5e52003a32589c1acf45.jpeg'),
(4, 6, 1, 'Emploi peintre de lacets', 1200, '2019-06-10 07:05:37', 'Palavas-les-flots', 'For though result and talent add are parish valley. Songs in oh other avoid it hours woman style. In myself family as if be agreed. Gay collected son him knowledge delivered put. Added would end ask sight and asked saw dried house. Property expenses yourself occasion endeavor two may judgment she. Me of soon rank be most head time tore. Colonel or passage to ability.', '7a7f1f1459d02b4059bf90e8694806ce.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Meubles'),
(2, 'Voitures'),
(3, 'Vacances'),
(4, 'Loisirs'),
(5, 'Mode'),
(6, 'Emploi');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190521081229', '2019-05-21 08:13:35'),
('20190521085629', '2019-05-21 09:00:57'),
('20190604093439', '2019-06-04 09:35:21');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `roles`) VALUES
(1, 'Pepito', 'pepito@mail.com', 'azerty', 'a:1:{i:0;s:9:\"ROLE_USER\";}'),
(2, 'Michel', 'michel@michel.com', 'michel', 'a:1:{i:0;s:9:\"ROLE_USER\";}');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `advert`
--
ALTER TABLE `advert`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_54F1F40B12469DE2` (`category_id`),
  ADD KEY `IDX_54F1F40B7E3C61F9` (`owner_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `advert`
--
ALTER TABLE `advert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `advert`
--
ALTER TABLE `advert`
  ADD CONSTRAINT `FK_54F1F40B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_54F1F40BF675F31B` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
