-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE [dbo].[Ingredients];
GO


DROP TABLE [dbo].[Menu];
GO


-- ************************************** [dbo].[Menu]

CREATE TABLE [dbo].[Menu]
(
 [MenuId]      int IDENTITY (1, 1) NOT NULL ,
 [MenuName]    nvarchar(50) NOT NULL ,
 [Description] nvarchar(250) NULL ,
 [ImagerUrl]   nvarchar(250) NOT NULL ,
 [RecipeId]    int NOT NULL ,


 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED ([MenuId] ASC)
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_RecipeId] ON [dbo].[Menu] 
 (
  [RecipeId] ASC
 )

GO







-- ************************************** [dbo].[Ingredients]

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







