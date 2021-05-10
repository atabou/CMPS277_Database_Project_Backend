-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: May 01, 2021 at 04:59 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

CREATE TABLE `box` (
  `B_Barcode` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `OrderID` int(11) NOT NULL,
  `V_Registration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `C_Registration` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Name` varchar(30) NOT NULL,
  `Location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `D_Registration` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Specialty` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fridge`
--

CREATE TABLE `fridge` (
  `F_Barcode` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `OperatingTemp` varchar(20) NOT NULL,
  `Capacity` varchar(20) NOT NULL,
  `Storage_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `government`
--

CREATE TABLE `government` (
  `Gov_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Storage_Provider_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `H_Registration` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `OffersVaccination` varchar(20) NOT NULL,
  `Storage_Provider_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inoculation`
--

CREATE TABLE `inoculation` (
  `Date` date NOT NULL,
  `V_Barcode` int(11) NOT NULL,
  `D_Registration` int(11) NOT NULL,
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `C_Registration` int(11) NOT NULL,
  `GOV_ID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `ETA` date NOT NULL,
  `DateReceived` date,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `SSN` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `SS_Status` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `side_effect`
--

CREATE TABLE `side_effect` (
  `Side_Effect_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `V_Registration` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `side_effect_felt`
--

CREATE TABLE `side_effect_felt` (
  `Date` date NOT NULL,
  `V_barcode` int(11) NOT NULL,
  `D_registration` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `Side_Effect_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storage`
--

CREATE TABLE `storage` (
  `Storage_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Location` varchar(100) NOT NULL,
  `Storage_Provider_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storage_provider`
--

CREATE TABLE `storage_provider` (
  `Storage_Provider_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `Transfer_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `B_barcode` int(11) NOT NULL,
  `F_barcode` int(11) NOT NULL,
  `Date_Transferred` date NOT NULL,
  `Date_Arrived` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine`
--

CREATE TABLE `vaccine` (
  `V_Registration` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Name` varchar(30) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `StorageTemp` varchar(20) NOT NULL,
  `ShelfLife` varchar(30) NOT NULL,
  `DosesRequired` int(11) NOT NULL,
  `TimeSeperation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_item`
--

CREATE TABLE `vaccine_item` (
  `V_Barcode` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `B_Barcode` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vaccine_manufacturer`
--

CREATE TABLE `vaccine_manufacturer` (
  `C_Registration` int(11) NOT NULL,
  `V_Registration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `worksat`
--

CREATE TABLE `worksat` (
  `D_Registration` int(11) NOT NULL,
  `H_Registration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `box`
--
ALTER TABLE `box`
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `V_Registration` (`V_Registration`);

--
-- Indexes for table `fridge`
--
ALTER TABLE `fridge`
  ADD KEY `Storage_ID` (`Storage_ID`);

--
-- Indexes for table `government`
--
ALTER TABLE `government`
  ADD KEY `Storage_Provider_ID` (`Storage_Provider_ID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD KEY `Storage_Provider_ID` (`Storage_Provider_ID`);

--
-- Indexes for table `inoculation`
--
ALTER TABLE `inoculation`
  ADD PRIMARY KEY (`Date`,`V_Barcode`,`D_Registration`,`SSN`),
  ADD KEY `V_Barcode` (`V_Barcode`),
  ADD KEY `D_Registration` (`D_Registration`),
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `C_Registration` (`C_Registration`),
  ADD KEY `GOV_ID` (`GOV_ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `side_effect`
--
ALTER TABLE `side_effect`
  ADD KEY `V_Registration` (`V_Registration`);

--
-- Indexes for table `side_effect_felt`
--
ALTER TABLE `side_effect_felt`
  ADD PRIMARY KEY (`Date`,`V_barcode`,`D_registration`,`SSN`,`Side_Effect_ID`),
  ADD KEY `V_barcode` (`V_barcode`),
  ADD KEY `D_registration` (`D_registration`),
  ADD KEY `SSN` (`SSN`),
  ADD KEY `Side_Effect_ID` (`Side_Effect_ID`);

--
-- Indexes for table `storage`
--
ALTER TABLE `storage`
  ADD KEY `Storage_Provider_ID` (`Storage_Provider_ID`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD KEY `B_barcode` (`B_barcode`),
  ADD KEY `F_barcode` (`F_barcode`);

--
-- Indexes for table `vaccine_item`
--
ALTER TABLE `vaccine_item`
  ADD KEY `B_Barcode` (`B_Barcode`);

--
-- Indexes for table `vaccine_manufacturer`
--
ALTER TABLE `vaccine_manufacturer`
  ADD PRIMARY KEY (`C_Registration`,`V_Registration`),
  ADD KEY `V_Registration` (`V_Registration`);

--
-- Indexes for table `worksat`
--
ALTER TABLE `worksat`
  ADD PRIMARY KEY (`D_Registration`,`H_Registration`),
  ADD KEY `H_Registration` (`H_Registration`);

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


-- --------------------------------------------------------

--
-- Default Values
--

INSERT INTO storage_provider () VALUES ();
INSERT INTO government (Storage_Provider_ID) VALUES (1);

-- --------------------------------------------------------

--
-- View for orders
--

CREATE VIEW Orders_V AS
  SELECT t1.OrderID, t2.Name as Company, t1.OrderDate as OrderDate, t1.ETA, t1.DateReceived as Received, t1.Status
  FROM Orders as t1 INNER JOIN Company as t2 ON t1.C_Registration = t2.C_Registration;

--
-- View for Inoculation
--

CREATE VIEW Inoculation_V AS
  SELECT t1.Date, t2.SSN, CONCAT(t2.FirstName, ' ', t2.LastName) as PatientName, t1.V_Barcode, t6.Name as VaccineName, t5.B_Barcode, t5.OrderID, t3.D_Registration, CONCAT(t3.FirstName, ' ', t3.LastName) as DoctorName  FROM Inoculation as t1 
    INNER JOIN Patient as t2 on t1.SSN = t2.SSN
    INNER JOIN Doctor as t3 on t1.D_Registration = t3.D_Registration
    INNER JOIN vaccine_item as t4 on t1.V_Barcode = t4.V_Barcode
    INNER JOIN Box as t5 on t4.B_Barcode = t5.B_Barcode
    INNER JOIN Vaccine as t6 on t5.V_Registration = t6.V_Registration;


-- --------------------------------------------------------

--
-- Stored Procedure for creating a new hospital
--

DROP PROCEDURE IF EXISTS createHospital;
DELIMITER $$
CREATE PROCEDURE createHospital(
    IN Name varchar(30),
    IN Address varchar(40),
  	IN Type varchar(20),
  	IN OffersVaccination varchar(20)
)
BEGIN

	DECLARE storage_prov_id INT;

	INSERT INTO storage_provider() VALUES ();
    
    SET storage_prov_id = (SELECT MAX(Storage_Provider_ID) FROM storage_provider);

	INSERT INTO hospital ( Name, Address, Type, OffersVaccination, Storage_Provider_ID ) VALUES (Name, Address, Type, OffersVaccination, storage_prov_id);

END $$
DELIMITER ;

-- --------------------------------------------------------

--
-- Indices
--

CREATE INDEX Date_Index
	ON inoculation (Date);