-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 17 fév. 2025 à 10:04
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `filrouge_final`
--

-- --------------------------------------------------------

--
-- Structure de la table `AspNetRoleClaims`
--

DROP TABLE IF EXISTS `AspNetRoleClaims`;
CREATE TABLE IF NOT EXISTS `AspNetRoleClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
CREATE TABLE IF NOT EXISTS `AspNetRoles` (
  `Id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `AspNetRoles`
--

INSERT INTO `AspNetRoles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('1', 'Admin', 'ADMIN', NULL),
('2', 'Director', 'DIRECTOR', NULL),
('3', 'Manager', 'MANAGER', NULL),
('4', 'Technician', 'TECHNICIAN', NULL),
('5', 'Customer', 'CUSTOMER', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
CREATE TABLE IF NOT EXISTS `AspNetUserClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
CREATE TABLE IF NOT EXISTS `AspNetUserLogins` (
  `LoginProvider` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
CREATE TABLE IF NOT EXISTS `AspNetUserRoles` (
  `UserId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `AspNetUserRoles`
--

INSERT INTO `AspNetUserRoles` (`UserId`, `RoleId`) VALUES
('46403910-91e2-434a-8c72-f814196d5026', '5'),
('569ae144-1a49-4a5e-b4f7-9fb9378d6e61', '5'),
('814ce78d-0eb9-43ff-9460-c20b31a9664a', '5'),
('a0711578-e6f6-4db0-855d-b6f95d319694', '5'),
('e7f30aa5-4be0-4f89-a934-e9687512a196', '5'),
('ec20024e-f81c-4b38-b326-0a558a5e72e7', '4'),
('f7a06f72-ba08-4844-9736-06ef1120be8d', '1'),
('f7b1012e-d0a7-4f47-8c2e-618bd202dcd7', '4');

-- --------------------------------------------------------

--
-- Structure de la table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
CREATE TABLE IF NOT EXISTS `AspNetUsers` (
  `Id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Discriminator` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Lastname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Firstname` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `BirthdayDate` datetime(6) DEFAULT NULL,
  `Address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PostalCode` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `City` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `MobilePhone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CountryId` int DEFAULT NULL,
  `TechnicianStatusId` int DEFAULT NULL,
  `UserName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `AspNetUsers`
--

INSERT INTO `AspNetUsers` (`Id`, `Discriminator`, `Lastname`, `Firstname`, `BirthdayDate`, `Address`, `PostalCode`, `City`, `MobilePhone`, `CountryId`, `TechnicianStatusId`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('46403910-91e2-434a-8c72-f814196d5026', 'Customer', 'Hasselmann', 'Fabien', '2024-05-01 15:25:00.000000', '88 rue de Liverdun', '54200', 'Villey-Saint-Etienne', '0676248686', 1, NULL, 'fab_dod@hotmail.com', 'FAB_DOD@HOTMAIL.COM', 'fab_dod@hotmail.com', 'FAB_DOD@HOTMAIL.COM', 0, 'AQAAAAIAAYagAAAAEP2FOEHtXaKrXrdFbOmwU82RVBfzwUpz7k4ryvFkJO/SHX2bMrHXB09HtU2uHSupdw==', 'FM4JTV4OBUC73GSKF4RJJPYK7QDRIPPD', '55928033-3627-47c0-baf3-9a5184cf6a9e', '0676248686', 0, 0, NULL, 1, 0),
('f7a06f72-ba08-4844-9736-06ef1120be8d', 'AppUser', 'Admin', 'Jack', '1997-04-16 16:13:00.000000', '10 rue Paix', '50000', 'Blougi', '0908070605', 1, 1, 'jack@dmin.fr', 'JACK@DMIN.FR', 'jack@dmin.fr', 'JACK@DMIN.FR', 0, 'AQAAAAIAAYagAAAAEBZckfmLPpsyohA9f+ocFfjCU5fkybw7I63iqvfGUjSUSqsCGnQtzN7z5OVm1LcX3A==', 'HY63GAQY3NZHLBBZB7SCESPCTKOIL2CP', '2b3a7c95-88af-4ab9-b584-2e53a2c70b32', '0102030405', 0, 0, NULL, 1, 0),
('ec20024e-f81c-4b38-b326-0a558a5e72e7', 'AppUser', 'Neymar', 'Jean', '1970-06-22 13:58:00.000000', '12 rue bonne intention', '66600', 'Anfayr', '0609090909', 1, 1, 'neymar@tm.com', 'NEYMAR@TM.COM', 'neymar@tm.com', 'NEYMAR@TM.COM', 0, 'AQAAAAIAAYagAAAAEOzQej6itXt/B9JhkEClZ88pGweIPWlpPkzck3knzD5R6AFA1PHz5IzxLT3cVxEIzA==', 'CYA7DW3QCIWWTZWTAURCKFGYLZBP6767', '2f8d2013-f8c8-4ee7-b418-6c46423499a3', '0304050607', 0, 0, NULL, 1, 0),
('f7b1012e-d0a7-4f47-8c2e-618bd202dcd7', 'AppUser', 'Stiqué', 'Sophie', '1973-09-29 14:05:00.000000', '20 rue Monarchie', '75002', 'Paris', '0504030201', 1, 1, 'sophie@tm.com', 'SOPHIE@TM.COM', 'sophie@tm.com', 'SOPHIE@TM.COM', 0, 'AQAAAAIAAYagAAAAEOvvJgJmHCXV4ugP4WHkk+L0Pszt7oFURZusqdswJmPtClVv+XZbRMo8/TAhSVQM3w==', '7IOAI5NS5I74MY6FZOIKL35GADTTJVN3', 'f1395347-1107-44a0-abca-263dfb22e94f', '0203040506', 0, 0, NULL, 1, 0),
('e7f30aa5-4be0-4f89-a934-e9687512a196', 'Customer', 'Acaisse', 'Pat', '1993-05-29 14:04:00.000000', '10 rue Millery', '50300', 'Nantes', '0607080910', 1, NULL, 'pat@orange.fr', 'PAT@ORANGE.FR', 'pat@orange.fr', 'PAT@ORANGE.FR', 0, 'AQAAAAIAAYagAAAAENDJzOgAw+vvtMIm9dzgHLBoDYh+WKSbuX9LvcX5pWpJEdDQaXZB7jtcS/DnvfZgeg==', 'MHV7J5HR7LHE5SRYW2C2CMX2CNQXCRNX', 'c0f6369b-ddfc-4727-9ed7-768767b5b3d3', '0102030405', 0, 0, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
CREATE TABLE IF NOT EXISTS `AspNetUserTokens` (
  `UserId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `buys`
--

DROP TABLE IF EXISTS `Buys`;
CREATE TABLE IF NOT EXISTS `Buys` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `BuyingDate` datetime(6) DEFAULT NULL,
  `CustomerId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SoftwareId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Calls`
--

DROP TABLE IF EXISTS `Calls`;
CREATE TABLE IF NOT EXISTS `Calls` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StartCallDate` datetime(6) DEFAULT NULL,
  `AnsweringCallDate` datetime(6) DEFAULT NULL,
  `EndCallDate` datetime(6) DEFAULT NULL,
  `CustomerId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
CREATE TABLE IF NOT EXISTS `Countries` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `EmergencyStatuses`
--

DROP TABLE IF EXISTS `EmergencyStatuses`;
CREATE TABLE IF NOT EXISTS `EmergencyStatuses` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `EmergencyStatuses`
--

INSERT INTO `EmergencyStatuses` (`Id`, `Name`) VALUES
(1, 'Critique'),
(2, 'Elevé'),
(3, 'Moyenne'),
(4, 'Faible'),
(5, 'A définir');

-- --------------------------------------------------------

--
-- Structure de la table `Malfunctions`
--

DROP TABLE IF EXISTS `Malfunctions`;
CREATE TABLE IF NOT EXISTS `Malfunctions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `SoftwareId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Malfunctions`
--

INSERT INTO `Malfunctions` (`Id`, `CategoryName`, `SoftwareId`) VALUES
(1, 'Connexion', 1),
(2, 'Erreurs/Bugs', 1),
(3, 'Performance', 1),
(4, 'Interface', 1),
(5, 'Compatibilité', 1),
(6, 'Données', 1),
(7, 'Sécurité', 1),
(8, 'Documentation', 1),
(9, 'Autres', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Softwares`
--

DROP TABLE IF EXISTS `Softwares`;
CREATE TABLE IF NOT EXISTS `Softwares` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `SoftwareName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Version` int DEFAULT NULL,
  `WarrantyId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Softwares`
--

INSERT INTO `Softwares` (`Id`, `SoftwareName`, `Version`, `WarrantyId`) VALUES
(1, 'TicketMaster', 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `TechnicianStatuses`
--

DROP TABLE IF EXISTS `TechnicianStatuses`;
CREATE TABLE IF NOT EXISTS `TechnicianStatuses` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TechnicianStatuses`
--

INSERT INTO `TechnicianStatuses` (`Id`, `Name`) VALUES
(1, 'Disponible'),
(2, 'Indisponible');

-- --------------------------------------------------------

--
-- Structure de la table `TicketHistories`
--

DROP TABLE IF EXISTS `TicketHistories`;
CREATE TABLE IF NOT EXISTS `TicketHistories` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `StatusDate` datetime(6) DEFAULT NULL,
  `Observation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TicketStateId` int NOT NULL,
  `UserId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `TicketId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TicketHistories`
--

INSERT INTO `TicketHistories` (`Id`, `StatusDate`, `Observation`, `TicketStateId`, `UserId`, `TicketId`) VALUES
(44, '2024-05-28 16:54:47.270769', 'parfait !', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(43, '2024-05-28 16:54:38.168136', 'alors savoie ou bien ?', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(42, '2024-05-28 16:42:19.627662', 'hello', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(41, '2024-05-28 16:42:09.561986', 'YOOO', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(40, '2024-05-28 16:38:31.068105', 'probleme urgent ?', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(39, '2024-05-28 16:38:24.506810', 'personne ?', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(38, '2024-05-28 16:38:17.085835', 'repondez moi plz', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(37, '2024-05-28 16:38:12.075465', 'y\'a kkun ?', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(45, '2024-05-29 11:06:11.687726', 'on est làààà', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(36, '2024-05-28 16:38:04.071422', 'je m\'appelle jpp', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(33, '2024-05-28 16:33:37.159282', 'test', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(34, '2024-05-28 16:34:03.962359', 'COUCOU', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(31, '2024-05-28 14:01:24.792670', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(30, '2024-05-28 14:01:24.778535', 'Faille sécurité ?', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(29, '2024-05-23 15:48:53.000000', 'Bonjour,\r\n\r\nAfin de vous aider pourriez vous être plus précis svp ?', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 23),
(28, '2024-05-23 15:46:35.645033', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 23),
(27, '2024-05-23 15:46:35.619654', 'J\'ai un problème', 1, '46403910-91e2-434a-8c72-f814196d5026', 23),
(46, '2024-05-29 11:10:07.072772', 'Hmmm...', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(47, '2024-05-29 11:34:19.894916', 'analyse en cours', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(48, '2024-05-29 13:48:25.076282', 'j\'attends', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(49, '2024-05-29 13:57:11.584083', 'MAIS FERME TA GUEULE', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(50, '2024-05-29 13:57:38.741902', 'SUCE MA TEUB', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(51, '2024-05-29 14:13:20.893497', 'Comment trouvé ma doc ?', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 25),
(52, '2024-05-29 14:13:20.897810', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 25),
(53, '2024-05-29 14:46:58.552150', 'Ca marche ou pas ?', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 25),
(54, '2024-05-29 14:47:12.371252', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 26),
(55, '2024-05-29 14:47:12.377025', 'j\'ai pas de réponse', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 26),
(56, '2024-05-29 14:48:36.757002', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 27),
(57, '2024-05-29 14:48:36.759909', 'j\'attends', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 27),
(58, '2024-05-29 14:50:09.750332', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 28),
(59, '2024-05-29 14:50:09.753386', 'j\'attends', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 28),
(60, '2024-05-29 14:50:41.555005', 'okidoki', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 28),
(61, '2024-05-29 14:50:58.029270', 'c po cool', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(62, '2024-05-29 16:14:51.390687', 'test !', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(63, '2024-05-29 16:47:02.879686', 'c tr0 b1 ton appli', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(64, '2024-05-29 16:54:25.005270', 'clément est un pervers', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(65, '2024-05-30 14:32:04.760319', 'je vous demande de vous arretez', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(66, '2024-05-30 14:34:42.011481', 'test', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(67, '2024-05-30 14:35:47.064725', 'dqz', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(68, '2024-05-30 14:37:22.119304', 'yooo', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 24),
(69, '2024-05-30 14:38:22.819052', 'Oui on est là', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 25),
(70, '2024-05-30 14:38:49.420184', 'm', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 25),
(71, '2024-05-30 14:52:53.238707', 'youpi', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(72, '2024-05-30 14:53:44.007900', 'tre', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(73, '2024-05-30 14:54:24.111106', 'd', 1, '46403910-91e2-434a-8c72-f814196d5026', 24),
(74, '2024-05-30 14:55:03.834792', 'q', 1, '46403910-91e2-434a-8c72-f814196d5026', 23),
(75, '2024-05-30 14:55:51.455436', 'q', 1, '46403910-91e2-434a-8c72-f814196d5026', 23),
(76, '2024-05-30 15:46:02.305997', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 24),
(84, '2024-05-30 16:48:44.372039', 'Yop !', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 26),
(78, '2024-05-30 16:12:53.639510', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 23),
(79, '2024-05-30 16:17:22.928895', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 29),
(80, '2024-05-30 16:17:22.933257', 'Salut !', 1, '46403910-91e2-434a-8c72-f814196d5026', 29),
(81, '2024-05-30 16:17:27.640001', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 29),
(82, '2024-05-30 16:18:10.663106', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 30),
(83, '2024-05-30 16:18:10.666584', 'Me suis tromper', 1, '46403910-91e2-434a-8c72-f814196d5026', 30),
(85, '2024-05-30 16:48:53.758556', 'On est lààà', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 27),
(86, '2024-05-30 16:49:08.900495', 'Ca farte ?', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 30),
(87, '2024-05-30 16:55:42.411690', 'qzd', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 25),
(88, '2024-05-30 16:55:48.799997', 'qzdqzd', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 28),
(89, '2024-05-31 13:51:17.146432', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 30),
(90, '2024-05-31 13:51:30.925814', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 31),
(91, '2024-05-31 13:51:30.930895', 'm', 1, '46403910-91e2-434a-8c72-f814196d5026', 31),
(92, '2024-05-31 14:02:08.720910', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 31),
(93, '2024-05-31 14:03:42.843490', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 32),
(94, '2024-05-31 14:03:42.867627', 'zzzz', 1, '46403910-91e2-434a-8c72-f814196d5026', 32),
(95, '2024-05-31 14:03:54.277209', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 32),
(96, '2024-05-31 14:04:02.048544', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 33),
(97, '2024-05-31 14:04:02.052878', 'zqddqz', 1, '46403910-91e2-434a-8c72-f814196d5026', 33),
(98, '2024-05-31 14:04:23.357542', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 33),
(99, '2024-05-31 14:05:12.186681', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 34),
(100, '2024-05-31 14:05:12.190375', 'dzqdq', 1, '46403910-91e2-434a-8c72-f814196d5026', 34),
(101, '2024-05-31 14:05:37.348358', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 34),
(102, '2024-05-31 14:10:38.033772', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 35),
(103, '2024-05-31 14:10:38.036739', 'ùùù', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(104, '2024-05-31 14:12:25.938783', 'dz', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(105, '2024-05-31 14:12:36.693441', 'zdq', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(106, '2024-05-31 14:13:52.670289', 'dz', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(107, '2024-05-31 14:14:02.628142', 'dzq', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(108, '2024-05-31 14:16:16.885675', 'qzd', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(109, '2024-05-31 14:16:26.180834', 'a', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(110, '2024-05-31 14:16:31.444302', 'DZQ', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(111, '2024-05-31 14:19:34.328627', 'DZQ', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(112, '2024-05-31 14:23:55.189586', 'zd', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(113, '2024-05-31 14:24:00.869801', 'qzdqd', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(114, '2024-05-31 14:26:14.762856', 'dz', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(115, '2024-05-31 14:26:19.481305', 'qzd', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(116, '2024-05-31 14:26:44.373470', 'qzd', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(117, '2024-05-31 14:26:49.199362', 'qzd', 1, '46403910-91e2-434a-8c72-f814196d5026', 35),
(118, '2024-05-31 14:28:09.985021', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 35),
(119, '2024-05-31 14:28:24.461717', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 36),
(120, '2024-05-31 14:28:24.465731', 'test', 1, '46403910-91e2-434a-8c72-f814196d5026', 36),
(121, '2024-05-31 14:31:16.742041', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 37),
(122, '2024-05-31 14:31:16.745989', 'hmmm', 1, '46403910-91e2-434a-8c72-f814196d5026', 37),
(123, '2024-05-31 14:33:15.317562', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 38),
(124, '2024-05-31 14:33:15.320875', 'dzqd', 1, '46403910-91e2-434a-8c72-f814196d5026', 38),
(125, '2024-05-31 14:33:19.754043', 'qzd', 1, '46403910-91e2-434a-8c72-f814196d5026', 36),
(126, '2024-05-31 14:33:21.556968', 'qzdq', 1, '46403910-91e2-434a-8c72-f814196d5026', 36),
(127, '2024-05-31 14:35:22.749316', 'dzqd', 1, '46403910-91e2-434a-8c72-f814196d5026', 36),
(128, '2024-05-31 14:35:30.356539', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 36),
(129, '2024-05-31 14:37:09.686238', 'yooo', 1, '46403910-91e2-434a-8c72-f814196d5026', 37),
(130, '2024-05-31 14:37:19.080806', 'dzqdq', 1, '46403910-91e2-434a-8c72-f814196d5026', 37),
(131, '2024-05-31 14:38:11.385821', 'Ca marccheee', 1, '46403910-91e2-434a-8c72-f814196d5026', 37),
(132, '2024-05-31 14:38:18.796593', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 37),
(133, '2024-05-31 14:49:45.521454', 'Pollleee', 1, '46403910-91e2-434a-8c72-f814196d5026', 38),
(134, '2024-05-31 15:14:45.999719', 'Nous prenons en charge votre demande', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 38),
(135, '2024-05-31 15:54:06.958771', 'mhh', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 25),
(136, '2024-06-26 16:38:29.444792', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 25),
(137, '2024-07-08 09:48:11.217772', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(138, '2024-07-08 09:48:11.225940', 'Heyyyy !', 1, '46403910-91e2-434a-8c72-f814196d5026', 39),
(139, '2024-07-08 10:44:31.277843', 'Hello !', 1, '46403910-91e2-434a-8c72-f814196d5026', 38),
(140, '2024-07-08 11:00:36.871280', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 40),
(141, '2024-07-08 11:00:36.874405', 'dzqdq', 1, '46403910-91e2-434a-8c72-f814196d5026', 40),
(142, '2024-07-11 14:45:55.015807', 'Certes', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 28),
(143, '2024-07-11 15:04:06.676936', '***SYS-notif*** Modified EmergencyStatusId from 5 to 1', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 40),
(144, '2024-07-11 15:04:06.694799', '***SYS-notif*** Modified MafunctionId from 3 to 8', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 40),
(145, '2024-07-11 15:04:06.695513', '***SYS-notif*** Modified StateId from 1 to 2', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 40),
(146, '2024-07-11 15:06:28.774138', '***SYS-notif*** Modified EmergencyStatusId from 5 to 4', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 38),
(147, '2024-07-11 15:06:28.774230', '***SYS-notif*** Modified MafunctionId from 2 to 1', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 38),
(148, '2024-07-11 15:06:28.774294', '***SYS-notif*** Modified StateId from 1 to 2', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 38),
(149, '2024-07-11 15:06:28.774319', 'On s\'occupe de tout !', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 38),
(150, '2024-07-11 15:16:07.016979', '***SYS-notif*** Modified EmergencyStatusId from 5 to 4', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(151, '2024-07-11 15:16:07.017067', '***SYS-notif*** Modified MafunctionId from 1 to 9', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(152, '2024-07-11 15:16:07.017107', '***SYS-notif*** Modified StateId from 1 to 2', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(153, '2024-07-11 15:16:07.017121', 'Pouvez-vous précisé ?', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(154, '2024-07-11 15:18:01.844017', 'Je s\'appelle gruut', 1, '46403910-91e2-434a-8c72-f814196d5026', 39),
(155, '2024-07-11 15:28:22.916728', '***SYS-notif*** Modified MafunctionId from 9 to 1', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(156, '2024-07-11 16:06:19.451671', '***SYS-notif*** Modified EmergencyStatusId from 1 to 4', 2, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 40),
(157, '2024-07-11 16:06:39.943216', '***SYS-notif*** Modified EmergencyStatusId from 4 to 3', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(158, '2024-07-11 16:06:39.944424', '***SYS-notif*** Modified MafunctionId from 1 to 4', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 39),
(159, '2024-07-11 16:49:25.004961', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 41),
(160, '2024-07-11 16:49:25.030123', 'dqd', 1, '46403910-91e2-434a-8c72-f814196d5026', 41),
(161, '2024-07-11 16:50:52.144715', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 42),
(162, '2024-07-11 16:50:52.149282', 'Problème conbexion svp', 1, '46403910-91e2-434a-8c72-f814196d5026', 42),
(163, '2024-07-11 16:51:30.755151', '***Ticket closed by customer action***', 3, '46403910-91e2-434a-8c72-f814196d5026', 41),
(164, '2024-07-11 16:52:17.970739', '***SYS-notif*** Modified StateId from 1 to 3', 3, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 27),
(165, '2024-07-11 17:00:41.725500', '***SYS-notif*** Modified StateId from 1 to 3', 3, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 28),
(166, '2024-07-18 10:54:02.344884', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 43),
(167, '2024-07-18 10:54:02.356678', 'Problème à résoudre', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 43),
(168, '2024-07-18 10:54:16.207018', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 44),
(169, '2024-07-18 10:54:16.210953', 'ici ca test !', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 44),
(170, '2024-07-18 10:54:32.174189', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 45),
(171, '2024-07-18 10:54:32.178200', 'Yes !', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 45),
(172, '2024-07-18 10:54:49.781740', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 46),
(173, '2024-07-18 10:54:49.785627', 'ettttt', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 46),
(174, '2024-07-18 10:54:56.819501', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 47),
(175, '2024-07-18 10:54:56.823592', 'eeeeeee', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 47),
(176, '2024-07-18 10:55:02.843242', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 48),
(177, '2024-07-18 10:55:02.846804', 'qdzqdqdzddzq', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 48),
(178, '2024-07-18 10:55:19.160075', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 48),
(179, '2024-07-18 13:40:53.893283', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 49),
(180, '2024-07-18 13:40:53.907697', '1111', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 49),
(181, '2024-07-18 13:41:10.561222', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 50),
(182, '2024-07-18 13:41:10.564821', '++', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 50),
(183, '2024-07-18 14:03:55.195077', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 45),
(184, '2024-07-18 16:05:38.533587', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 51),
(185, '2024-07-18 16:05:38.561219', 'zdqdq', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 51),
(186, '2024-07-18 16:12:28.827197', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 51),
(187, '2024-07-18 16:12:34.271912', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 50),
(188, '2024-07-19 10:11:15.941720', 'Test!', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 43),
(189, '2024-07-19 10:11:20.709064', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 43),
(190, '2024-07-19 10:13:20.622231', 'Hellooo', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 44),
(191, '2024-07-19 10:13:28.630712', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 44),
(192, '2024-07-19 11:20:57.762556', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 52),
(193, '2024-07-19 11:20:57.778483', 'dqzdqz', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 52),
(194, '2024-07-19 15:37:22.965308', 'Transfer to tech', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 53),
(195, '2024-07-19 15:37:22.977163', 'Bonjour,\r\n\r\nJe constate un problème de connexion avec votre application de matin, je ne parviens pas à dépasser l\'espace où l\'on rentre son nom et son mot de passe, pourriez-vous me tenir informé s\'il vous plaît ?\r\n\r\nCordialement,\r\n\r\nPat ACAISSE', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 53),
(196, '2024-07-22 09:26:26.470663', '***SYS-notif*** Modified EmergencyStatusId from 5 to 1', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 53),
(197, '2024-07-22 09:26:26.491822', 'Bonjour, il semble que notre serveur connaissent actuellement des perturbations. Nous sommes activement en train de faire le nécessaire pour solutionner ce désagrément, et je vous tiens informé lors de la résolution du problème.', 1, 'ec20024e-f81c-4b38-b326-0a558a5e72e7', 53),
(200, '2024-07-23 10:16:16.525273', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 49),
(201, '2024-07-24 16:26:45.877242', 'tessss', 1, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 52),
(202, '2024-07-24 16:29:28.454140', '***Ticket closed by customer action***', 3, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 47);

-- --------------------------------------------------------

--
-- Structure de la table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
CREATE TABLE IF NOT EXISTS `Tickets` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CustomerId` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `MalfunctionId` int NOT NULL,
  `EmergencyStatusId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Tickets`
--

INSERT INTO `Tickets` (`Id`, `CustomerId`, `MalfunctionId`, `EmergencyStatusId`) VALUES
(1, '46403910-91e2-434a-8c72-f814196d5026', 1, 5),
(2, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(24, '46403910-91e2-434a-8c72-f814196d5026', 7, 5),
(4, '46403910-91e2-434a-8c72-f814196d5026', 1, 5),
(23, '46403910-91e2-434a-8c72-f814196d5026', 1, 5),
(6, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(7, '46403910-91e2-434a-8c72-f814196d5026', 9, 5),
(8, '46403910-91e2-434a-8c72-f814196d5026', 9, 5),
(9, '46403910-91e2-434a-8c72-f814196d5026', 9, 5),
(10, '46403910-91e2-434a-8c72-f814196d5026', 9, 5),
(11, '46403910-91e2-434a-8c72-f814196d5026', 9, 5),
(12, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(13, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(14, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(15, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(16, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(17, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(18, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(19, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(20, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(21, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(22, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(25, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 8, 5),
(26, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 8, 5),
(27, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 8, 5),
(28, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 7, 5),
(29, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(30, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(31, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(32, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(33, '46403910-91e2-434a-8c72-f814196d5026', 3, 5),
(34, '46403910-91e2-434a-8c72-f814196d5026', 4, 5),
(35, '46403910-91e2-434a-8c72-f814196d5026', 1, 5),
(36, '46403910-91e2-434a-8c72-f814196d5026', 2, 5),
(37, '46403910-91e2-434a-8c72-f814196d5026', 1, 5),
(38, '46403910-91e2-434a-8c72-f814196d5026', 1, 4),
(39, '46403910-91e2-434a-8c72-f814196d5026', 4, 3),
(40, '46403910-91e2-434a-8c72-f814196d5026', 8, 4),
(41, '46403910-91e2-434a-8c72-f814196d5026', 1, 5),
(42, '46403910-91e2-434a-8c72-f814196d5026', 1, 5),
(43, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 7, 5),
(44, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 2, 5),
(45, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 2, 5),
(46, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 5, 5),
(47, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 7, 5),
(48, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 3, 5),
(49, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 5, 5),
(50, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 1, 5),
(51, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 2, 5),
(52, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 1, 5),
(53, 'e7f30aa5-4be0-4f89-a934-e9687512a196', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `TicketStates`
--

DROP TABLE IF EXISTS `TicketStates`;
CREATE TABLE IF NOT EXISTS `TicketStates` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `TicketStates`
--

INSERT INTO `TicketStates` (`Id`, `name`) VALUES
(1, 'Ouvert'),
(2, 'En attente'),
(3, 'Clôturé');

-- --------------------------------------------------------

--
-- Structure de la table `Warranties`
--

DROP TABLE IF EXISTS `Warranties`;
CREATE TABLE IF NOT EXISTS `Warranties` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Duration` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `Warranties`
--

INSERT INTO `Warranties` (`Id`, `Duration`) VALUES
(1, 12),
(2, 24),
(3, 48);

-- --------------------------------------------------------

--
-- Structure de la table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE IF NOT EXISTS `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('20240514113621_First-Migration-IdentityEntity', '8.0.4'),
('20240516141116_ChangedUserIdTypeInModels', '8.0.4');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
