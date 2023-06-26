-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2023 a las 05:59:57
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `users_app`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `companies`
--

CREATE TABLE `companies` (
  `id_comp` int(11) NOT NULL,
  `name_comp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `companies`
--

INSERT INTO `companies` (`id_comp`, `name_comp`) VALUES
(1, 'Alqueria'),
(2, 'Servientrega'),
(3, 'Cannonical');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruits`
--

CREATE TABLE `fruits` (
  `id_frut` int(11) NOT NULL,
  `name_frut` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fruits`
--

INSERT INTO `fruits` (`id_frut`, `name_frut`) VALUES
(1, 'limon'),
(2, 'manzana'),
(3, 'pera'),
(4, 'naranja'),
(5, 'uva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `name_rol` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `name_rol`) VALUES
(7, 'admin'),
(8, 'support'),
(9, 'costumer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usrs` int(11) NOT NULL,
  `name_usrs` varchar(255) NOT NULL,
  `email_usrs` varchar(255) NOT NULL,
  `password_usrs` varchar(255) NOT NULL,
  `is_active_usrs` tinyint(1) NOT NULL DEFAULT 1,
  `money_usrs` double NOT NULL,
  `age_usrs` int(11) NOT NULL,
  `gender_usrs` enum('m','f') NOT NULL,
  `latitude_usrs` int(11) NOT NULL,
  `longitude_usrs` int(11) NOT NULL,
  `friends_usrs` bigint(20) NOT NULL,
  `id_rol` int(11) NOT NULL DEFAULT 1,
  `id_comp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usrs`, `name_usrs`, `email_usrs`, `password_usrs`, `is_active_usrs`, `money_usrs`, `age_usrs`, `gender_usrs`, `latitude_usrs`, `longitude_usrs`, `friends_usrs`, `id_rol`, `id_comp`) VALUES
(1, 'test', 'test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 1, 50000000, 27, 'm', 54, -8, 13, 9, 1),
(2, 'test2', 'test2@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 1, 800000, 45, 'f', 88, -7, 8, 9, 1),
(3, 'test3', 'test3@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 1, 300000, 33, 'm', 9, -77, 5, 9, 2),
(4, 'test4', 'test4@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 1, 8500000, 45, 'f', 88, -7, 6, 9, 3),
(5, 'test5', 'test5@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 1, 38546415, 23, 'f', 9, -7, 78, 9, 3),
(6, 'test6', 'test6@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 1, 4564534123, 40, 'm', 98, -74, 7, 9, 3),
(7, 'test7', 'test7@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 415354342, 55, 'm', 88, -71, 6, 9, 3),
(8, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(9, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(10, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(11, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(12, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(13, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(14, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(15, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 2),
(20, 'fdsfsdf', 'fdsfsdf@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 1, 54325435, 45, 'f', 54, -56, 8, 8, 1),
(21, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 1),
(22, 'test test', 'test_test@gmail.com', '$2a$10$HMZQfr4DMgrB83lqIJ/UgOlCUrm9PVKNtcAnMimsijW54BSriew7C', 0, 4000, 50, 'm', 400, -7, 40, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_fruits`
--

CREATE TABLE `users_fruits` (
  `id_usrs_fruts` int(11) NOT NULL,
  `id_usrs` int(11) NOT NULL,
  `id_fruts` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_fruits`
--

INSERT INTO `users_fruits` (`id_usrs_fruts`, `id_usrs`, `id_fruts`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 2, 2),
(4, 2, 2),
(5, 3, 5),
(6, 3, 5),
(7, 3, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id_comp`);

--
-- Indices de la tabla `fruits`
--
ALTER TABLE `fruits`
  ADD PRIMARY KEY (`id_frut`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usrs`),
  ADD KEY `id_comp` (`id_comp`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_rol_2` (`id_rol`);

--
-- Indices de la tabla `users_fruits`
--
ALTER TABLE `users_fruits`
  ADD PRIMARY KEY (`id_usrs_fruts`),
  ADD KEY `id_usrs` (`id_usrs`),
  ADD KEY `id_fruts` (`id_fruts`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `companies`
--
ALTER TABLE `companies`
  MODIFY `id_comp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fruits`
--
ALTER TABLE `fruits`
  MODIFY `id_frut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_usrs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `users_fruits`
--
ALTER TABLE `users_fruits`
  MODIFY `id_usrs_fruts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_comp`) REFERENCES `companies` (`id_comp`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `users_fruits`
--
ALTER TABLE `users_fruits`
  ADD CONSTRAINT `users_fruits_ibfk_1` FOREIGN KEY (`id_usrs`) REFERENCES `users` (`id_usrs`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_fruits_ibfk_2` FOREIGN KEY (`id_fruts`) REFERENCES `fruits` (`id_frut`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
