-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2017 at 01:01 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `portfolio`
--
CREATE DATABASE IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `portfolio`;

-- --------------------------------------------------------

--
-- Table structure for table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `username` varchar(254) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrateur`
--

INSERT INTO `administrateur` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_competance`
--

CREATE TABLE IF NOT EXISTS `categorie_competance` (
  `idCompetanceCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCompetanceCategorie` varchar(254) DEFAULT NULL,
  `descriptionCompetanceCategorie` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idCompetanceCategorie`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `categorie_competance`
--

INSERT INTO `categorie_competance` (`idCompetanceCategorie`, `nomCompetanceCategorie`, `descriptionCompetanceCategorie`) VALUES
(3, 'Programming', 'You can do stuff with the computer'),
(2, 'Economics', 'You can do stuff with stocks');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_projet`
--

CREATE TABLE IF NOT EXISTS `categorie_projet` (
  `idProjetCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomProjetCategorie` varchar(254) DEFAULT NULL,
  `descriptionProjetCategorie` varchar(254) DEFAULT NULL,
  `imageProjetCategorie` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idProjetCategorie`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `categorie_projet`
--

INSERT INTO `categorie_projet` (`idProjetCategorie`, `nomProjetCategorie`, `descriptionProjetCategorie`, `imageProjetCategorie`) VALUES
(12, '3D', '4d projects', '302818paypal.png');

-- --------------------------------------------------------

--
-- Table structure for table `competance`
--

CREATE TABLE IF NOT EXISTS `competance` (
  `idCompetance` int(11) NOT NULL AUTO_INCREMENT,
  `idProfile` int(11) DEFAULT NULL,
  `nomCompetance` varchar(254) NOT NULL,
  `pourcentageCompetance` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCompetance`),
  KEY `FK_ASSOCIATION13` (`idProfile`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `competance`
--

INSERT INTO `competance` (`idCompetance`, `idProfile`, `nomCompetance`, `pourcentageCompetance`) VALUES
(1, 1, 'Python', 65),
(3, 1, 'C', 60),
(4, 1, 'java', 50),
(5, 1, 'C', 60),
(6, 1, 'java', 100),
(11, 8, 'CSS4', 50),
(10, 2, 'CSS4', 47),
(12, 8, 'J2EE', 83);

-- --------------------------------------------------------

--
-- Table structure for table `courrier`
--

CREATE TABLE IF NOT EXISTS `courrier` (
  `idCourrier` int(11) NOT NULL AUTO_INCREMENT,
  `emailCourrier` varchar(254) DEFAULT NULL,
  `sujetCourrier` varchar(254) DEFAULT NULL,
  `messageCourrier` varchar(254) DEFAULT NULL,
  `dateEnvoieCourrier` datetime DEFAULT NULL,
  `nomCompletCourrier` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idCourrier`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `courrier`
--

INSERT INTO `courrier` (`idCourrier`, `emailCourrier`, `sujetCourrier`, `messageCourrier`, `dateEnvoieCourrier`, `nomCompletCourrier`) VALUES
(16, 'test@test.com', 'test', 'hello', '2017-01-30 22:29:01', 'harry poter'),
(15, 'test@test.com', 'test', 'helllo', '2016-12-26 11:28:59', 'harry poter'),
(21, 'az@az0.c', 'az', 'az', '2017-01-31 01:27:21', 'az');

-- --------------------------------------------------------

--
-- Table structure for table `cursus`
--

CREATE TABLE IF NOT EXISTS `cursus` (
  `id_cursus` int(11) NOT NULL AUTO_INCREMENT,
  `idProfile` int(11) DEFAULT NULL,
  `nomCursus` varchar(254) DEFAULT NULL,
  `annee_debutCursus` varchar(254) DEFAULT NULL,
  `annee_finCursus` varchar(254) DEFAULT NULL,
  `etablissementCursus` varchar(254) DEFAULT NULL,
  `remarqueCursus` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id_cursus`),
  KEY `FK_ASSOCIATION14` (`idProfile`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `cursus`
--

INSERT INTO `cursus` (`id_cursus`, `idProfile`, `nomCursus`, `annee_debutCursus`, `annee_finCursus`, `etablissementCursus`, `remarqueCursus`) VALUES
(6, 1, 'something', '2016', '2019', 'Hell', 'HOLA!'),
(7, 2, 'DEV', '2015', '2018', 'Ensias', 'yes'),
(11, 8, 'Ensias', '2015', '2018', 'Ensias', 'GOOD');

-- --------------------------------------------------------

--
-- Table structure for table `domaine`
--

CREATE TABLE IF NOT EXISTS `domaine` (
  `idDomaine` int(11) NOT NULL AUTO_INCREMENT,
  `nomDomaine` varchar(254) DEFAULT NULL,
  `descriptionDomaine` varchar(254) DEFAULT NULL,
  `imageDomaine` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idDomaine`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `domaine`
--

INSERT INTO `domaine` (`idDomaine`, `nomDomaine`, `descriptionDomaine`, `imageDomaine`) VALUES
(5, 'Web', 'Web Design', 'aaass.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE IF NOT EXISTS `experience` (
  `idExperience` int(11) NOT NULL AUTO_INCREMENT,
  `nomExperience` varchar(254) NOT NULL,
  `logoExperience` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idExperience`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`idExperience`, `nomExperience`, `logoExperience`) VALUES
(4, 'NVIDEA', '98402logo 1.png'),
(9, 'ZZ', '7933468paypal.png');

-- --------------------------------------------------------

--
-- Table structure for table `lien`
--

CREATE TABLE IF NOT EXISTS `lien` (
  `idLien` int(11) NOT NULL AUTO_INCREMENT,
  `idProfile` int(11) DEFAULT NULL,
  `nomLien` varchar(254) DEFAULT NULL,
  `urlLien` varchar(254) DEFAULT NULL,
  `imageLien` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idLien`),
  KEY `FK_ASSOCIATION16` (`idProfile`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `lien`
--

INSERT INTO `lien` (`idLien`, `idProfile`, `nomLien`, `urlLien`, `imageLien`) VALUES
(24, 1, 'facebook', 'https://www.facebook.com/MedRedaBenchraa', '1282297default-50x50.gif'),
(25, 8, 'facebook', 'https://web.facebook.com/', '9402565facebook-flat-vector-logo-400x400.png'),
(22, 2, 'facebook', 'http://www.facebook.com', '6789804mestro.png'),
(26, 8, 'Twitter', 'www.facebook.com', '5041824twitter-logo-final.png');

-- --------------------------------------------------------

--
-- Table structure for table `portfolio`
--

CREATE TABLE IF NOT EXISTS `portfolio` (
  `nomTheme` varchar(254) NOT NULL,
  `nomPortfolio` varchar(254) DEFAULT NULL,
  `aProposPortfolio` varchar(254) DEFAULT NULL,
  `logoPortfolio` varchar(254) DEFAULT NULL,
  `salutationPortfolio` varchar(254) DEFAULT NULL,
  KEY `FK_ASSOCIATION11` (`nomTheme`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio`
--

INSERT INTO `portfolio` (`nomTheme`, `nomPortfolio`, `aProposPortfolio`, `logoPortfolio`, `salutationPortfolio`) VALUES
('karmo', 'RR Labs', 'BESTEVER', '4066431logo.png', 'Welcome to my site');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `idProfile` int(11) NOT NULL AUTO_INCREMENT,
  `nomProfile` varchar(254) DEFAULT NULL,
  `prenomProfile` varchar(254) DEFAULT NULL,
  `emailProfile` varchar(254) DEFAULT NULL,
  `telephoneProfile` varchar(254) DEFAULT NULL,
  `imageProfile` varchar(254) DEFAULT NULL,
  `biographieProfile` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idProfile`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`idProfile`, `nomProfile`, `prenomProfile`, `emailProfile`, `telephoneProfile`, `imageProfile`, `biographieProfile`) VALUES
(8, 'Rabab', 'C', 'rc@gmail.com', '0652535253', '2790640avatar2.png', 'Zdaf');

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `idProjet` int(11) NOT NULL AUTO_INCREMENT,
  `idProjetCategorie` int(11) NOT NULL,
  `nomProjet` varchar(254) DEFAULT NULL,
  `descriptionProjet` varchar(254) DEFAULT NULL,
  `projetProjet` varchar(254) DEFAULT NULL,
  `imageProjet` varchar(254) DEFAULT NULL,
  `etoileProjet` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idProjet`),
  KEY `FK_ASSOCIATION8` (`idProjetCategorie`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`idProjet`, `idProjetCategorie`, `nomProjet`, `descriptionProjet`, `projetProjet`, `imageProjet`, `etoileProjet`) VALUES
(1, 8, 'JJ', '<u>AA<b> &nbsp;jl</b></u>', 'AAA', '0', 1),
(9, 1, 'zz', '<p><b>zz</b></p>', 'zz', '2192626icons.png', 1),
(12, 6, 'Boom', '<p><b>az<u>&nbsp;</u></b><b><u>ZZE</u></b></p>', 'BAH', '6772344photo2.png', 0),
(14, 12, 'FRANK', '<p><b><u><p>THIS IS A TEXT</p></u></b></p>', 'ZOOM', '1412633photo1.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE IF NOT EXISTS `theme` (
  `nomTheme` varchar(254) NOT NULL,
  `lienTheme` varchar(254) DEFAULT NULL,
  `paletteTheme` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`nomTheme`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`nomTheme`, `lienTheme`, `paletteTheme`) VALUES
('Flat', 'flat.xml', 'Flat.png'),
('Modern', 'Modern', 'Modern.png'),
('karmo', 'karmo', 'karmo.png\r\n'),
('creative', 'creative.xml', 'creative.JPG');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
