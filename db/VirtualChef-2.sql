-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE IF EXISTS [Restaurants];
GO


-- ************************************** [Restaurants]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Restaurants')
CREATE TABLE [Restaurants]
(
 [RestaurantId]   int IDENTITY (1, 1) NOT NULL ,
 [RestaurantName] nvarchar(50) NOT NULL ,
 [Address]        nvarchar(250) NOT NULL ,
 [GPSCoordinate]  nvarchar(50) NOT NULL ,
 [MenuId]         int NOT NULL ,


 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED ([RestaurantId] ASC),
 CONSTRAINT [FK_Menu_To_Restaurants] FOREIGN KEY ([MenuId])  REFERENCES [dbo].[Menu]([MenuId])
);
GO


CREATE NONCLUSTERED INDEX [fkIdx_MenuId] ON [Restaurants] 
 (
  [MenuId] ASC
 )

GO


-- ************************************** [Diet]

IF NOT EXISTS (SELECT * FROM sys.tables t WHERE t.name='Diet')
CREATE TABLE [Restaurants]
(
 [DietId]   int IDENTITY (1, 1) NOT NULL ,
 [DietName] nvarchar(50) NOT NULL 


 CONSTRAINT [PK_Diet] PRIMARY KEY CLUSTERED ([DietId] ASC),
);
GO




