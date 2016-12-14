-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 13 Décembre 2016 à 23:55
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `portfolio`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `username` varchar(254) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`username`, `password`) VALUES
('admin', '0');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_competance`
--

CREATE TABLE `categorie_competance` (
  `idCompetanceCategorie` int(11) NOT NULL,
  `nomCompetanceCategorie` varchar(254) DEFAULT NULL,
  `descriptionCompetanceCategorie` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie_competance`
--

INSERT INTO `categorie_competance` (`idCompetanceCategorie`, `nomCompetanceCategorie`, `descriptionCompetanceCategorie`) VALUES
(3, 'Programming', 'You can do stuff with the computer'),
(2, 'Economics', 'You can do stuff with stocks');

-- --------------------------------------------------------

--
-- Structure de la table `categorie_projet`
--

CREATE TABLE `categorie_projet` (
  `idProjetCategorie` int(11) NOT NULL,
  `nomProjetCategorie` varchar(254) DEFAULT NULL,
  `descriptionProjetCategorie` varchar(254) DEFAULT NULL,
  `imageProjetCategorie` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categorie_projet`
--

INSERT INTO `categorie_projet` (`idProjetCategorie`, `nomProjetCategorie`, `descriptionProjetCategorie`, `imageProjetCategorie`) VALUES
(1, '3D', 'All 3d Work', '3D.jpg'),
(5, '3D', 'All 3d Work', '3D.jpg'),
(3, '3D', 'All 3d Work', '3D.jpg'),
(4, '4D', 'All 3d Work', '4D.jpg'),
(6, '4D', 'All 3d Work', '4D.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `competance`
--

CREATE TABLE `competance` (
  `idCompetance` int(11) NOT NULL,
  `idProfile` int(11) DEFAULT NULL,
  `nomCompetance` varchar(254) NOT NULL,
  `pourcentageCompetance` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `competance`
--

INSERT INTO `competance` (`idCompetance`, `idProfile`, `nomCompetance`, `pourcentageCompetance`) VALUES
(1, 1, 'Python', 65),
(3, 1, 'C', 60),
(4, 1, 'java', 50),
(5, 1, 'C', 60),
(6, 1, 'java', 50);

-- --------------------------------------------------------

--
-- Structure de la table `courrier`
--

CREATE TABLE `courrier` (
  `idCourrier` int(11) NOT NULL,
  `emailCourrier` varchar(254) DEFAULT NULL,
  `sujetCourrier` varchar(254) DEFAULT NULL,
  `messageCourrier` varchar(254) DEFAULT NULL,
  `dateEnvoieCourrier` datetime DEFAULT NULL,
  `nomCompletCourrier` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `courrier`
--

INSERT INTO `courrier` (`idCourrier`, `emailCourrier`, `sujetCourrier`, `messageCourrier`, `dateEnvoieCourrier`, `nomCompletCourrier`) VALUES
(3, 'test@test.com', 'test', 'hello', '2016-12-13 18:29:46', 'harry poter'),
(5, 'rabab.chahboune@gmail.com', 'test', 'hello there', '2016-12-13 18:31:14', 'Rabab Chahboune');

-- --------------------------------------------------------

--
-- Structure de la table `cursus`
--

CREATE TABLE `cursus` (
  `id_cursus` int(11) NOT NULL,
  `idProfile` int(11) DEFAULT NULL,
  `nomCursus` varchar(254) DEFAULT NULL,
  `annee_debutCursus` varchar(254) DEFAULT NULL,
  `annee_finCursus` varchar(254) DEFAULT NULL,
  `etablissementCursus` varchar(254) DEFAULT NULL,
  `remarqueCursus` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cursus`
--

INSERT INTO `cursus` (`id_cursus`, `idProfile`, `nomCursus`, `annee_debutCursus`, `annee_finCursus`, `etablissementCursus`, `remarqueCursus`) VALUES
(6, 1, 'something', '2016', '2019', 'Hell', 'do not make the same mistake');

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE `domaine` (
  `idDomaine` int(11) NOT NULL,
  `nomDomaine` varchar(254) DEFAULT NULL,
  `descriptionDomaine` varchar(254) DEFAULT NULL,
  `imageDomaine` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`idDomaine`, `nomDomaine`, `descriptionDomaine`, `imageDomaine`) VALUES
(1, 'aaa', 'we do stuff butt not so much', 'facebook.jpeg'),
(3, 'aaa', 'we do stuff butt not so much', 'aaass.jpg'),
(4, 'aaa', 'we do stuff butt not so much', 'aaass.jpg'),
(5, 'aaa', 'we do stuff butt not so much', 'aaass.jpg'),
(6, 'aaa', 'we do stuff butt not so much', 'aaass.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

CREATE TABLE `experience` (
  `idExperience` int(11) NOT NULL,
  `nomExperience` varchar(254) NOT NULL,
  `logoExperience` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `experience`
--

INSERT INTO `experience` (`idExperience`, `nomExperience`, `logoExperience`) VALUES
(2, 'welcome', 'hello.jpeg'),
(4, 'NVDIA', 'NVDIA.png');

-- --------------------------------------------------------

--
-- Structure de la table `lien`
--

CREATE TABLE `lien` (
  `idLien` int(11) NOT NULL,
  `idProfile` int(11) DEFAULT NULL,
  `nomLien` varchar(254) DEFAULT NULL,
  `urlLien` varchar(254) DEFAULT NULL,
  `imageLien` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `lien`
--

INSERT INTO `lien` (`idLien`, `idProfile`, `nomLien`, `urlLien`, `imageLien`) VALUES
(3, 1, 'facebook', 'www.facebook.com/profile1', 'facebook.jpg'),
(4, 1, 'facebook', 'www.facebook.com/profile1', 'facebook.jpg'),
(5, 1, 'facebook', 'www.facebook.com/profile1', 'facebook.jpg'),
(6, 1, 'facebook', 'www.facebook.com/profile1', 'facebook.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `portfolio`
--

CREATE TABLE `portfolio` (
  `nomTheme` varchar(254) NOT NULL,
  `nomPortfolio` varchar(254) DEFAULT NULL,
  `aProposPortfolio` varchar(254) DEFAULT NULL,
  `logoPortfolio` varchar(254) DEFAULT NULL,
  `salutationPortfolio` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `portfolio`
--

INSERT INTO `portfolio` (`nomTheme`, `nomPortfolio`, `aProposPortfolio`, `logoPortfolio`, `salutationPortfolio`) VALUES
('Theme2', 'newPortfolio', 'I am a portfolio', 'port.jpeg', 'Hello there');

-- --------------------------------------------------------

--
-- Structure de la table `profile`
--

CREATE TABLE `profile` (
  `idProfile` int(11) NOT NULL,
  `nomProfile` varchar(254) DEFAULT NULL,
  `prenomProfile` varchar(254) DEFAULT NULL,
  `emailProfile` varchar(254) DEFAULT NULL,
  `telephoneProfile` varchar(254) DEFAULT NULL,
  `imageProfile` varchar(254) DEFAULT NULL,
  `biographieProfile` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `profile`
--

INSERT INTO `profile` (`idProfile`, `nomProfile`, `prenomProfile`, `emailProfile`, `telephoneProfile`, `imageProfile`, `biographieProfile`) VALUES
(1, 'Benchraa', 'Reda', 'medreda.benchraa@gmail.com', '0618276271', 'sexy.jpeg', 'I am the one who kisses');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `idProjet` int(11) NOT NULL,
  `idProjetCategorie` int(11) NOT NULL,
  `nomProjet` varchar(254) DEFAULT NULL,
  `descriptionProjet` varchar(254) DEFAULT NULL,
  `projetProjet` varchar(254) DEFAULT NULL,
  `imageProjet` varchar(254) DEFAULT NULL,
  `etoileProjet` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`idProjet`, `idProjetCategorie`, `nomProjet`, `descriptionProjet`, `projetProjet`, `imageProjet`, `etoileProjet`) VALUES
(1, 2, 'z', 'z', 'THIS IS SMTH', 'z.jpg', 1),
(2, 2, 'Hzzzz', 'Tzzzzzzz', 'Tzzzz', 'pp.jpg', 1),
(3, 7, 'projectServlet', 'JEE project', 'trial', 'projet.jpeg', 0),
(6, 7, 'projectServlet', 'JEE project', 'trial', 'projet.jpeg', 0);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `nomTheme` varchar(254) NOT NULL,
  `lienTheme` varchar(254) DEFAULT NULL,
  `paletteTheme` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `theme`
--

INSERT INTO `theme` (`nomTheme`, `lienTheme`, `paletteTheme`) VALUES
('theme1', 'theme.css', 'info'),
('theme2', 'theme.css', 'info');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categorie_competance`
--
ALTER TABLE `categorie_competance`
  ADD PRIMARY KEY (`idCompetanceCategorie`);

--
-- Index pour la table `categorie_projet`
--
ALTER TABLE `categorie_projet`
  ADD PRIMARY KEY (`idProjetCategorie`);

--
-- Index pour la table `competance`
--
ALTER TABLE `competance`
  ADD PRIMARY KEY (`idCompetance`),
  ADD KEY `FK_ASSOCIATION13` (`idProfile`);

--
-- Index pour la table `courrier`
--
ALTER TABLE `courrier`
  ADD PRIMARY KEY (`idCourrier`);

--
-- Index pour la table `cursus`
--
ALTER TABLE `cursus`
  ADD PRIMARY KEY (`id_cursus`),
  ADD KEY `FK_ASSOCIATION14` (`idProfile`);

--
-- Index pour la table `domaine`
--
ALTER TABLE `domaine`
  ADD PRIMARY KEY (`idDomaine`);

--
-- Index pour la table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`idExperience`);

--
-- Index pour la table `lien`
--
ALTER TABLE `lien`
  ADD PRIMARY KEY (`idLien`),
  ADD KEY `FK_ASSOCIATION16` (`idProfile`);

--
-- Index pour la table `portfolio`
--
ALTER TABLE `portfolio`
  ADD KEY `FK_ASSOCIATION11` (`nomTheme`);

--
-- Index pour la table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`idProfile`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`idProjet`),
  ADD KEY `FK_ASSOCIATION8` (`idProjetCategorie`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`nomTheme`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categorie_competance`
--
ALTER TABLE `categorie_competance`
  MODIFY `idCompetanceCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `categorie_projet`
--
ALTER TABLE `categorie_projet`
  MODIFY `idProjetCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `competance`
--
ALTER TABLE `competance`
  MODIFY `idCompetance` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `courrier`
--
ALTER TABLE `courrier`
  MODIFY `idCourrier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `cursus`
--
ALTER TABLE `cursus`
  MODIFY `id_cursus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `domaine`
--
ALTER TABLE `domaine`
  MODIFY `idDomaine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `experience`
--
ALTER TABLE `experience`
  MODIFY `idExperience` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `lien`
--
ALTER TABLE `lien`
  MODIFY `idLien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `profile`
--
ALTER TABLE `profile`
  MODIFY `idProfile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `idProjet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
