------------------------------------------------------
-- managtInfDev - TABLES --
------------------------------------------------------
-- OS (osID, osName)
-- TYPEOFDEV (typeOfDevID, typeOfDevName)
-- EMPLOYEE (empID, empName, empLastName, empEmail)
-- DEVICE (serialNumber, osID, typeOfDevID, empID, deviceBrand, deviceModel)
-- CATEGORY (catID, catName, catDescription)
-- MALWARE (malwID, catID, malwName, malwFirstDetDate)
-- Malware_Device (malwID, serialNumber)
------------------------------------------------------
-- SET PROPER FORMAT --
------------------------------------------------------
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI';
------------------------------------------------------
-- DELETE OLD TABLES --
------------------------------------------------------
DROP TABLE OS CASCADE CONSTRAINTS;
DROP TABLE TYPEOFDEV CASCADE CONSTRAINTS;
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE DEVICE CASCADE CONSTRAINTS;
DROP TABLE CATEGORY CASCADE CONSTRAINTS;
DROP TABLE MALWARE CASCADE CONSTRAINTS;
DROP TABLE Malware_Device CASCADE CONSTRAINTS;
------------------------------------------------------
-- TABLE CREATION --
------------------------------------------------------
-- OS (osID, osName)
CREATE TABLE OS (
    osID    INT,
    osName  VARCHAR2(255),
    CONSTRAINT PK_OS PRIMARY KEY (osID)
);

-- TYPEOFDEV (typeOfDevID, typeOfDevName)
CREATE TABLE TYPEOFDEV (
    typeOfDevID     INT,
    typeOfDevName   VARCHAR2(255),
    CONSTRAINT PK_TYPEOFDEV PRIMARY KEY (typeOfDevID)
);

-- EMPLOYEE (empID, empName, empLastName, empEmail)
CREATE TABLE EMPLOYEE (
    empID       INT,
    empName     VARCHAR2(255),
    empLastName VARCHAR2(255),
    empEmail    VARCHAR2(255),
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY (empID)
);

-- DEVICE (serialNumber, osID, typeOfDevID, empID, deviceBrand, deviceModel)
CREATE TABLE DEVICE (
    serialNumber    INT,
    osID            INT,
    typeOfDevID     INT,
    empID           INT,
    deviceBrand     VARCHAR2(255),
    deviceModel     VARCHAR2(255),
    CONSTRAINT PK_DEVICE PRIMARY KEY (serialNumber),
    CONSTRAINT FK1_DEVICE FOREIGN KEY (osID) REFERENCES OS (osID) ON DELETE CASCADE,
    CONSTRAINT FK2_DEVICE FOREIGN KEY (typeOfDevID) REFERENCES TYPEOFDEV (typeOfDevID) ON DELETE CASCADE,
    CONSTRAINT FK3_DEVICE FOREIGN KEY (empID) REFERENCES EMPLOYEE (empID) ON DELETE CASCADE
);

-- CATEGORY (catID, catName, catDescription)
CREATE TABLE CATEGORY (
    catID           INT,
    catName         VARCHAR2(255),
    catDescription  VARCHAR2(255),
    CONSTRAINT PK_CATEGORY PRIMARY KEY (catID)
);

-- MALWARE (malwID, catID, malwName, malwFirstDetDate)
CREATE TABLE MALWARE (
    malwID              INT,
    catID               INT,
    malwName            VARCHAR2(255),
    malwFirstDetDate    DATE,
    CONSTRAINT PK_MALWARE PRIMARY KEY (malwID),
    CONSTRAINT FK1_MALWARE FOREIGN KEY (catID) REFERENCES CATEGORY (catID) ON DELETE CASCADE
);

-- Malware_Device (malwID, serialNumber)
CREATE TABLE Malware_Device (
    malwID          INT,
    serialNumber    INT,
    CONSTRAINT PK_Malware_Device PRIMARY KEY (malwID, serialNumber),
    CONSTRAINT FK1_Malware_Device FOREIGN KEY (malwID) REFERENCES MALWARE (malwID) ON DELETE CASCADE,
    CONSTRAINT FK2_Malware_Device FOREIGN KEY (serialNumber) REFERENCES DEVICE (serialNumber) ON DELETE CASCADE
);