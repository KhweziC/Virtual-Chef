-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE [dbo].[Cook];
GO


DROP TABLE [dbo].[Categories];
GO


-- ************************************** [dbo].[Categories]

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







