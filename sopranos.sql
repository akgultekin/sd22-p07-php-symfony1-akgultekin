-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 14 feb 2024 om 15:03
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

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

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `category`
--

INSERT INTO `category` (`id`, `name`, `image`) VALUES
(1, 'Vis pizza\'s', 'fish-pizzas.png'),
(2, 'Vlees pizza\'s', 'meat-pizzas.png'),
(3, 'Veggie pizza\'s', 'vegetarian-pizzas.png');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240214133614', '2024-02-14 14:36:20', 82);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `pizza`
--

INSERT INTO `pizza` (`id`, `category_id`, `name`, `image`, `description`) VALUES
(1, 1, 'Tuna pizza', 'tuna-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Ingeblikte of verse tonijn (uitgelekt indien ingeblikt), Tomatensaus of pizzasaus, Mozzarellakaas (geraspt of in plakjes), Rode uien (in dunne plakjes), Paprika\'s (groen, rood of geel, in dunne plakjes), Olijfolie, Zout en peper.'),
(2, 1, 'Smoked Salmon pizza', 'smoked-salmon-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Roomkaas (bij voorkeur op kamertemperatuur), Gerookte zalm (in dunne plakjes gesneden), Rode ui (in dunne plakjes gesneden), Kappertjes, Verse dille (fijngehakt), Citroen (in partjes gesneden voor het serveren), Zwarte peper (versgemalen, naar smaak).'),
(3, 1, 'Shrimp Scampi pizza', 'shrimp-scampi-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Knoflookboter (gesmolten boter gemengd met fijngehakte knoflook), Grote garnalen (schoongemaakt en gepeld), Verse peterselie (fijngehakt), Rode pepervlokken (optioneel, voor wat pit), Citroensap, Zout en peper (naar smaak), Mozzarella kaas (geraspt), Parmezaanse kaas (geraspt), Olijfolie.'),
(4, 2, 'Pepperoni pizza', 'pepperoni-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Olijfolie, Knoflookpoeder (optioneel, voor extra smaak), Gedroogde oregano (optioneel, voor extra smaak), Rode pepervlokken (optioneel, voor wat pit).'),
(5, 2, 'BBQ Chicken pizza', 'bbq-chicken-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Barbecuesaus, Gekookte kipfilet (in blokjes of plakjes), Rode ui (in dunne plakjes gesneden), Mozzarella kaas (geraspt), Gouda kaas (geraspt), Verse koriander (fijngehakt), Olijfolie.'),
(6, 2, 'Meat Lovers pizza', 'meat-lovers-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomatensaus of pizzasaus, Mozzarella kaas (geraspt), Pepperoni plakjes, Italiaanse worst (in plakjes gesneden), Ham (in blokjes gesneden), Spek (in stukjes gesneden), Gehakt (voorgegaard), Optionele toevoegingen: Rode pepervlokken, Gedroogde oregano, Knoflookpoeder.'),
(7, 3, 'Margherita pizza', 'margherita-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Tomaten (in plakjes gesneden of cherrytomaten gehalveerd), Verse mozzarella kaas (in plakjes of stukjes gescheurd), Verse basilicumblaadjes, Knoflook (fijngehakt), Extra vierge olijfolie, Zeezout, Gemalen zwarte peper.'),
(8, 3, 'Mediterraenean Veggie pizza', 'mediterranean-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus (of tomatensaus), Mozzarella kaas (geraspt), Feta kaas (verkruimeld), Cherrytomaten (gehalveerd), Rode ui (in dunne plakjes gesneden), Zwarte olijven (ontpit en in plakjes gesneden), Artisjokharten (uitgelekt en in kwarten gesneden), Verse spinazieblaadjes, Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.'),
(9, 3, 'Pesto Veggie pizza', 'pesto-veggie-pizza.png', 'Pizzadeeg of kant-en-klare pizzabodem, Pesto saus, Mozzarella kaas (geraspt), Cherrytomaten (gehakt), Rode ui (in dunne plakjes gesneden), Champignons (in plakjes gesneden), Paprika (in dunne reepjes gesneden), Courgette (in dunne plakjes gesneden), Verse basilicumblaadjes, Extra vierge olijfolie, Zout en peper naar smaak.');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_CFDD826F12469DE2` (`category_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `FK_CFDD826F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
