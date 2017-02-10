-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2017 at 01:22 AM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `categorie_projet`
--

INSERT INTO `categorie_projet` (`idProjetCategorie`, `nomProjetCategorie`, `descriptionProjetCategorie`, `imageProjetCategorie`) VALUES
(17, 'Poster', 'Designing beautiful posters.', ''),
(14, 'Web Design', 'Build web interfaces', ''),
(15, 'Video clip', 'Making video clips', ''),
(16, 'Logos', 'Making logos for enterprises ', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

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
(12, 8, 'J2ee', 25),
(14, 8, 'HTML5', 85),
(15, 8, 'Javascript', 76),
(16, 10, 'Project management', 78);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `courrier`
--

INSERT INTO `courrier` (`idCourrier`, `emailCourrier`, `sujetCourrier`, `messageCourrier`, `dateEnvoieCourrier`, `nomCompletCourrier`) VALUES
(21, 'az@az0.c', 'az', 'az', '2017-01-31 01:27:21', 'az'),
(26, 'test@test.com', 'test', 'hello', '2017-02-09 20:42:59', 'harry poter'),
(27, 'test@test.com', 'test', 'hello', '2017-02-09 20:42:59', 'harry poter');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `cursus`
--

INSERT INTO `cursus` (`id_cursus`, `idProfile`, `nomCursus`, `annee_debutCursus`, `annee_finCursus`, `etablissementCursus`, `remarqueCursus`) VALUES
(6, 1, 'something', '2016', '2019', 'Hell', 'HOLA!'),
(7, 2, 'DEV', '2015', '2018', 'Ensias', 'yes'),
(11, 8, 'Native UX and UI Designer', '2014', 'Présent', 'Fanatix', 'My role was to help produce number of consumer products for web and native apps. I work alongside the CEO, SVP of Mobile Applications and Commercial Director.'),
(13, 9, 'a', 'a', 'a', 'a', 'a'),
(14, 8, 'Co-Founder and Events Co-ordinator', '2013', '2016', 'Infiltration Airsoft', 'High tech events co-ordinator running airsoft games around the the UK. Running events with 300 players and up to 50 staff at any one time. '),
(15, 8, 'UX and UI Designer - Contract', '2013', '2013', 'Wirehive', 'Joined this venture as a brand consultant to help setup a new hosting solutions business that already had relationships with many of the UKs largest IT and design based agencies.'),
(16, 8, 'Senior UX and UI Designer', '2007', '2010', 'Fubra', 'Working within a large team of developers, my responsibilities included native app design, website design and iconography.'),
(17, 8, 'Bulk Check Manager', '2006', '2007', 'Travelex', 'Successfully managed a team of fifteen people within a highly competitive foreign exchange company. Each day my team had to handle,'),
(18, 10, 'UX AND UI DESIGNER - CONTRACT', '2015', '2016', 'Wirshark', 'Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc ');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `domaine`
--

INSERT INTO `domaine` (`idDomaine`, `nomDomaine`, `descriptionDomaine`, `imageDomaine`) VALUES
(13, 'Web', 'Building web application', '4111387html.png'),
(14, 'Graphic design', 'Creating beautiful art', '2437451tools.png'),
(15, 'Branding', 'We do branding', '7250570tag.png'),
(16, 'Videos', 'Creating professional videos', '7442994presentation.png');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE IF NOT EXISTS `experience` (
  `idExperience` int(11) NOT NULL AUTO_INCREMENT,
  `nomExperience` varchar(254) NOT NULL,
  `logoExperience` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idExperience`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`idExperience`, `nomExperience`, `logoExperience`) VALUES
(13, 'Visa', '4680454visa.png'),
(12, 'Master Card', '5117363mastercard.png'),
(14, 'Amazon', '6217643amazon.png'),
(15, 'Paypal', '6889798paypal.png');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `lien`
--

INSERT INTO `lien` (`idLien`, `idProfile`, `nomLien`, `urlLien`, `imageLien`) VALUES
(24, 1, 'facebook', 'https://www.facebook.com/MedRedaBenchraa', '1282297default-50x50.gif'),
(25, 8, 'Facebook', 'https://www.facebook.com/', '9402565facebook-flat-vector-logo-400x400.png'),
(22, 2, 'facebook', 'http://www.facebook.com', '6789804mestro.png'),
(26, 8, 'Twitter', 'www.facebook.com', '5041824twitter-logo-final.png'),
(28, 10, 'Facebook', 'www.facebook.com', '4162939facebook-flat-vector-logo-400x400.png');

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
('Edge', 'RR LABS', 'BESTEVER', '7723643deviantart.png', 'Welcome to my website');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`idProfile`, `nomProfile`, `prenomProfile`, `emailProfile`, `telephoneProfile`, `imageProfile`, `biographieProfile`) VALUES
(8, 'Hamo', 'Rabi', 'hamo.rabi@gmail.com', '0652535253', '7801080reza.jpg', 'I am a highly experienced UX and UI designer with over 10 years in the field. I am an energetic, ambitious\r\nperson who enjoys working with others and am passionate about what I do, with an eye for detail.'),
(10, 'Frank', 'Kron', 'F.kron@yahoo.de', '062859645', '8933792.jpg', 'My name is Cassandra Duncan. I grew up an only child. I was also an only grandchild on both sides. The youngest of all my cousins and the only child in a small neighborhood that consisted of a bunch of adults.'),
(11, 'Anna', 'len', 'Anna.l@hotmail.de', '0652538595', '7632845.jpg', 'Accustomed to being around primarily adults, I was always mature for my age. Even my own friends often annoyed me during my adolescent years. I had a lot of people who invested in me'),
(12, 'Simon', 'phen', 'simon.phen@gmail.com', '0652857595', '9999654.jpg', 'Iâ??m proud to say this new role suits me. Iâ??m driven, not to do great things for myself, but to spur my son on to even greater ones.');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`idProjet`, `idProjetCategorie`, `nomProjet`, `descriptionProjet`, `projetProjet`, `imageProjet`, `etoileProjet`) VALUES
(1, 8, 'JJ', '<u>AA<b> &nbsp;jl</b></u>', 'AAA', '0', 1),
(9, 1, 'zz', '<p><b>zz</b></p>', 'zz', '2192626icons.png', 1),
(12, 6, 'Boom', '<p><b>az<u>&nbsp;</u></b><b><u>ZZE</u></b></p>', 'BAH', '6772344photo2.png', 0),
(16, 14, 'Wirehive', '<p><br></p><p><img alt="" src="http://media.dunkedcdn.com/assets/prod/7652/750x0_p1af8ga2ij1ouktvr1vmh1av3r4s8.jpg" title="Image: http://media.dunkedcdn.com/assets/prod/7652/750x0_p1af8ga2ij1ouktvr1vmh1av3r4s8.jpg"><br></p>', 'I was lucky enough to work with the guys at Wirehive to create their name, branding and website from the beginning', '32641071.jpg', 0),
(17, 14, 'LVNRM', '<p><img src="http://media.dunkedcdn.com/assets/prod/7652/750x0_p1afgf1bip1qh43ga8j6tgmjk93.jpg" title="Image: http://media.dunkedcdn.com/assets/prod/7652/750x0_p1afgf1bip1qh43ga8j6tgmjk93.jpg"><br></p>', 'LVNRM or Livingroom was a startup I created to gather designers together in their front rooms to share and discuss their startup ideas. ', '78240772.jpg', 0),
(18, 16, 'fanatix', '<p>\r\n\r\nI have been working at fanatix since early 2014 as lead design. Designing the new fanatix app on both iOS and Android devices.<br></p>', 'I have been working at fanatix since early 2014 as lead design. Designing the new fanatix app on both iOS and Android devices.', '37680835.jpg', 0),
(19, 17, 'Infiltration Airsoft', '<p>\r\n\r\nnfiltration Airsoft is a company I co-founded. It has been running for three years and runs high tech airsoft events around the UK<br></p>', '', '26499344.jpg', 0),
(20, 15, 'Remember The War', '<p><img src="http://media.dunkedcdn.com/assets/prod/7652/750x0_p1afgfgmhb1nj51eld1ts01a4b7u84.jpg" title="Image: http://media.dunkedcdn.com/assets/prod/7652/750x0_p1afgfgmhb1nj51eld1ts01a4b7u84.jpg"><br></p>', 'Remember The War was a crowd funded project I created with the aim in educating the younger generations on the second World War. ', '8706133bw-2.png', 0);

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
('Edge', 'Edge', 'Edge.JPG'),
('Karmo', 'karmo', 'karmo.png\r\n'),
('creative', 'creative.xml', 'creative.JPG');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
