-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `ClimateService`
--

DROP TABLE IF EXISTS `ClimateService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClimateService` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `rootServiceId` bigint(20) NOT NULL,
  `scenario` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `versionNo` varchar(255) DEFAULT NULL,
  `creatorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pthjuwm8mc20t3004lg8q7dmw` (`creatorId`),
  CONSTRAINT `FK_pthjuwm8mc20t3004lg8q7dmw` FOREIGN KEY (`creatorId`) REFERENCES `User` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClimateService`
--

LOCK TABLES `ClimateService` WRITE;
/*!40000 ALTER TABLE `ClimateService` DISABLE KEYS */;
INSERT INTO `ClimateService` VALUES (1,'2015-03-05 12:32:29','2-D-Variable-Map','This service generates a map of a 2-dimensional variable with time averaging and spatial subsetting.  Select a data source (model or observation), a variable name, a time range, and a spatial range (lat-lon box) below.',2,'12','twoDimMap.html','1',1),(2,'2015-03-06 12:32:29','2-D-Variable-Zonal-Mean','This service generates a graph of a 2-dimensional variable\'s zonal mean with time averaing.  Select a data source (model or observation), a variable name, and a time range below.',2,'13','twoDimZonalMean.html','1',1),(3,'2015-03-07 12:32:29','2-D-Variable-Time-Series','This service generates a graph of a 2-dimensional variable\'s time series with monthly averaged values.  Select a data source (model or observation), a variable name, a time range, and a spatial range below.',103,'1','twoDimTimeSeries.html','1',1),(4,'2015-03-08 12:32:29','3-D-Variable-2-D-Slice','This service generates a slice map of a 3-dimensional variable at a selected pressure level.  Select a data source, a variable name, a time range, a spatial range, and a pressure level below.',2,'1','twoDimSlice3D.html','1',1),(5,'2015-03-09 12:32:29','3-D-Variable-Zonal-Mean','This service generates a contour plot of zonal-mean vertical profiles of a 3-dimensional variable.  Select a data source, a variable name, a time range, and a pressure range below.',105,'2','threeDimZonalMean.html','1',1),(6,'2015-03-10 12:32:29','3-D-Variable-Average-Vertical-Profile','This service generates the average of a three-dimensional variable over a specified region and time and display the average as a function of pressure level as an X-Y plot. ',11,'1','threeDimVarVertical.html','1',1),(7,'2015-03-11 12:32:29','Scatter-and-Histogram-Plot-of-Two-Variables','This service generates a scatter plot between two specified variables and the histograms of the two variables, and calculates the correlation of the two variables.Edit',29,'12','scatterPlot2Vars.html','1',1),(8,'2015-03-12 12:32:29','Difference-Plot-of-Two-Time-Averaged-Variables','This service calculates the differences between two specified variables and displays the lat-lon maps of the two variables and their differences.',232,'12','diffPlot2Vars.html','1',1),(9,'2015-03-13 12:32:29','Conditional-Sampling-with-One-Variable','This service sorts one variable by the values of another variable (environmental condition, e.g. SST) and displays the averaged value of the first variable as a function of the bin value of the second variable.',26,'1','conditionalSampling.html','1',1),(10,'2015-08-24 12:32:29','Conditional-Sampling-with-Two-Variables','This service sorts one variable called sampled variable by the\nvalues of two variables called sampling variables and displays the\naveraged value of the sampled variable in color as a function of the\nbin value of the two sampling variables in X-Y axis.',2,'1','conditionalSampling2Var.html','1',1),(11,'2015-08-20 12:32:29','Time-Lagged-Correlation-Map-of-Two-Variables','This service generates a time-lagged correlation map between two specified variables.',2,'1','correlationMap.html','1',1),(12,'2015-07-31 12:32:29','Regrid-and-Download','This service regrids a variable from a dataset according to the lat/lon/plev specified by the user, and mades the regridded data downloadable by the user.',32,'1','regridAndDownload.html','1',1);
/*!40000 ALTER TABLE `ClimateService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `commentImage` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `thumb` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `creatorId` bigint(20) DEFAULT NULL,
  `CommentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lkjuq69fyqk7pb1jr8yte1ci3` (`creatorId`),
  KEY `FK_5n17buhn0dpbiygdjnuoyhh8n` (`CommentId`),
  CONSTRAINT `FK_5n17buhn0dpbiygdjnuoyhh8n` FOREIGN KEY (`CommentId`) REFERENCES `Workflow` (`id`),
  CONSTRAINT `FK_lkjuq69fyqk7pb1jr8yte1ci3` FOREIGN KEY (`creatorId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dataset`
--

DROP TABLE IF EXISTS `Dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dataset` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CMIP5VarName` varchar(255) DEFAULT NULL,
  `agencyId` varchar(255) DEFAULT NULL,
  `dataSourceInputParameterToCallScienceApplicationCode` varchar(255) DEFAULT NULL,
  `gridDimension` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `physicalVariable` varchar(255) DEFAULT NULL,
  `publishTimeStamp` datetime DEFAULT NULL,
  `responsiblePerson` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `variableNameInWebInterface` varchar(255) DEFAULT NULL,
  `variableNameInputParameterToCallScienceApplicationCode` varchar(255) DEFAULT NULL,
  `instrumentId` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `dataSourceNameinWebInterface` varchar(255) DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9x29nf004vryd28iummv5l5r0` (`instrumentId`),
  CONSTRAINT `FK_9x29nf004vryd28iummv5l5r0` FOREIGN KEY (`instrumentId`) REFERENCES `Instrument` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dataset`
--

LOCK TABLES `Dataset` WRITE;
/*!40000 ALTER TABLE `Dataset` DISABLE KEYS */;
INSERT INTO `Dataset` VALUES (1,'pr','GFDL','GFDL_ESM2G','2D','ESM2G Precipitation Flux','Precipitation Flux',NULL,'CZ','ESM2G','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1996-01-00 00:00:00'),(2,'clt','GFDL','GFDL_ESM2G','2D','ESM2G Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','ESM2G','available on server','%',NULL,'Total Cloud Fraction','clt',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1996-01-00 00:00:00'),(3,'ts','GFDL','GFDL_ESM2G','2D','ESM2G Surface Temperature','Surface Temperature',NULL,'CZ','ESM2G','available on server','K',NULL,'Surface Temperature','ts',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1996-01-00 00:00:00'),(4,'tos','GFDL','GFDL_ESM2G','2D','ESM2G Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','ESM2G','available on server','K',NULL,'Sea Surface Temperature','tos',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1996-01-00 00:00:00'),(5,'uas','GFDL','GFDL_ESM2G','2D','ESM2G Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','ESM2G','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(6,'vas','GFDL','GFDL_ESM2G','2D','ESM2G Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','ESM2G','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(7,'sfcWind','GFDL','GFDL_ESM2G','2D','ESM2G Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','ESM2G','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(8,'zos','GFDL','GFDL_ESM2G','2D','ESM2G Sea Surface Height','Sea Surface Height',NULL,'CZ','ESM2G','available on server','m',NULL,'Sea Surface Height','zos',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1996-01-00 00:00:00'),(9,'lai','GFDL','GFDL_ESM2G','2D','ESM2G Leaf Area Index','Leaf Area Index',NULL,'CZ','ESM2G','available on server','1',NULL,'Leaf Area Index','lai',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1995-01-00 00:00:00'),(10,'rlds','GFDL','GFDL_ESM2G','2D','ESM2G Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1995-01-00 00:00:00'),(11,'rlus','GFDL','GFDL_ESM2G','2D','ESM2G Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1995-01-00 00:00:00'),(12,'rldscs','GFDL','GFDL_ESM2G','2D','ESM2G Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1995-01-00 00:00:00'),(13,'rsdt','GFDL','GFDL_ESM2G','2D','ESM2G TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(14,'rlut','GFDL','GFDL_ESM2G','2D','ESM2G TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1995-01-00 00:00:00'),(15,'rsut','GFDL','GFDL_ESM2G','2D','ESM2G TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(16,'rlutcs','GFDL','GFDL_ESM2G','2D','ESM2G TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1995-01-00 00:00:00'),(17,'rsutcs','GFDL','GFDL_ESM2G','2D','ESM2G TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','ESM2G','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(18,'ta','GFDL','GFDL_ESM2G','3D','ESM2G Air Temperature','Air Temperature',NULL,'CZ','ESM2G','available on server','K',NULL,'Air Temperature','ta',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(19,'hus','GFDL','GFDL_ESM2G','3D','ESM2G Specific Humidity','Specific Humidity',NULL,'CZ','ESM2G','available on server','1',NULL,'Specific Humidity','hus',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(20,'cli','GFDL','GFDL_ESM2G','3D','ESM2G Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','ESM2G','available on server','1',NULL,'Cloud Ice Water Content','cli',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(21,'clw','GFDL','GFDL_ESM2G','3D','ESM2G Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','ESM2G','available on server','1',NULL,'Cloud Liquid Water Content','clw',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1991-01-00 00:00:00'),(22,'wap','GFDL','GFDL_ESM2G','3D','ESM2G Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','ESM2G','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1986-01-00 00:00:00'),(23,'hur','GFDL','GFDL_ESM2G','3D','ESM2G Relative Humidity','Relative Humidity',NULL,'CZ','ESM2G','available on server','%',NULL,'Relative Humidity','hur',19,NULL,'GFDL/ESM2G','2005-12-00 00:00:00','1986-01-00 00:00:00'),(24,'pr','GISS','GISS_E2-H','2D','E2-H Precipitation Flux','Precipitation Flux',NULL,'CZ','E2-H','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(25,'clt','GISS','GISS_E2-H','2D','E2-H Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','E2-H','available on server','%',NULL,'Total Cloud Fraction','clt',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(26,'ts','GISS','GISS_E2-H','2D','E2-H Surface Temperature','Surface Temperature',NULL,'CZ','E2-H','available on server','K',NULL,'Surface Temperature','ts',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(27,'tos','GISS','GISS_E2-H','2D','E2-H Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','E2-H','available on server','K',NULL,'Sea Surface Temperature','tos',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(28,'uas','GISS','GISS_E2-H','2D','E2-H Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','E2-H','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(29,'vas','GISS','GISS_E2-H','2D','E2-H Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','E2-H','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(30,'sfcWind','GISS','GISS_E2-H','2D','E2-H Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','E2-H','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(31,'rlds','GISS','GISS_E2-H','2D','E2-H Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(32,'rsds','GISS','GISS_E2-H','2D','E2-H Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(33,'rlus','GISS','GISS_E2-H','2D','E2-H Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(34,'rsus','GISS','GISS_E2-H','2D','E2-H Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(35,'rldscs','GISS','GISS_E2-H','2D','E2-H Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(36,'rsdscs','GISS','GISS_E2-H','2D','E2-H Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(37,'rsuscs','GISS','GISS_E2-H','2D','E2-H Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(38,'rsdt','GISS','GISS_E2-H','2D','E2-H TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(39,'rlut','GISS','GISS_E2-H','2D','E2-H TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(40,'rsut','GISS','GISS_E2-H','2D','E2-H TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(41,'rlutcs','GISS','GISS_E2-H','2D','E2-H TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(42,'rsutcs','GISS','GISS_E2-H','2D','E2-H TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','E2-H','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(43,'ta','GISS','GISS_E2-H','3D','E2-H Air Temperature','Air Temperature',NULL,'CZ','E2-H','available on server','K',NULL,'Air Temperature','ta',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(44,'hus','GISS','GISS_E2-H','3D','E2-H Specific Humidity','Specific Humidity',NULL,'CZ','E2-H','available on server','1',NULL,'Specific Humidity','hus',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1995-01-00 00:00:00'),(45,'cli','GISS','GISS_E2-H','3D','E2-H Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','E2-H','available on server','1',NULL,'Cloud Ice Water Content','cli',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1951-01-00 00:00:00'),(46,'clw','GISS','GISS_E2-H','3D','E2-H Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','E2-H','available on server','1',NULL,'Cloud Liquid Water Content','clw',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1951-01-00 00:00:00'),(47,'wap','GISS','GISS_E2-H','3D','E2-H Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','E2-H','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1951-01-00 00:00:00'),(48,'hur','GISS','GISS_E2-H','3D','E2-H Relative Humidity','Relative Humidity',NULL,'CZ','E2-H','available on server','%',NULL,'Relative Humidity','hur',17,NULL,'GISS/E2-H','2005-12-00 00:00:00','1951-01-00 00:00:00'),(49,'pr','GISS','GISS_E2-R','2D','E2-R Precipitation Flux','Precipitation Flux',NULL,'CZ','E2-R','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(50,'clt','GISS','GISS_E2-R','2D','E2-R Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','E2-R','available on server','%',NULL,'Total Cloud Fraction','clt',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(51,'ts','GISS','GISS_E2-R','2D','E2-R Surface Temperature','Surface Temperature',NULL,'CZ','E2-R','available on server','K',NULL,'Surface Temperature','ts',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(52,'tos','GISS','GISS_E2-R','2D','E2-R Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','E2-R','available on server','K',NULL,'Sea Surface Temperature','tos',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(53,'uas','GISS','GISS_E2-R','2D','E2-R Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','E2-R','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(54,'vas','GISS','GISS_E2-R','2D','E2-R Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','E2-R','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(55,'sfcWind','GISS','GISS_E2-R','2D','E2-R Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','E2-R','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(56,'zos','GISS','GISS_E2-R','2D','E2-R Sea Surface Height','Sea Surface Height',NULL,'CZ','E2-R','available on server','m',NULL,'Sea Surface Height','zos',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(57,'rsds','GISS','GISS_E2-R','2D','E2-R Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(58,'rlus','GISS','GISS_E2-R','2D','E2-R Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(59,'rsus','GISS','GISS_E2-R','2D','E2-R Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(60,'rldscs','GISS','GISS_E2-R','2D','E2-R Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(61,'rsdscs','GISS','GISS_E2-R','2D','E2-R Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(62,'rsuscs','GISS','GISS_E2-R','2D','E2-R Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(63,'rsdt','GISS','GISS_E2-R','2D','E2-R TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(64,'rlut','GISS','GISS_E2-R','2D','E2-R TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(65,'rsut','GISS','GISS_E2-R','2D','E2-R TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(66,'rlutcs','GISS','GISS_E2-R','2D','E2-R TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(67,'rsutcs','GISS','GISS_E2-R','2D','E2-R TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','E2-R','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(68,'ta','GISS','GISS_E2-R','3D','E2-R Air Temperature','Air Temperature',NULL,'CZ','E2-R','available on server','K',NULL,'Air Temperature','ta',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(69,'hus','GISS','GISS_E2-R','3D','E2-R Specific Humidity','Specific Humidity',NULL,'CZ','E2-R','available on server','1',NULL,'Specific Humidity','hus',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(70,'cli','GISS','GISS_E2-R','3D','E2-R Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','E2-R','available on server','1',NULL,'Cloud Ice Water Content','cli',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','2001-01-00 00:00:00'),(71,'clw','GISS','GISS_E2-R','3D','E2-R Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','E2-R','available on server','1',NULL,'Cloud Liquid Water Content','clw',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1995-01-00 00:00:00'),(72,'wap','GISS','GISS_E2-R','3D','E2-R Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','E2-R','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1951-01-00 00:00:00'),(73,'hur','GISS','GISS_E2-R','3D','E2-R Relative Humidity','Relative Humidity',NULL,'CZ','E2-R','available on server','%',NULL,'Relative Humidity','hur',18,NULL,'GISS/E2-R','2005-12-00 00:00:00','1951-01-00 00:00:00'),(74,'pr','NCAR','NCAR_CAM5','2D','CAM5 Precipitation Flux','Precipitation Flux',NULL,'CZ','CAM5','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(75,'clt','NCAR','NCAR_CAM5','2D','CAM5 Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','CAM5','available on server','%',NULL,'Total Cloud Fraction','clt',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(76,'ts','NCAR','NCAR_CAM5','2D','CAM5 Surface Temperature','Surface Temperature',NULL,'CZ','CAM5','available on server','K',NULL,'Surface Temperature','ts',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(77,'tos','NCAR','NCAR_CAM5','2D','CAM5 Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','CAM5','available on server','K',NULL,'Sea Surface Temperature','tos',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(78,'sfcWind','NCAR','NCAR_CAM5','2D','CAM5 Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','CAM5','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(79,'zos','NCAR','NCAR_CAM5','2D','CAM5 Sea Surface Height','Sea Surface Height',NULL,'CZ','CAM5','available on server','m',NULL,'Sea Surface Height','zos',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(80,'lai','NCAR','NCAR_CAM5','2D','CAM5 Leaf Area Index','Leaf Area Index',NULL,'CZ','CAM5','available on server','1',NULL,'Leaf Area Index','lai',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(81,'rlds','NCAR','NCAR_CAM5','2D','CAM5 Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(82,'rsds','NCAR','NCAR_CAM5','2D','CAM5 Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(83,'rlus','NCAR','NCAR_CAM5','2D','CAM5 Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(84,'rsus','NCAR','NCAR_CAM5','2D','CAM5 Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(85,'rsdscs','NCAR','NCAR_CAM5','2D','CAM5 Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(86,'rsuscs','NCAR','NCAR_CAM5','2D','CAM5 Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(87,'rsdt','NCAR','NCAR_CAM5','2D','CAM5 TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(88,'rlut','NCAR','NCAR_CAM5','2D','CAM5 TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(89,'rsut','NCAR','NCAR_CAM5','2D','CAM5 TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(90,'rlutcs','NCAR','NCAR_CAM5','2D','CAM5 TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(91,'rsutcs','NCAR','NCAR_CAM5','2D','CAM5 TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','CAM5','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(92,'ta','NCAR','NCAR_CAM5','3D','CAM5 Air Temperature','Air Temperature',NULL,'CZ','CAM5','available on server','K',NULL,'Air Temperature','ta',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(93,'hus','NCAR','NCAR_CAM5','3D','CAM5 Specific Humidity','Specific Humidity',NULL,'CZ','CAM5','available on server','1',NULL,'Specific Humidity','hus',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1995-01-00 00:00:00'),(94,'cli','NCAR','NCAR_CAM5','3D','CAM5 Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','CAM5','available on server','1',NULL,'Cloud Ice Water Content','cli',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1975-01-00 00:00:00'),(95,'clw','NCAR','NCAR_CAM5','3D','CAM5 Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','CAM5','available on server','1',NULL,'Cloud Liquid Water Content','clw',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1975-01-00 00:00:00'),(96,'wap','NCAR','NCAR_CAM5','3D','CAM5 Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','CAM5','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1950-01-00 00:00:00'),(97,'hur','NCAR','NCAR_CAM5','3D','CAM5 Relative Humidity','Relative Humidity',NULL,'CZ','CAM5','available on server','%',NULL,'Relative Humidity','hur',13,NULL,'NCAR/CAM5','2005-12-00 00:00:00','1950-01-00 00:00:00'),(98,'pr','NCC','NCC_NORESM','2D','NORESM Precipitation Flux','Precipitation Flux',NULL,'CZ','NORESM','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(99,'clt','NCC','NCC_NORESM','2D','NORESM Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','NORESM','available on server','%',NULL,'Total Cloud Fraction','clt',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(100,'ts','NCC','NCC_NORESM','2D','NORESM Surface Temperature','Surface Temperature',NULL,'CZ','NORESM','available on server','K',NULL,'Surface Temperature','ts',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(101,'tos','NCC','NCC_NORESM','2D','NORESM Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','NORESM','available on server','K',NULL,'Sea Surface Temperature','tos',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(102,'uas','NCC','NCC_NORESM','2D','NORESM Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','NORESM','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(103,'vas','NCC','NCC_NORESM','2D','NORESM Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','NORESM','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(104,'zos','NCC','NCC_NORESM','2D','NORESM Sea Surface Height','Sea Surface Height',NULL,'CZ','NORESM','available on server','m',NULL,'Sea Surface Height','zos',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(105,'lai','NCC','NCC_NORESM','2D','NORESM Leaf Area Index','Leaf Area Index',NULL,'CZ','NORESM','available on server','1',NULL,'Leaf Area Index','lai',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(106,'rlds','NCC','NCC_NORESM','2D','NORESM Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(107,'rsds','NCC','NCC_NORESM','2D','NORESM Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(108,'rlus','NCC','NCC_NORESM','2D','NORESM Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(109,'rsus','NCC','NCC_NORESM','2D','NORESM Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(110,'rldscs','NCC','NCC_NORESM','2D','NORESM Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(111,'rsdscs','NCC','NCC_NORESM','2D','NORESM Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(112,'rsuscs','NCC','NCC_NORESM','2D','NORESM Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(113,'rsdt','NCC','NCC_NORESM','2D','NORESM TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(114,'rlut','NCC','NCC_NORESM','2D','NORESM TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(115,'rsut','NCC','NCC_NORESM','2D','NORESM TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(116,'rlutcs','NCC','NCC_NORESM','2D','NORESM TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(117,'rsutcs','NCC','NCC_NORESM','2D','NORESM TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','NORESM','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(118,'ta','NCC','NCC_NORESM','3D','NORESM Air Temperature','Air Temperature',NULL,'CZ','NORESM','available on server','K',NULL,'Air Temperature','ta',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(119,'hus','NCC','NCC_NORESM','3D','NORESM Specific Humidity','Specific Humidity',NULL,'CZ','NORESM','available on server','1',NULL,'Specific Humidity','hus',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1995-01-00 00:00:00'),(120,'cli','NCC','NCC_NORESM','3D','NORESM Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','NORESM','available on server','1',NULL,'Cloud Ice Water Content','cli',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1950-01-00 00:00:00'),(121,'clw','NCC','NCC_NORESM','3D','NORESM Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','NORESM','available on server','1',NULL,'Cloud Liquid Water Content','clw',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1950-01-00 00:00:00'),(122,'wap','NCC','NCC_NORESM','3D','NORESM Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','NORESM','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1950-01-00 00:00:00'),(123,'hur','NCC','NCC_NORESM','3D','NORESM Relative Humidity','Relative Humidity',NULL,'CZ','NORESM','available on server','%',NULL,'Relative Humidity','hur',24,NULL,'NCC/NORESM','2005-12-00 00:00:00','1950-01-00 00:00:00'),(124,'pr','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Precipitation Flux','Precipitation Flux',NULL,'CZ','HadGEM2-ES','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(125,'clt','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','HadGEM2-ES','available on server','%',NULL,'Total Cloud Fraction','clt',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(126,'ts','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Temperature','Surface Temperature',NULL,'CZ','HadGEM2-ES','available on server','K',NULL,'Surface Temperature','ts',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(127,'tos','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','HadGEM2-ES','available on server','K',NULL,'Sea Surface Temperature','tos',21,NULL,'UKMO/HadGEM2-ES','2005-12-00 00:00:00','1995-01-00 00:00:00'),(128,'uas','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','HadGEM2-ES','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(129,'vas','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','HadGEM2-ES','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(130,'sfcWind','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','HadGEM2-ES','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(131,'zos','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Sea Surface Height','Sea Surface Height',NULL,'CZ','HadGEM2-ES','available on server','m',NULL,'Sea Surface Height','zos',21,NULL,'UKMO/HadGEM2-ES','2005-12-00 00:00:00','1959-12-00 00:00:00'),(132,'lai','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Leaf Area Index','Leaf Area Index',NULL,'CZ','HadGEM2-ES','available on server','1',NULL,'Leaf Area Index','lai',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(133,'rlds','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(134,'rsds','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(135,'rlus','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(136,'rsus','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(137,'rldscs','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(138,'rsdscs','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(139,'rsuscs','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(140,'rsdt','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(141,'rlut','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(142,'rsut','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(143,'rlutcs','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(144,'rsutcs','UKMO','UKMO_HadGEM2-ES','2D','HadGEM2-ES TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','HadGEM2-ES','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(145,'ta','UKMO','UKMO_HadGEM2-ES','3D','HadGEM2-ES Air Temperature','Air Temperature',NULL,'CZ','HadGEM2-ES','available on server','K',NULL,'Air Temperature','ta',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(146,'hus','UKMO','UKMO_HadGEM2-ES','3D','HadGEM2-ES Specific Humidity','Specific Humidity',NULL,'CZ','HadGEM2-ES','available on server','1',NULL,'Specific Humidity','hus',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1995-01-00 00:00:00'),(147,'cli','UKMO','UKMO_HadGEM2-ES','3D','HadGEM2-ES Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','HadGEM2-ES','available on server','1',NULL,'Cloud Ice Water Content','cli',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1984-12-00 00:00:00'),(148,'clw','UKMO','UKMO_HadGEM2-ES','3D','HadGEM2-ES Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','HadGEM2-ES','available on server','1',NULL,'Cloud Liquid Water Content','clw',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1984-12-00 00:00:00'),(149,'wap','UKMO','UKMO_HadGEM2-ES','3D','HadGEM2-ES Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','HadGEM2-ES','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1984-12-00 00:00:00'),(150,'hur','UKMO','UKMO_HadGEM2-ES','3D','HadGEM2-ES Relative Humidity','Relative Humidity',NULL,'CZ','HadGEM2-ES','available on server','%',NULL,'Relative Humidity','hur',21,NULL,'UKMO/HadGEM2-ES','2005-11-00 00:00:00','1984-12-00 00:00:00'),(151,'pr','CCCMA','CCCMA_CANAM4','2D','CANAM4 Precipitation Flux','Precipitation Flux',NULL,'CZ','CANAM4','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(152,'clt','CCCMA','CCCMA_CANAM4','2D','CANAM4 Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','CANAM4','available on server','%',NULL,'Total Cloud Fraction','clt',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(153,'ts','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Temperature','Surface Temperature',NULL,'CZ','CANAM4','available on server','K',NULL,'Surface Temperature','ts',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1950-01-00 00:00:00'),(154,'tas','CCCMA','CCCMA_CANAM4','2D','CANAM4 Near-Surface Air Temperature','Near-Surface Air Temperature',NULL,'CZ','CANAM4','available on server','K',NULL,'Near-Surface Air Temperature','tas',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1950-01-00 00:00:00'),(155,'hurs','CCCMA','CCCMA_CANAM4','2D','CANAM4 Near-Surface Relative Humidity','Near-Surface Relative Humidity',NULL,'CZ','CANAM4','available on server','%',NULL,'Near-Surface Relative Humidity','hurs',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1950-01-00 00:00:00'),(156,'uas','CCCMA','CCCMA_CANAM4','2D','CANAM4 Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','CANAM4','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(157,'vas','CCCMA','CCCMA_CANAM4','2D','CANAM4 Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','CANAM4','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(158,'sfcWind','CCCMA','CCCMA_CANAM4','2D','CANAM4 Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','CANAM4','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(159,'rlds','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(160,'rsds','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(161,'rlus','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(162,'rsus','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(163,'rldscs','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(164,'rsdscs','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(165,'rsuscs','CCCMA','CCCMA_CANAM4','2D','CANAM4 Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(166,'rsdt','CCCMA','CCCMA_CANAM4','2D','CANAM4 TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(167,'rlut','CCCMA','CCCMA_CANAM4','2D','CANAM4 TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(168,'rsut','CCCMA','CCCMA_CANAM4','2D','CANAM4 TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(169,'rlutcs','CCCMA','CCCMA_CANAM4','2D','CANAM4 TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(170,'rsutcs','CCCMA','CCCMA_CANAM4','2D','CANAM4 TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','CANAM4','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(171,'ta','CCCMA','CCCMA_CANAM4','3D','CANAM4 Air Temperature','Air Temperature',NULL,'CZ','CANAM4','available on server','K',NULL,'Air Temperature','ta',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(172,'hus','CCCMA','CCCMA_CANAM4','3D','CANAM4 Specific Humidity','Specific Humidity',NULL,'CZ','CANAM4','available on server','1',NULL,'Specific Humidity','hus',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1995-01-00 00:00:00'),(173,'cli','CCCMA','CCCMA_CANAM4','3D','CANAM4 Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','CANAM4','available on server','1',NULL,'Cloud Ice Water Content','cli',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1950-01-00 00:00:00'),(174,'clw','CCCMA','CCCMA_CANAM4','3D','CANAM4 Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','CANAM4','available on server','1',NULL,'Cloud Liquid Water Content','clw',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1950-01-00 00:00:00'),(175,'wap','CCCMA','CCCMA_CANAM4','3D','CANAM4 Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','CANAM4','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1950-01-00 00:00:00'),(176,'hur','CCCMA','CCCMA_CANAM4','3D','CANAM4 Relative Humidity','Relative Humidity',NULL,'CZ','CANAM4','available on server','%',NULL,'Relative Humidity','hur',14,NULL,'CCCMA/CANAM4','2009-12-00 00:00:00','1950-01-00 00:00:00'),(177,'pr','CSIRO','CSIRO_MK3.6','2D','MK3.6 Precipitation Flux','Precipitation Flux',NULL,'CZ','MK3.6','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(178,'clt','CSIRO','CSIRO_MK3.6','2D','MK3.6 Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','MK3.6','available on server','%',NULL,'Total Cloud Fraction','clt',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(179,'ts','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Temperature','Surface Temperature',NULL,'CZ','MK3.6','available on server','K',NULL,'Surface Temperature','ts',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(180,'uas','CSIRO','CSIRO_MK3.6','2D','MK3.6 Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','MK3.6','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(181,'vas','CSIRO','CSIRO_MK3.6','2D','MK3.6 Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','MK3.6','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(182,'sfcWind','CSIRO','CSIRO_MK3.6','2D','MK3.6 Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','MK3.6','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(183,'rlds','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(184,'rsds','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(185,'rlus','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(186,'rsus','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(187,'rldscs','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(188,'rsdscs','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(189,'rsuscs','CSIRO','CSIRO_MK3.6','2D','MK3.6 Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(190,'rsdt','CSIRO','CSIRO_MK3.6','2D','MK3.6 TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(191,'rlut','CSIRO','CSIRO_MK3.6','2D','MK3.6 TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(192,'rsut','CSIRO','CSIRO_MK3.6','2D','MK3.6 TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(193,'rlutcs','CSIRO','CSIRO_MK3.6','2D','MK3.6 TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(194,'rsutcs','CSIRO','CSIRO_MK3.6','2D','MK3.6 TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','MK3.6','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(195,'ta','CSIRO','CSIRO_MK3.6','3D','MK3.6 Air Temperature','Air Temperature',NULL,'CZ','MK3.6','available on server','K',NULL,'Air Temperature','ta',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(196,'hus','CSIRO','CSIRO_MK3.6','3D','MK3.6 Specific Humidity','Specific Humidity',NULL,'CZ','MK3.6','available on server','1',NULL,'Specific Humidity','hus',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1995-01-00 00:00:00'),(197,'cli','CSIRO','CSIRO_MK3.6','3D','MK3.6 Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','MK3.6','available on server','1',NULL,'Cloud Ice Water Content','cli',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1979-01-00 00:00:00'),(198,'clw','CSIRO','CSIRO_MK3.6','3D','MK3.6 Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','MK3.6','available on server','1',NULL,'Cloud Liquid Water Content','clw',23,NULL,'CSIRO/MK3.6','2009-12-00 00:00:00','1999-01-00 00:00:00'),(199,'wap','CSIRO','CSIRO_MK3.6','3D','MK3.6 Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','MK3.6','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',23,NULL,'CSIRO/MK3.6','2005-12-00 00:00:00','1990-01-00 00:00:00'),(200,'hur','CSIRO','CSIRO_MK3.6','3D','MK3.6 Relative Humidity','Relative Humidity',NULL,'CZ','MK3.6','available on server','%',NULL,'Relative Humidity','hur',23,NULL,'CSIRO/MK3.6','2005-12-00 00:00:00','1990-01-00 00:00:00'),(201,'pr','GFDL','GFDL_CM3','2D','CM3 Precipitation Flux','Precipitation Flux',NULL,'CZ','CM3','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1994-01-00 00:00:00'),(202,'clt','GFDL','GFDL_CM3','2D','CM3 Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','CM3','available on server','%',NULL,'Total Cloud Fraction','clt',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1994-01-00 00:00:00'),(203,'ts','GFDL','GFDL_CM3','2D','CM3 Surface Temperature','Surface Temperature',NULL,'CZ','CM3','available on server','K',NULL,'Surface Temperature','ts',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1994-01-00 00:00:00'),(204,'uas','GFDL','GFDL_CM3','2D','CM3 Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','CM3','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(205,'vas','GFDL','GFDL_CM3','2D','CM3 Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','CM3','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(206,'sfcWind','GFDL','GFDL_CM3','2D','CM3 Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','CM3','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(207,'rlds','GFDL','GFDL_CM3','2D','CM3 Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(208,'rsds','GFDL','GFDL_CM3','2D','CM3 Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(209,'rlus','GFDL','GFDL_CM3','2D','CM3 Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(210,'rsus','GFDL','GFDL_CM3','2D','CM3 Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(211,'rldscs','GFDL','GFDL_CM3','2D','CM3 Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(212,'rsdscs','GFDL','GFDL_CM3','2D','CM3 Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(213,'rsuscs','GFDL','GFDL_CM3','2D','CM3 Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(214,'rsdt','GFDL','GFDL_CM3','2D','CM3 TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(215,'rlut','GFDL','GFDL_CM3','2D','CM3 TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(216,'rsut','GFDL','GFDL_CM3','2D','CM3 TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(217,'rlutcs','GFDL','GFDL_CM3','2D','CM3 TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(218,'rsutcs','GFDL','GFDL_CM3','2D','CM3 TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','CM3','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1995-01-00 00:00:00'),(219,'ta','GFDL','GFDL_CM3','3D','CM3 Air Temperature','Air Temperature',NULL,'CZ','CM3','available on server','K',NULL,'Air Temperature','ta',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1989-01-00 00:00:00'),(220,'hus','GFDL','GFDL_CM3','3D','CM3 Specific Humidity','Specific Humidity',NULL,'CZ','CM3','available on server','1',NULL,'Specific Humidity','hus',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1989-01-00 00:00:00'),(221,'cli','GFDL','GFDL_CM3','3D','CM3 Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','CM3','available on server','1',NULL,'Cloud Ice Water Content','cli',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1979-01-00 00:00:00'),(222,'clw','GFDL','GFDL_CM3','3D','CM3 Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','CM3','available on server','1',NULL,'Cloud Liquid Water Content','clw',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1979-01-00 00:00:00'),(223,'wap','GFDL','GFDL_CM3','3D','CM3 Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','CM3','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1989-01-00 00:00:00'),(224,'hur','GFDL','GFDL_CM3','3D','CM3 Relative Humidity','Relative Humidity',NULL,'CZ','CM3','available on server','%',NULL,'Relative Humidity','hur',15,NULL,'GFDL/CM3','2008-12-00 00:00:00','1989-01-00 00:00:00'),(225,'pr','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Precipitation Flux','Precipitation Flux',NULL,'CZ','CM5A-LR','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(226,'clt','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','CM5A-LR','available on server','%',NULL,'Total Cloud Fraction','clt',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(227,'ts','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Temperature','Surface Temperature',NULL,'CZ','CM5A-LR','available on server','K',NULL,'Surface Temperature','ts',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(228,'uas','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','CM5A-LR','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(229,'vas','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','CM5A-LR','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(230,'sfcWind','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','CM5A-LR','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(231,'lai','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Leaf Area Index','Leaf Area Index',NULL,'CZ','CM5A-LR','available on server','1',NULL,'Leaf Area Index','lai',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(232,'rlds','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(233,'rsds','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(234,'rlus','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(235,'rsus','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(236,'rldscs','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(237,'rsdscs','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(238,'rsuscs','IPSL','IPSL_CM5A-LR','2D','CM5A-LR Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(239,'rsdt','IPSL','IPSL_CM5A-LR','2D','CM5A-LR TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(240,'rlut','IPSL','IPSL_CM5A-LR','2D','CM5A-LR TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(241,'rsut','IPSL','IPSL_CM5A-LR','2D','CM5A-LR TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(242,'rlutcs','IPSL','IPSL_CM5A-LR','2D','CM5A-LR TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(243,'rsutcs','IPSL','IPSL_CM5A-LR','2D','CM5A-LR TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','CM5A-LR','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(244,'ta','IPSL','IPSL_CM5A-LR','3D','CM5A-LR Air Temperature','Air Temperature',NULL,'CZ','CM5A-LR','available on server','K',NULL,'Air Temperature','ta',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(245,'hus','IPSL','IPSL_CM5A-LR','3D','CM5A-LR Specific Humidity','Specific Humidity',NULL,'CZ','CM5A-LR','available on server','1',NULL,'Specific Humidity','hus',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1995-01-00 00:00:00'),(246,'cli','IPSL','IPSL_CM5A-LR','3D','CM5A-LR Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','CM5A-LR','available on server','1',NULL,'Cloud Ice Water Content','cli',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1979-01-00 00:00:00'),(247,'clw','IPSL','IPSL_CM5A-LR','3D','CM5A-LR Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','CM5A-LR','available on server','1',NULL,'Cloud Liquid Water Content','clw',16,NULL,'IPSL/CM5A-LR','2009-12-00 00:00:00','1979-01-00 00:00:00'),(248,'pr','MIROC','MIROC_MIROC5','2D','MIROC5 Precipitation Flux','Precipitation Flux',NULL,'CZ','MIROC5','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1979-01-00 00:00:00'),(249,'clt','MIROC','MIROC_MIROC5','2D','MIROC5 Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','MIROC5','available on server','%',NULL,'Total Cloud Fraction','clt',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1979-01-00 00:00:00'),(250,'ts','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Temperature','Surface Temperature',NULL,'CZ','MIROC5','available on server','K',NULL,'Surface Temperature','ts',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1979-01-00 00:00:00'),(251,'uas','MIROC','MIROC_MIROC5','2D','MIROC5 Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','MIROC5','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(252,'vas','MIROC','MIROC_MIROC5','2D','MIROC5 Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','MIROC5','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(253,'sfcWind','MIROC','MIROC_MIROC5','2D','MIROC5 Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','MIROC5','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(254,'lai','MIROC','MIROC_MIROC5','2D','MIROC5 Leaf Area Index','Leaf Area Index',NULL,'CZ','MIROC5','available on server','1',NULL,'Leaf Area Index','lai',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(255,'rlds','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(256,'rsds','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(257,'rlus','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(258,'rsus','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(259,'rldscs','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(260,'rsdscs','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(261,'rsuscs','MIROC','MIROC_MIROC5','2D','MIROC5 Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(262,'rsdt','MIROC','MIROC_MIROC5','2D','MIROC5 TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(263,'rlut','MIROC','MIROC_MIROC5','2D','MIROC5 TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(264,'rsut','MIROC','MIROC_MIROC5','2D','MIROC5 TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(265,'rlutcs','MIROC','MIROC_MIROC5','2D','MIROC5 TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(266,'rsutcs','MIROC','MIROC_MIROC5','2D','MIROC5 TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','MIROC5','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1995-01-00 00:00:00'),(267,'ta','MIROC','MIROC_MIROC5','3D','MIROC5 Air Temperature','Air Temperature',NULL,'CZ','MIROC5','available on server','K',NULL,'Air Temperature','ta',22,NULL,'MIROC/MIROC5','1998-12-00 00:00:00','1995-01-00 00:00:00'),(268,'hus','MIROC','MIROC_MIROC5','3D','MIROC5 Specific Humidity','Specific Humidity',NULL,'CZ','MIROC5','available on server','1',NULL,'Specific Humidity','hus',22,NULL,'MIROC/MIROC5','1998-12-00 00:00:00','1995-01-00 00:00:00'),(269,'cli','MIROC','MIROC_MIROC5','3D','MIROC5 Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','MIROC5','available on server','1',NULL,'Cloud Ice Water Content','cli',22,NULL,'MIROC/MIROC5','1998-12-00 00:00:00','1979-01-00 00:00:00'),(270,'clw','MIROC','MIROC_MIROC5','3D','MIROC5 Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','MIROC5','available on server','1',NULL,'Cloud Liquid Water Content','clw',22,NULL,'MIROC/MIROC5','2008-12-00 00:00:00','1979-01-00 00:00:00'),(271,'wap','MIROC','MIROC_MIROC5','3D','MIROC5 Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','MIROC5','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',22,NULL,'MIROC/MIROC5','2009-12-00 00:00:00','1920-01-00 00:00:00'),(272,'hur','MIROC','MIROC_MIROC5','3D','MIROC5 Relative Humidity','Relative Humidity',NULL,'CZ','MIROC5','available on server','%',NULL,'Relative Humidity','hur',22,NULL,'MIROC/MIROC5','2009-12-00 00:00:00','1920-01-00 00:00:00'),(273,'pr','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Precipitation Flux','Precipitation Flux',NULL,'CZ','HadGEM2-A','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(274,'clt','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','HadGEM2-A','available on server','%',NULL,'Total Cloud Fraction','clt',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(275,'ts','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Temperature','Surface Temperature',NULL,'CZ','HadGEM2-A','available on server','K',NULL,'Surface Temperature','ts',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(276,'hurs','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Near-Surface Relative Humidity','Near-Surface Relative Humidity',NULL,'CZ','HadGEM2-A','available on server','%',NULL,'Near-Surface Relative Humidity','hurs',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1978-09-00 00:00:00'),(277,'uas','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','HadGEM2-A','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(278,'vas','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','HadGEM2-A','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(279,'sfcWind','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','HadGEM2-A','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(280,'rlds','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(281,'rsds','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(282,'rlus','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(283,'rsus','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(284,'rldscs','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(285,'rsdscs','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(286,'rsuscs','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(287,'rsdt','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(288,'rlut','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(289,'rsut','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(290,'rlutcs','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(291,'rsutcs','UKMO','UKMO_HadGEM2-A','2D','HadGEM2-A TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','HadGEM2-A','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1995-01-00 00:00:00'),(292,'ta','UKMO','UKMO_HadGEM2-A','3D','HadGEM2-A Air Temperature','Air Temperature',NULL,'CZ','HadGEM2-A','available on server','K',NULL,'Air Temperature','ta',20,NULL,'UKMO/HadGEM2-A','2008-11-00 00:00:00','1995-01-00 00:00:00'),(293,'hus','UKMO','UKMO_HadGEM2-A','3D','HadGEM2-A Specific Humidity','Specific Humidity',NULL,'CZ','HadGEM2-A','available on server','1',NULL,'Specific Humidity','hus',20,NULL,'UKMO/HadGEM2-A','2008-11-00 00:00:00','1995-01-00 00:00:00'),(294,'cli','UKMO','UKMO_HadGEM2-A','3D','HadGEM2-A Cloud Ice Water Content','Cloud Ice Water Content',NULL,'CZ','HadGEM2-A','available on server','1',NULL,'Cloud Ice Water Content','cli',20,NULL,'UKMO/HadGEM2-A','2008-11-00 00:00:00','1978-09-00 00:00:00'),(295,'clw','UKMO','UKMO_HadGEM2-A','3D','HadGEM2-A Cloud Liquid Water Content','Cloud Liquid Water Content',NULL,'CZ','HadGEM2-A','available on server','1',NULL,'Cloud Liquid Water Content','clw',20,NULL,'UKMO/HadGEM2-A','2008-11-00 00:00:00','1978-09-00 00:00:00'),(296,'wap','UKMO','UKMO_HadGEM2-A','3D','HadGEM2-A Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','HadGEM2-A','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1978-09-00 00:00:00'),(297,'hur','UKMO','UKMO_HadGEM2-A','3D','HadGEM2-A Relative Humidity','Relative Humidity',NULL,'CZ','HadGEM2-A','available on server','%',NULL,'Relative Humidity','hur',20,NULL,'UKMO/HadGEM2-A','2008-12-00 00:00:00','1978-09-00 00:00:00'),(298,'zl','NASA','NASA_GRACE','2D','GRACE Equivalent Water Height Over Land','Equivalent Water Height Over Land',NULL,'CZ','GRACE','available on server','cm',NULL,'Equivalent Water Height Over Land','zl',2,NULL,'NASA/GRACE','2011-12-00 00:00:00','2003-02-00 00:00:00'),(299,'zo','NASA','NASA_GRACE','2D','GRACE Equivalent Water Height Over Ocean','Equivalent Water Height Over Ocean',NULL,'CZ','GRACE','available on server','cm',NULL,'Equivalent Water Height Over Ocean','zo',2,NULL,'NASA/GRACE','2011-12-00 00:00:00','2003-02-00 00:00:00'),(300,'clt','NASA','NASA_MODIS','2D','MODIS Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','MODIS','available on server','%',NULL,'Total Cloud Fraction','clt',6,NULL,'NASA/MODIS','2011-09-00 00:00:00','2000-03-00 00:00:00'),(301,'lai','NASA','NASA_MODIS','2D','MODIS Leaf Area Index','Leaf Area Index',NULL,'CZ','MODIS','available on server','1',NULL,'Leaf Area Index','lai',6,NULL,'NASA/MODIS','2009-12-00 00:00:00','2000-02-00 00:00:00'),(302,'tos','NASA','NASA_AMSRE','2D','AMSRE Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','AMSRE','available on server','K',NULL,'Sea Surface Temperature','tos',9,NULL,'NASA/AMSRE','2010-12-00 00:00:00','2002-06-00 00:00:00'),(303,'pr','NASA','NASA_TRMM','2D','TRMM Precipitation Flux','Precipitation Flux',NULL,'CZ','TRMM','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',7,NULL,'NASA/TRMM','2013-12-00 00:00:00','1998-01-00 00:00:00'),(304,'pr','NASA','NASA_GPCP','2D','GPCP Precipitation Flux','Precipitation Flux',NULL,'CZ','GPCP','available on server','kg  m-2 s-1',NULL,'Precipitation Flux','pr',8,NULL,'NASA/GPCP','2011-06-00 00:00:00','1979-01-00 00:00:00'),(305,'uas','NASA','NASA_QuikSCAT','2D','QuikSCAT Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','QuikSCAT','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',10,NULL,'NASA/QuikSCAT','2009-10-00 00:00:00','1999-08-00 00:00:00'),(306,'vas','NASA','NASA_QuikSCAT','2D','QuikSCAT Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','QuikSCAT','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',10,NULL,'NASA/QuikSCAT','2009-10-00 00:00:00','1999-08-00 00:00:00'),(307,'sfcWind','NASA','NASA_QuikSCAT','2D','QuikSCAT Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','QuikSCAT','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',10,NULL,'NASA/QuikSCAT','2009-10-00 00:00:00','1999-08-00 00:00:00'),(308,'zos','NASA','NASA_AVISO','2D','AVISO Sea Surface Height','Sea Surface Height',NULL,'CZ','AVISO','available on server','m',NULL,'Sea Surface Height','zos',11,NULL,'NASA/AVISO','2010-12-00 00:00:00','1992-10-00 00:00:00'),(309,'ohc700','NOAA','NOAA_NODC','2D','NODC Ocean Heat Content Anomaly within 700 m Depth','Ocean Heat Content Anomaly within 700 m Depth',NULL,'CZ','NODC','available on server','1e18 joules',NULL,'Ocean Heat Content Anomaly within 700 m Depth','ohc700',3,NULL,'NOAA/NODC','2012-12-00 00:00:00','1955-01-00 00:00:00'),(310,'ohc2000','NOAA','NOAA_NODC','2D','NODC Ocean Heat Content Anomaly within 2000 m Depth','Ocean Heat Content Anomaly within 2000 m Depth',NULL,'CZ','NODC','available on server','1e18 joules',NULL,'Ocean Heat Content Anomaly within 2000 m Depth','ohc2000',3,NULL,'NOAA/NODC','2012-12-00 00:00:00','2005-01-00 00:00:00'),(311,'rlds','NASA','NASA_CERES','2D','CERES Surface Downwelling Longwave Radiation','Surface Downwelling Longwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'Surface Downwelling Longwave Radiation','rlds',12,NULL,'NASA/CERES','2010-02-00 00:00:00','2000-03-00 00:00:00'),(312,'rsds','NASA','NASA_CERES','2D','CERES Surface Downwelling Shortwave Radiation','Surface Downwelling Shortwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'Surface Downwelling Shortwave Radiation','rsds',12,NULL,'NASA/CERES','2010-02-00 00:00:00','2000-03-00 00:00:00'),(313,'rlus','NASA','NASA_CERES','2D','CERES Surface Upwelling Longwave Radiation','Surface Upwelling Longwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'Surface Upwelling Longwave Radiation','rlus',12,NULL,'NASA/CERES','2010-02-00 00:00:00','2000-03-00 00:00:00'),(314,'rsus','NASA','NASA_CERES','2D','CERES Surface Upwelling Shortwave Radiation','Surface Upwelling Shortwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'Surface Upwelling Shortwave Radiation','rsus',12,NULL,'NASA/CERES','2010-02-00 00:00:00','2000-03-00 00:00:00'),(315,'rldscs','NASA','NASA_CERES','2D','CERES Surface Downwelling Clear-Sky Longwave Radiation','Surface Downwelling Clear-Sky Longwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Longwave Radiation','rldscs',12,NULL,'NASA/CERES','2010-02-00 00:00:00','2000-03-00 00:00:00'),(316,'rsdscs','NASA','NASA_CERES','2D','CERES Surface Downwelling Clear-Sky Shortwave Radiation','Surface Downwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'Surface Downwelling Clear-Sky Shortwave Radiation','rsdscs',12,NULL,'NASA/CERES','2010-02-00 00:00:00','2000-03-00 00:00:00'),(317,'rsuscs','NASA','NASA_CERES','2D','CERES Surface Upwelling Clear-Sky Shortwave Radiation','Surface Upwelling Clear-Sky Shortwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'Surface Upwelling Clear-Sky Shortwave Radiation','rsuscs',12,NULL,'NASA/CERES','2010-02-00 00:00:00','2000-03-00 00:00:00'),(318,'rsdt','NASA','NASA_CERES','2D','CERES TOA Incident Shortwave Radiation','TOA Incident Shortwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'TOA Incident Shortwave Radiation','rsdt',12,NULL,'NASA/CERES','2012-06-00 00:00:00','2000-03-00 00:00:00'),(319,'rlut','NASA','NASA_CERES','2D','CERES TOA Outgoing Longwave Radiation','TOA Outgoing Longwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'TOA Outgoing Longwave Radiation','rlut',12,NULL,'NASA/CERES','2012-06-00 00:00:00','2000-03-00 00:00:00'),(320,'rsut','NASA','NASA_CERES','2D','CERES TOA Outgoing Shortwave Radiation','TOA Outgoing Shortwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'TOA Outgoing Shortwave Radiation','rsut',12,NULL,'NASA/CERES','2012-06-00 00:00:00','2000-03-00 00:00:00'),(321,'rlutcs','NASA','NASA_CERES','2D','CERES TOA Outgoing Clear-Sky Longwave Radiation','TOA Outgoing Clear-Sky Longwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Longwave Radiation','rlutcs',12,NULL,'NASA/CERES','2012-06-00 00:00:00','2000-03-00 00:00:00'),(322,'rsutcs','NASA','NASA_CERES','2D','CERES TOA Outgoing Clear-Sky Shortwave Radiation','TOA Outgoing Clear-Sky Shortwave Radiation',NULL,'CZ','CERES','available on server','W m-2',NULL,'TOA Outgoing Clear-Sky Shortwave Radiation','rsutcs',12,NULL,'NASA/CERES','2012-06-00 00:00:00','2000-03-00 00:00:00'),(323,'tas','NASA','NASA_AIRS','2D','AIRS Near-Surface Air Temperature','Near-Surface Air Temperature',NULL,'CZ','AIRS','available on server','K',NULL,'Near-Surface Air Temperature','tas',4,NULL,'NASA/AIRS','2011-12-00 00:00:00','2002-09-00 00:00:00'),(324,'ta','NASA','NASA_AIRS','3D','AIRS Air Temperature','Air Temperature',NULL,'CZ','AIRS','available on server','K',NULL,'Air Temperature','ta',4,NULL,'NASA/AIRS','2011-05-00 00:00:00','2002-09-00 00:00:00'),(325,'hus','NASA','NASA_AIRS','3D','AIRS Specific Humidity','Specific Humidity',NULL,'CZ','AIRS','available on server','1',NULL,'Specific Humidity','hus',4,NULL,'NASA/AIRS','2011-05-00 00:00:00','2002-09-00 00:00:00'),(326,'ta','NASA','NASA_MLS','3D','MLS Air Temperature','Air Temperature',NULL,'CZ','MLS','available on server','K',NULL,'Air Temperature','ta',5,NULL,'NASA/MLS','2010-12-00 00:00:00','2004-08-00 00:00:00'),(327,'hus','NASA','NASA_MLS','3D','MLS Specific Humidity','Specific Humidity',NULL,'CZ','MLS','available on server','1',NULL,'Specific Humidity','hus',5,NULL,'NASA/MLS','2010-12-00 00:00:00','2004-08-00 00:00:00'),(328,'ot','ARGO','ARGO_ARGO','3D','ARGO Ocean Temperature','Ocean Temperature',NULL,'CZ','ARGO','available on server','K',NULL,'Ocean Temperature','ot',1,NULL,'ARGO/ARGO','2013-05-00 00:00:00','2001-01-00 00:00:00'),(329,'os','ARGO','ARGO_ARGO','3D','ARGO Ocean Salinity','Ocean Salinity',NULL,'CZ','ARGO','available on server','',NULL,'Ocean Salinity','os',1,NULL,'ARGO/ARGO','2013-05-00 00:00:00','2001-01-00 00:00:00'),(330,'clt','ECMWF','ECMWF_interim','2D','interim Total Cloud Fraction','Total Cloud Fraction',NULL,'CZ','interim','available on server','%',NULL,'Total Cloud Fraction','clt',25,NULL,'ECMWF/interim','2014-04-00 00:00:00','1979-01-00 00:00:00'),(331,'tos','ECMWF','ECMWF_interim','2D','interim Sea Surface Temperature','Sea Surface Temperature',NULL,'CZ','interim','available on server','K',NULL,'Sea Surface Temperature','tos',25,NULL,'ECMWF/interim','2014-02-00 00:00:00','1979-01-00 00:00:00'),(332,'uas','ECMWF','ECMWF_interim','2D','interim Eastward Near-Surface Wind','Eastward Near-Surface Wind',NULL,'CZ','interim','available on server','m s-1',NULL,'Eastward Near-Surface Wind','uas',25,NULL,'ECMWF/interim','2014-12-00 00:00:00','1995-01-00 00:00:00'),(333,'vas','ECMWF','ECMWF_interim','2D','interim Northward Near-Surface Wind','Northward Near-Surface Wind',NULL,'CZ','interim','available on server','m s-1',NULL,'Northward Near-Surface Wind','vas',25,NULL,'ECMWF/interim','2014-12-00 00:00:00','1995-01-00 00:00:00'),(334,'sfcWind','ECMWF','ECMWF_interim','2D','interim Near-Surface Wind Speed','Near-Surface Wind Speed',NULL,'CZ','interim','available on server','m s-1',NULL,'Near-Surface Wind Speed','sfcWind',25,NULL,'ECMWF/interim','2014-12-00 00:00:00','1995-01-00 00:00:00'),(335,'wap','ECMWF','ECMWF_interim','3D','interim Vertical Wind Velocity','Vertical Wind Velocity',NULL,'CZ','interim','available on server','m s-1',NULL,'Vertical Wind Velocity','wap',25,NULL,'ECMWF/interim','2014-02-00 00:00:00','1979-01-00 00:00:00'),(336,'hur','ECMWF','ECMWF_interim','3D','interim Relative Humidity','Relative Humidity',NULL,'CZ','interim','available on server','%',NULL,'Relative Humidity','hur',25,NULL,'ECMWF/interim','2014-02-00 00:00:00','1979-01-00 00:00:00');
/*!40000 ALTER TABLE `Dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DatasetAndService`
--

DROP TABLE IF EXISTS `DatasetAndService`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatasetAndService` (
  `datasetId` bigint(20) NOT NULL,
  `climateServiceId` bigint(20) NOT NULL,
  KEY `FK_6p60kv2w7e024lsmb1t62ig3t` (`climateServiceId`),
  KEY `FK_kun7pek776x1b9auplo9wqpft` (`datasetId`),
  CONSTRAINT `FK_6p60kv2w7e024lsmb1t62ig3t` FOREIGN KEY (`climateServiceId`) REFERENCES `ClimateService` (`id`),
  CONSTRAINT `FK_kun7pek776x1b9auplo9wqpft` FOREIGN KEY (`datasetId`) REFERENCES `Dataset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatasetAndService`
--

LOCK TABLES `DatasetAndService` WRITE;
/*!40000 ALTER TABLE `DatasetAndService` DISABLE KEYS */;
/*!40000 ALTER TABLE `DatasetAndService` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DatasetEntry`
--

DROP TABLE IF EXISTS `DatasetEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatasetEntry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `latestAccessTimeStamp` datetime DEFAULT NULL,
  `registerNote` varchar(255) DEFAULT NULL,
  `registerTimeStamp` datetime DEFAULT NULL,
  `versionNo` varchar(255) DEFAULT NULL,
  `datasetId` bigint(20) NOT NULL,
  `registorId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_itx9dqsd7u40a8yqneuf8eqkt` (`datasetId`),
  KEY `FK_4buclln5u42iy9dull0fkuj2l` (`registorId`),
  CONSTRAINT `FK_4buclln5u42iy9dull0fkuj2l` FOREIGN KEY (`registorId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_itx9dqsd7u40a8yqneuf8eqkt` FOREIGN KEY (`datasetId`) REFERENCES `Dataset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatasetEntry`
--

LOCK TABLES `DatasetEntry` WRITE;
/*!40000 ALTER TABLE `DatasetEntry` DISABLE KEYS */;
/*!40000 ALTER TABLE `DatasetEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DatasetLog`
--

DROP TABLE IF EXISTS `DatasetLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DatasetLog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataUrl` varchar(255) DEFAULT NULL,
  `plotUrl` varchar(255) DEFAULT NULL,
  `dataSetId` bigint(20) NOT NULL,
  `originalDatasetId` bigint(20) NOT NULL,
  `outputDatasetId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8qcp27u950bwk18esghybcm6y` (`dataSetId`),
  KEY `FK_1fdrm9s5nx4f9l28kfr34lhwc` (`originalDatasetId`),
  KEY `FK_e25yurslvvvtmiivvg830mvvg` (`outputDatasetId`),
  CONSTRAINT `FK_1fdrm9s5nx4f9l28kfr34lhwc` FOREIGN KEY (`originalDatasetId`) REFERENCES `Dataset` (`id`),
  CONSTRAINT `FK_8qcp27u950bwk18esghybcm6y` FOREIGN KEY (`dataSetId`) REFERENCES `Dataset` (`id`),
  CONSTRAINT `FK_e25yurslvvvtmiivvg830mvvg` FOREIGN KEY (`outputDatasetId`) REFERENCES `Dataset` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DatasetLog`
--

LOCK TABLES `DatasetLog` WRITE;
/*!40000 ALTER TABLE `DatasetLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `DatasetLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Followers`
--

DROP TABLE IF EXISTS `Followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Followers` (
  `userId` bigint(20) NOT NULL,
  `followerId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`followerId`),
  KEY `FK_qgh5s13pp9gd38a60q7udwjv5` (`followerId`),
  CONSTRAINT `FK_nu39jm3pscfg99xxpmcd23p22` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_qgh5s13pp9gd38a60q7udwjv5` FOREIGN KEY (`followerId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Followers`
--

LOCK TABLES `Followers` WRITE;
/*!40000 ALTER TABLE `Followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GoupAndGroupmembers`
--

DROP TABLE IF EXISTS `GoupAndGroupmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GoupAndGroupmembers` (
  `groupId` bigint(20) NOT NULL,
  `member` bigint(20) NOT NULL,
  KEY `FK_ignjkbu83bic43jh0ey3jxsml` (`member`),
  KEY `FK_fu7i87y3vpte63gtoogncyftb` (`groupId`),
  CONSTRAINT `FK_fu7i87y3vpte63gtoogncyftb` FOREIGN KEY (`groupId`) REFERENCES `GroupUsers` (`id`),
  CONSTRAINT `FK_ignjkbu83bic43jh0ey3jxsml` FOREIGN KEY (`member`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GoupAndGroupmembers`
--

LOCK TABLES `GoupAndGroupmembers` WRITE;
/*!40000 ALTER TABLE `GoupAndGroupmembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `GoupAndGroupmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupUsers`
--

DROP TABLE IF EXISTS `GroupUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GroupUsers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `creatorUser` bigint(20) NOT NULL,
  `groupDescription` varchar(255) DEFAULT NULL,
  `groupName` varchar(255) DEFAULT NULL,
  `groupUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupUsers`
--

LOCK TABLES `GroupUsers` WRITE;
/*!40000 ALTER TABLE `GroupUsers` DISABLE KEYS */;
/*!40000 ALTER TABLE `GroupUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instrument`
--

DROP TABLE IF EXISTS `Instrument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Instrument` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `launchDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instrument`
--

LOCK TABLES `Instrument` WRITE;
/*!40000 ALTER TABLE `Instrument` DISABLE KEYS */;
INSERT INTO `Instrument` VALUES (1,NULL,NULL,'ARGO'),(2,NULL,NULL,'GRACE'),(3,NULL,NULL,'NODC'),(4,NULL,NULL,'AIRS'),(5,NULL,NULL,'MLS'),(6,NULL,NULL,'MODIS'),(7,NULL,NULL,'TRMM'),(8,NULL,NULL,'GPCP'),(9,NULL,NULL,'AMSRE'),(10,NULL,NULL,'QuikSCAT'),(11,NULL,NULL,'AVISO'),(12,NULL,NULL,'CERES'),(13,NULL,NULL,'CAM5'),(14,NULL,NULL,'CANAM4'),(15,NULL,NULL,'CM3'),(16,NULL,NULL,'CM5A-LR'),(17,NULL,NULL,'E2-H'),(18,NULL,NULL,'E2-R'),(19,NULL,NULL,'ESM2G'),(20,NULL,NULL,'HadGEM2-A'),(21,NULL,NULL,'HadGEM2-ES'),(22,NULL,NULL,'MIROC5'),(23,NULL,NULL,'MK3.6'),(24,NULL,NULL,'NORESM'),(25,NULL,NULL,'interim');
/*!40000 ALTER TABLE `Instrument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mail`
--

DROP TABLE IF EXISTS `Mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fromUserMail` varchar(255) DEFAULT NULL,
  `mailContent` varchar(255) DEFAULT NULL,
  `mailDate` datetime DEFAULT NULL,
  `mailTitle` varchar(255) DEFAULT NULL,
  `readStatus` bit(1) NOT NULL,
  `toUserMail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mail`
--

LOCK TABLES `Mail` WRITE;
/*!40000 ALTER TABLE `Mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parameter`
--

DROP TABLE IF EXISTS `Parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parameter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataRange` varchar(255) DEFAULT NULL,
  `indexInService` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `rule` varchar(255) DEFAULT NULL,
  `serviceId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2dy806x79j22t7i4rbdpeldof` (`serviceId`),
  CONSTRAINT `FK_2dy806x79j22t7i4rbdpeldof` FOREIGN KEY (`serviceId`) REFERENCES `ClimateService` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parameter`
--

LOCK TABLES `Parameter` WRITE;
/*!40000 ALTER TABLE `Parameter` DISABLE KEYS */;
INSERT INTO `Parameter` VALUES (1,'NORANGE',1,'data source','data source','rule',2),(2,'NORANGE',2,'variable name','variable name','rule',2),(3,'NORANGE',3,'start year-month','start year-month','rule',2),(4,'NORANGE',4,'end year-month','end year-month','rule',2),(5,'NORANGE',5,'select months','select months','rule',2),(6,'NORANGE',6,'start lat (deg)','start lat (deg)','rule',2),(7,'NORANGE',7,'end lat (deg)','end lat (deg)','rule',2),(8,'NORANGE',8,'variable scale','variable scale','rule',2),(9,'norange',1,'model','model','rule',1),(10,'norange',2,'var','var','rule',1),(11,'norange',3,'startT','startT','rule',1),(12,'norange',4,'endT','endT','rule',1),(13,'norange',5,'months','months','rule',1),(14,'norange',6,'lat1','lat1','rule',1),(15,'norange',7,'lat2','lat2','rule',1),(16,'norange',8,'lon1','lon1','rule',1),(17,'norange',9,'lon2','lon2','rule',1),(18,'norange',10,'scale','scale','rule',1),(19,'NORANGE',1,'model','model','rule',3),(20,'NORANGE',2,'var','var','rule',3),(21,'NORANGE',3,'startT','startT','rule',3),(22,'NORANGE',4,'endT','endT','rule',3),(23,'NORANGE',5,'lon1','lon1','rule',3),(24,'NORANGE',6,'lon2','lon2','rule',3),(25,'NORANGE',7,'lat1','lat1','rule',3),(26,'NORANGE',8,'lat2','lat2','rule',3),(27,'NORANGE',9,'scale','scale','rule',3),(28,'NORANGE',1,'model','model','rule',4),(29,'NORANGE',2,'var','var','rule',4),(30,'NORANGE',3,'startT','startT','rule',4),(31,'NORANGE',4,'endT','endT','rule',4),(32,'NORANGE',5,'pr','pr','rule',4),(33,'NORANGE',6,'lon1','lon1','rule',4),(34,'NORANGE',7,'lon2','lon2','rule',4),(35,'NORANGE',8,'lat1','lat1','rule',4),(36,'NORANGE',9,'lat2','lat2','rule',4),(37,'NORANGE',10,'months','months','rule',4),(38,'NORANGE',11,'scale','scale','rule',4),(39,'NORANGE',1,'model','model','rule',5),(40,'NORANGE',2,'var','var','rule',5),(41,'NORANGE',3,'startT','startT','rule',5),(42,'NORANGE',4,'endT','endT','rule',5),(43,'NORANGE',5,'lat1','lat1','rule',5),(44,'NORANGE',6,'lat2','lat2','rule',5),(45,'NORANGE',7,'pres1','pres1','rule',5),(46,'NORANGE',8,'pres2','pres2','rule',5),(47,'NORANGE',9,'months','months','rule',5),(48,'NORANGE',10,'scale','scale','rule',5),(49,'NORANGE',1,'model','model','rule',6),(50,'NORANGE',2,'var','var','rule',6),(51,'NORANGE',3,'startT','startT','rule',6),(52,'NORANGE',4,'endT','endT','rule',6),(53,'NORANGE',5,'lon1','lon1','rule',6),(54,'NORANGE',6,'lon2','lon2','rule',6),(55,'NORANGE',7,'lat1','lat1','rule',6),(56,'NORANGE',8,'lat2','lat2','rule',6),(57,'NORANGE',9,'months','months','rule',6),(58,'NORANGE',10,'scale','scale','rule',6),(59,'NORANGE',1,'model1','model1','rule',7),(60,'NORANGE',2,'model2','model2','rule',7),(61,'NORANGE',3,'var1','var1','rule',7),(62,'NORANGE',4,'var2','var2','rule',7),(63,'NORANGE',5,'pres1','pre1','rule',7),(64,'NORANGE',6,'pres2','pre2','rule',7),(65,'NORANGE',7,'startT','startT','rule',7),(66,'NORANGE',8,'endT','endT','rule',7),(67,'NORANGE',9,'lon1','lon1','rule',7),(68,'NORANGE',10,'lon2','lon2','rule',7),(69,'NORANGE',11,'lat1','lat1','rule',7),(70,'NORANGE',12,'lat2','lat2','rule',7),(71,'NORANGE',13,'nSample','nSample','rule',7),(72,'NORANGE',1,'model1','model1','rule',8),(73,'NORANGE',2,'model2','model2','rule',8),(74,'NORANGE',3,'var1','var1','rule',8),(75,'NORANGE',4,'var2','var2','rule',8),(76,'NORANGE',5,'pres1','pre1','rule',8),(77,'NORANGE',6,'pres2','pre2','rule',8),(78,'NORANGE',7,'startT','startT','rule',8),(79,'NORANGE',8,'endT','endT','rule',8),(80,'NORANGE',9,'lon1','lon1','rule',8),(81,'NORANGE',10,'lon2','lon2','rule',8),(82,'NORANGE',11,'lat1','lat1','rule',8),(83,'NORANGE',12,'lat2','lat2','rule',8),(84,'NORANGE',1,'model1','model1','rule',9),(85,'NORANGE',2,'model2','model2','rule',9),(86,'NORANGE',3,'var1','var1','rule',9),(87,'NORANGE',4,'var2','var2','rule',9),(88,'NORANGE',5,'pres1','pre1','rule',9),(89,'NORANGE',6,'pres2','pre2','rule',9),(90,'NORANGE',7,'startT','startT','rule',9),(91,'NORANGE',8,'endT','endT','rule',9),(92,'NORANGE',9,'lon1','lon1','rule',9),(93,'NORANGE',10,'lon2','lon2','rule',9),(94,'NORANGE',11,'lat1','lat1','rule',9),(95,'NORANGE',12,'lat2','lat2','rule',9),(96,'NORANGE',13,'months','months','rule',9),(97,'NORANGE',14,'bin_min','bin_min','rule',9),(98,'NORANGE',15,'bin_max','bin_max','rule',9),(99,'NORANGE',16,'bin_n','bin_n','rule',9),(100,'NORANGE',17,'env_var_plev','env_var_plev','rule',9),(101,'NORANGE',18,'displayOpt','displayOpt','rule',9),(102,'NORANGE',1,'model','model','rule',12),(103,'NORANGE',2,'var','var','rule',12),(104,'NORANGE',3,'startT','startT','rule',12),(105,'NORANGE',4,'endT','endT','rule',12),(106,'NORANGE',5,'lon1','lon1','rule',12),(107,'NORANGE',6,'lon2','lon2','rule',12),(108,'NORANGE',7,'dlon','dlon','rule',12),(109,'NORANGE',8,'lat1','lat1','rule',12),(110,'NORANGE',9,'lat2','lat2','rule',12),(111,'NORANGE',10,'dlat','dlat','rule',12),(112,'NORANGE',11,'plev','plev','rule',12),(113,'NORANGE',1,'model1','model1','rule',11),(114,'NORANGE',2,'model2','model2','rule',11),(115,'NORANGE',3,'var1','var1','rule',11),(116,'NORANGE',4,'var2','var2','rule',11),(117,'NORANGE',5,'pres1','pres1','rule',11),(118,'NORANGE',6,'pres2','pres2','rule',11),(119,'NORANGE',7,'startT','startT','rule',11),(120,'NORANGE',8,'endT','endT','rule',11),(121,'NORANGE',9,'lon1','lon1','rule',11),(122,'NORANGE',10,'lon2','lon2','rule',11),(123,'NORANGE',11,'lat1','lat1','rule',11),(124,'NORANGE',12,'lat2','lat2','rule',11),(125,'NORANGE',13,'laggedTime','laggedTime','rule',11),(126,'NORANGE',1,'model1','model1','rule',10),(127,'NORANGE',2,'var1','var1','rule',10),(128,'NORANGE',3,'startT','startT','rule',10),(129,'NORANGE',4,'endT','endT','rule',10),(130,'NORANGE',5,'lon1','lon1','rule',10),(131,'NORANGE',6,'lon2','lon2','rule',10),(132,'NORANGE',7,'lat1','lat1','rule',10),(133,'NORANGE',8,'lat2','lat2','rule',10),(134,'NORANGE',9,'pres1','pres1','rule',10),(135,'NORANGE',10,'pres2','pres2','rule',10),(136,'NORANGE',11,'months','months','rule',10),(137,'NORANGE',12,'model2','model2','rule',10),(138,'NORANGE',13,'var2','var2','rule',10),(139,'NORANGE',23,'model3','model3','rule',10),(140,'NORANGE',24,'var3','var3','rule',10),(141,'NORANGE',14,'bin_min1','bin_min1','rule',10),(142,'NORANGE',15,'bin_max1','bin_max1','rule',10),(143,'NORANGE',16,'bin_n1','bin_n1','rule',10),(144,'NORANGE',17,'env_var_plev1','env_var_plev1','rule',10),(145,'NORANGE',18,'bin_min2','bin_min2','rule',10),(146,'NORANGE',19,'bin_max2','bin_max2','rule',10),(147,'NORANGE',20,'bin_n2','bin_n2','rule',10),(148,'NORANGE',21,'env_var_plev2','env_var_plev2','rule',10),(149,'NORANGE',22,'displayOpt','displayOpt','rule',10);
/*!40000 ALTER TABLE `Parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reply`
--

DROP TABLE IF EXISTS `Reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `fromId` bigint(20) DEFAULT NULL,
  `toId` bigint(20) DEFAULT NULL,
  `ReplyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s5pwr6ms4uos72doove914pop` (`fromId`),
  KEY `FK_9gkxrpshkt1kxvah4ps39u61x` (`toId`),
  KEY `FK_snmda8b4vprb57xlpgb2tyh44` (`ReplyId`),
  CONSTRAINT `FK_9gkxrpshkt1kxvah4ps39u61x` FOREIGN KEY (`toId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_s5pwr6ms4uos72doove914pop` FOREIGN KEY (`fromId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_snmda8b4vprb57xlpgb2tyh44` FOREIGN KEY (`ReplyId`) REFERENCES `Comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reply`
--

LOCK TABLES `Reply` WRITE;
/*!40000 ALTER TABLE `Reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceEntry`
--

DROP TABLE IF EXISTS `ServiceEntry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceEntry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `latestAccessTimeStamp` datetime DEFAULT NULL,
  `registerNote` varchar(255) DEFAULT NULL,
  `registerTimeStamp` datetime DEFAULT NULL,
  `versionNo` varchar(255) DEFAULT NULL,
  `serviceId` bigint(20) DEFAULT NULL,
  `registorId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6gtyg2rmuamc303qi5bkn3lt3` (`serviceId`),
  KEY `FK_e2998aw52n95o5cedakjjhpvy` (`registorId`),
  CONSTRAINT `FK_6gtyg2rmuamc303qi5bkn3lt3` FOREIGN KEY (`serviceId`) REFERENCES `ClimateService` (`id`),
  CONSTRAINT `FK_e2998aw52n95o5cedakjjhpvy` FOREIGN KEY (`registorId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceEntry`
--

LOCK TABLES `ServiceEntry` WRITE;
/*!40000 ALTER TABLE `ServiceEntry` DISABLE KEYS */;
INSERT INTO `ServiceEntry` VALUES (1,1169,'2015-09-11 14:48:12','2-D-Variable-Map v1','2015-04-23 12:52:08','1',1,1),(2,202,'2015-09-11 14:51:05','2-D-Variable-Zonal-Mean v1','2015-04-23 12:55:44','1',2,1),(3,280,'2015-09-11 14:52:10','2-D-Variable-Time-Series v1','2015-04-23 12:56:08','1',3,1),(4,338,'2015-09-11 14:53:53','3-D-Variable-2-D-Slice v1','2015-04-23 12:56:39','1',4,1),(5,348,'2015-09-11 14:57:55','3-D-Variable-Zonal-Mean v1','2015-04-23 12:57:07','1',5,1),(6,97,'2015-09-11 14:59:17','3-D-Variable-Average-Vertical-4Profile v1','2015-04-23 12:57:30','1',6,1),(7,294,'2015-09-11 15:05:14','Scatter-and-Histogram-Plot-of-Two-Variables v1','2015-04-23 12:57:51','1',7,1),(8,378,'2015-09-11 15:13:54','Difference-Plot-of-Two-Time-Averaged-Variables v1','2015-04-23 12:58:15','1',8,1),(9,312,'2015-09-11 15:29:57','Conditional-Sampling v1','2015-04-23 12:58:39','1',9,1),(10,0,'2015-03-05 12:32:29','ClimateService Name: 2-D-Variable-Map, VersionNo: 2','2015-03-05 12:32:29','2',1,1),(11,0,'2015-03-05 12:32:29','ClimateService Name: 2-D-Variable-Map, VersionNo: 1','2015-03-05 12:32:29','1',1,1),(12,164,'2015-09-02 15:05:27','Regrid-and-Download','2015-07-31 12:32:29','1',10,1),(13,430,'2015-09-11 15:28:03','Time-Lagged-Correlation-Map-of-Two-Variables','2015-08-21 12:32:29','1',11,1),(14,222,'2015-09-04 16:40:16','Conditional-Sampling-for-2-Variables','2015-08-24 12:32:29','1',12,1);
/*!40000 ALTER TABLE `ServiceEntry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suggestions`
--

DROP TABLE IF EXISTS `Suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suggestions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `suggestionContent` varchar(255) DEFAULT NULL,
  `suggestionCreator` bigint(20) NOT NULL,
  `suggestionTag` varchar(255) DEFAULT NULL,
  `suggestionVotes` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suggestions`
--

LOCK TABLES `Suggestions` WRITE;
/*!40000 ALTER TABLE `Suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuggestionsAndWorkflows`
--

DROP TABLE IF EXISTS `SuggestionsAndWorkflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuggestionsAndWorkflows` (
  `suggestionId` bigint(20) NOT NULL,
  `workflowId` bigint(20) NOT NULL,
  KEY `FK_syi0s1h7hprguacof1dmlcxur` (`workflowId`),
  KEY `FK_j5u7kkx55vboam8pt8an4cv3g` (`suggestionId`),
  CONSTRAINT `FK_j5u7kkx55vboam8pt8an4cv3g` FOREIGN KEY (`suggestionId`) REFERENCES `Suggestions` (`id`),
  CONSTRAINT `FK_syi0s1h7hprguacof1dmlcxur` FOREIGN KEY (`workflowId`) REFERENCES `Workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuggestionsAndWorkflows`
--

LOCK TABLES `SuggestionsAndWorkflows` WRITE;
/*!40000 ALTER TABLE `SuggestionsAndWorkflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuggestionsAndWorkflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (1,'shim'),(2,'gene'),(3,'expression'),(4,'affmetrix'),(5,'pathway-driven'),(6,'data-driven'),(7,'kegg'),(8,'mouse'),(9,'uniprot'),(10,'cel'),(11,'file'),(12,'genotype'),(13,'phenotype'),(14,'disease'),(15,'nbiconworkflows'),(16,'microarray'),(17,'RNA');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `faxNumber` varchar(255) DEFAULT NULL,
  `highestDegree` varchar(255) DEFAULT NULL,
  `mailingAddress` varchar(255) DEFAULT NULL,
  `middleInitial` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `researchFields` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'admin','user',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'admin',NULL,'\0'),(2,'Cyril','Aquilin-Germineaud',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'caquilinger',NULL,'\0'),(3,'Joseph','Brodie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jbrodie',NULL,'\0'),(4,'Rebecca','Buchholz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rbuchholz',NULL,'\0'),(5,'Forest','Cannon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'fcannon',NULL,'\0'),(6,'Oscar','Chimborazo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ochimborazo',NULL,'\0'),(7,'Michal','Clavner',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mclavner',NULL,'\0'),(8,'Jake','Gristey',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jgristey',NULL,'\0'),(9,'Natalie','Kille',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'nkille',NULL,'\0'),(10,'Marianna','Linz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mlinz',NULL,'\0'),(11,'Elizabeth','Maroon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'emaroon',NULL,'\0'),(12,'Gustavo','Marques',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'gmarques',NULL,'\0'),(13,'Cristian','Martinez-Villalobos',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cmartinezvi',NULL,'\0'),(14,'Anna','Merrifield',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'amerrifield',NULL,'\0'),(15,'Jamiat','Nanteza',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jnanteza',NULL,'\0'),(16,'Kirstin','Neff',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kneff',NULL,'\0'),(17,'Federica','Polverari',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'fpolverari',NULL,'\0'),(18,'Marine','Roge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mroge',NULL,'\0'),(19,'Kathryn','Sauter',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ksauter',NULL,'\0'),(20,'Hsien-Liang','Tseng',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'htseng',NULL,'\0'),(21,'Ana','Beatriz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'abeatriz',NULL,'\0'),(22,'Ho-Hsuan','Wei',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hwei',NULL,'\0'),(23,'Kathleen','Willmot',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kwillmot',NULL,'\0'),(24,'David','Zermeno-Diaz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'dzermenodia',NULL,'\0'),(25,'Kai','Zhang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kzhang',NULL,'\0'),(26,'Lei','Pan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'lei',NULL,'\0'),(27,'Chengxing','Zhai',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'czhai',NULL,'\0'),(28,'Benyang','Tang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'btang',NULL,'\0'),(29,'Jia','Zhang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jzhang',NULL,'\0'),(30,'Wei','Wang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'wwang',NULL,'\0'),(31,'Xing','Wei',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'xwei',NULL,'\0'),(32,'Ian','Fenty',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ifenty',NULL,'\0'),(33,'Joao','Teixeira',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jteixeira',NULL,'\0'),(34,'Darren','Drewry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ddrewry',NULL,'\0'),(35,'Hui','Su',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hsu',NULL,'\0'),(36,'Konstantinos','Andreadis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'kandreadis',NULL,'\0'),(37,'Zhangfan','Xing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'zxing',NULL,'\0'),(38,'Terry','Kubar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'tkubar',NULL,'\0'),(39,'Jonathan','Jiang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jjiang',NULL,'\0'),(40,'Qihao','Bao',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'qbao',NULL,'\0'),(41,'Ming','Qi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mqi',NULL,'\0'),(42,'Ruoxiao','Wang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'rwang',NULL,'\0'),(43,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(44,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(45,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(46,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(47,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(48,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(49,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(50,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(51,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(52,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(53,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(54,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(55,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(56,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(57,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(58,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(59,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(60,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(61,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(62,'CCS student 10','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(63,'CCS student 10','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(64,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(65,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(66,'CCS student ','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(67,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(68,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(69,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(70,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(71,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(72,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(73,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(74,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(75,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(76,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(77,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(78,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(79,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(80,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(81,'CCS student 1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(82,'CCS student 12','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(83,'CCS student 1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(84,'CCS student 1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(85,'CCS student 123','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(86,'CCS student 12','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(87,'CCS student 12','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(88,'CCS student 12','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(89,'CCS student 12','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(90,'CCS student 121','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(91,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(92,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(93,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(94,'CCS student 2','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(95,'CCS student 1','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0'),(96,'Chenran','Gong','','','','','','','','','',NULL,NULL,NULL,'\0'),(97,'CCS student 2','','','','','','','','','','',NULL,NULL,NULL,'\0'),(98,'CCS student 5','','','','','','','','','','',NULL,NULL,NULL,'\0'),(99,'CCS student 5','','','','','','','','','','',NULL,NULL,NULL,'\0'),(100,'CCS student 1','','','','','','','','','','',NULL,NULL,NULL,'\0'),(101,'CCS student 2','','','','','','','','','','',NULL,NULL,NULL,'\0'),(102,'Chenran','Gong','','chenran.gong@sv.cmu.edu','','','','','','SOA','',NULL,NULL,NULL,'\0'),(103,'Chenran2','Em','','chenran.gong@sv.cmu.edu','','','','','','sss','','1234','',NULL,'\0'),(104,'222','','','666','','','','','','777','','test1','test0',NULL,'\0'),(106,'Wei','','','','','','','','','','','123','Wei',NULL,'\0'),(108,'ccc','eee','fff','ggg','','','','ddd','','hhh','','bbb','aaa',NULL,'\0'),(109,NULL,NULL,NULL,NULL,NULL,NULL,'test@gmail.com',NULL,NULL,NULL,NULL,'123',NULL,NULL,'\0'),(110,NULL,NULL,NULL,'m@m.m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'81dc9bdb52d04dc20036dbd8313ed055','Gavin','/assets/images/service.jpeg','\0');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Workflow`
--

DROP TABLE IF EXISTS `Workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Workflow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `edit` bit(1) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `userID` bigint(20) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `viewCount` bigint(20) NOT NULL,
  `wfCategory` varchar(255) DEFAULT NULL,
  `wfCode` varchar(255) DEFAULT NULL,
  `wfDate` datetime DEFAULT NULL,
  `wfDesc` longtext,
  `wfImg` varchar(255) DEFAULT NULL,
  `wfInput` varchar(255) DEFAULT NULL,
  `wfOutput` varchar(255) DEFAULT NULL,
  `wfTitle` varchar(255) DEFAULT NULL,
  `wfUrl` varchar(255) DEFAULT NULL,
  `wfVisibility` varchar(255) DEFAULT NULL,
  `creatorId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3b344sojaqbwl681a156kd3wq` (`creatorId`),
  CONSTRAINT `FK_3b344sojaqbwl681a156kd3wq` FOREIGN KEY (`creatorId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Workflow`
--

LOCK TABLES `Workflow` WRITE;
/*!40000 ALTER TABLE `Workflow` DISABLE KEYS */;
INSERT INTO `Workflow` VALUES (1,'\0',0,'norm',110,'Gavin',0,'MyExperiment','http://www.myexperiment.org/workflows/19/download/Mouse_Microarray_Analysis-v.xml','2016-04-02 02:07:54','This workflow takes in probesets from and AffyMetrix micorarray experiment and returns: the genes ; gene start and end positions; chromosome where genes reside; ensembl trasncripts; SwissProt ids; affy probeset identifiers for chips Mouse430_2 and Mouse430a_2. Example ids from the Mouse430_2 affymetrix array are as follows (newline separated): 1447227_at 1440624_at 1436240_at 1454904_at 1435665_at 1418148_at 1429831_at','http://www.myexperiment.org/workflows/19/versions/3/previews/full','Please Edit This Field','Please Edit This Field','Mouse Microarray Analysis','',NULL,110);
/*!40000 ALTER TABLE `Workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkflowAndContributors`
--

DROP TABLE IF EXISTS `WorkflowAndContributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkflowAndContributors` (
  `workflowId` bigint(20) NOT NULL,
  `contributorId` bigint(20) NOT NULL,
  KEY `FK_367p8b18y1cxkdic4syuihp5x` (`contributorId`),
  KEY `FK_p32eylwaqpcmj6vcojwe69udi` (`workflowId`),
  CONSTRAINT `FK_367p8b18y1cxkdic4syuihp5x` FOREIGN KEY (`contributorId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_p32eylwaqpcmj6vcojwe69udi` FOREIGN KEY (`workflowId`) REFERENCES `Workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkflowAndContributors`
--

LOCK TABLES `WorkflowAndContributors` WRITE;
/*!40000 ALTER TABLE `WorkflowAndContributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkflowAndContributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkflowAndRelated`
--

DROP TABLE IF EXISTS `WorkflowAndRelated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkflowAndRelated` (
  `workflowId` bigint(20) NOT NULL,
  `relatedId` bigint(20) NOT NULL,
  KEY `FK_pqkep7qljfigj5npokc28e92g` (`relatedId`),
  KEY `FK_8uyuy069qi35xvyjferw9h1bc` (`workflowId`),
  CONSTRAINT `FK_8uyuy069qi35xvyjferw9h1bc` FOREIGN KEY (`workflowId`) REFERENCES `Workflow` (`id`),
  CONSTRAINT `FK_pqkep7qljfigj5npokc28e92g` FOREIGN KEY (`relatedId`) REFERENCES `Workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkflowAndRelated`
--

LOCK TABLES `WorkflowAndRelated` WRITE;
/*!40000 ALTER TABLE `WorkflowAndRelated` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkflowAndRelated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkflowAndTags`
--

DROP TABLE IF EXISTS `WorkflowAndTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkflowAndTags` (
  `workflowId` bigint(20) NOT NULL,
  `tagId` bigint(20) NOT NULL,
  PRIMARY KEY (`workflowId`,`tagId`),
  KEY `FK_59b23dfaqyn9ldndg9prlnnhi` (`tagId`),
  CONSTRAINT `FK_59b23dfaqyn9ldndg9prlnnhi` FOREIGN KEY (`tagId`) REFERENCES `Tag` (`id`),
  CONSTRAINT `FK_aylx2jtd22frsdq1frgpfgxng` FOREIGN KEY (`workflowId`) REFERENCES `Workflow` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkflowAndTags`
--

LOCK TABLES `WorkflowAndTags` WRITE;
/*!40000 ALTER TABLE `WorkflowAndTags` DISABLE KEYS */;
INSERT INTO `WorkflowAndTags` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17);
/*!40000 ALTER TABLE `WorkflowAndTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendRequests`
--

DROP TABLE IF EXISTS `friendRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendRequests` (
  `userId` bigint(20) NOT NULL,
  `senderId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`senderId`),
  KEY `FK_k6ur89ph4k8af6hj7sbfuu8a8` (`senderId`),
  CONSTRAINT `FK_iun3hk4df9bl52mgbnq76b4i9` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_k6ur89ph4k8af6hj7sbfuu8a8` FOREIGN KEY (`senderId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendRequests`
--

LOCK TABLES `friendRequests` WRITE;
/*!40000 ALTER TABLE `friendRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friendship` (
  `userAId` bigint(20) NOT NULL,
  `userBId` bigint(20) NOT NULL,
  PRIMARY KEY (`userAId`,`userBId`),
  KEY `FK_coyphr7fwqn2sbhog9tfwm1ba` (`userBId`),
  CONSTRAINT `FK_coyphr7fwqn2sbhog9tfwm1ba` FOREIGN KEY (`userBId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_fob08lc6byjq2gn46wmaylohu` FOREIGN KEY (`userAId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-15 22:11:03
