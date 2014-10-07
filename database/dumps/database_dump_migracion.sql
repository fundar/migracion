-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aditional_information`
--

DROP TABLE IF EXISTS `aditional_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aditional_information` (
  `id_aditional` int(11) NOT NULL AUTO_INCREMENT,
  `id_request` int(11) NOT NULL,
  `date_request` date DEFAULT NULL,
  `request` text,
  `response` text,
  `date_response` date DEFAULT NULL,
  `date_limit` date DEFAULT NULL,
  PRIMARY KEY (`id_aditional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aditional_information`
--

LOCK TABLES `aditional_information` WRITE;
/*!40000 ALTER TABLE `aditional_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `aditional_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allegations`
--

DROP TABLE IF EXISTS `allegations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allegations` (
  `id_allegation` int(11) NOT NULL AUTO_INCREMENT,
  `id_request` int(11) NOT NULL,
  `allegation` text,
  `description` varchar(255) DEFAULT NULL COMMENT 'A que ponencia fue enviada',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_allegation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allegations`
--

LOCK TABLES `allegations` WRITE;
/*!40000 ALTER TABLE `allegations` DISABLE KEYS */;
/*!40000 ALTER TABLE `allegations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers_types`
--

DROP TABLE IF EXISTS `answers_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers_types` (
  `id_type_answer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_type_answer`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers_types`
--

LOCK TABLES `answers_types` WRITE;
/*!40000 ALTER TABLE `answers_types` DISABLE KEYS */;
INSERT INTO `answers_types` VALUES (1,'Entrega de información'),(2,'Inexistencia'),(3,'Incompetencia'),(4,'Reservada'),(5,'Confidencial'),(6,'Sin Respuesta');
/*!40000 ALTER TABLE `answers_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `id_organization` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cumplimiento`
--

DROP TABLE IF EXISTS `cumplimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cumplimiento` (
  `id_cumplimiento` int(11) NOT NULL AUTO_INCREMENT,
  `id_request` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'Modalidad de entrega de la información',
  PRIMARY KEY (`id_cumplimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cumplimiento`
--

LOCK TABLES `cumplimiento` WRITE;
/*!40000 ALTER TABLE `cumplimiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `cumplimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencies`
--

DROP TABLE IF EXISTS `dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependencies` (
  `id_dependecy` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'federal',
  PRIMARY KEY (`id_dependecy`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencies`
--

LOCK TABLES `dependencies` WRITE;
/*!40000 ALTER TABLE `dependencies` DISABLE KEYS */;
INSERT INTO `dependencies` VALUES (1,'ADMINISTRACIÓN FEDERAL DE SERVICIOS EDUCATIVOS EN EL DISTRITO FEDERAL (AFSEDF)',NULL,'',NULL,NULL,'federal'),(2,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE ALTAMIRA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(3,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE COATZACOALCOS, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(4,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE DOS BOCAS, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(5,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE ENSENADA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(6,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE GUAYMAS, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(7,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE LÁZARO CÁRDENAS, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(8,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE MANZANILLO, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(9,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE MAZATLÁN, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(10,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE PROGRESO, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(11,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE PUERTO MADERO S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(12,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE PUERTO VALLARTA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(13,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE SALINA CRUZ, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(14,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE TAMPICO, S.A. DE. C.V',NULL,'',NULL,NULL,'federal'),(15,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE TOPOLOBAMPO, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(16,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE TUXPAN, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(17,'ADMINISTRACIÓN PORTUARIA INTEGRAL DE VERACRUZ, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(18,'AEROPUERTO INTERNACIONAL DE LA CIUDAD DE MÉXICO S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(19,'AEROPUERTOS Y SERVICIOS AUXILIARES',NULL,'',NULL,NULL,'federal'),(20,'AGROASEMEX, S.A.',NULL,'',NULL,NULL,'federal'),(21,'APOYOS Y SERVICIOS A LA COMERCIALIZACIÓN AGROPECUARIA',NULL,'',NULL,NULL,'federal'),(22,'ARCHIVO GENERAL DE LA NACIÓN',NULL,'',NULL,NULL,'federal'),(23,'BANCO DE CRÉDITO RURAL DE OCCIDENTE, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(24,'BANCO DE CRÉDITO RURAL DEL CENTRO, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(25,'BANCO DE CRÉDITO RURAL DEL CENTRO-NORTE, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(26,'BANCO DE CRÉDITO RURAL DEL CENTRO-SUR, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(27,'BANCO DE CRÉDITO RURAL DEL GOLFO, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(28,'BANCO DE CRÉDITO RURAL DEL ISTMO, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(29,'BANCO DE CRÉDITO RURAL DEL NORESTE, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(30,'BANCO DE CRÉDITO RURAL DEL NOROESTE, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(31,'BANCO DE CRÉDITO RURAL DEL NORTE, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(32,'BANCO DE CRÉDITO RURAL DEL PACÍFICO-NORTE, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(33,'BANCO DE CRÉDITO RURAL DEL PACÍFICO-SUR, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(34,'BANCO DE CRÉDITO RURAL PENINSULAR, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(35,'BANCO DEL AHORRO NACIONAL Y SERVICIOS FINANCIEROS, S.N.C.',NULL,'',NULL,NULL,'federal'),(36,'BANCO NACIONAL DE COMERCIO EXTERIOR, S.N.C.',NULL,'',NULL,NULL,'federal'),(37,'BANCO NACIONAL DE CRÉDITO RURAL, S.N.C. EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(38,'BANCO NACIONAL DE OBRAS Y SERVICIOS PÚBLICOS, S.N.C.',NULL,'',NULL,NULL,'federal'),(39,'BANCO NACIONAL DEL EJÉRCITO, FUERZA AÉREA Y ARMADA, S.N.C.',NULL,'',NULL,NULL,'federal'),(40,'CAMINOS Y PUENTES FEDERALES DE INGRESOS Y SERVICIOS CONEXOS',NULL,'',NULL,NULL,'federal'),(41,'CASA DE MONEDA DE MÉXICO',NULL,'',NULL,NULL,'federal'),(42,'CENTRO DE CAPACITACIÓN CINEMATOGRÁFICA, A.C.',NULL,'',NULL,NULL,'federal'),(43,'CENTRO DE ENSEÑANZA TÉCNICA INDUSTRIAL',NULL,'',NULL,NULL,'federal'),(44,'CENTRO DE INGENIERÍA Y DESARROLLO INDUSTRIAL',NULL,'',NULL,NULL,'federal'),(45,'CENTRO DE INVESTIGACIÓN CIENTÍFICA DE YUCATÁN, A.C.',NULL,'',NULL,NULL,'federal'),(46,'CENTRO DE INVESTIGACIÓN CIENTÍFICA Y EDUCACIÓN SUPERIOR DE ENSENADA, B.C.',NULL,'',NULL,NULL,'federal'),(47,'CENTRO DE INVESTIGACIÓN EN ALIMENTACIÓN Y DESARROLLO, A.C.',NULL,'',NULL,NULL,'federal'),(48,'CENTRO DE INVESTIGACIÓN EN GEOGRAFÍA Y GEOMÁTICA ING. JORGE L.TAMAYO, A.C.',NULL,'',NULL,NULL,'federal'),(49,'CENTRO DE INVESTIGACIÓN EN MATEMÁTICAS, A.C.',NULL,'',NULL,NULL,'federal'),(50,'CENTRO DE INVESTIGACIÓN EN MATERIALES AVANZADOS, S.C.',NULL,'',NULL,NULL,'federal'),(51,'CENTRO DE INVESTIGACIÓN EN QUÍMICA APLICADA',NULL,'',NULL,NULL,'federal'),(52,'CENTRO DE INVESTIGACIÓN Y ASISTENCIA EN TECNOLOGÍA Y DISEÑO DEL ESTADO DE JALISCO ',NULL,'',NULL,NULL,'federal'),(53,'CENTRO DE INVESTIGACIÓN Y DE ESTUDIOS AVANZADOS DEL IPN',NULL,'',NULL,NULL,'federal'),(54,'CENTRO DE INVESTIGACIÓN Y DESARROLLO TECNOLÓGICO EN ELECTROQUÍMICA, S.C.',NULL,'',NULL,NULL,'federal'),(55,'CENTRO DE INVESTIGACIÓN Y DOCENCIA ECONÓMICAS, A.C.',NULL,'',NULL,NULL,'federal'),(56,'CENTRO DE INVESTIGACIÓN Y SEGURIDAD NACIONAL',NULL,'',NULL,NULL,'federal'),(57,'CENTRO DE INVESTIGACIONES BIOLÓGICAS DEL NOROESTE S.C.',NULL,'',NULL,NULL,'federal'),(58,'CENTRO DE INVESTIGACIONES EN ÓPTICA, A.C.',NULL,'',NULL,NULL,'federal'),(59,'CENTRO DE INVESTIGACIONES Y ESTUDIOS SUPERIORES EN ANTROPOLOGÍA SOCIAL',NULL,'',NULL,NULL,'federal'),(60,'CENTRO NACIONAL DE METROLOGÍA',NULL,'',NULL,NULL,'federal'),(61,'CENTRO NACIONAL DE PREVENCIÓN DE DESASTRES',NULL,'',NULL,NULL,'federal'),(62,'CENTRO REGIONAL DE ALTA ESPECIALIDAD DE CHIAPAS',NULL,'',NULL,NULL,'federal'),(63,'CENTROS DE INTEGRACIÓN JUVENIL, A.C.',NULL,'',NULL,NULL,'federal'),(64,'CIATEC, A.C.',NULL,'',NULL,NULL,'federal'),(65,'CIATEQ A.C.',NULL,'',NULL,NULL,'federal'),(66,'COLEGIO DE BACHILLERES',NULL,'',NULL,NULL,'federal'),(67,'COLEGIO DE POSGRADUADOS',NULL,'',NULL,NULL,'federal'),(68,'COLEGIO NACIONAL DE EDUCACIÓN PROFESIONAL TÉCNICA',NULL,'',NULL,NULL,'federal'),(69,'COLEGIO SUPERIOR AGROPECUARIO DEL ESTADO DE GUERRERO (CSAEGRO)',NULL,'',NULL,NULL,'federal'),(70,'COMISIÓN DE OPERACIÓN Y FOMENTO DE ACTIVIDADES ACADÉMICAS DEL IPN',NULL,'',NULL,NULL,'federal'),(71,'COMISIÓN FEDERAL DE COMPETENCIA',NULL,'',NULL,NULL,'federal'),(72,'COMISIÓN FEDERAL DE ELECTRICIDAD',NULL,'',NULL,NULL,'federal'),(73,'COMISIÓN FEDERAL DE MEJORA REGULATORIA',NULL,'',NULL,NULL,'federal'),(74,'COMISIÓN FEDERAL DE TELECOMUNICACIONES',NULL,'',NULL,NULL,'federal'),(75,'COMISIÓN FEDERAL PARA LA PROTECCIÓN CONTRA RIESGOS SANITARIOS',NULL,'',NULL,NULL,'federal'),(76,'COMISIÓN NACIONAL BANCARIA Y DE VALORES',NULL,'',NULL,NULL,'federal'),(77,'COMISIÓN NACIONAL DE ACUACULTURA Y PESCA',NULL,'',NULL,NULL,'federal'),(78,'COMISIÓN NACIONAL DE ARBITRAJE MÉDICO',NULL,'',NULL,NULL,'federal'),(79,'COMISIÓN NACIONAL DE ÁREAS NATURALES PROTEGIDAS',NULL,'',NULL,NULL,'federal'),(80,'COMISIÓN NACIONAL DE CULTURA FÍSICA Y DEPORTE',NULL,'',NULL,NULL,'federal'),(81,'COMISIÓN NACIONAL DE HIDROCARBUROS',NULL,'',NULL,NULL,'federal'),(82,'COMISIÓN NACIONAL DE LIBROS DE TEXTO GRATUITOS',NULL,'',NULL,NULL,'federal'),(83,'COMISIÓN NACIONAL DE LOS SALARIOS MÍNIMOS',NULL,'',NULL,NULL,'federal'),(84,'COMISIÓN NACIONAL DE SEGURIDAD NUCLEAR Y SALVAGUARDIAS',NULL,'',NULL,NULL,'federal'),(85,'COMISIÓN NACIONAL DE SEGUROS Y FIANZAS',NULL,'',NULL,NULL,'federal'),(86,'COMISIÓN NACIONAL DE VIVIENDA',NULL,'',NULL,NULL,'federal'),(87,'COMISIÓN NACIONAL DE ZONAS ÁRIDAS',NULL,'',NULL,NULL,'federal'),(88,'COMISIÓN NACIONAL DEL AGUA',NULL,'',NULL,NULL,'federal'),(89,'COMISIÓN NACIONAL DEL SISTEMA DE AHORRO PARA EL RETIRO',NULL,'',NULL,NULL,'federal'),(90,'COMISIÓN NACIONAL FORESTAL',NULL,'',NULL,NULL,'federal'),(91,'COMISIÓN NACIONAL PARA EL DESARROLLO DE LOS PUEBLOS INDÍGENAS',NULL,'',NULL,NULL,'federal'),(92,'COMISIÓN NACIONAL PARA EL USO EFICIENTE DE LA ENERGÍA',NULL,'',NULL,NULL,'federal'),(93,'COMISIÓN NACIONAL PARA LA PROTECCIÓN Y DEFENSA DE LOS USUARIOS DE SERVICIOS FINANCIEROS',NULL,'',NULL,NULL,'federal'),(94,'COMISIÓN PARA LA REGULARIZACIÓN DE LA TENENCIA DE LA TIERRA',NULL,'',NULL,NULL,'federal'),(95,'COMISIÓN REGULADORA DE ENERGÍA',NULL,'',NULL,NULL,'federal'),(96,'COMITÉ NACIONAL MIXTO DE PROTECCIÓN AL SALARIO',NULL,'',NULL,NULL,'federal'),(97,'COMPAÑÍA MEXICANA DE EXPLORACIONES, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(98,'COMPAÑÍA OPERADORA DEL CENTRO CULTURAL Y TURÍSTICO DE TIJUANA S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(99,'CONSEJERÍA JURÍDICA DEL EJECUTIVO FEDERAL',NULL,'',NULL,NULL,'federal'),(100,'CONSEJO DE PROMOCIÓN TURÍSTICA DE MÉXICO S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(101,'CONSEJO NACIONAL DE CIENCIA Y TECNOLOGÍA',NULL,'',NULL,NULL,'federal'),(102,'CONSEJO NACIONAL DE EVALUACIÓN DE LA POLÍTICA DE DESARROLLO SOCIAL',NULL,'',NULL,NULL,'federal'),(103,'CONSEJO NACIONAL DE FOMENTO EDUCATIVO',NULL,'',NULL,NULL,'federal'),(104,'CONSEJO NACIONAL DE NORMALIZACIÓN Y CERTIFICACIÓN DE COMPETENCIAS LABORALES (CONOCER)',NULL,'',NULL,NULL,'federal'),(105,'CONSEJO NACIONAL DE POBLACIÓN',NULL,'',NULL,NULL,'federal'),(106,'CONSEJO NACIONAL PARA LA CULTURA Y LAS ARTES',NULL,'',NULL,NULL,'federal'),(107,'CONSEJO NACIONAL PARA PREVENIR LA DISCRIMINACIÓN',NULL,'',NULL,NULL,'federal'),(108,'COORDINACIÓN GENERAL DE LA COMISIÓN MEXICANA DE AYUDA A REFUGIADOS',NULL,'',NULL,NULL,'federal'),(109,'COORDINACIÓN GENERAL DEL PROGRAMA NACIONAL DE APOYO PARA LAS EMPRESAS DE SOLIDARIDAD (FONAES)',NULL,'',NULL,NULL,'federal'),(110,'COORDINACIÓN NACIONAL DEL PROGRAMA DE DESARROLLO HUMANO OPORTUNIDADES',NULL,'',NULL,NULL,'federal'),(111,'CORPORACIÓN MEXICANA DE INVESTIGACIÓN EN MATERIALES, S. A. DE C.V.',NULL,'',NULL,NULL,'federal'),(112,'DICONSA S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(113,'EDUCAL, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(114,'EL COLEGIO DE LA FRONTERA NORTE, A.C.',NULL,'',NULL,NULL,'federal'),(115,'EL COLEGIO DE LA FRONTERA SUR',NULL,'',NULL,NULL,'federal'),(116,'EL COLEGIO DE MÉXICO, A.C.',NULL,'',NULL,NULL,'federal'),(117,'EL COLEGIO DE MICHOACÁN, A.C.',NULL,'',NULL,NULL,'federal'),(118,'EL COLEGIO DE SAN LUIS, A.C.',NULL,'',NULL,NULL,'federal'),(119,'ESTUDIOS CHURUBUSCO AZTECA, S.A.',NULL,'',NULL,NULL,'federal'),(120,'EXPORTADORA DE SAL, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(121,'FERROCARRIL DEL ISTMO DE TEHUANTEPEC S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(122,'FERROCARRILES NACIONALES DE MÉXICO EN LIQUIDACIÓN',NULL,'',NULL,NULL,'federal'),(123,'FIDEICOMISO DE CONSTRUCCIONES MILITARES',NULL,'',NULL,NULL,'federal'),(124,'FIDEICOMISO DE FOMENTO MINERO',NULL,'',NULL,NULL,'federal'),(125,'FIDEICOMISO DE FORMACIÓN Y CAPACITACIÓN PARA EL PERSONAL DE LA MARINA MERCANTE NACIONAL',NULL,'',NULL,NULL,'federal'),(126,'FIDEICOMISO DE RIESGO COMPARTIDO',NULL,'',NULL,NULL,'federal'),(127,'FIDEICOMISO FONDO NACIONAL DE FOMENTO EJIDAL',NULL,'',NULL,NULL,'federal'),(128,'FIDEICOMISO FONDO NACIONAL DE HABITACIONES POPULARES',NULL,'',NULL,NULL,'federal'),(129,'FIDEICOMISO LIQUIDADOR DE INSTITUCIONES Y ORGANIZACIONES AUXILIARES DE CRÉDITO',NULL,'',NULL,NULL,'federal'),(130,'FIDEICOMISO PARA LA CINETECA NACIONAL',NULL,'',NULL,NULL,'federal'),(131,'FINANCIERA RURAL',NULL,'',NULL,NULL,'federal'),(132,'FONATUR, CONSTRUCTORA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(133,'FONATUR MANTENIMIENTO TURÍSTICO S.A. de C.V',NULL,'',NULL,NULL,'federal'),(134,'FONATUR OPERADORA PORTUARIA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(135,'FONDO DE CAPITALIZACIÓN E INVERSIÓN DEL SECTOR RURAL',NULL,'',NULL,NULL,'federal'),(136,'FONDO DE CULTURA ECONÓMICA',NULL,'',NULL,NULL,'federal'),(137,'FONDO DE GARANTÍA Y FOMENTO PARA LA AGRICULTURA, GANADERÍA Y AVICULTURA',NULL,'',NULL,NULL,'federal'),(138,'FONDO DE INFORMACIÓN Y DOCUMENTACIÓN PARA LA INDUSTRIA',NULL,'',NULL,NULL,'federal'),(139,'FONDO DE OPERACIÓN Y FINANCIAMIENTO BANCARIO A LA VIVIENDA',NULL,'',NULL,NULL,'federal'),(140,'FONDO NACIONAL DE FOMENTO AL TURISMO',NULL,'',NULL,NULL,'federal'),(141,'FONDO NACIONAL PARA EL FOMENTO DE LAS ARTESANÍAS',NULL,'',NULL,NULL,'federal'),(142,'FONDO PARA EL DESARROLLO DE RECURSOS HUMANOS',NULL,'',NULL,NULL,'federal'),(143,'GRUPO AEROPORTUARIO DE LA CIUDAD DE MÉXICO, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(144,'HOSPITAL GENERAL DE MÉXICO',NULL,'',NULL,NULL,'federal'),(145,'HOSPITAL GENERAL DR. MANUEL GEA GONZÁLEZ',NULL,'',NULL,NULL,'federal'),(146,'HOSPITAL INFANTIL DE MÉXICO FEDERICO GÓMEZ',NULL,'',NULL,NULL,'federal'),(147,'HOSPITAL JUÁREZ DE MÉXICO',NULL,'',NULL,NULL,'federal'),(148,'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD DEL BAJÍO',NULL,'',NULL,NULL,'federal'),(149,'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD CIUDAD VICTORIA &quot;BICENTENARIO 2010&quot;',NULL,'',NULL,NULL,'federal'),(150,'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD DE OAXACA',NULL,'',NULL,NULL,'federal'),(151,'HOSPITAL REGIONAL DE ALTA ESPECIALIDAD DE YUCATÁN',NULL,'',NULL,NULL,'federal'),(152,'III SERVICIOS, S. A. DE C. V.',NULL,'',NULL,NULL,'federal'),(153,'IMPRESORA Y ENCUADERNADORA PROGRESO, S. A. DE C.V.',NULL,'',NULL,NULL,'federal'),(154,'INSTITUTO NACIONAL DE BELLAS ARTES Y LITERATURA',NULL,'',NULL,NULL,'federal'),(155,'INSTITUTO DE ECOLOGÍA, A. C.',NULL,'',NULL,NULL,'federal'),(156,'INSTITUTO DE INVESTIGACIONES DR. JOSÉ MARÍA LUIS MORA',NULL,'',NULL,NULL,'federal'),(157,'INSTITUTO DE INVESTIGACIONES ELÉCTRICAS',NULL,'',NULL,NULL,'federal'),(158,'INSTITUTO DE SEGURIDAD SOCIAL PARA LAS FUERZAS ARMADAS MEXICANAS',NULL,'',NULL,NULL,'federal'),(159,'INSTITUTO DE SEGURIDAD Y SERVICIOS SOCIALES DE LOS TRABAJADORES DEL ESTADO',NULL,'',NULL,NULL,'federal'),(160,'INSTITUTO DEL FONDO NACIONAL DE LA VIVIENDA PARA LOS TRABAJADORES',NULL,'',NULL,NULL,'federal'),(161,'INSTITUTO DEL FONDO NACIONAL PARA EL CONSUMO DE LOS TRABAJADORES',NULL,'',NULL,NULL,'federal'),(162,'INSTITUTO FEDERAL DE ACCESO A LA INFORMACIÓN Y PROTECCIÓN DE DATOS',NULL,'',NULL,NULL,'federal'),(163,'INSTITUTO MEXICANO DE CINEMATOGRAFÍA',NULL,'',NULL,NULL,'federal'),(164,'INSTITUTO MEXICANO DE LA JUVENTUD',NULL,'',NULL,NULL,'federal'),(165,'INSTITUTO MEXICANO DE LA PROPIEDAD INDUSTRIAL',NULL,'',NULL,NULL,'federal'),(166,'INSTITUTO MEXICANO DE LA RADIO',NULL,'',NULL,NULL,'federal'),(167,'INSTITUTO MEXICANO DE LA RADIO',NULL,'',NULL,NULL,'federal'),(168,'INSTITUTO MEXICANO DE TECNOLOGÍA DEL AGUA',NULL,'',NULL,NULL,'federal'),(169,'INSTITUTO MEXICANO DEL PETRÓLEO',NULL,'',NULL,NULL,'federal'),(170,'INSTITUTO MEXICANO DEL SEGURO SOCIAL',NULL,'',NULL,NULL,'federal'),(171,'INSTITUTO NACIONAL DE ANTROPOLOGÍA E HISTORIA',NULL,'',NULL,NULL,'federal'),(172,'INSTITUTO NACIONAL DE ASTROFÍSICA, ÓPTICA Y ELECTRÓNICA',NULL,'',NULL,NULL,'federal'),(173,'INSTITUTO NACIONAL DE CANCEROLOGÍA',NULL,'',NULL,NULL,'federal'),(174,'INSTITUTO NACIONAL DE CARDIOLOGÍA IGNACIO CHÁVEZ',NULL,'',NULL,NULL,'federal'),(175,'INSTITUTO NACIONAL DE CIENCIAS MÉDICAS Y NUTRICIÓN SALVADOR ZUBIRÁN',NULL,'',NULL,NULL,'federal'),(176,'INSTITUTO NACIONAL DE CIENCIAS PENALES',NULL,'',NULL,NULL,'federal'),(177,'INSTITUTO NACIONAL DE DESARROLLO SOCIAL',NULL,'',NULL,NULL,'federal'),(178,'INSTITUTO NACIONAL DE ECOLOGÍA',NULL,'',NULL,NULL,'federal'),(179,'INSTITUTO NACIONAL DE ENFERMEDADES RESPIRATORIAS',NULL,'',NULL,NULL,'federal'),(180,'INSTITUTO NACIONAL DE ESTADÍSTICA, GEOGRAFÍA E INFORMÁTICA',NULL,'',NULL,NULL,'federal'),(181,'INSTITUTO NACIONAL DE ESTUDIOS HISTÓRICOS DE LAS REVOLUCIONES DE MÉXICO',NULL,'',NULL,NULL,'federal'),(182,'INSTITUTO NACIONAL DE INVESTIGACIONES FORESTALES, AGRÍCOLAS Y PECUARIAS',NULL,'',NULL,NULL,'federal'),(183,'INSTITUTO NACIONAL DE INVESTIGACIONES NUCLEARES',NULL,'',NULL,NULL,'federal'),(184,'INSTITUTO NACIONAL DE LA INFRAESTRUCTURA FÍSICA EDUCATIVA',NULL,'',NULL,NULL,'federal'),(185,'INSTITUTO NACIONAL DE LAS MUJERES',NULL,'',NULL,NULL,'federal'),(186,'INSTITUTO NACIONAL DE LAS PERSONAS ADULTAS MAYORES',NULL,'',NULL,NULL,'federal'),(187,'INSTITUTO NACIONAL DE LENGUAS INDÍGENAS',NULL,'',NULL,NULL,'federal'),(188,'INSTITUTO NACIONAL DE MEDICINA GENÓMICA',NULL,'',NULL,NULL,'federal'),(189,'INSTITUTO NACIONAL DE MIGRACIÓN',NULL,'',NULL,NULL,'federal'),(190,'INSTITUTO NACIONAL DE NEUROLOGÍA Y NEUROCIRUGÍA MANUEL VELASCO SUÁREZ',NULL,'',NULL,NULL,'federal'),(191,'INSTITUTO NACIONAL DE PEDIATRÍA',NULL,'',NULL,NULL,'federal'),(192,'INSTITUTO NACIONAL DE PERINATOLOGÍA',NULL,'',NULL,NULL,'federal'),(193,'INSTITUTO NACIONAL DE PESCA',NULL,'',NULL,NULL,'federal'),(194,'INSTITUTO NACIONAL DE PSIQUIATRÍA RAMÓN DE LA FUENTE MUÑÍZ',NULL,'',NULL,NULL,'federal'),(195,'INSTITUTO NACIONAL DE REHABILITACIÓN',NULL,'',NULL,NULL,'federal'),(196,'INSTITUTO NACIONAL DE SALUD PÚBLICA',NULL,'',NULL,NULL,'federal'),(197,'INSTITUTO NACIONAL INDIGENISTA',NULL,'',NULL,NULL,'federal'),(198,'INSTITUTO NACIONAL PARA EL DESARROLLO DE CAPACIDADES DEL SECTOR RURAL A.C.',NULL,'',NULL,NULL,'federal'),(199,'INSTITUTO NACIONAL PARA LA EDUCACIÓN DE LOS ADULTOS',NULL,'',NULL,NULL,'federal'),(200,'INSTITUTO NACIONAL PARA LA EVALUACIÓN DE LA EDUCACIÓN',NULL,'',NULL,NULL,'federal'),(201,'INSTITUTO PARA EL DESARROLLO TÉCNICO DE LAS HACIENDAS PÚBLICAS',NULL,'',NULL,NULL,'federal'),(202,'INSTITUTO PARA LA PROTECCIÓN AL AHORRO BANCARIO',NULL,'',NULL,NULL,'federal'),(203,'INSTITUTO POLITÉCNICO NACIONAL',NULL,'',NULL,NULL,'federal'),(204,'INSTITUTO POTOSINO DE INVESTIGACIÓN CIENTÍFICA Y TECNOLÓGICA, A.C.',NULL,'',NULL,NULL,'federal'),(205,'JUNTA FEDERAL DE CONCILIACIÓN Y ARBITRAJE',NULL,'',NULL,NULL,'federal'),(206,'LABORATORIOS DE BIOLÓGICOS Y REACTIVOS DE MÉXICO, S. A. DE C.V.',NULL,'',NULL,NULL,'federal'),(207,'LICONSA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(208,'LOTERÍA NACIONAL PARA LA ASISTENCIA PÚBLICA',NULL,'',NULL,NULL,'federal'),(209,'LUZ Y FUERZA DEL CENTRO (EN PROCESO DE LIQUIDACIÓN)',NULL,'',NULL,NULL,'federal'),(210,'MONITOREO DE SERVICIOS NO UTILIZAR',NULL,'',NULL,NULL,'federal'),(211,'MONITOREO DE SERVICIOS 3 NO UTILIZAR',NULL,'',NULL,NULL,'federal'),(212,'MONITOREO 2 DE SERVICIOS NO UTILIZAR',NULL,'',NULL,NULL,'federal'),(213,'NACIONAL FINANCIERA, S.N.C.',NULL,'',NULL,NULL,'federal'),(214,'NOTIMEX, AGENCIA DE NOTICIAS DEL ESTADO MEXICANO',NULL,'',NULL,NULL,'federal'),(215,'NOTIMEX, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(216,'OADPRS ÓRGANO ADMINISTRATIVO DESCONCENTRADO PREVENCIÓN Y READAPTACIÓN SOCIAL',NULL,'',NULL,NULL,'federal'),(217,'OCEAN GARDEN PRODUCTS, INC.',NULL,'',NULL,NULL,'federal'),(218,'ORGANISMO PROMOTOR DE MEDIOS AUDIOVISUALES',NULL,'',NULL,NULL,'federal'),(219,'ÓRGANO ADMINISTRATIVO DESCONCENTRADO DE PREVENCIÓN Y READAPTACIÓN SOCIAL',NULL,'',NULL,NULL,'federal'),(220,'PATRONATO DE OBRAS E INSTALACIONES DEL INSTITUTO POLITÉCNICO NACIONAL ',NULL,'',NULL,NULL,'federal'),(221,'PEMEX EXPLORACIÓN Y PRODUCCIÓN',NULL,'',NULL,NULL,'federal'),(222,'PEMEX GAS Y PETROQUÍMICA BÁSICA',NULL,'',NULL,NULL,'federal'),(223,'PEMEX PETROQUÍMICA',NULL,'',NULL,NULL,'federal'),(224,'PEMEX REFINACIÓN',NULL,'',NULL,NULL,'federal'),(225,'PETRÓLEOS MEXICANOS',NULL,'',NULL,NULL,'federal'),(226,'PETROQUÍMICA CAMARGO, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(227,'PETROQUÍMICA CANGREJERA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(228,'PETROQUÍMICA COSOLEACAQUE, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(229,'PETROQUÍMICA ESCOLÍN, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(230,'PETROQUÍMICA MORELOS, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(231,'PETROQUÍMICA PAJARITOS, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(232,'PETROQUÍMICA TULA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(233,'PMI COMERCIO INTERNACIONAL, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(234,'POLICÍA FEDERAL, ANTES POLICÍA FEDERAL PREVENTIVA',NULL,'',NULL,NULL,'federal'),(235,'PRESIDENCIA DE LA REPÚBLICA',NULL,'',NULL,NULL,'federal'),(236,'PROCURADURÍA AGRARIA',NULL,'',NULL,NULL,'federal'),(237,'PROCURADURÍA DE LA DEFENSA DEL CONTRIBUYENTE (PRODECON)',NULL,'',NULL,NULL,'federal'),(238,'PROCURADURÍA FEDERAL DE LA DEFENSA DEL TRABAJO',NULL,'',NULL,NULL,'federal'),(239,'PROCURADURÍA FEDERAL DE PROTECCIÓN AL AMBIENTE',NULL,'',NULL,NULL,'federal'),(240,'PROCURADURÍA FEDERAL DEL CONSUMIDOR',NULL,'',NULL,NULL,'federal'),(241,'PROCURADURÍA GENERAL DE LA REPÚBLICA',NULL,'',NULL,NULL,'federal'),(242,'PROCURADURIA SOCIAL DE ATENCIÓN A LAS VÍCTIMAS DE DELITOS',NULL,'',NULL,NULL,'federal'),(243,'PRODUCTORA DE COSPELES, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(244,'PRODUCTORA NACIONAL DE BIOLÓGICOS VETERINARIOS',NULL,'',NULL,NULL,'federal'),(245,'PRODUCTORA NACIONAL DE SEMILLAS',NULL,'',NULL,NULL,'federal'),(246,'PROMÉXICO',NULL,'',NULL,NULL,'federal'),(247,'PRONÓSTICOS PARA LA ASISTENCIA PÚBLICA',NULL,'',NULL,NULL,'federal'),(248,'REGISTRO AGRARIO NACIONAL',NULL,'',NULL,NULL,'federal'),(249,'SECRETARÍA DE AGRICULTURA, GANADERÍA, DESARROLLO RURAL, PESCA Y ALIMENTACIÓN',NULL,'',NULL,NULL,'federal'),(250,'SECRETARÍA DE COMUNICACIONES Y TRANSPORTES',NULL,'',NULL,NULL,'federal'),(251,'SECRETARÍA DE DESARROLLO SOCIAL',NULL,'',NULL,NULL,'federal'),(252,'SECRETARÍA DE ECONOMÍA',NULL,'',NULL,NULL,'federal'),(253,'SECRETARÍA DE EDUCACIÓN PÚBLICA',NULL,'',NULL,NULL,'federal'),(254,'SECRETARÍA DE ENERGÍA',NULL,'',NULL,NULL,'federal'),(255,'SECRETARÍA DE GOBERNACIÓN',NULL,'',NULL,NULL,'federal'),(256,'SECRETARÍA DE HACIENDA Y CRÉDITO PÚBLICO',NULL,'',NULL,NULL,'federal'),(257,'SECRETARÍA DE LA DEFENSA NACIONAL',NULL,'',NULL,NULL,'federal'),(258,'SECRETARÍA DE LA FUNCIÓN PÚBLICA',NULL,'',NULL,NULL,'federal'),(259,'SECRETARÍA DE LA REFORMA AGRARIA',NULL,'',NULL,NULL,'federal'),(260,'SECRETARÍA DE MARINA',NULL,'',NULL,NULL,'federal'),(261,'SECRETARÍA DE MEDIO AMBIENTE Y RECURSOS NATURALES',NULL,'',NULL,NULL,'federal'),(262,'SECRETARÍA DE RELACIONES EXTERIORES',NULL,'',NULL,NULL,'federal'),(263,'SECRETARÍA DE SALUD',NULL,'',NULL,NULL,'federal'),(264,'SECRETARÍA DE SEGURIDAD PÚBLICA',NULL,'',NULL,NULL,'federal'),(265,'SECRETARÍA DE TURISMO',NULL,'',NULL,NULL,'federal'),(266,'SECRETARÍA DEL TRABAJO Y PREVISIÓN SOCIAL',NULL,'',NULL,NULL,'federal'),(267,'SECRETARIADO EJECUTIVO DEL SISTEMA NACIONAL DE SEGURIDAD PÚBLICA',NULL,'',NULL,NULL,'federal'),(268,'SERVICIO DE ADMINISTRACIÓN DE BIENES ASEGURADOS',NULL,'',NULL,NULL,'federal'),(269,'SERVICIO DE ADMINISTRACIÓN TRIBUTARIA',NULL,'',NULL,NULL,'federal'),(270,'SERVICIO DE ADMINISTRACIÓN Y ENAJENACIÓN DE BIENES',NULL,'',NULL,NULL,'federal'),(271,'SERVICIO DE INFORMACIÓN AGROALIMENTARIA Y PESQUERA',NULL,'',NULL,NULL,'federal'),(272,'SERVICIO DE PROTECCIÓN FEDERAL',NULL,'',NULL,NULL,'federal'),(273,'SERVICIO GEOLÓGICO MEXICANO',NULL,'',NULL,NULL,'federal'),(274,'SERVICIO NACIONAL DE INSPECCIÓN Y CERTIFICACIÓN DE SEMILLAS',NULL,'',NULL,NULL,'federal'),(275,'SERVICIO NACIONAL DE SANIDAD, INOCUIDAD Y CALIDAD AGROALIMENTARIA',NULL,'',NULL,NULL,'federal'),(276,'SERVICIO POSTAL MEXICANO',NULL,'',NULL,NULL,'federal'),(277,'SERVICIOS A LA NAVEGACIÓN EN EL ESPACIO AÉREO MEXICANO',NULL,'',NULL,NULL,'federal'),(278,'SERVICIOS AEROPORTUARIOS DE LA CIUDAD DE MÉXICO, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(279,'SISTEMA NACIONAL PARA EL DESARROLLO INTEGRAL DE LA FAMILIA',NULL,'',NULL,NULL,'federal'),(280,'SOCIEDAD HIPOTECARIA FEDERAL, S.N.C.',NULL,'',NULL,NULL,'federal'),(281,'TALLERES GRÁFICOS DE MÉXICO',NULL,'',NULL,NULL,'federal'),(282,'TELECOMUNICACIONES DE MÉXICO',NULL,'',NULL,NULL,'federal'),(283,'TELEVISIÓN METROPOLITANA, S.A. DE C.V.',NULL,'',NULL,NULL,'federal'),(284,'TRIBUNAL UNITARIO AGRARIO DISTRITO 44 EN GÓMEZ PALACIO DURANGO',NULL,'',NULL,NULL,'federal'),(285,'UNIVERSIDAD PEDAGÓGICA NACIONAL',NULL,'',NULL,NULL,'federal'),(286,'CNDH',NULL,'',NULL,NULL,'federal');
/*!40000 ALTER TABLE `dependencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id_document` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `short_name` varchar(45) DEFAULT NULL,
  `date_create` date NOT NULL,
  `page_numbers` varchar(10) DEFAULT NULL,
  `file_url` varchar(255) NOT NULL,
  `file_type` varchar(45) NOT NULL DEFAULT 'pdf',
  PRIMARY KEY (`id_document`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_types`
--

DROP TABLE IF EXISTS `documents_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_types` (
  `id_type_document` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_type_document`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_types`
--

LOCK TABLES `documents_types` WRITE;
/*!40000 ALTER TABLE `documents_types` DISABLE KEYS */;
INSERT INTO `documents_types` VALUES (1,'Circulares'),(2,'Reglamentaciones'),(3,'Protocolos'),(4,'Planes'),(5,'Directrices'),(6,'Presupuesto'),(7,'Manuales'),(8,'Capacitaciones/Profesionalización de funcionarios'),(9,'Leyes'),(10,'Convenios de Colaboración '),(11,'Informes'),(12,'Programas'),(13,'Lineamientos'),(14,'Guías'),(15,'Registros'),(16,'Recursos Públicos y Presupuestales'),(17,'Oficio');
/*!40000 ALTER TABLE `documents_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords`
--

DROP TABLE IF EXISTS `keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords` (
  `id_keyword` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_keyword`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords`
--

LOCK TABLES `keywords` WRITE;
/*!40000 ALTER TABLE `keywords` DISABLE KEYS */;
INSERT INTO `keywords` VALUES (1,'criterios'),(2,'actas de reunión'),(3,'estancia'),(4,'visitante'),(5,'razones humanitarias'),(6,'manual'),(7,'trámites'),(8,'normatividad interna'),(9,'requisitos'),(10,'recursos ejercidos'),(11,'partida'),(12,'gasto'),(13,'productos alimenticios'),(14,'servicios públicos'),(15,'delegación regional'),(16,'presupuesto'),(17,'atención medica'),(18,'2006'),(19,'2007'),(20,'2008'),(21,'2009'),(22,'2010'),(23,'2011'),(24,'2012'),(25,'2004'),(26,'2005'),(27,'identificación'),(28,'funcionarios'),(29,'agentes públicos'),(30,'familiares'),(31,'detención'),(32,'espacios de dialogo'),(33,'autoridades públicas'),(34,'sociedad civil'),(35,'derechos'),(36,'niñez migrante'),(37,'niños'),(38,'niñas'),(39,'adolescentes'),(40,'18 años'),(41,'asilo'),(42,'albergues'),(43,'repatriaciones'),(44,'expulsiones'),(45,'devoluciones'),(46,'reglamentos'),(47,'circulares'),(48,'protocolos'),(49,'ley de migración'),(50,'convenios'),(51,'acuerdos'),(52,'DIF'),(53,'COMAR'),(54,'investigaciones'),(55,'alojamiento'),(56,'deportación'),(57,'protocolo de actuación'),(58,'OPIs'),(59,'campañas'),(60,'higiene'),(61,'salubridad'),(62,'educación '),(63,'operativos'),(64,'Polícia Federal'),(65,'seguridad regional'),(66,'grupos Beta'),(67,'aseguramiento'),(68,'plan anual de trabajo'),(69,'calendarización'),(70,'capítulo de gasto'),(71,'Frontera sur '),(72,'Paisano'),(73,'Repatriación humana'),(74,'Rendición de cuentas'),(75,'PGR'),(76,'INM'),(77,'procuración de justicia'),(78,'delitos contra migrantes'),(79,'averiguaciones previas'),(80,'SRE'),(81,'trabajadores migrantes'),(82,'revisiones migratorias férreas'),(83,'lineamientos'),(84,'control y verificación migratoria'),(85,'dignificación de estaciones'),(86,'adquisición de terrenos'),(87,'construcción'),(88,'Plan Nacional de Desarrollo'),(89,'Tenosique'),(90,'Tabasco'),(91,'mecanismos'),(92,'asistencia jurídica'),(93,'víctimas'),(94,'custodia'),(95,'representante consular'),(96,'sentencias '),(97,'Programas'),(98,'UIFSA'),(99,'motivos'),(100,'nacionalidad'),(101,'condiciones de custodia'),(102,'medidas de control'),(103,'incumplimiento'),(104,'levantamiento'),(105,'edad'),(106,'sexo'),(107,'oficios'),(108,'autoridades migratorias'),(109,'trata de personas'),(110,'repatriadas'),(111,'regularización'),(112,'cargos públicos'),(113,'Estancia Provisional'),(114,'asilo político'),(115,'refugiado'),(116,'denominación legal'),(117,'salud'),(118,'aseguramiento'),(119,'capacitación'),(120,'acceso a la información'),(121,'proceso de selección'),(122,'presupuesto anual'),(123,'IFAI'),(124,'solicitudes'),(125,'tramites'),(126,'pensión alimentaria'),(127,'servidores públicos'),(128,'estaciones migratorias'),(129,'derechos humanos'),(130,'SFP'),(131,'violaciones'),(132,'expediente'),(133,'sanción'),(134,'delito'),(135,'FEVIMTRA'),(136,'protección'),(137,'procesos penales'),(138,'programas sectoriales'),(139,'SEDESOL'),(140,'mujeres'),(141,'giros negros'),(142,'INMUJERES'),(143,'Mesa Interinstitucional de Género y Migración'),(144,'estadísticas'),(145,'detenidos'),(146,'SEGOB'),(147,'OASISS'),(148,'redes de trata'),(149,'cuestionario'),(150,'Lineamientos'),(151,'entrevistas'),(152,'SEDENA'),(153,'minoría de edad'),(154,'agentes migratorios'),(155,'SEMARNAT'),(156,'recomendaciones'),(157,'CNDH'),(158,'delegación migratoria'),(159,'resolución'),(160,'alojados'),(161,'quejas'),(162,'normas'),(163,'vehículos oficiales'),(164,'Red Nacional de Atención a Víctimas'),(165,'alimentación'),(166,'medicamentos'),(167,'repatriados'),(168,'gráficos'),(169,'formatos'),(170,'procedimiento'),(171,'atención psicológica'),(172,'refugio'),(173,'estudios'),(174,'infancia'),(175,'acciones'),(176,'capacitaciones'),(177,'condiciones higiénicas'),(178,'contratación'),(179,'distribución geográfica'),(180,'municipios'),(181,'CISEN'),(182,'SSP');
/*!40000 ALTER TABLE `keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords2documents`
--

DROP TABLE IF EXISTS `keywords2documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords2documents` (
  `id_keyword` int(11) NOT NULL,
  `id_document` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords2documents`
--

LOCK TABLES `keywords2documents` WRITE;
/*!40000 ALTER TABLE `keywords2documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords2documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keywords2requests`
--

DROP TABLE IF EXISTS `keywords2requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywords2requests` (
  `id_keyword` int(11) NOT NULL,
  `id_request` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywords2requests`
--

LOCK TABLES `keywords2requests` WRITE;
/*!40000 ALTER TABLE `keywords2requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `keywords2requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `id_organization` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_organization`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quality` (
  `id_quality` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_quality`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality`
--

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;
INSERT INTO `quality` VALUES (1,'Completa'),(2,'Legible'),(3,'Formato Abierto'),(4,'Incompleta'),(5,'Ilegible'),(6,'En formato no accesible'),(7,'No es lo solicitado');
/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id_request` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_document` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_dependecy` int(11) NOT NULL DEFAULT '0',
  `other_dependency` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `folio` varchar(55) DEFAULT NULL,
  `description` text,
  `keywords` varchar(255) DEFAULT NULL,
  `date_published` date NOT NULL,
  `date_last_modified` date DEFAULT NULL,
  `date_answer` date DEFAULT NULL,
  PRIMARY KEY (`id_request`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resolutions`
--

DROP TABLE IF EXISTS `resolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolutions` (
  `id_resolution` int(11) NOT NULL AUTO_INCREMENT,
  `id_request` int(11) NOT NULL,
  `id_type_resolution` int(11) NOT NULL COMMENT '1 Confirma\n2 Modifica\n3 Revoca\n4 Desecha\n5 Sobresee',
  `date_notification` date DEFAULT NULL,
  `date` date DEFAULT NULL,
  `resource` varchar(45) DEFAULT NULL COMMENT 'Ponencia que procesó el recurso',
  `resource_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_resolution`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resolutions`
--

LOCK TABLES `resolutions` WRITE;
/*!40000 ALTER TABLE `resolutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `resolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resolutions_type`
--

DROP TABLE IF EXISTS `resolutions_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resolutions_type` (
  `id_resolution_type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_resolution_type`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resolutions_type`
--

LOCK TABLES `resolutions_type` WRITE;
/*!40000 ALTER TABLE `resolutions_type` DISABLE KEYS */;
INSERT INTO `resolutions_type` VALUES (1,'Confirma'),(2,'Modifica'),(3,'Revoca'),(4,'Desecha'),(5,'Sobresee');
/*!40000 ALTER TABLE `resolutions_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `id_response` int(11) NOT NULL AUTO_INCREMENT,
  `id_request` int(11) NOT NULL,
  `id_type_document` int(11) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `id_type_answer` int(11) DEFAULT NULL,
  `answer` text,
  `id_quality` int(11) DEFAULT NULL COMMENT '1 Completa\n2 Legible\n3 Formato Abierto\n\n4 Incompleta\n5 Ilegible\n6 No es lo solicita\n7 En formato no accesible',
  `information_delivery` int(11) NOT NULL DEFAULT '3' COMMENT '1 Consulta directa\n2 Formato fisico\n3 Formato electronico',
  `process_ifai` int(11) NOT NULL DEFAULT '1' COMMENT '1 En proceso\n2 Concluida\n3 No aplica',
  `date_limit` date DEFAULT NULL,
  PRIMARY KEY (`id_response`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id_review` int(11) NOT NULL AUTO_INCREMENT,
  `id_request` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `date_limit` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT 'Acto que se recurrió',
  PRIMARY KEY (`id_review`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_organization` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'normal',
  `date_create` time NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-11  3:39:09
