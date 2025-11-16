/*
==============================================================
              DATAWAREHOUSE SETUP SCRIPT (SIMPLE)
==============================================================

Purpose:
    - Checks if the 'DataWarehouse' database exists.
    - If it exists, it will be dropped safely.
    - Creates a fresh 'DataWarehouse' database.
    - Creates the three schemas used in Medallion Architecture:
        • bronze  – raw data
        • silver  – cleaned data
        • gold    – business-ready data

WARNING:
    Running this script will DELETE the existing DataWarehouse 
    database and all its data. Use only with proper backups.
==============================================================
*/

USE master;
GO

-- Drop the 'DataWarehouse' database if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
