CREATE DATABASE  IF NOT EXISTS `Finance_DW` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Finance_DW`;
-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Finance_DW
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Customer_SK` int(11) NOT NULL,
  `PEC_CustomerID` int(11) DEFAULT NULL,
  `TPCE_CustomerID` int(11) DEFAULT NULL,
  `TPCW_CustomerID` int(11) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `CustomerType` varchar(45) DEFAULT NULL,
  `Address_1` varchar(50) DEFAULT NULL,
  `Address_2` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` char(5) DEFAULT NULL,
  PRIMARY KEY (`Customer_SK`),
  KEY `Customer_SK` (`Customer_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Date`
--

DROP TABLE IF EXISTS `Date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Date` (
  `Date_SK` int(11) NOT NULL,
  `Date_NK` date DEFAULT NULL,
  `CalendarYear` smallint(6) DEFAULT NULL,
  `CalendarQuarter` tinyint(4) DEFAULT NULL,
  `CalendarMonth` tinyint(4) DEFAULT NULL,
  `CalendarWeek` tinyint(4) DEFAULT NULL,
  `FiscalYear` smallint(6) DEFAULT NULL,
  `FiscalQuarter` tinyint(4) DEFAULT NULL,
  `FiscalMonth` tinyint(4) DEFAULT NULL,
  `FiscalWeek` tinyint(4) DEFAULT NULL,
  `Day` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Date_SK`),
  KEY `Date_SK` (`Date_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Method`
--

DROP TABLE IF EXISTS `Method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Method` (
  `Method_SK` int(11) NOT NULL,
  `ShippingMethod` varchar(10) DEFAULT NULL,
  `OrderMethod` varchar(10) DEFAULT NULL,
  `PaymentMethod` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Method_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `Product_SK` int(11) NOT NULL,
  `PEC_ProductID` int(11) DEFAULT NULL,
  `TPCE_ProductID` int(11) DEFAULT NULL,
  `TPCW_ProductID` int(11) DEFAULT NULL,
  `ProductName` varchar(45) DEFAULT NULL,
  `ProductType_ID` int(11) DEFAULT NULL,
  `ProductDescription` varchar(50) DEFAULT NULL,
  `Price1` decimal(10,2) DEFAULT NULL,
  `Price2` decimal(10,2) DEFAULT NULL,
  `UnitCost` decimal(10,2) DEFAULT NULL,
  `BU_ID` varchar(1) DEFAULT NULL,
  `BU_Name` varchar(45) DEFAULT NULL,
  `BU_Abbrev` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Product_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `Supplier_SK` int(11) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `SupplierName` varchar(50) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `Zip` char(5) DEFAULT NULL,
  PRIMARY KEY (`Supplier_SK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales_fact`
--

DROP TABLE IF EXISTS `sales_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales_fact` (
  `Customer_SK` int(11) NOT NULL,
  `Product_SK` int(11) NOT NULL,
  `Supplier_SK` int(11) NOT NULL,
  `SalesDate_SK` int(11) NOT NULL,
  `OrderDate_SK` int(11) NOT NULL,
  `Method_SK` int(11) NOT NULL,
  `InvoiceID_DD` int(11) NOT NULL,
  `Division` varchar(20) NOT NULL,
  `Quantity` decimal(8,2) DEFAULT NULL,
  `Sales_Amount` decimal(12,2) DEFAULT NULL,
  `Number_of_days` int(11) DEFAULT NULL,
  `ShippingCost` decimal(10,2) DEFAULT NULL,
  `Total_Amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`InvoiceID_DD`,`Division`,`Customer_SK`,`SalesDate_SK`,`Supplier_SK`,`Method_SK`,`Product_SK`,`OrderDate_SK`),
  KEY `method_fk` (`Method_SK`),
  KEY `orderDate_fk` (`OrderDate_SK`),
  KEY `prod_fk` (`Product_SK`),
  KEY `salesDate_fk` (`SalesDate_SK`),
  KEY `supplier_fk` (`Supplier_SK`),
  KEY `Customer_SK` (`Customer_SK`,`SalesDate_SK`,`Supplier_SK`,`Method_SK`,`Product_SK`,`OrderDate_SK`),
  CONSTRAINT `cust_fk` FOREIGN KEY (`Customer_SK`) REFERENCES `Customer` (`Customer_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `method_fk` FOREIGN KEY (`Method_SK`) REFERENCES `Method` (`Method_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `orderDate_fk` FOREIGN KEY (`OrderDate_SK`) REFERENCES `Date` (`Date_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prod_fk` FOREIGN KEY (`Product_SK`) REFERENCES `Product` (`Product_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `salesDate_fk` FOREIGN KEY (`SalesDate_SK`) REFERENCES `Date` (`Date_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `supplier_fk` FOREIGN KEY (`Supplier_SK`) REFERENCES `Supplier` (`Supplier_SK`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-04 18:44:35
