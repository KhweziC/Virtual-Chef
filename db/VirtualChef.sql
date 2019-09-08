-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[Cook];
GO


DROP TABLE IF EXISTS [dbo].[Categories];
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








-- ************************************** [dbo].[Cook]

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='Cook')
CREATE TABLE [dbo].[Cook]
(
 [RecipeId]     int NOT NULL ,
 [IngredientId] int NOT NULL ,
 [Quantity]     decimal(2,0) NOT NULL ,
 [Measurement]  nvarchar(50) NOT NULL ,


 CONSTRAINT [PK_Cook] PRIMARY KEY CLUSTERED ([RecipeId] ASC, [IngredientId] ASC),
 CONSTRAINT [FK_Ingredients_To_Cook] FOREIGN KEY ([IngredientId])  REFERENCES [dbo].[Ingredients]([IngredientId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_IngredientId] ON [dbo].[Cook] 
 (
  [IngredientId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_RecipeId] ON [dbo].[Cook] 
 (
  [RecipeId] ASC
 )

GO







