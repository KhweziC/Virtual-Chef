USE [master]
GO
/****** Object:  Database [VirtualChef1.0]    Script Date: 9/22/2019 7:20:56 AM ******/
CREATE DATABASE [VirtualChef1.0]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VirtualChef1.0', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VirtualChef1.0.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VirtualChef1.0_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\VirtualChef1.0_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VirtualChef1.0] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VirtualChef1.0].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VirtualChef1.0] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET ARITHABORT OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VirtualChef1.0] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VirtualChef1.0] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VirtualChef1.0] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VirtualChef1.0] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET RECOVERY FULL 
GO
ALTER DATABASE [VirtualChef1.0] SET  MULTI_USER 
GO
ALTER DATABASE [VirtualChef1.0] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VirtualChef1.0] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VirtualChef1.0] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VirtualChef1.0] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VirtualChef1.0] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VirtualChef1.0', N'ON'
GO
ALTER DATABASE [VirtualChef1.0] SET QUERY_STORE = OFF
GO
USE [VirtualChef1.0]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](40) NOT NULL,
	[Description] [nvarchar](20) NULL,
	[ImageUrl] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_CategoryName] UNIQUE NONCLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cook]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cook](
	[RecipeId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Quantity] [decimal](2, 0) NOT NULL,
	[Measurement] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cook] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryId] [nvarchar](3) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Diet]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diet](
	[DietId] [int] IDENTITY(1,1) NOT NULL,
	[DietName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Diet] PRIMARY KEY CLUSTERED 
(
	[DietId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientId] [int] IDENTITY(1,1) NOT NULL,
	[IngredientName] [nvarchar](50) NOT NULL,
	[ImageUrl] [nvarchar](250) NOT NULL,
	[Nutritions] [text] NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Ingredients] PRIMARY KEY CLUSTERED 
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[ImagerUrl] [nvarchar](250) NOT NULL,
	[DietId] [int] NOT NULL,
	[RestaurantId] [int] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuRecipes]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuRecipes](
	[MenuId] [int] NOT NULL,
	[RecipeId] [int] NOT NULL,
 CONSTRAINT [PK_MenuRecipe] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC,
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[RecipeId] [int] NOT NULL,
	[RecipeName] [nvarchar](50) NOT NULL,
	[Directions] [text] NOT NULL,
	[Preptime] [time](7) NOT NULL,
	[CookTime] [time](7) NOT NULL,
	[ReadyIn] [time](7) NOT NULL,
	[Author] [varchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CountryId] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 9/22/2019 7:20:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[RestaurantId] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[GPSCoordinate] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Restaurant] PRIMARY KEY CLUSTERED 
(
	[RestaurantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_IngredientId]    Script Date: 9/22/2019 7:20:56 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_IngredientId] ON [dbo].[Cook]
(
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_RecipeId]    Script Date: 9/22/2019 7:20:56 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_RecipeId] ON [dbo].[Cook]
(
	[RecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fkIdx_CategoryId]    Script Date: 9/22/2019 7:20:56 AM ******/
CREATE NONCLUSTERED INDEX [fkIdx_CategoryId] ON [dbo].[Ingredients]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_IngredientName]    Script Date: 9/22/2019 7:20:56 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_IngredientName] ON [dbo].[Ingredients]
(
	[IngredientName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cook]  WITH CHECK ADD  CONSTRAINT [FK_Ingredients_To_Cook] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredients] ([IngredientId])
GO
ALTER TABLE [dbo].[Cook] CHECK CONSTRAINT [FK_Ingredients_To_Cook]
GO
ALTER TABLE [dbo].[Cook]  WITH CHECK ADD  CONSTRAINT [FK_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([RecipeId])
GO
ALTER TABLE [dbo].[Cook] CHECK CONSTRAINT [FK_Recipe]
GO
ALTER TABLE [dbo].[Ingredients]  WITH CHECK ADD  CONSTRAINT [FK_Categories_To_Ingredients] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Ingredients] CHECK CONSTRAINT [FK_Categories_To_Ingredients]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_To_Restaurants] FOREIGN KEY([RestaurantId])
REFERENCES [dbo].[Restaurants] ([RestaurantId])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_To_Restaurants]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_To_Diet] FOREIGN KEY([DietId])
REFERENCES [dbo].[Diet] ([DietId])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_To_Diet]
GO
ALTER TABLE [dbo].[MenuRecipes]  WITH CHECK ADD  CONSTRAINT [FK_To_Menu] FOREIGN KEY([MenuId])
REFERENCES [dbo].[Menu] ([MenuId])
GO
ALTER TABLE [dbo].[MenuRecipes] CHECK CONSTRAINT [FK_To_Menu]
GO
ALTER TABLE [dbo].[MenuRecipes]  WITH CHECK ADD  CONSTRAINT [FK_To_Recipe] FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([RecipeId])
GO
ALTER TABLE [dbo].[MenuRecipes] CHECK CONSTRAINT [FK_To_Recipe]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_To_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([CountryId])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_To_Country]
GO
USE [master]
GO
ALTER DATABASE [VirtualChef1.0] SET  READ_WRITE 
GO
