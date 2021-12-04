USE [master]
GO
/****** Object:  Database [machineShop]    Script Date: 10/10/2021 9:25:43 PM ******/
CREATE DATABASE [machineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'machineShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\machineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'machineShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\machineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [machineShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [machineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [machineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [machineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [machineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [machineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [machineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [machineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [machineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [machineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [machineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [machineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [machineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [machineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [machineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [machineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [machineShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [machineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [machineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [machineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [machineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [machineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [machineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [machineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [machineShop] SET RECOVERY FULL 
GO
ALTER DATABASE [machineShop] SET  MULTI_USER 
GO
ALTER DATABASE [machineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [machineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [machineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [machineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [machineShop] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'machineShop', N'ON'
GO
ALTER DATABASE [machineShop] SET QUERY_STORE = OFF
GO
USE [machineShop]
GO
/****** Object:  Table [dbo].[DailyRun]    Script Date: 10/10/2021 9:25:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyRun](
	[ID] [int] NOT NULL,
	[RunDate] [datetime] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[WorkOrderID] [int] NOT NULL,
	[MachineID] [varchar](5) NOT NULL,
	[QtyRan] [int] NULL,
	[TimeTaken] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/10/2021 9:25:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[PhoneNo] [varchar](15) NULL,
	[ZipCodeID] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinishedParts]    Script Date: 10/10/2021 9:25:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinishedParts](
	[FinishedPartID] [int] NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[RawPartID] [int] NOT NULL,
	[FinishedQty] [int] NULL,
	[FinishPartNo] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FinishedPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 10/10/2021 9:25:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machine](
	[MachineID] [varchar](5) NOT NULL,
	[MachineType] [varchar](10) NOT NULL,
	[Operation] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RawParts]    Script Date: 10/10/2021 9:25:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RawParts](
	[RawPartID] [int] NOT NULL,
	[RawPartNo] [varchar](20) NOT NULL,
	[Material] [varchar](40) NOT NULL,
	[RawQty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RawPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrder]    Script Date: 10/10/2021 9:25:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrder](
	[WorkOrderID] [int] NOT NULL,
	[FinishedPartID] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Quantity] [int] NULL,
	[EstimatedTime] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[WorkOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZipCode]    Script Date: 10/10/2021 9:25:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZipCode](
	[ZipCodeID] [varchar](10) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZipCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [idx_Employee]    Script Date: 10/10/2021 9:25:44 PM ******/
CREATE NONCLUSTERED INDEX [idx_Employee] ON [dbo].[DailyRun]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Machine]    Script Date: 10/10/2021 9:25:44 PM ******/
CREATE NONCLUSTERED INDEX [idx_Machine] ON [dbo].[DailyRun]
(
	[MachineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Workorder]    Script Date: 10/10/2021 9:25:44 PM ******/
CREATE NONCLUSTERED INDEX [idx_Workorder] ON [dbo].[DailyRun]
(
	[WorkOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Zipcode]    Script Date: 10/10/2021 9:25:44 PM ******/
CREATE NONCLUSTERED INDEX [idx_Zipcode] ON [dbo].[Employee]
(
	[ZipCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Rawpart]    Script Date: 10/10/2021 9:25:44 PM ******/
CREATE NONCLUSTERED INDEX [idx_Rawpart] ON [dbo].[FinishedParts]
(
	[RawPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Finishedpart]    Script Date: 10/10/2021 9:25:44 PM ******/
CREATE NONCLUSTERED INDEX [idx_Finishedpart] ON [dbo].[WorkOrder]
(
	[FinishedPartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DailyRun]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DailyRun] CHECK CONSTRAINT [FK_EmployeeID]
GO
ALTER TABLE [dbo].[DailyRun]  WITH CHECK ADD  CONSTRAINT [FK_MachineID] FOREIGN KEY([MachineID])
REFERENCES [dbo].[Machine] ([MachineID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DailyRun] CHECK CONSTRAINT [FK_MachineID]
GO
ALTER TABLE [dbo].[DailyRun]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrderID] FOREIGN KEY([WorkOrderID])
REFERENCES [dbo].[WorkOrder] ([WorkOrderID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DailyRun] CHECK CONSTRAINT [FK_WorkOrderID]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Zipcode] FOREIGN KEY([ZipCodeID])
REFERENCES [dbo].[ZipCode] ([ZipCodeID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Zipcode]
GO
ALTER TABLE [dbo].[FinishedParts]  WITH CHECK ADD  CONSTRAINT [FK_RawPartID] FOREIGN KEY([RawPartID])
REFERENCES [dbo].[RawParts] ([RawPartID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[FinishedParts] CHECK CONSTRAINT [FK_RawPartID]
GO
ALTER TABLE [dbo].[WorkOrder]  WITH CHECK ADD  CONSTRAINT [FK_FinishedPartID] FOREIGN KEY([FinishedPartID])
REFERENCES [dbo].[FinishedParts] ([FinishedPartID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[WorkOrder] CHECK CONSTRAINT [FK_FinishedPartID]
GO
USE [master]
GO
ALTER DATABASE [machineShop] SET  READ_WRITE 
GO