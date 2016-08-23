USE [master]
GO
/****** Object:  Database [MyDukkanDB]    Script Date: 23.8.2016 10:48:20 ******/
CREATE DATABASE [MyDukkanDB]
GO
ALTER DATABASE [MyDukkanDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyDukkanDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyDukkanDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyDukkanDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyDukkanDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyDukkanDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyDukkanDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyDukkanDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyDukkanDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MyDukkanDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyDukkanDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyDukkanDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyDukkanDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyDukkanDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyDukkanDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyDukkanDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyDukkanDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyDukkanDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyDukkanDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyDukkanDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyDukkanDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyDukkanDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyDukkanDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyDukkanDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyDukkanDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyDukkanDB] SET RECOVERY FULL 
GO
ALTER DATABASE [MyDukkanDB] SET  MULTI_USER 
GO
ALTER DATABASE [MyDukkanDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyDukkanDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyDukkanDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyDukkanDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyDukkanDB', N'ON'
GO
USE [MyDukkanDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23.8.2016 10:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 23.8.2016 10:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nickname] [nvarchar](30) NOT NULL,
	[Text] [nvarchar](250) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsValid] [bit] NOT NULL CONSTRAINT [DF_Comments_IsValid]  DEFAULT ((0)),
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 23.8.2016 10:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Price] [decimal](7, 2) NOT NULL,
	[Summary] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[StarCount] [tinyint] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ImageFileName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SiteUsers]    Script Date: 23.8.2016 10:48:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[LastAccess] [datetime] NOT NULL,
	[Permission] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SiteUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Gıda')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Kozmetik')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Elektronik')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Giyim')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

GO
INSERT [dbo].[Comments] ([Id], [Nickname], [Text], [ProductId], [CreatedOn], [IsValid]) VALUES (2, N'muratbaseren', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 3, CAST(N'2016-08-22 10:27:04.467' AS DateTime), 1)
GO
INSERT [dbo].[Comments] ([Id], [Nickname], [Text], [ProductId], [CreatedOn], [IsValid]) VALUES (3, N'muratbaseren2', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 3, CAST(N'2016-08-22 10:27:13.400' AS DateTime), 1)
GO
INSERT [dbo].[Comments] ([Id], [Nickname], [Text], [ProductId], [CreatedOn], [IsValid]) VALUES (4, N'user2', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 3, CAST(N'2016-08-22 10:27:19.777' AS DateTime), 1)
GO
INSERT [dbo].[Comments] ([Id], [Nickname], [Text], [ProductId], [CreatedOn], [IsValid]) VALUES (6, N'akif', N'böyle baklama olmaz olsun.', 3, CAST(N'2016-08-22 11:13:55.967' AS DateTime), 1)
GO
INSERT [dbo].[Comments] ([Id], [Nickname], [Text], [ProductId], [CreatedOn], [IsValid]) VALUES (7, N'hakan', N'olmadı şimdi', 2, CAST(N'2016-08-22 11:43:57.497' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (1, N'Ekmek', CAST(1.00 AS Decimal(7, 2)), N'Buğday ekmeği', N'Yeme de yanında yat, yok böyle ekmek bir alan bir daha alıyor.', 3, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (2, N'Çorba', CAST(3.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 4, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (3, N'Baklava', CAST(25.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 5, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (4, N'Çikolata', CAST(5.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 2, 1, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (5, N'Tişört', CAST(15.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 3, 4, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (6, N'Gömlek', CAST(45.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 5, 4, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (7, N'Parfüm', CAST(256.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 5, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (8, N'Deodorant', CAST(7.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 3, 2, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (9, N'Laptop', CAST(1145.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 4, 3, NULL)
GO
INSERT [dbo].[Products] ([Id], [Name], [Price], [Summary], [Description], [StarCount], [CategoryId], [ImageFileName]) VALUES (10, N'Cep Telefonu', CAST(756.00 AS Decimal(7, 2)), N'Tincidunt integer eu augue augue nunc elit dolor', N'Tincidunt integer eu augue augue nunc elit dolor, luctus placerat scelerisque euismod, iaculis eu lacus nunc mi elit, vehicula ut laoreet ac, aliquam sit amet justo nunc tempor, metus vel.', 4, 3, NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[SiteUsers] ON 

GO
INSERT [dbo].[SiteUsers] ([Id], [Name], [Surname], [Email], [Password], [LastAccess], [Permission]) VALUES (1, N'Murat', N'Başeren', N'kadirmuratbaseren@gmail.com', N'123', CAST(N'2016-08-19 11:35:18.627' AS DateTime), N'admin')
GO
INSERT [dbo].[SiteUsers] ([Id], [Name], [Surname], [Email], [Password], [LastAccess], [Permission]) VALUES (3, N'Kadir Murat', N'Başeren', N'muratbaseren@gmail.com', N'123', CAST(N'2016-08-19 11:30:01.650' AS DateTime), N'admin')
GO
INSERT [dbo].[SiteUsers] ([Id], [Name], [Surname], [Email], [Password], [LastAccess], [Permission]) VALUES (4, N'Murat', N'Başeren', N'kkk', N'kkk', CAST(N'2016-08-23 10:44:33.687' AS DateTime), N'kullanici')
GO
INSERT [dbo].[SiteUsers] ([Id], [Name], [Surname], [Email], [Password], [LastAccess], [Permission]) VALUES (5, N'Murat', N'Başeren', N'aaa', N'aaa', CAST(N'2016-08-23 10:44:46.313' AS DateTime), N'admin')
GO
SET IDENTITY_INSERT [dbo].[SiteUsers] OFF
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [MyDukkanDB] SET  READ_WRITE 
GO
