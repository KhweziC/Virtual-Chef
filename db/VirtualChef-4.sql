-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[Ingredients];
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









-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[Cook];
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
 CONSTRAINT [FK_Recipe] FOREIGN KEY ([RecipeId])  REFERENCES [dbo].[Recipes]([RecipeId]),
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


-- ************************************** [dbo].[Cook]
DROP TABLE IF EXISTS [dbo].[MenuRecipes];
GO
 
IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='MenuRecipes')
CREATE TABLE [dbo].[MenuRecipes]
(
 [MenuId]     int NOT NULL ,
 [RecipeId] int NOT NULL 


 CONSTRAINT [PK_MenuRecipe] PRIMARY KEY CLUSTERED ([RecipeId] ASC, [MenuId] ASC),
 CONSTRAINT [FK_To_Recipe] FOREIGN KEY ([RecipeId])  REFERENCES [dbo].[Recipes]([RecipeId]),
 CONSTRAINT [FK_To_Menu] FOREIGN KEY ([MenuId])  REFERENCES [dbo].[Menu]([MenuId])
);
GO







