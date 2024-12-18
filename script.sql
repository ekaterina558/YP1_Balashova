USE [master]
GO
/****** Object:  Database [AvtoMasterskya]    Script Date: 12.12.2024 18:02:44 ******/
CREATE DATABASE [AvtoMasterskya]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AvtoMasterskya', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AvtoMasterskya.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AvtoMasterskya_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AvtoMasterskya_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AvtoMasterskya] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AvtoMasterskya].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AvtoMasterskya] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET ARITHABORT OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AvtoMasterskya] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AvtoMasterskya] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AvtoMasterskya] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AvtoMasterskya] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AvtoMasterskya] SET  MULTI_USER 
GO
ALTER DATABASE [AvtoMasterskya] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AvtoMasterskya] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AvtoMasterskya] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AvtoMasterskya] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AvtoMasterskya] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AvtoMasterskya] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AvtoMasterskya] SET QUERY_STORE = OFF
GO
USE [AvtoMasterskya]
GO
/****** Object:  Table [dbo].[Smena]    Script Date: 12.12.2024 18:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Smena](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[naimenov] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Smena] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudniki]    Script Date: 12.12.2024 18:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudniki](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[surname] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[otchestvo] [nvarchar](50) NOT NULL,
	[Dolznost] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[IDSmena] [int] NOT NULL,
	[IDZakaz] [int] NOT NULL,
 CONSTRAINT [PK_Sotrudniki] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12.12.2024 18:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[IDRole] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakaz]    Script Date: 12.12.2024 18:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakaz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[naimenov] [nvarchar](50) NOT NULL,
	[kolichestvo] [int] NOT NULL,
	[cena] [money] NOT NULL,
 CONSTRAINT [PK_Zakaz] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Smena] ON 

INSERT [dbo].[Smena] ([ID], [naimenov]) VALUES (1, N'Смена_1')
INSERT [dbo].[Smena] ([ID], [naimenov]) VALUES (2, N'Смена_2')
INSERT [dbo].[Smena] ([ID], [naimenov]) VALUES (3, N'Смена_3')
INSERT [dbo].[Smena] ([ID], [naimenov]) VALUES (4, N'Смена_4')
INSERT [dbo].[Smena] ([ID], [naimenov]) VALUES (5, N'Смена_5')
SET IDENTITY_INSERT [dbo].[Smena] OFF
GO
SET IDENTITY_INSERT [dbo].[Sotrudniki] ON 

INSERT [dbo].[Sotrudniki] ([ID], [surname], [name], [otchestvo], [Dolznost], [Status], [IDSmena], [IDZakaz]) VALUES (1, N'Петров', N'Роман', N'Владимирович', N'Автомеханик', N'Уволен', 1, 1)
INSERT [dbo].[Sotrudniki] ([ID], [surname], [name], [otchestvo], [Dolznost], [Status], [IDSmena], [IDZakaz]) VALUES (2, N'Горбунова', N'София', N'Васильевна', N'Автодиагност', N'Уволена', 2, 2)
INSERT [dbo].[Sotrudniki] ([ID], [surname], [name], [otchestvo], [Dolznost], [Status], [IDSmena], [IDZakaz]) VALUES (3, N'Соболев', N'Арсений', N'Артурович', N'Мастер приемщик', N'Принят', 3, 3)
INSERT [dbo].[Sotrudniki] ([ID], [surname], [name], [otchestvo], [Dolznost], [Status], [IDSmena], [IDZakaz]) VALUES (4, N'Ильин', N'Давид', N'Романович', N'Автодиагност', N'Принят', 4, 4)
INSERT [dbo].[Sotrudniki] ([ID], [surname], [name], [otchestvo], [Dolznost], [Status], [IDSmena], [IDZakaz]) VALUES (5, N'Соколова', N'Анна ', N'Матвеевна', N'Автомеханик', N'Принята', 5, 5)
SET IDENTITY_INSERT [dbo].[Sotrudniki] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [login], [password], [name], [IDRole]) VALUES (1, N'admin', N'admin', N'Екатерина', 1)
INSERT [dbo].[User] ([ID], [login], [password], [name], [IDRole]) VALUES (2, N'user', N'user', N'Гость', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Zakaz] ON 

INSERT [dbo].[Zakaz] ([ID], [naimenov], [kolichestvo], [cena]) VALUES (1, N'Заказ_1', 3, 400.0000)
INSERT [dbo].[Zakaz] ([ID], [naimenov], [kolichestvo], [cena]) VALUES (2, N'Заказ_2', 4, 500.0000)
INSERT [dbo].[Zakaz] ([ID], [naimenov], [kolichestvo], [cena]) VALUES (3, N'Заказ_3', 2, 200.0000)
INSERT [dbo].[Zakaz] ([ID], [naimenov], [kolichestvo], [cena]) VALUES (4, N'Заказ_4', 5, 450.0000)
INSERT [dbo].[Zakaz] ([ID], [naimenov], [kolichestvo], [cena]) VALUES (5, N'Заказ_5', 6, 500.0000)
INSERT [dbo].[Zakaz] ([ID], [naimenov], [kolichestvo], [cena]) VALUES (6, N'edrgrd', 1, 10.0000)
SET IDENTITY_INSERT [dbo].[Zakaz] OFF
GO
ALTER TABLE [dbo].[Sotrudniki]  WITH CHECK ADD  CONSTRAINT [FK_Sotrudniki_Smena] FOREIGN KEY([IDSmena])
REFERENCES [dbo].[Smena] ([ID])
GO
ALTER TABLE [dbo].[Sotrudniki] CHECK CONSTRAINT [FK_Sotrudniki_Smena]
GO
ALTER TABLE [dbo].[Sotrudniki]  WITH CHECK ADD  CONSTRAINT [FK_Sotrudniki_Zakaz] FOREIGN KEY([IDZakaz])
REFERENCES [dbo].[Zakaz] ([ID])
GO
ALTER TABLE [dbo].[Sotrudniki] CHECK CONSTRAINT [FK_Sotrudniki_Zakaz]
GO
USE [master]
GO
ALTER DATABASE [AvtoMasterskya] SET  READ_WRITE 
GO
