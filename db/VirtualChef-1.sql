-- Warning: You can generate script only for two tables at a time in your Free plan 
-- 
-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[Countries];
GO


DROP TABLE IF EXISTS [dbo].[Categories];
GO


-- ************************************** [dbo].[Countries]

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='Countries')
CREATE TABLE [dbo].[Countries]
(
 [CountryId]   nvarchar(3) NOT NULL ,
 [CountryName] nvarchar(50) NOT NULL ,


 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([CountryId] ASC)
);
GO








-- ************************************** [dbo].[Categories]

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='Categories')
CREATE TABLE [dbo].[Categories]
(
 [CategoryId]   int IDENTITY (1, 1) NOT NULL ,
 [CategoryName] nvarchar(40) NOT NULL ,
 [Description]  nvarchar(20) NULL ,
 [ImageUrl]     nvarchar(250) NOT NULL ,


 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([CategoryId] ASC),
 CONSTRAINT [UK_CategoryName] UNIQUE NONCLUSTERED ([CategoryName] ASC)
);
GO








