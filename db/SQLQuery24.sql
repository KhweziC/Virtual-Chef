-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [dbo].[MC];
GO


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







-- ************************************** [dbo].[MC]

IF NOT EXISTS (SELECT * FROM sys.tables t join sys.schemas s ON (t.schema_id = s.schema_id) WHERE s.name='dbo' and t.name='MC')
CREATE TABLE [dbo].[MC]
(
 [MenuId]     int NOT NULL ,
 [CategoryId] int NOT NULL ,


 CONSTRAINT [FK_216] FOREIGN KEY ([MenuId])  REFERENCES [dbo].[Menu]([MenuId]),
 CONSTRAINT [FK_219] FOREIGN KEY ([CategoryId])  REFERENCES [dbo].[Categories]([CategoryId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_216] ON [dbo].[MC] 
 (
  [MenuId] ASC
 )

GO

CREATE NONCLUSTERED INDEX [fkIdx_219] ON [dbo].[MC] 
 (
  [CategoryId] ASC
 )

GO







