-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-09-2021 a las 04:56:55
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `delilah_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `state` varchar(10) NOT NULL,
  `orderTime` datetime NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `paymentMethod` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`state`, `orderTime`, `orderNumber`, `idUser`, `paymentMethod`) VALUES
('enviando', '2021-05-12 18:43:32', 1, 5, 'efectivo'),
('enviando', '2021-07-15 15:32:36', 2, 20, 'tarjeta'),
('entregado', '2021-03-01 19:03:31', 3, 11, 'efectivo'),
('enviando', '2020-10-14 10:06:05', 4, 4, 'tarjeta'),
('enviando', '2021-02-17 09:00:51', 5, 36, 'tarjeta'),
('nuevo', '2020-09-23 10:37:36', 6, 25, 'tarjeta'),
('preparando', '2020-12-09 19:50:23', 7, 38, 'efectivo'),
('confirmado', '2021-05-05 09:23:57', 8, 36, 'efectivo'),
('cancelado', '2020-11-30 13:35:15', 9, 25, 'efectivo'),
('confirmado', '2020-11-21 18:07:35', 10, 3, 'efectivo'),
('nuevo', '2021-07-15 15:32:34', 11, 38, 'tarjeta'),
('enviado', '2021-05-12 18:43:32', 12, 5, 'tarjeta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `urlImg` varchar(255) NOT NULL,
  `dishName` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `urlImg`, `dishName`, `price`) VALUES
(1, 'http://dummyimage.com/129x100.png/cc0000/ffffff', 'Orange Roughy 6/8 Oz', 414837),
(2, 'http://dummyimage.com/227x100.png/cc0000/ffffff', 'Pork - Ground', 487126),
(3, 'http://dummyimage.com/121x100.png/cc0000/ffffff', 'Tray - 16in Rnd Blk', 940895),
(4, 'http://dummyimage.com/240x100.png/ff4444/ffffff', 'Oil - Olive Bertolli', 51903),
(5, 'http://dummyimage.com/106x100.png/cc0000/ffffff', 'Creamers - 10%', 548599),
(6, 'http://dummyimage.com/167x100.png/5fa2dd/ffffff', 'Soup - Campbells Chili', 109568),
(7, 'http://dummyimage.com/218x100.png/5fa2dd/ffffff', 'Apples - Spartan', 398177),
(8, 'http://dummyimage.com/145x100.png/5fa2dd/ffffff', 'Leeks - Large', 266558),
(9, 'http://dummyimage.com/161x100.png/cc0000/ffffff', 'Lettuce - Romaine, Heart', 291165),
(10, 'http://dummyimage.com/163x100.png/ff4444/ffffff', 'Mushroom - Enoki, Dry', 308021),
(11, 'http://dummyimage.com/220x100.png/cc0000/ffffff', 'Tea - Herbal I Love Lemon', 390809),
(12, 'http://dummyimage.com/239x100.png/5fa2dd/ffffff', 'Wine - Prem Select Charddonany', 153298),
(13, 'http://dummyimage.com/246x100.png/dddddd/000000', 'Lamb - Racks, Frenched', 968275),
(14, 'http://dummyimage.com/168x100.png/ff4444/ffffff', 'Wine - Gato Negro Cabernet', 671740),
(15, 'http://dummyimage.com/226x100.png/5fa2dd/ffffff', 'Garbag Bags - Black', 857875),
(16, 'http://dummyimage.com/217x100.png/5fa2dd/ffffff', 'Wine - Red, Harrow Estates, Cab', 246181),
(17, 'http://dummyimage.com/211x100.png/cc0000/ffffff', 'Stainless Steel Cleaner Vision', 205417),
(18, 'http://dummyimage.com/132x100.png/5fa2dd/ffffff', 'Petit Baguette', 13163),
(19, 'http://dummyimage.com/116x100.png/dddddd/000000', 'Quail - Whole, Bone - In', 542448),
(20, 'http://dummyimage.com/248x100.png/5fa2dd/ffffff', 'Chickensplit Half', 108201),
(21, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'Oysters - Smoked', 267697),
(22, 'http://dummyimage.com/174x100.png/cc0000/ffffff', 'Noodles - Steamed Chow Mein', 254302),
(23, 'http://dummyimage.com/244x100.png/5fa2dd/ffffff', 'Veal - Slab Bacon', 469332),
(24, 'http://dummyimage.com/214x100.png/ff4444/ffffff', 'The Pop Shoppe - Black Cherry', 499727),
(25, 'http://dummyimage.com/133x100.png/dddddd/000000', 'Bread - Multigrain', 237516),
(26, 'http://dummyimage.com/174x100.png/ff4444/ffffff', 'Curry Paste - Madras', 999761),
(27, 'http://dummyimage.com/246x100.png/dddddd/000000', 'Wine - White, Pinot Grigio', 340128),
(28, 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 'Appetizer - Spring Roll, Veg', 362032),
(29, 'http://dummyimage.com/150x100.png/dddddd/000000', 'Tobasco Sauce', 335471),
(30, 'http://dummyimage.com/181x100.png/ff4444/ffffff', 'Nut - Pine Nuts, Whole', 449156),
(31, 'http://dummyimage.com/127x100.png/5fa2dd/ffffff', 'Seedlings - Mix, Organic', 193158),
(32, 'http://dummyimage.com/120x100.png/5fa2dd/ffffff', 'Garbag Bags - Black', 878640),
(33, 'http://dummyimage.com/118x100.png/cc0000/ffffff', 'Island Oasis - Sweet And Sour Mix', 269030),
(34, 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', 'Water - Spring Water, 355 Ml', 246419),
(35, 'http://dummyimage.com/163x100.png/dddddd/000000', 'Turnip - Wax', 537390),
(36, 'http://dummyimage.com/158x100.png/cc0000/ffffff', 'Pork - Caul Fat', 469018),
(37, 'http://dummyimage.com/129x100.png/dddddd/000000', 'Juice - Ocean Spray Kiwi', 613973),
(38, 'http://dummyimage.com/250x100.png/5fa2dd/ffffff', 'Spinach - Packaged', 551103),
(39, 'http://dummyimage.com/123x100.png/ff4444/ffffff', 'Wine - White, Pinot Grigio', 150508),
(40, 'http://dummyimage.com/170x100.png/5fa2dd/ffffff', 'Pasta - Bauletti, Chicken White', 244647),
(41, 'http://dummyimage.com/172x100.png/dddddd/000000', 'Couscous', 511922),
(42, 'http://dummyimage.com/248x100.png/5fa2dd/ffffff', 'Wine - Red, Cooking', 199123),
(43, 'http://dummyimage.com/171x100.png/ff4444/ffffff', 'Muffin - Mix - Mango Sour Cherry', 135531),
(44, 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'Pepper - Pablano', 956277),
(45, 'http://dummyimage.com/163x100.png/dddddd/000000', 'Chocolate - Chips Compound', 41134),
(46, 'http://dummyimage.com/100x100.png/5fa2dd/ffffff', 'Squid - U - 10 Thailand', 384248),
(47, 'http://dummyimage.com/156x100.png/ff4444/ffffff', 'Foil Cont Round', 861131),
(48, 'http://dummyimage.com/214x100.png/cc0000/ffffff', 'Wine - Bouchard La Vignee Pinot', 251964),
(49, 'http://dummyimage.com/184x100.png/dddddd/000000', 'Kellogs Cereal In A Cup', 530560),
(50, 'http://dummyimage.com/233x100.png/5fa2dd/ffffff', 'Catfish - Fillets', 850518);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productsPerOrders`
--

CREATE TABLE `productsPerOrders` (
  `id` int(11) NOT NULL,
  `orderNumber` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productsPerOrders`
--

INSERT INTO `productsPerOrders` (`id`, `orderNumber`, `idProduct`, `amount`) VALUES
(1, 2, 32, 10),
(2, 1, 50, 10),
(3, 4, 40, 10),
(4, 7, 17, 1),
(5, 4, 17, 9),
(6, 10, 39, 10),
(7, 5, 29, 3),
(8, 3, 38, 2),
(9, 2, 13, 7),
(10, 5, 24, 3),
(11, 8, 26, 6),
(12, 6, 14, 2),
(13, 2, 39, 8),
(14, 1, 47, 9),
(15, 9, 33, 6),
(16, 7, 41, 10),
(17, 7, 49, 7),
(18, 10, 14, 3),
(19, 4, 48, 4),
(20, 4, 19, 5),
(22, 11, 5, 2),
(26, 12, 4, 3),
(27, 12, 2, 1),
(28, 12, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `userName`, `name`, `lastname`, `email`, `phone`, `address`, `password`, `role`) VALUES
(1, 'wreekie0', 'Wilhelmina', 'Reekie', 'wreekie0@dion.ne.jp', 557463675, '28422 Forest Place', 'nhzbBZ', 'user'),
(2, 'rorbine1', 'Ruthe', 'Orbine', 'rorbine1@usa.gov', 338799527, '34181 Drewry Park', 'IQeM89KJdZL', 'admin'),
(3, 'tchurchyard2', 'Teddy', 'Churchyard', 'tchurchyard2@newyorker.com', 657390902, '4958 Kennedy Court', 'KLHYok', 'admin'),
(4, 'jkoppke3', 'Jodie', 'Koppke', 'jkoppke3@tripod.com', 120818666, '24 Golf View Way', 'EJASFd', 'admin'),
(5, 'atoy4', 'Andrea', 'Toy', 'atoy4@chicagotribune.com', 281246272, '0 Arapahoe Plaza', '1bJnc4I72yr', 'user'),
(6, 'lobbard5', 'Libbi', 'Obbard', 'lobbard5@europa.eu', 546270773, '28742 6th Pass', 'PtNXHFfA', 'user'),
(7, 'lgierok6', 'Lina', 'Gierok', 'lgierok6@php.net', 727407324, '11550 Grayhawk Park', 'AjiO06629o', 'admin'),
(8, 'mbevens7', 'Morganica', 'Bevens', 'mbevens7@blogspot.com', 687125272, '1 Northfield Parkway', 'PvxaaZLu', 'user'),
(9, 'bbengough8', 'Bret', 'Bengough', 'bbengough8@livejournal.com', 207021708, '16 Sachtjen Pass', 'VpPRCh1o3yX', 'admin'),
(10, 'jjurick9', 'Jervis', 'Jurick', 'jjurick9@marriott.com', 433822692, '42 Northwestern Crossing', 'Eo0CeEsf1', 'admin'),
(11, 'kmottersheada', 'Kris', 'Mottershead', 'kmottersheada@hp.com', 614158498, '7 Meadow Valley Junction', 'DckfZ0Zk4zyc', 'user'),
(12, 'cmatteib', 'Christin', 'Mattei', 'cmatteib@nhs.uk', 213218675, '533 Farmco Parkway', 'pgCdWeT', 'admin'),
(13, 'gpavierc', 'Gram', 'Pavier', 'gpavierc@marketwatch.com', 379341840, '029 Fair Oaks Park', 'yrLsm5T3T', 'user'),
(14, 'datteridged', 'Dorthea', 'Atteridge', 'datteridged@reuters.com', 716429104, '4494 Sachtjen Court', 'IFci3CGbeVK', 'user'),
(15, 'rbassette', 'Romain', 'Bassett', 'rbassette@meetup.com', 261692915, '51268 Hagan Way', '9fjANy', 'user'),
(16, 'etodf', 'Ericka', 'Tod', 'etodf@tinypic.com', 675887951, '71 Park Meadow Street', 'PFzRkbG2Uz5', 'user'),
(17, 'brosleng', 'Bernice', 'Roslen', 'brosleng@mtv.com', 210163257, '600 Comanche Trail', 'KqAZtpUF', 'admin'),
(18, 'mdimeloeh', 'Merilee', 'Dimeloe', 'mdimeloeh@buzzfeed.com', 445160215, '65 Larry Plaza', 'chD3XBNcX4P', 'admin'),
(19, 'mcritzeni', 'Mercedes', 'Critzen', 'mcritzeni@constantcontact.com', 801419065, '7 Judy Alley', '9CNtnpv3', 'user'),
(20, 'mmcpeicej', 'Maurise', 'McPeice', 'mmcpeicej@yahoo.co.jp', 749523069, '10 Thackeray Street', 'tKqQNHxIA1W', 'user'),
(21, 'flanmeidk', 'Frans', 'Lanmeid', 'flanmeidk@telegraph.co.uk', 891497880, '9 Welch Terrace', 'IPuXdHyh1e', 'admin'),
(22, 'wdelahayl', 'Waylin', 'De La Hay', 'wdelahayl@desdev.cn', 430601208, '75569 Saint Paul Drive', 'Lz74M94Gq5', 'admin'),
(23, 'ktorram', 'Kelwin', 'Torra', 'ktorram@dell.com', 796900954, '70636 Holmberg Lane', '4rP0UBF', 'user'),
(24, 'rmeralin', 'Robinetta', 'Merali', 'rmeralin@about.me', 665565173, '15 Riverside Lane', 'FBxMdEJr9wP', 'admin'),
(25, 'fdowyero', 'Ferguson', 'Dowyer', 'fdowyero@nps.gov', 446179899, '23247 6th Drive', 'mKfh4m8n', 'user'),
(26, 'otwistp', 'Orazio', 'Twist', 'otwistp@dailymotion.com', 249311020, '7 Golf Place', 'HrZ0efpOK5L', 'user'),
(27, 'ibabingtonq', 'Ingar', 'Babington', 'ibabingtonq@pinterest.com', 247704391, '836 Northview Avenue', 'dLUslEnL87j1', 'user'),
(28, 'mfullagarr', 'Mahalia', 'Fullagar', 'mfullagarr@g.co', 596540821, '451 Artisan Plaza', 'ZKl8Nbku26u', 'admin'),
(29, 'morwells', 'Marie-ann', 'Orwell', 'morwells@typepad.com', 961348282, '312 Elka Road', 'zLXNuM', 'admin'),
(30, 'jchurchardt', 'Jervis', 'Churchard', 'jchurchardt@netlog.com', 838811027, '59 Golf View Lane', 'BI7rkBK', 'user'),
(31, 'ccleworthu', 'Caron', 'Cleworth', 'ccleworthu@ucoz.ru', 919734468, '44899 Kingsford Park', 'N1MbEO', 'admin'),
(32, 'srymerv', 'Sky', 'Rymer', 'srymerv@parallels.com', 703026995, '447 Eastlawn Hill', 'jCPXi2AUKZ', 'user'),
(33, 'fbonannow', 'Forster', 'Bonanno', 'fbonannow@admin.ch', 680328209, '17 Chive Drive', 'o0mSD8DR', 'admin'),
(34, 'lsavaryx', 'Libbie', 'Savary', 'lsavaryx@mayoclinic.com', 690596003, '6490 Gerald Avenue', '1G3brqlEKg4s', 'admin'),
(35, 'tcabany', 'Tomlin', 'Caban', 'tcabany@sogou.com', 981729274, '2836 Hoepker Avenue', 'NaawFqLtkwU', 'user'),
(36, 'aweaverz', 'Agnella', 'Weaver', 'aweaverz@newyorker.com', 971284020, '8 Carey Street', 'exewUne9ABM', 'user'),
(37, 'xhumfrey10', 'Ximenez', 'Humfrey', 'xhumfrey10@networksolutions.com', 408008994, '70 Green Plaza', 'uH9CvzIlZ', 'admin'),
(38, 'roffiler11', 'Rahel', 'Offiler', 'roffiler11@wiley.com', 698025974, '5 Comanche Crossing', 'RPHSIXoM3XmW', 'admin'),
(39, 'sjeune12', 'Sophia', 'Jeune', 'sjeune12@addthis.com', 227446409, '54 Lawn Drive', 'JFikd8a9N', 'admin'),
(40, 'tfrick13', 'Tove', 'Frick', 'tfrick13@surveymonkey.com', 582799504, '75111 Ludington Crossing', 'WfptmiHc', 'user'),
(41, 'fchristoffels14', 'Forrest', 'Christoffels', 'fchristoffels14@hugedomains.com', 146745394, '607 Iowa Place', 'vDtpvk', 'user'),
(42, 'spetrovykh15', 'Sib', 'Petrovykh', 'spetrovykh15@businessinsider.com', 298401874, '8 Scoville Avenue', 'QkPB6UJi', 'user'),
(43, 'rhaysham16', 'Ruddy', 'Haysham', 'rhaysham16@cocolog-nifty.com', 889979884, '84 Vidon Junction', 'BDOfg8JQ37b', 'user'),
(44, 'hcornforth17', 'Hunter', 'Cornforth', 'hcornforth17@ameblo.jp', 763993700, '3412 Ruskin Hill', 'J7KkQW8qBYPx', 'user'),
(45, 'zvictoria18', 'Zena', 'Victoria', 'zvictoria18@vkontakte.ru', 968567756, '178 Old Gate Parkway', 'P5qYpYoSip', 'admin'),
(46, 'yverden19', 'Yardley', 'Verden', 'yverden19@51.la', 639140041, '792 Westridge Terrace', 'YNtYwW0WN', 'admin'),
(47, 'phalhead1a', 'Prescott', 'Halhead', 'phalhead1a@gnu.org', 252893156, '2840 Huxley Place', 'gOmCG5', 'user'),
(48, 'arochford1b', 'Almeta', 'Rochford', 'arochford1b@dropbox.com', 721016313, '45402 Everett Hill', 'N2kZPlwE1pD5', 'user'),
(49, 'tpevie1c', 'Tabby', 'Pevie', 'tpevie1c@hugedomains.com', 667874029, '2 Dahle Drive', 'UyfzGVh5T', 'admin'),
(50, 'rbuckoke1d', 'Rosa', 'Buckoke', 'rbuckoke1d@usatoday.com', 944436552, '61 Crest Line Parkway', 'RGESIbNSUM', 'user'),
(51, 'algo', 'camilo', 'urrego', 'algomas@gmail.com', 7567890, 'calle falsa 123', 'algomasdificil', 'user');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderNumber`),
  ADD KEY `idUser` (`idUser`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productsPerOrders`
--
ALTER TABLE `productsPerOrders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idProduct` (`idProduct`),
  ADD KEY `orderNumber` (`orderNumber`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `orderNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `productsPerOrders`
--
ALTER TABLE `productsPerOrders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `productsPerOrders`
--
ALTER TABLE `productsPerOrders`
  ADD CONSTRAINT `productsperorders_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `productsperorders_ibfk_2` FOREIGN KEY (`orderNumber`) REFERENCES `orders` (`orderNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
