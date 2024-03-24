-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2024 at 05:38 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sopranos`
--
CREATE DATABASE IF NOT EXISTS `sopranos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sopranos`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'Vis pizza\'s', 'fish-pizzas.png'),
(2, 'Vlees pizza\'s', 'meat-pizzas.png'),
(3, 'Veggie pizza\'s', 'vegetarian-pizzas.png');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240214133614', '2024-02-14 14:36:20', 82),
('DoctrineMigrations\\Version20240313081420', '2024-03-22 09:42:44', 8),
('DoctrineMigrations\\Version20240322090042', '2024-03-22 10:00:48', 64),
('DoctrineMigrations\\Version20240322091230', '2024-03-22 10:12:51', 54),
('DoctrineMigrations\\Version20240322091600', '2024-03-22 10:16:08', 54),
('DoctrineMigrations\\Version20240323165427', '2024-03-23 17:54:33', 75),
('DoctrineMigrations\\Version20240323175821', '2024-03-23 18:58:26', 10);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `pizza_id` int(11) DEFAULT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `zip` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(5,2) NOT NULL,
  `size` enum('Medium 25 cm','Large 35 cm','Calzone') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`id`, `category_id`, `name`, `image`, `description`, `price`, `size`) VALUES
(1, 1, 'Tuna pizza', 'tuna-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Ingeblikte of verse tonijn (uitgelekt indien ingeblikt), Tomatensaus of pizzasaus, Mozzarellakaas (geraspt of in plakjes), Rode uien (in dunne plakjes), Paprika\'s (groen, rood of geel, in dunne plakjes), Olijfolie, Zout en peper.', 12.99, 'Medium 25 cm'),
(2, 1, 'Smoked Salmon pizza', 'smoked-salmon-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Roomkaas (bij voorkeur op kamertemperatuur), Gerookte zalm (in dunne plakjes gesneden), Rode ui (in dunne plakjes gesneden), Kappertjes, Verse dille (fijngehakt), Citroen (in partjes gesneden voor het serveren), Zwarte peper (versgemalen, naar smaak).', 14.99, 'Medium 25 cm'),
(3, 1, 'Shrimp Scampi pizza', 'shrimp-scampi-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Knoflookboter (gesmolten boter gemengd met fijngehakte knoflook), Grote garnalen (schoongemaakt en gepeld), Verse peterselie (fijngehakt), Rode pepervlokken (optioneel, voor wat pit), Citroensap, Zout en peper (naar smaak), Mozzarella kaas (geraspt), Parmezaanse kaas (geraspt), Olijfolie.', 16.99, 'Medium 25 cm'),
(4, 2, 'Pepperoni pizza', 'pepperoni-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Olijfolie, Knoflookpoeder (optioneel, voor extra smaak), Gedroogde oregano (optioneel, voor extra smaak), Rode pepervlokken (optioneel, voor wat pit).', 10.99, 'Medium 25 cm'),
(5, 2, 'BBQ Chicken pizza', 'bbq-chicken-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Barbecuesaus, Gekookte kipfilet (in blokjes of plakjes), Rode ui (in dunne plakjes gesneden), Mozzarella kaas (geraspt), Gouda kaas (geraspt), Verse koriander (fijngehakt), Olijfolie.', 13.99, 'Medium 25 cm'),
(6, 2, 'Meat Lovers pizza', 'meat-lovers-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Italiaanse worst (in plakjes gesneden), Ham (in blokjes gesneden), Spek (in stukjes gesneden), Gehakt (voorgegaard), Optionele toevoegingen: Rode pepervlokken, Gedroogde oregano, Knoflookpoeder.', 14.99, 'Medium 25 cm'),
(7, 3, 'Margherita pizza', 'margherita-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomaten (in plakjes gesneden of cherrytomaten gehalveerd), Verse mozzarella kaas (in plakjes of stukjes gescheurd), Verse basilicumblaadjes, Knoflook (fijngehakt), Extra vierge olijfolie, Zeezout, Gemalen zwarte peper.', 9.99, 'Medium 25 cm'),
(8, 3, 'Mediterraenean Veggie pizza', 'mediterranean-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus (of tomatensaus), Mozzarella kaas (geraspt), Feta kaas (verkruimeld), Cherrytomaten (gehalveerd), Rode ui (in dunne plakjes gesneden), Zwarte olijven (ontpit en in plakjes gesneden), Artisjokharten (uitgelekt en in kwarten gesneden), Verse spinazieblaadjes, Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.', 12.99, 'Medium 25 cm'),
(9, 3, 'Pesto Veggie pizza', 'pesto-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus, Mozzarella kaas (geraspt), Cherrytomaten (gehakt), Rode ui (in dunne plakjes gesneden), Champignons (in plakjes gesneden), Paprika (in dunne reepjes gesneden), Courgette (in dunne plakjes gesneden), Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.', 13.99, 'Medium 25 cm'),
(10, 1, 'Tuna pizza', 'tuna-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Ingeblikte of verse tonijn (uitgelekt indien ingeblikt), Tomatensaus of pizzasaus, Mozzarellakaas (geraspt of in plakjes), Rode uien (in dunne plakjes), Paprika\'s (groen, rood of geel, in dunne plakjes), Olijfolie, Zout en peper.', 18.99, 'Large 35 cm'),
(12, 1, 'Smoked Salmon pizza', 'smoked-salmon-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Roomkaas (bij voorkeur op kamertemperatuur), Gerookte zalm (in dunne plakjes gesneden), Rode ui (in dunne plakjes gesneden), Kappertjes, Verse dille (fijngehakt), Citroen (in partjes gesneden voor het serveren), Zwarte peper (versgemalen, naar smaak).', 21.99, 'Large 35 cm'),
(13, 1, 'Shrimp Scampi pizza', 'shrimp-scampi-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Knoflookboter (gesmolten boter gemengd met fijngehakte knoflook), Grote garnalen (schoongemaakt en gepeld), Verse peterselie (fijngehakt), Rode pepervlokken (optioneel, voor wat pit), Citroensap, Zout en peper (naar smaak), Mozzarella kaas (geraspt), Parmezaanse kaas (geraspt), Olijfolie.', 24.99, 'Large 35 cm'),
(14, 2, 'Pepperoni pizza', 'pepperoni-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Olijfolie, Knoflookpoeder (optioneel, voor extra smaak), Gedroogde oregano (optioneel, voor extra smaak), Rode pepervlokken (optioneel, voor wat pit).', 15.99, 'Large 35 cm'),
(15, 2, 'BBQ Chicken pizza', 'bbq-chicken-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Barbecuesaus, Gekookte kipfilet (in blokjes of plakjes), Rode ui (in dunne plakjes gesneden), Mozzarella kaas (geraspt), Gouda kaas (geraspt), Verse koriander (fijngehakt), Olijfolie.', 19.99, 'Large 35 cm'),
(16, 2, 'Meat Lovers pizza', 'meat-lovers-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Italiaanse worst (in plakjes gesneden), Ham (in blokjes gesneden), Spek (in stukjes gesneden), Gehakt (voorgegaard), Optionele toevoegingen: Rode pepervlokken, Gedroogde oregano, Knoflookpoeder.', 21.99, 'Large 35 cm'),
(17, 3, 'Margherita pizza', 'margherita-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomaten (in plakjes gesneden of cherrytomaten gehalveerd), Verse mozzarella kaas (in plakjes of stukjes gescheurd), Verse basilicumblaadjes, Knoflook (fijngehakt), Extra vierge olijfolie, Zeezout, Gemalen zwarte peper.', 9.99, 'Large 35 cm'),
(18, 3, 'Mediterraenean Veggie pizza', 'mediterranean-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus (of tomatensaus), Mozzarella kaas (geraspt), Feta kaas (verkruimeld), Cherrytomaten (gehalveerd), Rode ui (in dunne plakjes gesneden), Zwarte olijven (ontpit en in plakjes gesneden), Artisjokharten (uitgelekt en in kwarten gesneden), Verse spinazieblaadjes, Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.', 13.99, 'Large 35 cm'),
(19, 3, 'Pesto Veggie pizza', 'pesto-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus, Mozzarella kaas (geraspt), Cherrytomaten (gehakt), Rode ui (in dunne plakjes gesneden), Champignons (in plakjes gesneden), Paprika (in dunne reepjes gesneden), Courgette (in dunne plakjes gesneden), Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.', 18.99, 'Large 35 cm'),
(20, 1, 'Tuna pizza', 'tuna-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Ingeblikte of verse tonijn (uitgelekt indien ingeblikt), Tomatensaus of pizzasaus, Mozzarellakaas (geraspt of in plakjes), Rode uien (in dunne plakjes), Paprika\'s (groen, rood of geel, in dunne plakjes), Olijfolie, Zout en peper.', 14.99, 'Calzone'),
(21, 1, 'Smoked Salmon pizza', 'smoked-salmon-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Roomkaas (bij voorkeur op kamertemperatuur), Gerookte zalm (in dunne plakjes gesneden), Rode ui (in dunne plakjes gesneden), Kappertjes, Verse dille (fijngehakt), Citroen (in partjes gesneden voor het serveren), Zwarte peper (versgemalen, naar smaak).', 16.99, 'Calzone'),
(22, 1, 'Shrimp Scampi pizza', 'shrimp-scampi-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Knoflookboter (gesmolten boter gemengd met fijngehakte knoflook), Grote garnalen (schoongemaakt en gepeld), Verse peterselie (fijngehakt), Rode pepervlokken (optioneel, voor wat pit), Citroensap, Zout en peper (naar smaak), Mozzarella kaas (geraspt), Parmezaanse kaas (geraspt), Olijfolie.', 18.99, 'Calzone'),
(23, 2, 'Pepperoni pizza', 'pepperoni-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Olijfolie, Knoflookpoeder (optioneel, voor extra smaak), Gedroogde oregano (optioneel, voor extra smaak), Rode pepervlokken (optioneel, voor wat pit).', 12.99, 'Calzone'),
(24, 2, 'BBQ Chicken pizza', 'bbq-chicken-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Barbecuesaus, Gekookte kipfilet (in blokjes of plakjes), Rode ui (in dunne plakjes gesneden), Mozzarella kaas (geraspt), Gouda kaas (geraspt), Verse koriander (fijngehakt), Olijfolie.', 15.99, 'Calzone'),
(25, 2, 'Meat Lovers pizza', 'meat-lovers-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Italiaanse worst (in plakjes gesneden), Ham (in blokjes gesneden), Spek (in stukjes gesneden), Gehakt (voorgegaard), Optionele toevoegingen: Rode pepervlokken, Gedroogde oregano, Knoflookpoeder.', 16.99, 'Calzone'),
(26, 3, 'Margherita pizza', 'margherita-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomaten (in plakjes gesneden of cherrytomaten gehalveerd), Verse mozzarella kaas (in plakjes of stukjes gescheurd), Verse basilicumblaadjes, Knoflook (fijngehakt), Extra vierge olijfolie, Zeezout, Gemalen zwarte peper.', 11.99, 'Calzone'),
(27, 3, 'Mediterraenean Veggie pizza', 'mediterranean-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus (of tomatensaus), Mozzarella kaas (geraspt), Feta kaas (verkruimeld), Cherrytomaten (gehalveerd), Rode ui (in dunne plakjes gesneden), Zwarte olijven (ontpit en in plakjes gesneden), Artisjokharten (uitgelekt en in kwarten gesneden), Verse spinazieblaadjes, Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.', 14.99, 'Calzone'),
(28, 3, 'Pesto Veggie pizza', 'pesto-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus, Mozzarella kaas (geraspt), Cherrytomaten (gehakt), Rode ui (in dunne plakjes gesneden), Champignons (in plakjes gesneden), Paprika (in dunne reepjes gesneden), Courgette (in dunne plakjes gesneden), Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.', 15.99, 'Calzone'),
(29, NULL, '', NULL, NULL, 0.00, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398D41D1D42` (`pizza_id`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFDD826F12469DE2` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398D41D1D42` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`);

--
-- Constraints for table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_CFDD826F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
