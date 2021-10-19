-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: notebank
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiqueta` (
  `Etiqueta` varchar(50) NOT NULL,
  `Id_Nota` int(11) NOT NULL,
  PRIMARY KEY (`Etiqueta`,`Id_Nota`),
  KEY `FK_IDNOTA_ETIQUETA_idx` (`Id_Nota`),
  CONSTRAINT `FK_IDNOTA_ETIQUETA` FOREIGN KEY (`Id_Nota`) REFERENCES `nota` (`Id_Nota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota` (
  `Id_Nota` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Descripcion` varchar(2000) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `Eliminada` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id_Nota`),
  KEY `FK_USUARIO_NOTA_idx` (`Nombre_Usuario`),
  CONSTRAINT `FK_USUARIO_NOTA` FOREIGN KEY (`Nombre_Usuario`) REFERENCES `usuario` (`Nombre_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` VALUES (8,'lidy2','nota de diana modificada                ','2021-10-14 01:18:21',1),(9,'chuck','nota de chuck                ','2021-10-14 01:19:13',0);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Nombre_Usuario` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Correo` varchar(50) NOT NULL,
  `Imagen_Perfil` varchar(256) NOT NULL,
  `Contra` varchar(30) NOT NULL,
  `Fecha_Creacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Nombre_Usuario`),
  UNIQUE KEY `Correo_UNIQUE` (`Correo`),
  UNIQUE KEY `Nombre_Usuario_UNIQUE` (`Nombre_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('chuck','Jose Carlos','Torres Coronado','2000-07-26','jctorresc@gmail.com','assets/imagenes/Fotografia1634191299189.png','12345678','2021-10-14 01:01:39'),('lidy2','diana laura','Torres Coronado','1997-01-26','lidy@gmail.com','assets/imagenes/Fotografia1634192282078.png','87654321','2021-10-14 01:18:02');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'notebank'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_etiqueta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_etiqueta`(
IN pOpc varchar(50),
IN pEtiqueta varchar(50),
IN pIdNota INT

)
BEGIN


IF pOpc = 'Insert'
THEN 
INSERT INTO etiqueta
(Etiqueta, Id_Nota)
VALUES
(pEtiqueta, pIdNota);


END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_nota`(
IN pOpc varchar(50),
IN pIdNota INT,
IN pNombreUsuario varchar(50),
IN pDescripcion varchar(2000)

)
BEGIN

IF pOpc = 'Insert'
THEN 
INSERT INTO nota
(Nombre_Usuario, Descripcion)
VALUES
(pNombreUsuario, pDescripcion);


END IF;

IF pOpc = 'EliminarNota'
THEN 
UPDATE nota
SET Eliminada = 1
WHERE Id_Nota = pIdNota;


END IF;

IF pOpc = 'UpdateNota'
THEN 
UPDATE nota
SET Descripcion = pDescripcion
WHERE Id_Nota = pIdNota;


END IF;


IF pOpc = 'SelectNotasByUsuario'

THEN 
SELECT Id_Nota, Descripcion, Nombre_Usuario FROM nota
WHERE Nombre_Usuario  = pNombreUsuario AND Eliminada = 0 ORDER BY Fecha_Creacion DESC;

END IF;


IF pOpc = 'SelectNotaById'

THEN 
SELECT Id_Nota, Descripcion,Nombre_Usuario FROM nota
WHERE Id_Nota  = pIdNota AND Eliminada = 0;

END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_usuario`(
IN pOpc varchar(50),
IN pNombreUsuario varchar(50),
IN pNombre varchar (50),
IN pApellido varchar (50),
IN pFechaNacimiento date,
IN pCorreo varchar(50),
IN pImagenPerfil varchar(256),
IN pContra varchar(30)
)
BEGIN

IF pOpc = 'Insert'
THEN 
INSERT INTO usuario
(Nombre_Usuario, Nombre, Apellido, Fecha_Nacimiento, Correo, Imagen_Perfil, Contra)
VALUES
(pNombreUsuario, pNombre, pApellido, pFechaNacimiento, pCorreo, pImagenPerfil, pContra);

END IF;

IF pOpc = 'LoginUsuario'
THEN
SELECT Nombre_Usuario, Nombre, Apellido, Fecha_Nacimiento, Correo, Imagen_Perfil
 FROM usuario
WHERE Nombre_Usuario = pNombreUsuario AND Contra = pContra;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-18 21:39:00
