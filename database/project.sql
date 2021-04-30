-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 29, 2021 at 10:21 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `storageprovider`
--

DROP TABLE IF EXISTS `storage_provider`;
CREATE TABLE IF NOT EXISTS `storage_provider` (
  `Storage_Provider_ID` int(11) NOT NULL,
  CONSTRAINT PK_STORAGE_PROVIDER PRIMARY KEY (`Storage_Provider_ID`)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `government`
--

DROP TABLE IF EXISTS `government`;
CREATE TABLE IF NOT EXISTS `government` (
  `Gov_ID` int(11) NOT NULL,
  `Storage_Provider_ID` int(11) NOT NULL,
  PRIMARY KEY (`Gov_ID`),
  FOREIGN KEY (Storage_Provider_ID) REFERENCES storage_provider(Storage_Provider_ID)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
CREATE TABLE IF NOT EXISTS `hospital` (
  `H_Registration` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `isPublic` tinyint(1) NOT NULL,
  `OffersVaccination` tinyint(1) NOT NULL,
  `Storage_Provider_ID` int(11) NOT NULL,
  PRIMARY KEY (`H_Registration`),
  FOREIGN KEY (Storage_Provider_ID) REFERENCES storage_provider(Storage_Provider_ID)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `C_Registration` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Location` varchar(50) NOT NULL,
  PRIMARY KEY (C_Registration)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL,
  `C_Registration` int(11) NOT NULL,
  `GOV_ID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ETA` int NOT NULL,
  `DateReceived` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (C_Registration) REFERENCES company(C_Registration),
  FOREIGN KEY (Gov_ID) REFERENCES government(Gov_ID)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE IF NOT EXISTS `vaccine` (
  `V_Registration` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `StorageTemp` varchar(20) NOT NULL,
  `ShelfLife` varchar(30) NOT NULL,
  `DosesRequired` int(11) NOT NULL,
  `TimeSeperation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`V_Registration`)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sideeffect`
--

DROP TABLE IF EXISTS `side_effect`;
CREATE TABLE IF NOT EXISTS `side_effect` (
  `Side_Effect_ID` int(11) NOT NULL,
  `V_Registration` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Side_Effect_ID`),
  FOREIGN KEY (`V_Registration`) REFERENCES vaccine(V_Registration)
) DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `vaccinemanufacturer`
--

DROP TABLE IF EXISTS `vaccine_manufacturer`;
CREATE TABLE IF NOT EXISTS `vaccine_manufacturer` (
  `C_Registration` int(11) NOT NULL,
  `V_Registration` int(11) NOT NULL,
  CONSTRAINT PK_VACCINE_MANFACTURER PRIMARY KEY (`C_Registration`,`V_Registration`),  
  FOREIGN KEY (C_Registration) REFERENCES company(C_Registration),
  FOREIGN KEY (V_Registration) REFERENCES vaccine(V_Registration)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
CREATE TABLE IF NOT EXISTS `box` (
  `B_Barcode` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `V_Registration` int(11) NOT NULL,
  PRIMARY KEY (`B_Barcode`),
  FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
  FOREIGN KEY (V_Registration) REFERENCES vaccine(V_Registration)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccineitem`
--

DROP TABLE IF EXISTS `vaccine_item`;
CREATE TABLE IF NOT EXISTS `vaccine_item` (
  `V_Barcode` int(11) NOT NULL,
  `B_Barcode` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`V_Barcode`),
  FOREIGN KEY (B_Barcode) REFERENCES `box`(B_Barcode)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `SSN` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `SS_Status` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `D_Registration` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Specialty` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`D_Registration`)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worksat`
--

DROP TABLE IF EXISTS `works_at`;
CREATE TABLE IF NOT EXISTS `worksat` (
  `D_Registration` int(11) NOT NULL,
  `H_Registration` int(11) NOT NULL,
  PRIMARY KEY (`D_Registration`,`H_Registration`),
  FOREIGN KEY (D_Registration) REFERENCES doctor(D_Registration),
  FOREIGN KEY (H_Registration) REFERENCES hospital(H_Registration)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inoculation`
--

DROP TABLE IF EXISTS `inoculation`;
CREATE TABLE IF NOT EXISTS `inoculation` (
  `Date` date NOT NULL,
  `V_Barcode` int(11) NOT NULL,
  `D_Registration` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`Date`,`V_Barcode`,`D_Registration`,`SSN`),
  FOREIGN KEY (V_Barcode) REFERENCES vaccine_item(V_Barcode),
  FOREIGN KEY (D_Registration) REFERENCES doctor(D_Registration),
  FOREIGN KEY (SSN) REFERENCES patient(SSN)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sideeffectfelt`
--

DROP TABLE IF EXISTS `side_effect_felt`;
CREATE TABLE IF NOT EXISTS `side_effect_felt` (
  `Date` date NOT NULL,
  `V_barcode` int(11) NOT NULL,
  `D_registration` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `Side_Effect_ID` int(11) NOT NULL,
  PRIMARY KEY (`Date`,`V_barcode`,`D_registration`,`SSN`,`Side_Effect_ID`),
  FOREIGN KEY (`Date`) REFERENCES inoculation(`Date`),
  FOREIGN KEY (V_barcode) REFERENCES inoculation(`V_barcode`),
  FOREIGN KEY (D_registration) REFERENCES inoculation(`D_registration`),
  FOREIGN KEY (SSN) REFERENCES inoculation(`SSN`),
  FOREIGN KEY (Side_Effect_ID) REFERENCES side_effect(`Side_Effect_ID`)
) DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
CREATE TABLE IF NOT EXISTS `storage` (
  `Storage_ID` int(11) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Storage_Provider_ID` int(11) NOT NULL,
  PRIMARY KEY (`Storage_ID`),
  FOREIGN KEY (Storage_Provider_ID) REFERENCES storage_provider(Storage_Provider_ID)
) DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `fridge`
--

DROP TABLE IF EXISTS `fridge`;
CREATE TABLE IF NOT EXISTS `fridge` (
  `F_Barcode` int(11) NOT NULL,
  `OperatingTemp` varchar(20) NOT NULL,
  `Capacity` varchar(20) NOT NULL,
  `Storage_ID` int(11) NOT NULL,
  PRIMARY KEY (`F_Barcode`),
  FOREIGN KEY (Storage_ID) REFERENCES storage(Storage_ID)
) DEFAULT CHARSET=latin1;


-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
CREATE TABLE IF NOT EXISTS `transfer` (
  `Tranfer_ID` int(11) NOT NULL,
  `B_barcode` int(11) NOT NULL,
  `F_barcode` int(11) NOT NULL,
  `Date_Transferred` date NOT NULL,
  `Date_Arrived` date DEFAULT NULL,
  PRIMARY KEY (`Tranfer_ID`),
  FOREIGN KEY (B_Barcode) REFERENCES box(B_Barcode),
  FOREIGN KEY (F_Barcode) REFERENCES fridge(F_Barcode)
) DEFAULT CHARSET=latin1;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
