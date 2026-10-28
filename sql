USE [master]
GO
/****** Object:  Database [shoes]    Script Date: 28.10.2026 8:14:09 ******/
CREATE DATABASE [shoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoes', FILENAME = N'C:\Users\Рахим\Desktop\бд\shoes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shoes_log', FILENAME = N'C:\Users\Рахим\Desktop\бд\shoes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shoes] SET  MULTI_USER 
GO
ALTER DATABASE [shoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shoes] SET QUERY_STORE = ON
GO
ALTER DATABASE [shoes] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [shoes]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductProduction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderInProduct]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[StockItemId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderInProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[SubcategoryId] [int] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
	[Material] [nvarchar](300) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Size] [decimal](18, 1) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockItem]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[SizeId] [int] NOT NULL,
	[AviableQuantity] [int] NULL,
 CONSTRAINT [PK_AmountInStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subcategory]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subcategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Subcategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.10.2026 8:14:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Детская обувь')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Женская обувь')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Мужская обувь')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (1, N'Малыш-Спорт')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (2, N'Топ-Топ')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (3, N'Лапушка')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (4, N'Тёплые ножки')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (5, N'Северята')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (6, N'Весна')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (7, N'Здоровый шаг')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (8, N'Карапуз')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (9, N'Маленький франт')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (10, N'Барбари')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (11, N'Твой комфорт')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (12, N'Стиль и комфорт')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (13, N'Кожевенные традиции')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (14, N'Модный силуэт')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (15, N'Азимут')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (16, N'Берестов')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (1, 3, CAST(N'2026-04-02' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (2, 17, CAST(N'2026-04-05' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (3, 7, CAST(N'2026-04-08' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (4, 15, CAST(N'2026-04-12' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (5, 12, CAST(N'2026-04-18' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (6, 9, CAST(N'2026-04-22' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (7, 14, CAST(N'2026-04-25' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (8, 20, CAST(N'2026-04-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (9, 5, CAST(N'2026-05-05' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (10, 17, CAST(N'2026-05-08' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (11, 2, CAST(N'2026-10-24' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (12, 2, CAST(N'2026-10-24' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (13, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (14, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (15, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (16, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (17, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (18, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (19, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (20, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (21, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (22, 1, CAST(N'2026-10-28' AS Date))
INSERT [dbo].[Order] ([ID], [UserId], [OrderDate]) VALUES (23, 1, CAST(N'2026-10-28' AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderInProduct] ON 

INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 1, CAST(2190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (2, 1, 20, 1, CAST(2790.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (3, 2, 30, 1, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (4, 2, 39, 1, CAST(7500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (5, 3, 34, 1, CAST(17000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (6, 3, 57, 1, CAST(8565.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (7, 3, 65, 1, CAST(7795.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (8, 4, 50, 1, CAST(7757.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (9, 4, 48, 1, CAST(12340.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (10, 4, 44, 1, CAST(7130.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (11, 4, 62, 1, CAST(8765.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (12, 4, 32, 1, CAST(15000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (13, 5, 77, 1, CAST(9567.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (14, 5, 87, 1, CAST(21500.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (15, 5, 73, 1, CAST(7890.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (16, 6, 80, 1, CAST(24569.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (17, 6, 89, 1, CAST(14567.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (18, 6, 91, 1, CAST(15670.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (19, 7, 16, 1, CAST(4290.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (20, 7, 2, 2, CAST(2190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (21, 7, 24, 1, CAST(1690.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (22, 8, 86, 1, CAST(25625.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (23, 8, 75, 3, CAST(7890.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (24, 8, 70, 2, CAST(6550.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (25, 9, 7, 1, CAST(2490.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (26, 9, 14, 2, CAST(3190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (27, 10, 53, 1, CAST(7550.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (28, 10, 43, 1, CAST(7130.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (29, 10, 46, 1, CAST(12340.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (30, 10, 61, 2, CAST(8765.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (31, 11, 1, 1, CAST(2190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (32, 12, 1, 1, CAST(2190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (33, 13, 3, 1, CAST(2190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (34, 14, 3, 19, CAST(2190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (35, 15, 9, 25, CAST(1990.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (36, 16, 52, 1, CAST(7757.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (37, 17, 8, 1, CAST(2490.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (38, 18, 31, 12, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (39, 19, 28, 5, CAST(2390.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (40, 20, 19, 4, CAST(2790.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (41, 21, 13, 3, CAST(3190.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (42, 22, 10, 6, CAST(1990.00 AS Decimal(18, 2)))
INSERT [dbo].[OrderInProduct] ([Id], [OrderId], [StockItemId], [Quantity], [UnitPrice]) VALUES (43, 23, 83, 6, CAST(10155.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[OrderInProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (1, N'Кроссовки детские «Звёздочка» экокожа', 1, 1, N'Кроссовки детские «Звёздочка» экокожа. Производитель: ООО «Малыш-Спорт», г. Смоленск', N'Верх — экокожа (полиуретан на хлопковой основе), подкладка — хлопок 100%, подошва — ПВХ', CAST(2190.00 AS Decimal(18, 2)), N'Res/IMG_KS_195217.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (2, N'Кроссовки детские «Гонщик» экокожа', 1, 2, N'Кроссовки детские «Гонщик» экокожа. Производитель: Фабрика «Топ-Топ», г. Киров', N'Верх — экокожа (микрофибра), подкладка — текстиль сетчатый (полиэстер), подошва — термопластичная резина (ТЭП)', CAST(2490.00 AS Decimal(18, 2)), N'Res/IMG_KS_195213.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (3, N'Кроссовки детские «Радуга» экокожа перфорированная', 1, 3, N'Кроссовки детские «Радуга» экокожа перфорированная. Производитель: ИП Смирнова Л.В. (бренд «Лапушка»), г. Вологда', N'Верх — экокожа перфорированная, вставки — нейлон, стелька — ортопедическая с латексной подушкой, подошва — ЭВА', CAST(1990.00 AS Decimal(18, 2)), N'Res/IMG_KS_195222.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (4, N'Сапожки детские «Снежинка» зимние на меху', 2, 4, N'Сапожки детские «Снежинка» зимние на меху. Производитель: ООО «Тёплые ножки», г. Новосибирск', N'Верх — экокожа морозостойкая, утеплитель — искусственный мех (акрил 70%, полиэстер 30%), подкладка — флис, подошва — термоэластопласт (ТЭП)', CAST(3490.00 AS Decimal(18, 2)), N'Res/IMG_KB_185501.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (5, N'Сапожки детские «Медвежонок» демисезонные непромокаемые', 2, 5, N'Сапожки детские «Медвежонок» демисезонные непромокаемые. Производитель: Компания «Северята», г. Архангельск', N'Верх — плащёвая ткань с водоотталкивающей пропиткой (полиэстер 100%), отделка — экокожа, подкладка — микрофибра, мембрана — AirTex, подошва — резина', CAST(3190.00 AS Decimal(18, 2)), N'Res/IMG_KB_164816.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (6, N'Сапожки детские «Принцесса» кожаные', 2, 6, N'Сапожки детские «Принцесса» кожаные. Производитель: Мастерская «Весна», г. Тула', N'Верх — натуральная кожа (КРС), подкладка — шерсть натуральная (70%), байка (30%), стелька — войлочная, подошва — полиуретан', CAST(4290.00 AS Decimal(18, 2)), N'Res/IMG_KB_164811.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (7, N'Сандалии детские «Пчёлка» ортопедические летние', 3, 7, N'Сандалии детские «Пчёлка» ортопедические летние. Производитель: ООО «Здоровый шаг», г. Воронеж', N'Верх — нубук натуральный, подкладка — кожа растительного дубления, стелька — анатомическая с супинатором (латекс + пробка), подошва — каучук', CAST(2790.00 AS Decimal(18, 2)), N'Res/IMG_KSd_195207.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (8, N'Сандалии детские «Морячок» текстильные с фиксатором', 3, 8, N'Сандалии детские «Морячок» текстильные с фиксатором. Производитель: ИП Кузнецов А.Д. (бренд «Карапуз»), г. Краснодар', N'Верх — джинсовая ткань (хлопок 100%), окантовка — искусственная кожа, подкладка — хлопок, подошва — ЭВА лёгкая', CAST(1690.00 AS Decimal(18, 2)), N'Res/IMG_KSd_185508.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (9, N'Туфли детские «Бантик» лаковые праздничные', 4, 9, N'Туфли детские «Бантик» лаковые праздничные. Производитель: Дом обуви «Маленький франт», г. Москва', N'Верх — искусственная лаковая кожа (ПВХ), носок усиленный — термопластичный полиуретан, подкладка — кожа искусственная дышащая, стелька — анатомическая с амортизацией, подошва — полиуретан', CAST(2390.00 AS Decimal(18, 2)), N'Res/IMG_KSho_185512.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (10, N'Сапоги зимние натуральная кожа', 5, 10, N'Сапоги женские зимние, нескользящая, устойчивая подошва, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск ', N'Верх — натуральная кожа, подкладка — евромех, натуральный мех, текстильный утеплитель, подошва — резина', CAST(25000.00 AS Decimal(18, 2)), N'Res/IMG_WB_170905.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (11, N'Сапоги осенние натуральная кожа', 5, 10, N'Сапоги женские демисезонные из высококачественной натуральной кожи. Производитель: Дом обуви «Барбари», г. Новороссийск ', N'Верх — натуральная кожа, подкладка — текстильный утеплитель, стелька — текстиль, подошва — ТПР', CAST(15000.00 AS Decimal(18, 2)), N'Res/IMG_WB_170859.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (12, N'Сапоги трубы демисезонные замшевые', 5, 11, N'Сапоги женские демисезонные замшевые. Производитель: ОАО «Твой комфорт», г. Ярославль', N'Верх — натуральная замша, утепленные, тракторная подошва, стелька — байка, подошва — резина', CAST(17000.00 AS Decimal(18, 2)), N'Res/IMG_WB_170906.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (13, N'Босоножки «Песчаный берег» коричневые', 6, 12, N'Коричневая кожаная модель с открытым носком, боковой пряжкой и закрытым каблуком. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', N'Верх — 100% козья кожа, подкладка — 100% кожа; подошва: 100% кожа', CAST(7500.00 AS Decimal(18, 2)), N'Res/IMG_WSd_174332.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (14, N'Женские босоножки «Черный кофе» со скульптурным каблуком', 6, 13, N'Открытый носок и ремешок со сборной пряжкой, низкий каблук и резиновая подошва гарантируют комфорт. Производитель: ЗАО «Кожевенные традиции», г. Вятка', N'Верх — кожа собственного производств, подкладка — кожа; подошва: резина', CAST(5600.00 AS Decimal(18, 2)), N'Res/IMG_WSd_185156.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (15, N'Босоножки женские «Летний бриз»', 6, 14, N'Босоножки женские кожаные белые, регулируемый ремешок, закрытый каблук и кожаная подошва. Производитель: ООО «Модный силуэт», г. Кострома', N'Верх — натуральная кожа, подкладка — натуральная кожа, подошва — кожа', CAST(7130.00 AS Decimal(18, 2)), N'Res/IMG_WSd_185551.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (16, N'Демисезонные туфли натуральная кожа', 7, 14, N'Комфортные лаконичные лодочки, классический дизайна с современными акцентами. Производитель: ООО «Модный силуэт», г. Кострома', N'Верх — натуральная овечья кожа, подкладка и стелька — натуральная овечья кожа, подошва — резина', CAST(12340.00 AS Decimal(18, 2)), N'Res/IMG_WSho_174409.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (17, N'Туфли женские натуральная кожа с металлическими вставками', 7, 13, N'Стильные туфли для весеннего и летнего сезона. Производитель: ЗАО «Кожевенные традиции», г. Вятка', N'Верх — натуральная телячьей кожа, металлическая пряжка, подкладка и стелька— натуральная овечья кожа, подошва — резина', CAST(7757.00 AS Decimal(18, 2)), N'Res/IMG_WSho_185202.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (18, N'Туфли классические лодочки натуральная кожа', 7, 12, N'Модель из натуральной кожи, классический острый носок и изящная шпилька. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', N'Верх — натуральная кожа, подкладка и стелька — натуральная кожа, подошва — тунит', CAST(7550.00 AS Decimal(18, 2)), N'Res/IMG_WSho_185545.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (19, N'Кроссовки белые с оранжевым и красным', 8, 2, N'Многослойный верх из кожи и текстиля. Производитель: Фабрика «Топ-Топ», г. Киров', N'Верх — 70% кожа, 30% текстиль, подкладка — текстиль, подошва — резина', CAST(9450.00 AS Decimal(18, 2)), N'Res/IMG_WS_174110.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (20, N'Кроссовки летние кожаные', 8, 2, N'Уверенность на каждом шагу. Материал обеспечивает долговечность и комфорт при носке. Производитель: Фабрика «Топ-Топ», г. Киров', N'Верх — 87% кожа, 11% текстиль, 2% синтетика; подкладка: 100% текстиль; подошва: резина, пластик', CAST(8565.00 AS Decimal(18, 2)), N'Res/IMG_WS_185528.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (21, N'Кроссовки кожаные', 8, 12, N'Кроссовки женские из натуральной кожи. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', N'Верх — натуральная кожа, подкладка — кожа, подошва — полиуретан', CAST(8765.00 AS Decimal(18, 2)), N'Res/IMG_WS_185535.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (22, N'Кроссовки «Стиль и комфорт»', 8, 12, N'Кроссовки женские из натуральной кожи и синтетических материалов, сетчатые вставки. Производитель: ИП «Стиль и комфорт», г. Санкт-Петербург', N'Верх — 70% кожа, 20% полиамид, 10% полиуретан; подкладка — текстиль, подошва — ТПУ', CAST(7795.00 AS Decimal(18, 2)), N'Res/IMG_WS_185538.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (23, N'Кроссовки для бега «Драйв»', 9, 15, N'Сочетание стиля, комфорта и современных технологий. Производитель: Фабрика «Азимут», г. Санкт-Петербург', N'Верх —  сетка, подкладка — текстиль, подошва —  резина', CAST(6550.00 AS Decimal(18, 2)), N'Res/IMG_MS_185531.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (24, N'Кроссовки «Азимут Бег» ', 9, 15, N'Универсальный выбор для повседневного использования. Производитель: Фабрика «Азимут», г. Санкт-Петербург', N'Верх — 6% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', CAST(7890.00 AS Decimal(18, 2)), N'Res/IMG_MS_185532.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (25, N'Кроссовки', 9, 2, N'Кроссовки для мужчин, идеальное сочетание стиля и комфорта. Производитель: Фабрика «Топ-Топ», г. Киров', N'Верх — 56% кожа, 29% текстиль, 15% полимерные материалы; подкладка — 100% текстиль; подошва — полимерные материалы, резина', CAST(9567.00 AS Decimal(18, 2)), N'Res/IMG_MS_185533.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (26, N'Черные туфли в классическом стиле — база для деловых образов', 10, 10, N'Модель выполнена из натуральной кожи, на резиновой подошве. Производитель: Дом обуви «Барбари», г. Новороссийск ', N'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — резина', CAST(24569.00 AS Decimal(18, 2)), N'Res/IMG_MSho_190514.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (27, N'Туфли мужские светлые классика демисезонные', 10, 16, N'Туфли на низком каблуке кожаные', N'Верх — натуральная кожа, подкладка — текстиль, стелька — натуральная кожа, подошва — ТЭП', CAST(10155.00 AS Decimal(18, 2)), N'Res/IMG_MSho_190518.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (28, N'Туфли из натуральной кожи', 10, 16, N'Модель выполнена из натуральной кожи, на резиновой подошве, поддеживает классический и деловой стиль образов. Производитель: Дом обуви «Берестов», г. Москва', N'Верх — натуральная кожа, подкладка — натуральная кожа, стелька — натуральная кожа, подошва — резина', CAST(25625.00 AS Decimal(18, 2)), N'Res/IMG_MSho_191612.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (29, N'Ботинки мужские демисезонные', 11, 10, N'Ботинки из натуральной кожи темно-коричневого и черного цвета на шнурках. Производитель: Дом обуви «Берестов», г. Москва', N'Верх — натуральная кожа, подкладка — текстиль, подошва — искусственный материал', CAST(21500.00 AS Decimal(18, 2)), N'Res/IMG_MB_174349.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (30, N'Ботинки черные из натуральной кожи', 11, 13, N'Ботинки представляют баланс традиций и современности. Выполнены из натуральной кожи насыщенного черного цвета. Производитель: ЗАО «Кожевенные традиции», г. Вятка', N'Верх — натуральная кожа, подкладка — ворсин, стелька — ворсин, подошва — тунит', CAST(14567.00 AS Decimal(18, 2)), N'Res/IMG_MB_191200.png')
INSERT [dbo].[Product] ([Id], [Name], [SubcategoryId], [ManufacturerId], [Description], [Material], [Cost], [Photo]) VALUES (31, N'Ботинки зимние классические', 11, 10, N'Выбор на каждый день — натуральная кожа, натуральный мех. Производитель: Дом обуви «Барбари», г. Новороссийск ', N'Верх — натуральная кожа, подкладка — натуральный мех, стелька — натуральный мех, подошва — ТЭП', CAST(15670.00 AS Decimal(18, 2)), N'Res/IMG_MB_191205.png')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Авторизованный пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([Id], [Size]) VALUES (1, CAST(18.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (2, CAST(19.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (3, CAST(20.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (4, CAST(21.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (5, CAST(22.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (6, CAST(23.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (7, CAST(24.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (8, CAST(25.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (9, CAST(26.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (10, CAST(27.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (11, CAST(28.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (12, CAST(29.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (13, CAST(30.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (14, CAST(31.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (15, CAST(32.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (16, CAST(33.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (17, CAST(34.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (18, CAST(35.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (19, CAST(36.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (20, CAST(36.5 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (21, CAST(37.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (22, CAST(37.5 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (23, CAST(38.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (24, CAST(38.5 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (25, CAST(39.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (26, CAST(39.5 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (27, CAST(40.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (28, CAST(40.5 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (29, CAST(41.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (30, CAST(41.5 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (31, CAST(42.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (32, CAST(42.5 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (33, CAST(43.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (34, CAST(44.0 AS Decimal(18, 1)))
INSERT [dbo].[Size] ([Id], [Size]) VALUES (35, CAST(45.0 AS Decimal(18, 1)))
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[StockItem] ON 

INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (1, 1, 3, 18)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (2, 1, 4, 20)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (3, 1, 5, 0)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (4, 1, 6, 20)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (5, 1, 7, 20)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (6, 1, 8, 20)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (7, 2, 16, 2)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (8, 2, 17, 1)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (9, 3, 2, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (10, 3, 3, 24)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (11, 4, 2, 15)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (12, 4, 3, 15)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (13, 5, 4, 2)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (14, 5, 5, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (15, 5, 6, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (16, 6, 1, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (17, 6, 2, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (18, 6, 3, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (19, 7, 4, 0)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (20, 7, 5, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (21, 7, 6, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (22, 7, 7, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (23, 8, 10, 7)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (24, 8, 11, 7)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (25, 8, 12, 7)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (26, 8, 13, 7)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (27, 9, 1, 7)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (28, 9, 2, 2)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (29, 9, 3, 7)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (30, 10, 19, 12)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (31, 10, 21, 0)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (32, 11, 25, 2)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (33, 11, 27, 2)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (34, 12, 21, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (35, 12, 25, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (36, 12, 27, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (37, 13, 19, 10)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (38, 13, 21, 10)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (39, 13, 23, 10)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (40, 13, 25, 10)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (41, 13, 27, 10)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (42, 14, 18, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (43, 15, 21, 23)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (44, 15, 25, 23)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (45, 15, 27, 23)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (46, 16, 19, 25)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (47, 16, 21, 25)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (48, 16, 23, 25)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (49, 17, 19, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (50, 17, 23, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (51, 17, 25, 4)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (52, 17, 27, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (53, 18, 18, 9)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (54, 18, 23, 9)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (55, 19, 18, 2)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (56, 19, 19, 2)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (57, 20, 21, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (58, 20, 22, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (59, 20, 23, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (60, 20, 24, 5)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (61, 21, 18, 16)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (62, 21, 19, 16)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (63, 21, 23, 16)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (64, 21, 25, 16)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (65, 22, 18, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (66, 22, 23, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (67, 23, 30, 18)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (68, 23, 31, 18)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (69, 23, 32, 18)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (70, 23, 33, 18)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (71, 24, 23, 50)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (72, 24, 24, 50)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (73, 24, 25, 50)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (74, 24, 26, 50)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (75, 24, 27, 50)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (76, 24, 29, 50)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (77, 25, 29, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (78, 25, 31, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (79, 25, 34, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (80, 26, 27, 23)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (81, 26, 29, 23)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (82, 26, 33, 23)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (83, 27, 31, 9)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (84, 27, 33, 15)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (85, 27, 34, 15)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (86, 28, 34, 3)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (87, 29, 29, 1)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (88, 29, 31, 1)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (89, 30, 31, 20)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (90, 30, 33, 20)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (91, 31, 29, 30)
INSERT [dbo].[StockItem] ([Id], [ProductId], [SizeId], [AviableQuantity]) VALUES (92, 31, 31, 30)
SET IDENTITY_INSERT [dbo].[StockItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Subcategory] ON 

INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (1, N'Кроссовки', 1)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (2, N'Сапоги', 1)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (3, N'Босоножки', 1)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (4, N'Туфли', 1)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (5, N'Сапоги', 2)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (6, N'Босоножки', 2)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (7, N'Туфли', 2)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (8, N'Кроссовки', 2)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (9, N'Кроссовки', 3)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (10, N'Туфли', 3)
INSERT [dbo].[Subcategory] ([Id], [Name], [CategoryId]) VALUES (11, N'Ботинки', 3)
SET IDENTITY_INSERT [dbo].[Subcategory] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (1, N'Иванов', N'Иван', N'Сергеевич', N'isivanov', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (2, N'Петров', N'Пётр', N'Алексеевич', N'papetrov', 2)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (3, N'Сидорова', N'Анна', N'Дмитриевна', N'asidorova', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (4, N'Кузнецова', N'Екатерина', N'Андреевна', N'ekuznetsova', 2)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (5, N'Смирнов', N'Дмитрий', N'Владимирович', N'dsmirnov', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (6, N'Попов', N'Алексей', N'Николаевич', N'apopov', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (7, N'Васильева', N'Ольга', N'Игоревна', N'ovasileva', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (8, N'Соколов', N'Павел', N'Викторович', N'psokolov', 2)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (9, N'Михайлова', N'Татьяна', N'Юрьевна', N'tmikhailova', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (10, N'Новикова', N'Наталья', N'Сергеевна', N'nnovikova', 2)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (11, N'Фёдоров', N'Андрей', N'Максимович', N'afedorov', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (12, N'Морозов', N'Сергей', N'Павлович', N'smorozov', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (13, N'Волкова', N'Юлия', N'Александровна', N'jvolkova', 2)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (14, N'Алексеев', N'Артём', N'Евгеньевич', N'aalekseev', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (15, N'Лебедева', N'Ирина', N'Владимировна', N'ilebedeva', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (16, N'Егоров', N'Никита', N'Денисович', N'negorov', 2)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (17, N'Павлова', N'Елена', N'Петровна', N'epavlova', 3)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (18, N'Козлов', N'Роман', N'Олегович', N'rkozlov', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (19, N'Степанова', N'Виктория', N'Романовна', N'vstepanova', 2)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Patronymic], [Login], [RoleId]) VALUES (20, N'Николаев', N'Владимир', N'Иванович', N'vnikolaev', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderInProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderInProduct_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderInProduct] CHECK CONSTRAINT [FK_OrderInProduct_Order]
GO
ALTER TABLE [dbo].[OrderInProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderInProduct_StockItem] FOREIGN KEY([StockItemId])
REFERENCES [dbo].[StockItem] ([Id])
GO
ALTER TABLE [dbo].[OrderInProduct] CHECK CONSTRAINT [FK_OrderInProduct_StockItem]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductProduction] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductProduction]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Subcategory1] FOREIGN KEY([SubcategoryId])
REFERENCES [dbo].[Subcategory] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Subcategory1]
GO
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [FK_AmountInStock_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [FK_AmountInStock_Product]
GO
ALTER TABLE [dbo].[StockItem]  WITH CHECK ADD  CONSTRAINT [FK_AmountInStock_Size] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([Id])
GO
ALTER TABLE [dbo].[StockItem] CHECK CONSTRAINT [FK_AmountInStock_Size]
GO
ALTER TABLE [dbo].[Subcategory]  WITH CHECK ADD  CONSTRAINT [FK_Subcategory_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Subcategory] CHECK CONSTRAINT [FK_Subcategory_Category]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [shoes] SET  READ_WRITE 
GO
