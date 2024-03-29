USE [master]
GO
/****** Object:  Database [EfNinja-TaskD]    Script Date: 25.02.2024 08:19:05 ******/
CREATE DATABASE [EfNinja-TaskD]
GO
ALTER DATABASE [EfNinja-TaskD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EfNinja-TaskD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EfNinja-TaskD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET ARITHABORT OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EfNinja-TaskD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EfNinja-TaskD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EfNinja-TaskD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EfNinja-TaskD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EfNinja-TaskD] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EfNinja-TaskD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EfNinja-TaskD] SET  MULTI_USER 
GO
ALTER DATABASE [EfNinja-TaskD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EfNinja-TaskD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EfNinja-TaskD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EfNinja-TaskD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EfNinja-TaskD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EfNinja-TaskD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EfNinja-TaskD] SET QUERY_STORE = OFF
GO
USE [EfNinja-TaskD]
GO
/****** Object:  Table [dbo].[Claims]    Script Date: 25.02.2024 08:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExternalId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[Date] [datetimeoffset](7) NOT NULL,
	[StatusId] [int] NOT NULL,
	[Amount] [decimal](14, 4) NOT NULL,
	[CoverId] [int] NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimStatuses]    Script Date: 25.02.2024 08:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimStatuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExternalId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_ClaimStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Covers]    Script Date: 25.02.2024 08:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Covers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExternalId] [uniqueidentifier] NOT NULL,
	[CoverTypeId] [int] NOT NULL,
	[StartDate] [datetimeoffset](7) NOT NULL,
	[EndDate] [datetimeoffset](7) NOT NULL,
	[Premium] [decimal](14, 4) NOT NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Covers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoverTypes]    Script Date: 25.02.2024 08:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoverTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExternalId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CoverTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddresses]    Script Date: 25.02.2024 08:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExternalId] [uniqueidentifier] NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[PostalCode] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 25.02.2024 08:19:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExternalId] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](100) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_CoverId]    Script Date: 25.02.2024 08:19:05 ******/
CREATE NONCLUSTERED INDEX [IX_Claims_CoverId] ON [dbo].[Claims]
(
	[CoverId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Claims_StatusId]    Script Date: 25.02.2024 08:19:05 ******/
CREATE NONCLUSTERED INDEX [IX_Claims_StatusId] ON [dbo].[Claims]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Covers_CoverTypeId]    Script Date: 25.02.2024 08:19:05 ******/
CREATE NONCLUSTERED INDEX [IX_Covers_CoverTypeId] ON [dbo].[Covers]
(
	[CoverTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Covers_CustomerId]    Script Date: 25.02.2024 08:19:05 ******/
CREATE NONCLUSTERED INDEX [IX_Covers_CustomerId] ON [dbo].[Covers]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customers_AddressId]    Script Date: 25.02.2024 08:19:05 ******/
CREATE NONCLUSTERED INDEX [IX_Customers_AddressId] ON [dbo].[Customers]
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Customers_FirstName_LastName]    Script Date: 25.02.2024 08:19:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customers_FirstName_LastName] ON [dbo].[Customers]
(
	[FirstName] ASC,
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_ClaimStatuses_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ClaimStatuses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_ClaimStatuses_StatusId]
GO
ALTER TABLE [dbo].[Claims]  WITH CHECK ADD  CONSTRAINT [FK_Claims_Covers_CoverId] FOREIGN KEY([CoverId])
REFERENCES [dbo].[Covers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Claims] CHECK CONSTRAINT [FK_Claims_Covers_CoverId]
GO
ALTER TABLE [dbo].[Covers]  WITH CHECK ADD  CONSTRAINT [FK_Covers_CoverTypes_CoverTypeId] FOREIGN KEY([CoverTypeId])
REFERENCES [dbo].[CoverTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Covers] CHECK CONSTRAINT [FK_Covers_CoverTypes_CoverTypeId]
GO
ALTER TABLE [dbo].[Covers]  WITH CHECK ADD  CONSTRAINT [FK_Covers_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Covers] CHECK CONSTRAINT [FK_Covers_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerAddresses_AddressId] FOREIGN KEY([AddressId])
REFERENCES [dbo].[CustomerAddresses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CustomerAddresses_AddressId]
GO
USE [master]
GO
ALTER DATABASE [EfNinja-TaskD] SET  READ_WRITE 
GO
