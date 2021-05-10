-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 10, 2021 at 06:51 PM
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

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `createHospital`$$
CREATE DEFINER=`andretabourian`@`%` PROCEDURE `createHospital` (IN `Name` VARCHAR(30), IN `Address` VARCHAR(40), IN `Type` VARCHAR(20), IN `OffersVaccination` VARCHAR(20))  BEGIN

	DECLARE storage_prov_id INT;

	INSERT INTO storage_provider() VALUES ();
    
    SET storage_prov_id = (SELECT MAX(Storage_Provider_ID) FROM storage_provider);

	INSERT INTO hospital ( Name, Address, Type, OffersVaccination, Storage_Provider_ID ) VALUES (Name, Address, Type, OffersVaccination, storage_prov_id);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

DROP TABLE IF EXISTS `box`;
CREATE TABLE IF NOT EXISTS `box` (
  `B_Barcode` int(11) NOT NULL AUTO_INCREMENT,
  `OrderID` int(11) NOT NULL,
  `V_Registration` int(11) NOT NULL,
  PRIMARY KEY (`B_Barcode`),
  KEY `OrderID` (`OrderID`),
  KEY `V_Registration` (`V_Registration`)
) ENGINE=InnoDB AUTO_INCREMENT=3622 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `box`
--

INSERT INTO `box` (`B_Barcode`, `OrderID`, `V_Registration`) VALUES
(321, 1, 1),
(421, 1, 1),
(3621, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `C_Registration` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Location` varchar(50) NOT NULL,
  PRIMARY KEY (`C_Registration`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`C_Registration`, `Name`, `Location`) VALUES
(1, 'Pfizer', 'USA'),
(2, 'Moderna', 'USA'),
(3, 'Astra-Zeneca', 'UK'),
(4, 'Sputnik', 'Russia'),
(5, 'Sinovac', 'China');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `D_Registration` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Specialty` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`D_Registration`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`D_Registration`, `FirstName`, `LastName`, `Address`, `Specialty`) VALUES
(1, 'Wadi', 'Jureidini', 'Beirut', 'Viral Infections');

-- --------------------------------------------------------

--
-- Table structure for table `fridge`
--

DROP TABLE IF EXISTS `fridge`;
CREATE TABLE IF NOT EXISTS `fridge` (
  `F_Barcode` int(11) NOT NULL AUTO_INCREMENT,
  `OperatingTemp` varchar(20) NOT NULL,
  `Capacity` varchar(20) NOT NULL,
  `Storage_ID` int(11) NOT NULL,
  PRIMARY KEY (`F_Barcode`),
  KEY `Storage_ID` (`Storage_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fridge`
--

INSERT INTO `fridge` (`F_Barcode`, `OperatingTemp`, `Capacity`, `Storage_ID`) VALUES
(1, '-70', '20', 3),
(2, '-70', '20', 3),
(3, '-70', '20', 1),
(4, '-70', '20', 3);

-- --------------------------------------------------------

--
-- Table structure for table `government`
--

DROP TABLE IF EXISTS `government`;
CREATE TABLE IF NOT EXISTS `government` (
  `Gov_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Storage_Provider_ID` int(11) NOT NULL,
  PRIMARY KEY (`Gov_ID`),
  KEY `Storage_Provider_ID` (`Storage_Provider_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `government`
--

INSERT INTO `government` (`Gov_ID`, `Storage_Provider_ID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
CREATE TABLE IF NOT EXISTS `hospital` (
  `H_Registration` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `OffersVaccination` varchar(20) NOT NULL,
  `Storage_Provider_ID` int(11) NOT NULL,
  PRIMARY KEY (`H_Registration`),
  KEY `Storage_Provider_ID` (`Storage_Provider_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`H_Registration`, `Name`, `Address`, `Type`, `OffersVaccination`, `Storage_Provider_ID`) VALUES
(1, 'AUBMC', 'Bliss', 'Private', 'Yes', 2),
(2, 'Hotel-Dieu', 'Ashrafieh', 'Private', 'Yes', 3),
(3, 'Hopital El Roum', 'Ashrafieh', 'Private', 'Yes', 4),
(4, 'USJ', 'Ashrafieh', 'Private', 'Yes', 5);

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
  KEY `V_Barcode` (`V_Barcode`),
  KEY `D_Registration` (`D_Registration`),
  KEY `SSN` (`SSN`),
  KEY `Date_Index` (`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inoculation`
--

INSERT INTO `inoculation` (`Date`, `V_Barcode`, `D_Registration`, `SSN`) VALUES
('2021-05-13', 103, 1, 1),
('2021-05-13', 12834, 1, 2),
('2021-05-14', 182, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `inoculation_v`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `inoculation_v`;
CREATE TABLE IF NOT EXISTS `inoculation_v` (
`Date` date
,`SSN` int(11)
,`PatientName` varchar(101)
,`V_Barcode` int(11)
,`VaccineName` varchar(30)
,`B_Barcode` int(11)
,`OrderID` int(11)
,`D_Registration` int(11)
,`DoctorName` varchar(101)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `C_Registration` int(11) NOT NULL,
  `GOV_ID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ETA` date NOT NULL,
  `DateReceived` date DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `C_Registration` (`C_Registration`),
  KEY `GOV_ID` (`GOV_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `C_Registration`, `GOV_ID`, `OrderDate`, `ETA`, `DateReceived`, `Status`) VALUES
(1, 1, 1, '2021-05-10', '2021-05-12', '2021-05-12', 'Received'),
(2, 2, 1, '2021-05-10', '2021-05-15', NULL, 'Ordered');

-- --------------------------------------------------------

--
-- Stand-in structure for view `orders_v`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `orders_v`;
CREATE TABLE IF NOT EXISTS `orders_v` (
`OrderID` int(11)
,`Company` varchar(30)
,`OrderDate` date
,`ETA` date
,`Received` date
,`Status` varchar(20)
);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`SSN`, `FirstName`, `LastName`, `BirthDate`, `SS_Status`, `Address`, `PhoneNumber`) VALUES
(1, 'Andre', 'Tabourian', '1997-01-16', 'Covered', 'Beirut', 3123456),
(2, 'Chloe', 'Avedissian', '1999-01-10', 'Covered', 'Beirut', 3823829),
(3, 'Mariam', 'Dib', '1999-01-10', 'Covered', 'Beirut', 3987210),
(4, 'Mohammad', 'Abdallah', '1999-01-10', 'Covered', 'Beirut', 3473923),
(5, 'Andre', 'Tabourian', '2021-05-12', 'Covered', 'Beirut', 3782293);

-- --------------------------------------------------------

--
-- Table structure for table `side_effect`
--

DROP TABLE IF EXISTS `side_effect`;
CREATE TABLE IF NOT EXISTS `side_effect` (
  `Side_Effect_ID` int(11) NOT NULL AUTO_INCREMENT,
  `V_Registration` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Side_Effect_ID`),
  KEY `V_Registration` (`V_Registration`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `side_effect`
--

INSERT INTO `side_effect` (`Side_Effect_ID`, `V_Registration`, `Name`) VALUES
(1, 1, 'Fever');

-- --------------------------------------------------------

--
-- Table structure for table `side_effect_felt`
--

DROP TABLE IF EXISTS `side_effect_felt`;
CREATE TABLE IF NOT EXISTS `side_effect_felt` (
  `Date` date NOT NULL,
  `V_barcode` int(11) NOT NULL,
  `D_registration` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `Side_Effect_ID` int(11) NOT NULL,
  PRIMARY KEY (`Date`,`V_barcode`,`D_registration`,`SSN`,`Side_Effect_ID`),
  KEY `V_barcode` (`V_barcode`),
  KEY `D_registration` (`D_registration`),
  KEY `SSN` (`SSN`),
  KEY `Side_Effect_ID` (`Side_Effect_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `side_effect_felt`
--

INSERT INTO `side_effect_felt` (`Date`, `V_barcode`, `D_registration`, `SSN`, `Side_Effect_ID`) VALUES
('2021-05-13', 103, 1, 1, 1),
('2021-05-13', 12834, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
CREATE TABLE IF NOT EXISTS `storage` (
  `Storage_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Location` varchar(100) NOT NULL,
  `Storage_Provider_ID` int(11) NOT NULL,
  PRIMARY KEY (`Storage_ID`),
  KEY `Storage_Provider_ID` (`Storage_Provider_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storage`
--

INSERT INTO `storage` (`Storage_ID`, `Location`, `Storage_Provider_ID`) VALUES
(1, 'Airport', 1),
(2, 'Bliss', 2),
(3, 'Bliss - Main Gate', 2),
(4, 'Beirut', 2);

-- --------------------------------------------------------

--
-- Table structure for table `storage_provider`
--

DROP TABLE IF EXISTS `storage_provider`;
CREATE TABLE IF NOT EXISTS `storage_provider` (
  `Storage_Provider_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Storage_Provider_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `storage_provider`
--

INSERT INTO `storage_provider` (`Storage_Provider_ID`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
CREATE TABLE IF NOT EXISTS `transfer` (
  `Transfer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `B_barcode` int(11) NOT NULL,
  `F_barcode` int(11) NOT NULL,
  `Date_Transferred` date NOT NULL,
  `Date_Arrived` date DEFAULT NULL,
  PRIMARY KEY (`Transfer_ID`),
  KEY `B_barcode` (`B_barcode`),
  KEY `F_barcode` (`F_barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`Transfer_ID`, `B_barcode`, `F_barcode`, `Date_Transferred`, `Date_Arrived`) VALUES
(1, 321, 1, '2021-05-12', '2021-05-12'),
(2, 421, 1, '2021-05-12', '2021-05-12'),
(3, 3621, 1, '2021-05-12', '2021-05-12');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

DROP TABLE IF EXISTS `vaccine`;
CREATE TABLE IF NOT EXISTS `vaccine` (
  `V_Registration` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `StorageTemp` varchar(20) NOT NULL,
  `ShelfLife` varchar(30) NOT NULL,
  `DosesRequired` int(11) NOT NULL,
  `TimeSeperation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`V_Registration`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccine`
--

INSERT INTO `vaccine` (`V_Registration`, `Name`, `Description`, `StorageTemp`, `ShelfLife`, `DosesRequired`, `TimeSeperation`) VALUES
(1, 'Pfizer Vaccine', 'This is the Pfizer vaccine.', '-70', '2 weeks', 2, '72 days'),
(2, 'Moderna Vaccine', 'This is the Moderna Vaccine', '-70', '2 weeks', 2, '72 days'),
(3, 'Sputnik Vaccine', 'This is the Sputnik Vaccine.', '-5', '10 weeks', 2, '72 days'),
(4, 'SinoVac Vaccine', 'This is the Sinovac Vaccine.', '-30', '2 weeks', 2, '72 days');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_item`
--

DROP TABLE IF EXISTS `vaccine_item`;
CREATE TABLE IF NOT EXISTS `vaccine_item` (
  `V_Barcode` int(11) NOT NULL AUTO_INCREMENT,
  `B_Barcode` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`V_Barcode`),
  KEY `B_Barcode` (`B_Barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=75904 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vaccine_item`
--

INSERT INTO `vaccine_item` (`V_Barcode`, `B_Barcode`, `Status`) VALUES
(28, 421, 'Available'),
(103, 321, 'Used'),
(182, 321, 'Used'),
(237, 3621, 'Available'),
(281, 321, 'Available'),
(327, 3621, 'Available'),
(437, 3621, 'Available'),
(546, 421, 'Available'),
(547, 421, 'Available'),
(2734, 3621, 'Available'),
(2973, 321, 'Available'),
(3763, 321, 'Available'),
(4398, 421, 'Available'),
(4702, 421, 'Available'),
(4720, 3621, 'Available'),
(7556, 421, 'Available'),
(9201, 321, 'Available'),
(12834, 321, 'Used'),
(23934, 3621, 'Available'),
(27320, 421, 'Available'),
(28234, 3621, 'Available'),
(29749, 321, 'Available'),
(32742, 421, 'Available'),
(38290, 321, 'Available'),
(43975, 3621, 'Available'),
(57437, 3621, 'Available'),
(75903, 421, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_manufacturer`
--

DROP TABLE IF EXISTS `vaccine_manufacturer`;
CREATE TABLE IF NOT EXISTS `vaccine_manufacturer` (
  `C_Registration` int(11) NOT NULL,
  `V_Registration` int(11) NOT NULL,
  PRIMARY KEY (`C_Registration`,`V_Registration`),
  KEY `V_Registration` (`V_Registration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worksat`
--

DROP TABLE IF EXISTS `worksat`;
CREATE TABLE IF NOT EXISTS `worksat` (
  `D_Registration` int(11) NOT NULL,
  `H_Registration` int(11) NOT NULL,
  PRIMARY KEY (`D_Registration`,`H_Registration`),
  KEY `H_Registration` (`H_Registration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `inoculation_v`
--
DROP TABLE IF EXISTS `inoculation_v`;

DROP VIEW IF EXISTS `inoculation_v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`andretabourian`@`%` SQL SECURITY DEFINER VIEW `inoculation_v`  AS  select `t1`.`Date` AS `Date`,`t2`.`SSN` AS `SSN`,concat(`t2`.`FirstName`,' ',`t2`.`LastName`) AS `PatientName`,`t1`.`V_Barcode` AS `V_Barcode`,`t6`.`Name` AS `VaccineName`,`t5`.`B_Barcode` AS `B_Barcode`,`t5`.`OrderID` AS `OrderID`,`t3`.`D_Registration` AS `D_Registration`,concat(`t3`.`FirstName`,' ',`t3`.`LastName`) AS `DoctorName` from (((((`inoculation` `t1` join `patient` `t2` on((`t1`.`SSN` = `t2`.`SSN`))) join `doctor` `t3` on((`t1`.`D_Registration` = `t3`.`D_Registration`))) join `vaccine_item` `t4` on((`t1`.`V_Barcode` = `t4`.`V_Barcode`))) join `box` `t5` on((`t4`.`B_Barcode` = `t5`.`B_Barcode`))) join `vaccine` `t6` on((`t5`.`V_Registration` = `t6`.`V_Registration`))) ;

-- --------------------------------------------------------

--
-- Structure for view `orders_v`
--
DROP TABLE IF EXISTS `orders_v`;

DROP VIEW IF EXISTS `orders_v`;
CREATE ALGORITHM=UNDEFINED DEFINER=`andretabourian`@`%` SQL SECURITY DEFINER VIEW `orders_v`  AS  select `t1`.`OrderID` AS `OrderID`,`t2`.`Name` AS `Company`,`t1`.`OrderDate` AS `OrderDate`,`t1`.`ETA` AS `ETA`,`t1`.`DateReceived` AS `Received`,`t1`.`Status` AS `Status` from (`orders` `t1` join `company` `t2` on((`t1`.`C_Registration` = `t2`.`C_Registration`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `box`
--
ALTER TABLE `box`
  ADD CONSTRAINT `box_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  ADD CONSTRAINT `box_ibfk_2` FOREIGN KEY (`V_Registration`) REFERENCES `vaccine` (`V_Registration`);

--
-- Constraints for table `fridge`
--
ALTER TABLE `fridge`
  ADD CONSTRAINT `fridge_ibfk_1` FOREIGN KEY (`Storage_ID`) REFERENCES `storage` (`Storage_ID`);

--
-- Constraints for table `government`
--
ALTER TABLE `government`
  ADD CONSTRAINT `government_ibfk_1` FOREIGN KEY (`Storage_Provider_ID`) REFERENCES `storage_provider` (`Storage_Provider_ID`);

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`Storage_Provider_ID`) REFERENCES `storage_provider` (`Storage_Provider_ID`);

--
-- Constraints for table `inoculation`
--
ALTER TABLE `inoculation`
  ADD CONSTRAINT `inoculation_ibfk_1` FOREIGN KEY (`V_Barcode`) REFERENCES `vaccine_item` (`V_Barcode`),
  ADD CONSTRAINT `inoculation_ibfk_2` FOREIGN KEY (`D_Registration`) REFERENCES `doctor` (`D_Registration`),
  ADD CONSTRAINT `inoculation_ibfk_3` FOREIGN KEY (`SSN`) REFERENCES `patient` (`SSN`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`C_Registration`) REFERENCES `company` (`C_Registration`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`GOV_ID`) REFERENCES `government` (`Gov_ID`);

--
-- Constraints for table `side_effect`
--
ALTER TABLE `side_effect`
  ADD CONSTRAINT `side_effect_ibfk_1` FOREIGN KEY (`V_Registration`) REFERENCES `vaccine` (`V_Registration`);

--
-- Constraints for table `side_effect_felt`
--
ALTER TABLE `side_effect_felt`
  ADD CONSTRAINT `side_effect_felt_ibfk_1` FOREIGN KEY (`Date`) REFERENCES `inoculation` (`Date`),
  ADD CONSTRAINT `side_effect_felt_ibfk_2` FOREIGN KEY (`V_barcode`) REFERENCES `inoculation` (`V_Barcode`),
  ADD CONSTRAINT `side_effect_felt_ibfk_3` FOREIGN KEY (`D_registration`) REFERENCES `inoculation` (`D_Registration`),
  ADD CONSTRAINT `side_effect_felt_ibfk_4` FOREIGN KEY (`SSN`) REFERENCES `inoculation` (`SSN`),
  ADD CONSTRAINT `side_effect_felt_ibfk_5` FOREIGN KEY (`Side_Effect_ID`) REFERENCES `side_effect` (`Side_Effect_ID`);

--
-- Constraints for table `storage`
--
ALTER TABLE `storage`
  ADD CONSTRAINT `storage_ibfk_1` FOREIGN KEY (`Storage_Provider_ID`) REFERENCES `storage_provider` (`Storage_Provider_ID`);

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`B_barcode`) REFERENCES `box` (`B_Barcode`),
  ADD CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`F_barcode`) REFERENCES `fridge` (`F_Barcode`);

--
-- Constraints for table `vaccine_item`
--
ALTER TABLE `vaccine_item`
  ADD CONSTRAINT `vaccine_item_ibfk_1` FOREIGN KEY (`B_Barcode`) REFERENCES `box` (`B_Barcode`);

--
-- Constraints for table `vaccine_manufacturer`
--
ALTER TABLE `vaccine_manufacturer`
  ADD CONSTRAINT `vaccine_manufacturer_ibfk_1` FOREIGN KEY (`C_Registration`) REFERENCES `company` (`C_Registration`),
  ADD CONSTRAINT `vaccine_manufacturer_ibfk_2` FOREIGN KEY (`V_Registration`) REFERENCES `vaccine` (`V_Registration`);

--
-- Constraints for table `worksat`
--
ALTER TABLE `worksat`
  ADD CONSTRAINT `worksat_ibfk_1` FOREIGN KEY (`D_Registration`) REFERENCES `doctor` (`D_Registration`),
  ADD CONSTRAINT `worksat_ibfk_2` FOREIGN KEY (`H_Registration`) REFERENCES `hospital` (`H_Registration`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
