CREATE DATABASE  IF NOT EXISTS `plms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `plms`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: plms
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `BranchNo` tinyint NOT NULL AUTO_INCREMENT,
  `Street` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Barangay` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Province` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ZipCode` char(4) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`BranchNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--


--
-- Table structure for table `creditcarddetail`
--

DROP TABLE IF EXISTS `creditcarddetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcarddetail` (
  `ApplicationNo` int NOT NULL,
  `Issuer` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `CreditLimit` int DEFAULT NULL,
  `CardNo` char(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Expiry` date DEFAULT NULL,
  KEY `uiApplicationNo` (`ApplicationNo`),
  CONSTRAINT `creditcarddetail_ibfk_1` FOREIGN KEY (`ApplicationNo`) REFERENCES `loanapplication` (`ApplicationNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcarddetail`
--


--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerNo` int NOT NULL AUTO_INCREMENT,
  `FName` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `MName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `LName` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Sex` enum('Male','Female','Unknown') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `CivilStatus` enum('Single','Married','Widow','Separated','Annuled') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DOB` date NOT NULL,
  `UMIDNo` char(13) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `TIN` char(12) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `MobileNo` char(12) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `EduAttainment` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `HomeOwnership` enum('Owned','Mortgaged','Rented','Used Free/Living With Parents/Relatives') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Street` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Barangay` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Province` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ZipCode` char(4) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`CustomerNo`),
  KEY `uiFullName` (`FName`,`MName`,`LName`),
  KEY `uiUMIDNO` (`UMIDNo`),
  KEY `uiMobileNo` (`MobileNo`),
  KEY `uiAddress` (`Street`,`Barangay`),
  KEY `uiZipCode` (`ZipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--


--
-- Table structure for table `decision`
--

DROP TABLE IF EXISTS `decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decision` (
  `DecisionNo` int NOT NULL AUTO_INCREMENT,
  `DocumentationNo` int NOT NULL,
  `ApplicationNo` int NOT NULL,
  `Decision` enum('Approved','Suspended','Rejected') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `TotalPmt` decimal(11,4) NOT NULL,
  `MonthlyPmt` decimal(11,4) NOT NULL,
  `InterestRate` decimal(5,4) NOT NULL,
  `LendingLimit` decimal(11,4) NOT NULL,
  PRIMARY KEY (`DecisionNo`),
  KEY `uiDocumentationNo` (`DocumentationNo`),
  KEY `uiApplicationNo` (`ApplicationNo`),
  KEY `uiDecision` (`Decision`),
  KEY `uiTotalPmt` (`TotalPmt`),
  KEY `uiMonthlyPmt` (`MonthlyPmt`),
  CONSTRAINT `decision_ibfk_1` FOREIGN KEY (`DocumentationNo`) REFERENCES `loandocumentation` (`DocumentationNo`) ON UPDATE CASCADE,
  CONSTRAINT `decision_ibfk_2` FOREIGN KEY (`ApplicationNo`) REFERENCES `loanapplication` (`ApplicationNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decision`
--


--
-- Table structure for table `disbursement`
--

DROP TABLE IF EXISTS `disbursement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disbursement` (
  `DisbursementNo` int NOT NULL AUTO_INCREMENT,
  `ApplicationNo` int NOT NULL,
  `ProvidedAccNo` char(19) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Amount` decimal(11,4) NOT NULL,
  `DateDisbursed` date NOT NULL,
  PRIMARY KEY (`DisbursementNo`),
  KEY `uiApplication` (`ApplicationNo`),
  CONSTRAINT `disbursement_ibfk_1` FOREIGN KEY (`ApplicationNo`) REFERENCES `loanapplication` (`ApplicationNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disbursement`
--


--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document` (
  `DocumentNo` int NOT NULL AUTO_INCREMENT,
  `CustomerNo` int NOT NULL,
  `LoanProcessorNo` int NOT NULL,
  `DocumentationNo` int NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DateSubmitted` date NOT NULL,
  UNIQUE KEY `uuiDocumentNo` (`DocumentNo`),
  KEY `uiCustomerNo` (`CustomerNo`),
  KEY `uiLoanProcessorNo` (`LoanProcessorNo`),
  KEY `uiDocumentationNo` (`DocumentationNo`),
  KEY `uiName` (`Name`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`CustomerNo`) REFERENCES `customer` (`CustomerNo`) ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_2` FOREIGN KEY (`LoanProcessorNo`) REFERENCES `staff` (`StaffNo`) ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk_3` FOREIGN KEY (`DocumentationNo`) REFERENCES `loandocumentation` (`DocumentationNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utiLoanProcessorOnly` BEFORE INSERT ON `document` FOR EACH ROW BEGIN
	IF NOT EXISTS (
		SELECT
			Position.*
       		FROM((Staff
			INNER JOIN Document ON Staff.StaffNo = Document.LoanProcessorNo)
            		INNER JOIN Position ON Staff.PositionNo = Position.PositionNo)
		WHERE (NEW.LoanProcessorNo = Staff.StaffNo AND Position.Position = 'Loan Processor'))
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'staff is not a loan processor'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utuLoanProcessorOnly` BEFORE UPDATE ON `document` FOR EACH ROW BEGIN
	IF NOT EXISTS (
		SELECT
			Position.*
        	FROM((Staff
			INNER JOIN Document ON Staff.StaffNo = Document.LoanProcessorNo)
            		INNER JOIN Position ON Staff.PositionNo = Position.PositionNo)
		WHERE (NEW.LoanProcessorNo = Staff.StaffNo AND Position.Position = 'Loan Processor'))
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'staff is not a loan processor'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employmentdetail`
--

DROP TABLE IF EXISTS `employmentdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employmentdetail` (
  `ApplicationNo` int NOT NULL,
  `EmploymentType` enum('Governemnt','Private','Self-Employed') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `CompanyName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `Occupation` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Street` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Barangay` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Province` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ZipCode` char(4) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `HROfficeNo` char(12) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `YearsEmployed` tinyint NOT NULL,
  KEY `uiApplicationNo` (`ApplicationNo`),
  CONSTRAINT `employmentdetail_ibfk_1` FOREIGN KEY (`ApplicationNo`) REFERENCES `loanapplication` (`ApplicationNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employmentdetail`
--


--
-- Table structure for table `existingloandetail`
--

DROP TABLE IF EXISTS `existingloandetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `existingloandetail` (
  `ApplicationNo` int NOT NULL,
  `CompanyName` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `LoanType` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `MonthlyPmt` decimal(11,4) NOT NULL,
  `RemainingBal` decimal(11,4) NOT NULL,
  KEY `uiApplicationNo` (`ApplicationNo`),
  CONSTRAINT `existingloandetail_ibfk_1` FOREIGN KEY (`ApplicationNo`) REFERENCES `loanapplication` (`ApplicationNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existingloandetail`
--


--
-- Table structure for table `loanapplication`
--

DROP TABLE IF EXISTS `loanapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanapplication` (
  `ApplicationNo` int NOT NULL AUTO_INCREMENT,
  `CustomerNo` int NOT NULL,
  `TermNo` tinyint NOT NULL,
  `LoanOfficerNo` int NOT NULL,
  `Amount` decimal(11,4) NOT NULL,
  `Purpose` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `GrossAnnualIncome` decimal(11,4) NOT NULL,
  `PrefBank` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DebtRatio` decimal(3,0) NOT NULL,
  `InitialStatus` enum('Approved','Rejected') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ProcessingFee` decimal(9,4) DEFAULT '0.0000',
  PRIMARY KEY (`ApplicationNo`),
  KEY `uiCustomerNo` (`CustomerNo`),
  KEY `uiTermNo` (`TermNo`),
  KEY `uiLoanOfficerNo` (`LoanOfficerNo`),
  KEY `uiAmount` (`Amount`),
  KEY `uiGAI` (`GrossAnnualIncome`),
  KEY `uiStatus` (`InitialStatus`),
  CONSTRAINT `loanapplication_ibfk_1` FOREIGN KEY (`CustomerNo`) REFERENCES `customer` (`CustomerNo`) ON UPDATE CASCADE,
  CONSTRAINT `loanapplication_ibfk_2` FOREIGN KEY (`TermNo`) REFERENCES `loanterm` (`TermNo`) ON UPDATE CASCADE,
  CONSTRAINT `loanapplication_ibfk_3` FOREIGN KEY (`LoanOfficerNo`) REFERENCES `staff` (`StaffNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanapplication`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utiOfficerOnly` BEFORE INSERT ON `loanapplication` FOR EACH ROW BEGIN
	IF NOT EXISTS (
		SELECT 
			Position.*
        	FROM((Staff
			INNER JOIN LoanApplication ON Staff.StaffNo = LoanApplication.LoanOfficerNo)
            	INNER JOIN Position ON Staff.PositionNo = Position.PositionNo)
			WHERE (NEW.LoanOfficerNo = Staff.StaffNo AND Position.Position = 'Loan Officer'))
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'value is not a loan officer'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utuOfficerOnly` BEFORE UPDATE ON `loanapplication` FOR EACH ROW BEGIN
	IF NOT EXISTS (
		SELECT 
			Position.*
        	FROM((Staff
			INNER JOIN LoanApplication ON Staff.StaffNo = LoanApplication.LoanOfficerNo)
           		 INNER JOIN Position ON Staff.PositionNo = Position.PositionNo)
		WHERE (NEW.LoanOfficerNo = Staff.StaffNo AND Position.Position = 'Loan Officer'))
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'staff is not a loan officer'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loandocumentation`
--

DROP TABLE IF EXISTS `loandocumentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loandocumentation` (
  `DocumentationNo` int NOT NULL AUTO_INCREMENT,
  `UnderwriterNo` int NOT NULL,
  `Grade` char(2) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`DocumentationNo`),
  KEY `uiUnderwriterNo` (`UnderwriterNo`),
  CONSTRAINT `loandocumentation_ibfk_1` FOREIGN KEY (`UnderwriterNo`) REFERENCES `staff` (`StaffNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loandocumentation`
--

/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utiUnderwriterOnly` BEFORE INSERT ON `loandocumentation` FOR EACH ROW BEGIN
	IF NOT EXISTS (
		SELECT
			Position.*
        	FROM((Staff
			INNER JOIN LoanDocumentation ON Staff.StaffNo = 							LoanDocumentation.UnderwriterNo)
           		INNER JOIN Position ON Staff.PositionNo = Position.PositionNo)
		WHERE (NEW.UnderwriterNo = Staff.StaffNo AND Position.Position = 'Underwriter'))
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'staff is not an underwriter'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `utuUnderwriterOnly` BEFORE UPDATE ON `loandocumentation` FOR EACH ROW BEGIN
	IF NOT EXISTS (
		SELECT
			Position.*
        	FROM((Staff
			INNER JOIN LoanDocumentation ON Staff.StaffNo = 							LoanDocumentation.UnderwriterNo)
           		 INNER JOIN Position ON Staff.PositionNo = Position.PositionNo)
		WHERE (NEW.UnderwriterNo = Staff.StaffNo AND Position.Position = 'Underwriter'))
    THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'staff is not an underwriter'; 
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `loanterm`
--

DROP TABLE IF EXISTS `loanterm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanterm` (
  `TermNo` tinyint NOT NULL AUTO_INCREMENT,
  `TermInMonths` smallint NOT NULL,
  PRIMARY KEY (`TermNo`),
  KEY `uiTerm` (`TermInMonths`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanterm`
--

INSERT INTO `loanterm` VALUES (1,12),(2,18),(3,24),(4,36);

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `PositionNo` smallint NOT NULL AUTO_INCREMENT,
  `Position` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`PositionNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

INSERT INTO `position` VALUES (1,'Branch Manager'),(2,'Loan Officer'),(3,'Loan Processor'),(4,'Underwriter');

--
-- Table structure for table `repayment`
--

DROP TABLE IF EXISTS `repayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repayment` (
  `RepaymentNo` int NOT NULL AUTO_INCREMENT,
  `ApplicationNo` int NOT NULL,
  `ScheduledDate` date NOT NULL,
  `MonthlyPmt` decimal(11,4) NOT NULL,
  `PenaltyAmount` decimal(8,4) NOT NULL,
  `TotalAmount` decimal(11,4) NOT NULL,
  `PmtMethod` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DatePaid` date NOT NULL,
  PRIMARY KEY (`RepaymentNo`),
  KEY `uiApplicationNo` (`ApplicationNo`),
  KEY `uiScheduledDate` (`ScheduledDate`),
  CONSTRAINT `repayment_ibfk_1` FOREIGN KEY (`ApplicationNo`) REFERENCES `loanapplication` (`ApplicationNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repayment`
--


--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffNo` int NOT NULL AUTO_INCREMENT,
  `BranchNo` tinyint NOT NULL,
  `PositionNo` smallint NOT NULL,
  `FName` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `MName` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `LName` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Salary` decimal(11,4) NOT NULL,
  `Sex` enum('Male','Female') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `CivilStatus` enum('Single','Married','Widow','Separated','Annuled') COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `MobileNo` char(12) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Street` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Barangay` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Province` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `ZipCode` char(4) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`StaffNo`),
  KEY `uiBranchNo` (`BranchNo`),
  KEY `uiPositionNo` (`PositionNo`),
  KEY `uiFullName` (`FName`,`MName`,`LName`),
  KEY `uiAddress` (`Street`,`Barangay`),
  KEY `uiZipCode` (`ZipCode`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`BranchNo`) REFERENCES `branch` (`BranchNo`) ON UPDATE CASCADE,
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`PositionNo`) REFERENCES `position` (`PositionNo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--


--
-- Temporary view structure for view `uvactiveloan`
--

DROP TABLE IF EXISTS `uvactiveloan`;
/*!50001 DROP VIEW IF EXISTS `uvactiveloan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `uvactiveloan` AS SELECT 
 1 AS `Customer No`,
 1 AS `Full Name`,
 1 AS `Application No`,
 1 AS `Start Date`,
 1 AS `End Date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `uvstaffdetails`
--

DROP TABLE IF EXISTS `uvstaffdetails`;
/*!50001 DROP VIEW IF EXISTS `uvstaffdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `uvstaffdetails` AS SELECT 
 1 AS `Full Name`,
 1 AS `Address`,
 1 AS `Position`,
 1 AS `Sex`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'plms'
--

--
-- Dumping routines for database 'plms'
--
/*!50003 DROP PROCEDURE IF EXISTS `uspCustomerReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspCustomerReport`(InputtedCustomerNo int)
BEGIN
	SELECT
		CustomerNo AS 'Customer No',
		CONCAT_WS(' ', FName, MName, LName) AS 'Full Name',
		UMIDNo AS 'UMID No',
		TIN AS 'TIN',
		Sex AS 'Sex',
		CONCAT_WS(' ', Street, Barangay, City, Province, ZipCode) AS 'Address',
		DOB AS 'DOB'
    
	FROM Customer
	WHERE (CustomerNo = InputtedCustomerNo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspLoanDetailsReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspLoanDetailsReport`(CustomerNo int)
BEGIN
	SELECT
		LoanApplication.CustomerNo AS 'Customer No',
		LoanTerm.TermInMonths AS 'Loan Term',
		LoanApplication.Amount AS 'Loan Amount',
		COALESCE(Decision.InterestRate, 0) AS 'Interest Rate',
		CONCAT_WS(' ', Customer.FName, Customer.MName, Customer.LName) AS 'Full Name',
		CONCAT_WS(' ', Customer.Street, Customer.Barangay, Customer.City, Customer.Province, 			Customer.ZipCode) AS 'Address',
		Customer.MobileNo AS 'Contact No'
	FROM (((LoanApplication
		INNER JOIN LoanTerm ON LoanApplication.TermNo = LoanTerm.TermNo)
		LEFT JOIN Decision ON LoanApplication.ApplicationNo = Decision.ApplicationNo)
		INNER JOIN Customer ON LoanApplication.CustomerNo = Customer.CustomerNo)
	WHERE (LoanApplication.CustomerNo = CustomerNo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `uspReceivedPaymentReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_520_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `uspReceivedPaymentReport`(CustomerNo int)
BEGIN
	SELECT
		Repayment.RepaymentNo AS 'Receipt No',
    		LoanApplication.CustomerNo AS 'Customer No',
    		Repayment.DatePaid AS 'Receipt Date',
   		Repayment.ScheduledDate AS 'Scheduled Date',
    		Repayment.TotalAmount AS 'Repayment Amount',
    		Repayment.PenaltyAmount AS 'Penalty Charge',
    		Repayment.TotalAmount AS 'Total Amount'
	FROM (Repayment RIGHT JOIN LoanApplication ON Repayment.ApplicationNo = 					LoanApplication.ApplicationNo)
	WHERE (LoanApplication.CustomerNo = CustomerNo AND Repayment.RepaymentNo IS NOT NULL);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `uvactiveloan`
--

/*!50001 DROP VIEW IF EXISTS `uvactiveloan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_520_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `uvactiveloan` AS select `customer`.`CustomerNo` AS `Customer No`,concat_ws(' ',`customer`.`FName`,`customer`.`MName`,`customer`.`LName`) AS `Full Name`,`loanapplication`.`ApplicationNo` AS `Application No`,`disbursement`.`DateDisbursed` AS `Start Date`,(select (`disbursement`.`DateDisbursed` + interval `loanterm`.`TermInMonths` month)) AS `End Date` from (((`loanapplication` join `customer` on((`loanapplication`.`CustomerNo` = `customer`.`CustomerNo`))) left join `disbursement` on((`loanapplication`.`ApplicationNo` = `disbursement`.`ApplicationNo`))) join `loanterm` on((`loanapplication`.`TermNo` = `loanterm`.`TermNo`))) where ((`disbursement`.`DateDisbursed` + interval `loanterm`.`TermInMonths` month) > now()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `uvstaffdetails`
--

/*!50001 DROP VIEW IF EXISTS `uvstaffdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_520_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `uvstaffdetails` AS select concat_ws(' ',`staff`.`FName`,`staff`.`MName`,`staff`.`LName`) AS `Full Name`,concat_ws(' ',`staff`.`Street`,`staff`.`Barangay`,`staff`.`City`,`staff`.`Province`,`staff`.`ZipCode`) AS `Address`,'Position' AS `Position`,`staff`.`Sex` AS `Sex` from `staff` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
