USE [master]
GO
/****** Object:  Database [Employees]    Script Date: 12/2/2021 4:36:46 PM ******/
CREATE DATABASE [Employees]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Employees', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.YOUSEFSQL\MSSQL\DATA\Employees.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Employees_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.YOUSEFSQL\MSSQL\DATA\Employees_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Employees] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employees].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employees] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employees] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employees] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employees] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employees] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employees] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employees] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employees] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employees] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employees] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employees] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employees] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employees] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employees] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employees] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employees] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employees] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employees] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employees] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employees] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employees] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employees] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employees] SET RECOVERY FULL 
GO
ALTER DATABASE [Employees] SET  MULTI_USER 
GO
ALTER DATABASE [Employees] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employees] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employees] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employees] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employees] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Employees', N'ON'
GO
ALTER DATABASE [Employees] SET QUERY_STORE = OFF
GO
USE [Employees]
GO
/****** Object:  Table [dbo].[T_Country]    Script Date: 12/2/2021 4:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Department]    Script Date: 12/2/2021 4:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK_T_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_Employee]    Script Date: 12/2/2021 4:36:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[DepartmentID] [int] NULL,
	[Salary] [decimal](18, 0) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[CountryID] [int] NULL,
 CONSTRAINT [PK_T_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_Country] ON 

INSERT [dbo].[T_Country] ([CountryID], [CountryName]) VALUES (1, N'Jordan')
INSERT [dbo].[T_Country] ([CountryID], [CountryName]) VALUES (2, N'Iraq')
INSERT [dbo].[T_Country] ([CountryID], [CountryName]) VALUES (3, N'Turkey')
SET IDENTITY_INSERT [dbo].[T_Country] OFF
SET IDENTITY_INSERT [dbo].[T_Department] ON 

INSERT [dbo].[T_Department] ([DepartmentID], [DepartmentName]) VALUES (1, N'IT')
SET IDENTITY_INSERT [dbo].[T_Department] OFF
SET IDENTITY_INSERT [dbo].[T_Employee] ON 

INSERT [dbo].[T_Employee] ([ID], [FullName], [DepartmentID], [Salary], [PhoneNumber], [CountryID]) VALUES (1, N'yousef asad', 1, CAST(200 AS Decimal(18, 0)), N'078564545', 1)
INSERT [dbo].[T_Employee] ([ID], [FullName], [DepartmentID], [Salary], [PhoneNumber], [CountryID]) VALUES (8, N'Mohammad', 1, CAST(5000 AS Decimal(18, 0)), N'0798624182', 3)
INSERT [dbo].[T_Employee] ([ID], [FullName], [DepartmentID], [Salary], [PhoneNumber], [CountryID]) VALUES (9, N'Ali', 1, CAST(5000 AS Decimal(18, 0)), N'0000000', 3)
SET IDENTITY_INSERT [dbo].[T_Employee] OFF
ALTER TABLE [dbo].[T_Employee]  WITH CHECK ADD  CONSTRAINT [FK_T_Employee_T_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[T_Country] ([CountryID])
GO
ALTER TABLE [dbo].[T_Employee] CHECK CONSTRAINT [FK_T_Employee_T_Country]
GO
ALTER TABLE [dbo].[T_Employee]  WITH CHECK ADD  CONSTRAINT [FK_T_Employee_T_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[T_Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[T_Employee] CHECK CONSTRAINT [FK_T_Employee_T_Department]
GO
USE [master]
GO
ALTER DATABASE [Employees] SET  READ_WRITE 
GO
