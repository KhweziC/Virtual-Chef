-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE [dbo].[MC];
GO


DROP TABLE [dbo].[Countries];
GO


-- ************************************** [dbo].[Countries]

CREATE TABLE [dbo].[Countries]
(
 [CountryId]   nvarchar(3) NOT NULL ,
 [CountryName] nvarchar(50) NOT NULL ,


 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED ([CountryId] ASC)
);
GO








-- ************************************** [dbo].[MC]

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







