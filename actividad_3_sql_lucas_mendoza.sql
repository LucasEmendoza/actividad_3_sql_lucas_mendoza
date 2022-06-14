-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para tienda_deportiva_el_podio
DROP DATABASE IF EXISTS `tienda_deportiva_el_podio`;
CREATE DATABASE IF NOT EXISTS `tienda_deportiva_el_podio` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tienda_deportiva_el_podio`;

-- Volcando estructura para tabla tienda_deportiva_el_podio.customers
DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` smallint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `premiun` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla relaciona los clientes de la tienda su informacion y caracteristicas.';

-- Volcando datos para la tabla tienda_deportiva_el_podio.customers: ~3 rows (aproximadamente)
DELETE FROM `customers`;
INSERT INTO `customers` (`id`, `name`, `phone`, `premiun`) VALUES
	(1, 'carlos marquez', '3021544998', b'1'),
	(2, 'antonio velez', '3054569874', b'1'),
	(3, 'carolina guzman', '3128526574', b'1'),
	(4, 'lina durango', '3508524585', b'1');

-- Volcando estructura para tabla tienda_deportiva_el_podio.payments_method
DROP TABLE IF EXISTS `payments_method`;
CREATE TABLE IF NOT EXISTS `payments_method` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `payment` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla relaciona los metodos de pago con que se realizan las ventas en la tienda.';

-- Volcando datos para la tabla tienda_deportiva_el_podio.payments_method: ~3 rows (aproximadamente)
DELETE FROM `payments_method`;
INSERT INTO `payments_method` (`id`, `payment`) VALUES
	(1, 'cash'),
	(2, 'tdc_amex'),
	(3, 'bank_check');

-- Volcando estructura para tabla tienda_deportiva_el_podio.products
DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` smallint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `size` varchar(50) NOT NULL,
  `imported` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla relaciona el nombre y las caracteristicas de los productos vendidos en la tienda.\r\n';

-- Volcando datos para la tabla tienda_deportiva_el_podio.products: ~4 rows (aproximadamente)
DELETE FROM `products`;
INSERT INTO `products` (`id`, `name`, `size`, `imported`) VALUES
	(1, 'caminadora', '500', b'1'),
	(2, 'raqueta', '51', b'0'),
	(3, 'cancha sintenica', '1000', b'1'),
	(4, 'pesas', '200', b'0');

-- Volcando estructura para tabla tienda_deportiva_el_podio.sales
DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` smallint(10) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `value` float(12,2) NOT NULL,
  `customers_id` smallint(10) NOT NULL DEFAULT 0,
  `payments_method_id` smallint(10) NOT NULL DEFAULT 0,
  `product_id` smallint(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Esta tabla relaciona las ventas y su infomación.';

-- Volcando datos para la tabla tienda_deportiva_el_podio.sales: ~4 rows (aproximadamente)
DELETE FROM `sales`;
INSERT INTO `sales` (`id`, `date`, `value`, `customers_id`, `payments_method_id`, `product_id`) VALUES
	(1, '2022-02-13', 100000.00, 1, 1, 3),
	(2, '2022-04-14', 550000.00, 2, 2, 2),
	(3, '2022-02-16', 5000000.00, 3, 3, 1),
	(4, '2022-02-17', 50000.00, 4, 1, 4);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
