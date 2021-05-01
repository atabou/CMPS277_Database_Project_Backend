

--
-- Goverment
--

SELECT * from Goverment 
SELECT * from Goverment WHERE GOV_ID = var

INSERT INTO Goverment (GOV_ID, Storage_Provider_ID) values (gID, spID)


--------------------------------------------------------------------------------

--
-- Storage Provider
--

SELECT * FROM StorageProvider 
SELECT * FROM StorageProvider WHERE Storage_Provider_ID = var

INSERT into StorageProvider (Storage_Provider_ID) VALUES (spID)


--------------------------------------------------------------------------------

--
-- Hospitals
--

SELECT Name, Address, isPublic, offersVaccination FROM Hospitals 
SELECT Name, Address, isPublic, offersVaccination FROM Hospitals WHERE H_Registration = var
SELECT Name, Address, isPublic, offersVaccination FROM Hospitals WHERE Name = var
SELECT Name, Address, isPublic, offersVaccination FROM Hospitals WHERE isPublic = var
SELECT Name, Address, isPublic, offersVaccination FROM Hospitals WHERE offersVaccination = var

INSERT INTO Hospitals (H_Registration, Name, Address, isPublic, offersVaccination, Storage_Provider_ID) VALUES (hr, Name, add, ip, ov, spID)

UPDATE Hospitals set name = var where H_Registration = var
UPDATE Hospitals set offersVaccination = var where H_Registration = var
UPDATE Hospitals set Address = var where H_Registration = var

delete FROM Hospitals where H_Registration = var
delete FROM Hospitals where name = var

--------------------------------------------------------------------------------

--
-- Works At
--

SELECT * from WorksAt
SELECT * FROM WorksAt WHERE D_Registration = var and H_Registration = var

INSERT into WorksAt (D_Registration, H_Registration) VALUES (D_Registration, H_Registration)

delete FROM WorksAt WHERE D_Registration = var and H_Registration = var


--------------------------------------------------------------------------------

--
-- Doctor
--

SELECT firstName, lastName, Address, specialty FROM Doctor
SELECT firstName, lastName, Address, specialty FROM Doctor specialty = var

INSERT INTO Doctor (D_Registration, firstName, lastName, Address, specialty) VALUES (dr, fn, ln, add, specialty)

UPDATE Doctor set Address = var WHERE D_Registration = var
UPDATE Doctor set specialty = var WHERE D_Registration = var


--------------------------------------------------------------------------------

--
-- Patient
--

SELECT * from Patient 
SELECT * from Patient WHERE ssn = var
SELECT * from Patient WHERE birthDate = var
SELECT * from Patient WHERE ssStatus = var


INSERT into Patient (ssn, firstName, lastName, birthDate, ssStatus, Address, phoneNumber) VALUES (ssn, fn, ln, bd, ssStat, add, pn)

UPDATE Patient set ssStatus = var WHERE ssn = var
UPDATE Patient set Address = var WHERE ssn = var
UPDATE Patient set phoneNumber = var WHERE ssn = var


delete from Patient WHERE ssn = var
delete from Patient WHERE ssStatus = var


--------------------------------------------------------------------------------

--
-- Innoculation
--

SELECT * from Innoculation
SELECT * from Innoculation WHERE date = var
SELECT * from Innoculation WHERE ssn = var
SELECT * from Innoculation WHERE D_Registration = var
SELECT * from Innoculation WHERE V_Barcode = var


INSERT INTO Innoculation (date, V_Barcode, D_Registration, ssn) values (date, vb, dr, ssn)

UPDATE Innoculation set date = var where V_Barcode = var

delete from Innoculation where V_Barcode = var
delete FROM Innoculation where ssn = var



--------------------------------------------------------------------------------

--
-- Storage
--


SELECT * FROM Storage 
SELECT * FROM Storage where Location = var
SELECT * from Storage where Storage_Provider_ID = var

INSERT into Storage (storageID, Location, Storage_Provider_ID) VALUES (sID, loc, spID)

UPDATE Storage set Location = var WHERE storageID = var


--------------------------------------------------------------------------------

--
-- Fridge
--

SELECT operatingTemp, capacity FROM Fridge
SELECT operatingTemp, capacity FROM Fridge where f_Barcode = var
SELECT operatingTemp, capacity FROM Fridge where storageID = var
SELECT operatingTemp, capacity FROM Fridge where operatingTemp = var
SELECT operatingTemp, capacity FROM Fridge where capacity = var

INSERT into Fridge (f_Barcode, operatingTemp, capacity, storageID) VALUES (fbc, opt, cap, sID)

UPDATE Fridge set operatingTemp = var WHERE f_Barcode = var
UPDATE Fridge set capacity = var WHERE f_Barcode = var


--------------------------------------------------------------------------------

--
-- Transfer
--

SELECT transferID, dateTransferred, dateArrived from Transfer 
SELECT transferID, dateTransferred, dateArrived from Transfer where transferID = var

INSERT into Transfer (transferID, b_barcode, f_Barcode, dateTransferred, dateArrived) VALUES (tID, bbc, fbc, dt, da)

delete from Transfer WHERE transferID = var


--------------------------------------------------------------------------------
--
-- Box
--

SELECT * from Box
SELECT * from Box WHERE b_barcode = var

INSERT into Box (b_barcode, orderID, V_Registration) values (bbc, oID, vr)


--------------------------------------------------------------------------------
--
-- Vaccine Item
--

SELECT status from VaccineItem
SELECT status from VaccineItem WHERE V_Barcode = var

INSERT into VaccineItem (V_Barcode, b_barcode, status) values (vb, bbc, status)

UPDATE VaccineItem set status = var WHERE V_Barcode = var



--------------------------------------------------------------------------------
--
-- Company
--

SELECT C_Registration, Name , Location FROM Company OFFSET 15 LIMIT 10
SELECT C_Registration from Company where name = var


INSERT INTO Company(Name, Location) VALUES ('sjkhgvsf', 'wghdeu')

UPDATE Company set Name = var WHERE C_Registration = var
UPDATE Company set Name = var WHERE name = var
UPDATE Company set Location = var WHERE C_Registration = var
UPDATE Company set Location = var WHERE name = var

-------------------------------------------------------------------------------

--
-- Orders
--

SELECT orderID, orderDate, eta, dateReceived, status FROM Orders where orderID = var 
SELECT orderID, orderDate, eta, dateReceived, status FROM Orders where C_Registration = var 
SELECT orderID, orderDate, eta, dateReceived, status FROM Orders where orderDate = var 

INSERT INTO Orders (C_Registration, gov_ID, orderDate, eta, dateReceived, status) VALUES (cr, govID, od, eta, dr, status)

UPDATE Orders set status = var where orderID = var

--------------------------------------------------------------------------------

--
-- Vaccine
--

SELECT name, description, dosesRequired FROM Vaccine 
SELECT name, description, dosesRequired FROM Vaccine WHERE name = var
SELECT name, description, dosesRequired FROM Vaccine WHERE dosesRequired = var
SELECT name, description, dosesRequired FROM Vaccine WHERE storageTemp < var

INSERT INTO Vaccine (name, description, storageTemp, shelflife, dosesRequired, timeSep) VALUES (name, des, st, sl, dr, ts)

UPDATE Vaccine set dosesRequired = var where name = var
UPDATE Vaccine set storageTemp = var where name = var

--------------------------------------------------------------------------------

--
-- Vaccine Manufacturer
--

SELECT * FROM VaccineManufacturer

INSERT INTO VaccineManufacturer (C_Registration, V_Registration) values (cr, vr)

delete FROM VaccineManufacturer WHERE C_Registration = var and V_Registration = var




--------------------------------------------------------------------------------

--
-- Side Effect
--

SELECT * FROM SideEffect

INSERT INTO SideEffect (V_Registration, name) values (vr, name)

delete FROM SideEffect WHERE Name = var

--------------------------------------------------------------------------------

--
-- Side Effect Felt
--

SELECT * FROM SideEffectFelt

INSERT INTO SideEffectFelt (date, V_Barcode, D_Registration, ssn, SideEffectID) values (vrdate, vb, dr, ssn, seID)

delete FROM SideEffectFelt WHERE SideEffectID = var



