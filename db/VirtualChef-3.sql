

-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[Recipes];
GO


-- ************************************** [dbo].[Recipes]

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='Recipes')
CREATE TABLE [dbo].[Recipes]
(
 [RecipeId]   int NOT NULL ,
 [RecipeName] nvarchar(50) NOT NULL ,
 [Directions] text NOT NULL ,
 [Preptime]   time(7) NOT NULL ,
 [CookTime]   time(7) NOT NULL ,
 [ReadyIn]    time(7) NOT NULL ,
 [Author]     varchar(50) NOT NULL ,
 [CreateDate] datetime NOT NULL ,
 [CountyId]   nvarchar(50) NOT NULL ,


 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED ([RecipeId] ASC)
);
GO



-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[Menu];
GO


-- ************************************** [dbo].[Menu]

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='Menu')
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
