------------------------------------------------------
-- TABLES --
------------------------------------------------------
-- OS (osID, osName)
-- EMPLOYEE (empID, empName, empLastName, empEmail)
-- TYPE (typeID, typeName)
-- DEVICE (serialNumber, osID, typeID, empID, deviceBrand, deviceModel)
-- CATEGORY (catID, catName, catDescription)
-- MALWARE (malwID, catID, malwName, malwFirstDetDate)
-- Malware_Device (malwID, serialNumber)
------------------------------------------------------
-- TABLE CREATION --
------------------------------------------------------
CREATE TABLE OS (
    osID    INT,
    osName  VARCHAR(255)
);

CREATE TABLE 