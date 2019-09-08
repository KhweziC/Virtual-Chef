-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[Ingredients];
GO


DROP TABLE IF EXISTS [dbo].[Countries];
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








-- ************************************** [dbo].[Ingredients]

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='Ingredients')
CREATE TABLE [dbo].[Ingredients]
(
 [IngredientId]   int IDENTITY (1, 1) NOT NULL ,
 [IngredientName] nvarchar(50) NOT NULL ,
 [ImageUrl]       nvarchar(250) NOT NULL ,
 [Nutritions]     text NULL ,
 [CategoryId]     int NOT NULL ,


 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED ([IngredientId] ASC),
 CONSTRAINT [FK_Categories_To_Ingredients] FOREIGN KEY ([CategoryId])  REFERENCES [dbo].[Categories]([CategoryId])
);
GO


CREATE UNIQUE NONCLUSTERED INDEX [UK_IngredientName] ON [dbo].[Ingredients] 
 (
  [IngredientName] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_CategoryId] ON [dbo].[Ingredients] 
 (
  [CategoryId] ASC
 )

GO







