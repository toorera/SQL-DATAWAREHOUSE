/*
=============================================================
Create Datawarehouse Database and schema
=============================================================
Script Purpose:
    This script creates a new database named 'Datawarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, this script creates schema 
    for each of the layers in the Datawarehouse (i.e. gold, silver and bronze)
	
WARNING:
    Running this script will drop the entire 'Datawarehouse' database if it exists. 
    All data in the database will be permanently deleted. Proceed with caution 
    and ensure you have proper backups before running this script.
*/

USE master;
GO

-- Drop and recreate the 'Datawarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Datawarehouse;
END;
GO

-- Create the 'Datawarehouse' database
CREATE DATABASE Datawarehouse;
GO

USE Datawarehouse;
GO

-- Creating schema for each the datawarehouse layers 

CREATE SCHEMA gold;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA bronze
