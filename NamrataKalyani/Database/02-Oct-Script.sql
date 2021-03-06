USE [master]
GO
/****** Object:  Database [SUNDIGNOSTIC]    Script Date: 02-10-2021 12:11:02 ******/
CREATE DATABASE [SUNDIGNOSTIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SUNDIGNOSTIC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SUNDIGNOSTIC.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SUNDIGNOSTIC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SUNDIGNOSTIC_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SUNDIGNOSTIC] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SUNDIGNOSTIC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ARITHABORT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET  MULTI_USER 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SUNDIGNOSTIC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SUNDIGNOSTIC] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SUNDIGNOSTIC]
GO
/****** Object:  Table [dbo].[ReferalDoctor]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReferalDoctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReferalDoctorName] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ReferalDoctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_BillingMaster]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BillingMaster](
	[BilIingId] [int] IDENTITY(1,1) NOT NULL,
	[PId] [int] NULL,
	[Amount] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 0) NULL,
	[Expenses] [decimal](18, 0) NULL,
	[ReferalPercentage] [decimal](18, 0) NULL,
	[ReferalAmount] [decimal](18, 0) NULL,
	[DUE] [decimal](18, 0) NULL,
	[CollectedById] [int] NULL,
	[Status] [bit] NULL CONSTRAINT [DF__tbl_Billi__Statu__3E1D39E1]  DEFAULT ((0)),
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK__tbl_Bill__4473BF9A68C9D675] PRIMARY KEY CLUSTERED 
(
	[BilIingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_BillingReport]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_BillingReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NULL,
	[ReportId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_CenterSettings]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_CenterSettings](
	[CenterId] [int] IDENTITY(1,1) NOT NULL,
	[CenterName] [varchar](50) NULL,
	[FullAddress] [varchar](max) NULL,
	[BranchLocation] [varchar](50) NULL,
	[Logo] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Doctor] PRIMARY KEY CLUSTERED 
(
	[CenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[serumCholestrol] [varchar](50) NULL,
	[hdlCholestrol] [varchar](50) NULL,
	[LDLCholestrol] [varchar](50) NULL,
	[VLDLCholestrol] [varchar](50) NULL,
	[serumTriglyceride] [varchar](50) NULL,
	[THDL] [varchar](50) NULL,
	[LDLHDL] [varchar](50) NULL,
	[titalLipid] [varchar](50) NULL,
	[Name] [varchar](150) NULL,
	[ReportTypeId] [int] NULL,
	[DoctorName] [varchar](100) NULL,
	[Qualification] [varchar](100) NULL,
	[Designation] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ClinicalBiochemistoryReportLTF] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLTF]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ClinicalBiochemistoryReportLTF](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[serumBilirubin] [varchar](50) NULL,
	[serumBilirubinD] [varchar](50) NULL,
	[serumBilirubinID] [varchar](50) NULL,
	[serumAsparateAminoTransferase] [varchar](50) NULL,
	[serumAlanineAminoTransferase] [varchar](50) NULL,
	[serumTotalProtein] [varchar](50) NULL,
	[serumAlbumin] [varchar](50) NULL,
	[serumGlubulin] [varchar](50) NULL,
	[AGRation] [varchar](50) NULL,
	[serumAlkalinePhosphatse] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Name] [varchar](150) NULL,
	[ReportTypeId] [int] NULL,
	[Qualification] [varchar](100) NULL,
	[Designation] [varchar](100) NULL,
	[DoctorName] [varchar](150) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ClinicalBiochemistoryReportLIPIDProfile] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Collected]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Collected](
	[CollectedById] [int] IDENTITY(1,1) NOT NULL,
	[Collected_Name] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Collected] PRIMARY KEY CLUSTERED 
(
	[CollectedById] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ComputerBloodPictureReport]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ComputerBloodPictureReport](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[Date] [datetime] NULL,
	[Haemoglobin] [varchar](50) NULL,
	[ErythrocyteCount] [varchar](50) NULL,
	[TotalWBCCount] [varchar](50) NULL,
	[Neutrophils] [varchar](50) NULL,
	[Lymphocytes] [varchar](50) NULL,
	[Eosinophils] [varchar](50) NULL,
	[Monocytes] [varchar](50) NULL,
	[Basophils] [varchar](50) NULL,
	[Rbcs] [varchar](50) NULL,
	[PlateletCount] [varchar](50) NULL,
	[Name] [varchar](150) NULL,
	[ReportTypeId] [int] NULL,
	[Designation] [varchar](100) NULL,
	[Qualification] [varchar](100) NULL,
	[DoctorName] [varchar](100) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ComputerBloodPictureReport] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Doctor]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Doctor](
	[DocId] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](50) NULL,
	[Specilization] [varchar](max) NULL,
	[Signature] [varchar](max) NULL,
	[Qualification] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_Doctor_1] PRIMARY KEY CLUSTERED 
(
	[DocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_OtherReport]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OtherReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportTypeId] [int] NULL,
	[PId] [int] NULL,
	[TestName] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_OtherReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PatientInfo]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PatientInfo](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Pname] [varchar](50) NULL,
	[Age] [tinyint] NULL,
	[Gender] [varchar](10) NULL,
	[RefDocId] [int] NULL,
	[MobileNo] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_PatientInfo] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Printer]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Printer](
	[Printer_id] [int] IDENTITY(1,1) NOT NULL,
	[Printer_Name] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Printer] PRIMARY KEY CLUSTERED 
(
	[Printer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ReportType]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ReportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [varchar](max) NULL,
	[ShortName] [varchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ReportType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_UserLogin]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_UserLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Passward] [varchar](50) NULL,
	[Status] [bit] NULL,
	[Center] [int] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tble_Employee]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tble_Employee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tble_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_BillingMaster] ON 

INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, 1, CAST(3000.00 AS Decimal(18, 2)), CAST(100 AS Decimal(18, 0)), CAST(700 AS Decimal(18, 0)), NULL, CAST(1000 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL, 1, 1, 1, CAST(N'2021-09-19 02:10:00.000' AS DateTime), CAST(N'2021-09-22 17:33:17.040' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, 27, CAST(200.00 AS Decimal(18, 2)), CAST(10 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), NULL, CAST(21 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL, 1, NULL, 1, CAST(N'2021-09-20 00:00:00.000' AS DateTime), CAST(N'2021-09-22 19:12:58.740' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, 2030, CAST(2000.00 AS Decimal(18, 2)), CAST(200 AS Decimal(18, 0)), CAST(400 AS Decimal(18, 0)), NULL, CAST(100 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), NULL, 1, NULL, 1, CAST(N'2021-09-21 00:00:00.000' AS DateTime), CAST(N'2021-09-28 02:42:17.810' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3004, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:08:44.977' AS DateTime), CAST(N'2021-09-26 15:08:44.977' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3005, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:10:04.230' AS DateTime), CAST(N'2021-09-26 15:10:04.230' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3006, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:10:31.410' AS DateTime), CAST(N'2021-09-26 15:10:31.410' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3007, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:13:42.410' AS DateTime), CAST(N'2021-09-26 15:13:42.410' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3008, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:19:35.583' AS DateTime), CAST(N'2021-09-26 15:19:35.583' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3009, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:22:52.390' AS DateTime), CAST(N'2021-09-26 15:22:52.390' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3010, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:23:55.390' AS DateTime), CAST(N'2021-09-26 15:23:55.390' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3011, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:26:51.077' AS DateTime), CAST(N'2021-09-26 15:26:51.077' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3012, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:28:08.960' AS DateTime), CAST(N'2021-09-26 15:28:08.960' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3013, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:32:47.873' AS DateTime), CAST(N'2021-09-26 15:32:47.873' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3014, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 15:33:03.080' AS DateTime), CAST(N'2021-09-26 15:33:03.080' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3015, 1, CAST(800.00 AS Decimal(18, 2)), CAST(100 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL, CAST(200 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), NULL, 1, 1, 1, CAST(N'2021-09-26 15:33:36.477' AS DateTime), CAST(N'2021-09-28 01:07:36.727' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3016, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 16:13:08.803' AS DateTime), CAST(N'2021-09-26 16:13:08.803' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3017, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 16:33:14.783' AS DateTime), CAST(N'2021-09-26 16:33:14.783' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3018, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 16:46:46.990' AS DateTime), CAST(N'2021-09-26 16:46:46.990' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3019, 5032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 16:49:56.977' AS DateTime), CAST(N'2021-09-26 16:49:56.977' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3020, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 19:17:53.717' AS DateTime), CAST(N'2021-09-26 19:17:53.717' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3021, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-26 21:40:08.010' AS DateTime), CAST(N'2021-09-26 21:40:08.010' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4020, 5033, CAST(1000.00 AS Decimal(18, 2)), CAST(100 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL, CAST(200 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)), NULL, 1, 1, 1, CAST(N'2021-09-28 01:34:34.887' AS DateTime), CAST(N'2021-09-28 01:35:56.383' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4021, 5034, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-28 02:10:41.917' AS DateTime), CAST(N'2021-09-28 02:10:41.917' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4022, 5035, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, CAST(N'2021-09-28 02:37:59.123' AS DateTime), CAST(N'2021-09-28 02:37:59.123' AS DateTime))
INSERT [dbo].[tbl_BillingMaster] ([BilIingId], [PId], [Amount], [Discount], [Expenses], [ReferalPercentage], [ReferalAmount], [DUE], [CollectedById], [Status], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4023, 5035, CAST(1000.00 AS Decimal(18, 2)), CAST(10 AS Decimal(18, 0)), CAST(23 AS Decimal(18, 0)), CAST(20 AS Decimal(18, 0)), CAST(200 AS Decimal(18, 0)), CAST(123 AS Decimal(18, 0)), NULL, 1, 1, 1, CAST(N'2021-09-28 03:02:38.117' AS DateTime), CAST(N'2021-09-28 13:35:22.050' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_BillingMaster] OFF
SET IDENTITY_INSERT [dbo].[tbl_BillingReport] ON 

INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, 1, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Dr.Kalyani Hyderabadi</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart Surgon specialist&nbsp;</label></td>
</tr>
</tbody>
</table>', NULL, 1, CAST(N'2021-09-19 00:00:00.000' AS DateTime), CAST(N'2021-09-26 21:39:03.587' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1004, 3, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1005, 1004, 1, NULL, 1, 1, CAST(N'2021-09-23 17:15:56.727' AS DateTime), CAST(N'2021-09-23 17:15:56.727' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (4, 2, 1, NULL, NULL, NULL, CAST(N'2021-09-20 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (5, 3, 2, NULL, NULL, NULL, CAST(N'2021-09-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2008, 3015, 2, NULL, 1, 1, CAST(N'2021-09-26 15:33:46.757' AS DateTime), CAST(N'2021-09-26 15:33:46.757' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2010, 3016, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:13:09.027' AS DateTime), CAST(N'2021-09-26 16:13:09.027' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2011, 3016, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:13:09.123' AS DateTime), CAST(N'2021-09-26 16:13:09.123' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2020, 3021, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">13 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Rajita</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 27, CAST(N'2021-09-26 21:40:08.027' AS DateTime), CAST(N'2021-09-30 23:21:54.787' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3023, 4022, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.4 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)Bilal</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Dr Bilal</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 5035, CAST(N'2021-09-28 02:37:59.343' AS DateTime), CAST(N'2021-09-28 02:52:42.927' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3024, 4022, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-28 02:37:59.370' AS DateTime), CAST(N'2021-09-28 02:37:59.370' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3025, 4023, 6, N'<p style="text-align: center;"><strong>Blood Uria&nbsp;</strong></p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ajaz</strong></p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Pathology</strong></p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;">&nbsp;</p>', 1, 1, CAST(N'2021-09-28 03:02:38.260' AS DateTime), CAST(N'2021-09-28 03:02:38.260' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2009, 3015, 3, NULL, 1, 1, CAST(N'2021-09-26 15:33:46.807' AS DateTime), CAST(N'2021-09-26 15:33:46.807' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2012, 3017, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:33:14.793' AS DateTime), CAST(N'2021-09-26 16:33:14.793' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2013, 3017, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:33:14.823' AS DateTime), CAST(N'2021-09-26 16:33:14.823' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2014, 3018, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:46:47.007' AS DateTime), CAST(N'2021-09-26 16:46:47.007' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2015, 3018, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">S.T Marks</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:46:47.010' AS DateTime), CAST(N'2021-09-26 16:47:48.720' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2017, 3019, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:49:56.990' AS DateTime), CAST(N'2021-09-26 16:49:56.990' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2018, 3019, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:49:57.017' AS DateTime), CAST(N'2021-09-26 16:49:57.017' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2019, 3020, 3, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">23 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%">surya<br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 27, CAST(N'2021-09-26 19:17:53.730' AS DateTime), CAST(N'2021-09-26 19:19:03.113' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2016, 3019, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-26 16:49:56.980' AS DateTime), CAST(N'2021-09-26 16:49:56.980' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3019, 4020, 1, N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-28 01:34:34.893' AS DateTime), CAST(N'2021-09-28 01:34:34.893' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3020, 4020, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">James</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Pathology</label></td>
</tr>
</tbody>
</table>', 1, 5033, CAST(N'2021-09-28 01:34:34.957' AS DateTime), CAST(N'2021-09-28 01:39:17.887' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3021, 4021, 2, N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', 1, 1, CAST(N'2021-09-28 02:10:41.923' AS DateTime), CAST(N'2021-09-28 02:10:41.923' AS DateTime))
INSERT [dbo].[tbl_BillingReport] ([Id], [BillId], [ReportId], [Description], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3022, 4021, 5, N'<h1 style="text-align: center;"><strong>Test For Kidney</strong></h1>', 1, 5034, CAST(N'2021-09-28 02:10:41.950' AS DateTime), CAST(N'2021-09-28 02:13:35.917' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_BillingReport] OFF
SET IDENTITY_INSERT [dbo].[tbl_CenterSettings] ON 

INSERT [dbo].[tbl_CenterSettings] ([CenterId], [CenterName], [FullAddress], [BranchLocation], [Logo], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Akbar', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Hyderabad', NULL, N'test', 1, NULL, 1, NULL)
INSERT [dbo].[tbl_CenterSettings] ([CenterId], [CenterName], [FullAddress], [BranchLocation], [Logo], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Sun', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Pune', NULL, N'test', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_CenterSettings] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 10, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 5, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 2, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 4, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-04 16:16:19.120' AS DateTime), 12, CAST(N'2021-09-04 16:16:19.120' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-05 18:09:40.803' AS DateTime), 12, CAST(N'2021-09-05 18:09:40.803' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 27, N'123', N'123', N'123', N'123', N'123', N'123', N'123', N'123', NULL, 1, NULL, NULL, NULL, 123, CAST(N'2021-09-05 20:14:25.797' AS DateTime), 123, CAST(N'2021-09-05 20:14:25.797' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 27, N'42', N'11', N'32', N'22', N'11', N'11', N'22', N'33', NULL, 1, NULL, NULL, NULL, 33, CAST(N'2021-09-05 22:03:09.737' AS DateTime), 33, CAST(N'2021-09-05 22:03:09.737' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 27, N'62', N'11', N'62', N'22', N'11', N'11', N'22', N'33', NULL, 1, NULL, NULL, NULL, 33, CAST(N'2021-09-05 22:05:12.493' AS DateTime), 33, CAST(N'2021-09-05 22:05:12.493' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 27, N'66', N'11', N'44', N'33', N'33', N'55', N'22', N'77', NULL, 1, NULL, NULL, NULL, 77, CAST(N'2021-09-05 22:08:24.210' AS DateTime), 77, CAST(N'2021-09-05 22:08:24.210' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 29, N'10', N'14', N'11', N'15', N'12', N'16', N'13', N'17', NULL, 1, NULL, NULL, NULL, 17, CAST(N'2021-09-06 02:29:30.250' AS DateTime), 17, CAST(N'2021-09-06 02:29:30.250' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 30, N'123', N'12', N'12', N'15', N'12', N'16', N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-06 08:48:44.233' AS DateTime), 12, CAST(N'2021-09-06 08:48:44.233' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 27, N'12', N'12', N'12', N'12', N'11', NULL, N'12', N'12', NULL, 1, NULL, NULL, NULL, 12, CAST(N'2021-09-21 17:24:04.990' AS DateTime), 12, CAST(N'2021-09-21 17:24:04.990' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 545454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-23 17:52:19.940' AS DateTime), 1, CAST(N'2021-09-23 17:52:19.940' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [DoctorName], [Qualification], [Designation], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1014, 92111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-24 17:07:02.097' AS DateTime), 1, CAST(N'2021-09-24 17:07:02.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 4, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 10, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, NULL, 2, NULL, NULL, NULL, NULL, CAST(N'2021-09-04 16:27:09.660' AS DateTime), NULL, CAST(N'2021-09-04 16:27:09.660' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 27, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, NULL, 2, NULL, NULL, NULL, 1, CAST(N'2021-09-06 02:11:36.330' AS DateTime), 1, CAST(N'2021-09-06 02:11:36.330' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 545454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-23 17:52:19.947' AS DateTime), 1, CAST(N'2021-09-23 17:52:19.947' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1005, 92111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime), 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [Qualification], [Designation], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2005, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-26 15:33:46.760' AS DateTime), 1, CAST(N'2021-09-26 15:33:46.760' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] OFF
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] ON 

INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 4, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0 ', N'3.9 ', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic
', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 5, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 6, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 7, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 8, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 9, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 10, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, NULL, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11', N'233', N'123', N'232', N'322', N'23', N'11', N'23', N'22', N'23', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 27, NULL, N'21', N'11', N'22', N'33', N'12', N'22', N'33', N'11', N'11', N'22', NULL, 3, NULL, NULL, NULL, NULL, CAST(N'2021-09-05 22:46:34.387' AS DateTime), NULL, CAST(N'2021-09-05 22:46:34.387' AS DateTime))
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 545454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-23 17:52:19.950' AS DateTime), 1, CAST(N'2021-09-23 17:52:19.950' AS DateTime))
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1014, 92111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime), 1, CAST(N'2021-09-24 17:07:02.137' AS DateTime))
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [Designation], [Qualification], [DoctorName], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2014, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, CAST(N'2021-09-26 15:33:46.807' AS DateTime), 1, CAST(N'2021-09-26 15:33:46.807' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] OFF
SET IDENTITY_INSERT [dbo].[tbl_Doctor] ON 

INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Ajaz', N'Heart', N'Ajaz', N'MBBS', 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Suriya', N'Ear', N'Suriya', N'MD', 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'krishna', NULL, NULL, NULL, 1, CAST(N'2021-10-02 11:35:32.580' AS DateTime), 1, CAST(N'2021-10-02 11:35:32.580' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Doctor] OFF
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] ON 

INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Ritu', 28, N'Female', 1, N'8888804930', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-26 16:46:46.947' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Tanya Varma', 24, N'1', 1, N'9800000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Supriya Sinha', 22, N'F', 1, N'9100000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Gudda', 18, N'1', 1, N'9900000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Tanuja', 32, N'1', 1, N'8800000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'Priya', 21, N'1', 1, N'7700000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, N'Prince', 23, N'1', 1, N'6600000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, N'Salman', 52, N'1', 1, N'9700000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, N'Rubina', 25, N'1', 1, N'8700000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, N'Tripti Sharma', 23, N'Female', 1, N'9300000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (15, N'Sakshi', 22, N'Female', 1, N'9988778899', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (16, N'Minu', 55, N'Female', 1, N'9144000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (17, N'Sakshi', 33, N'Female', 1, N'7700111111', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (18, N'Aman', 22, N'Female', 1, N'7700111122', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (19, N'Aman', 23, N'Male', 1, N'7700111123', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (20, N'Tanu Sharma', 23, N'Female', 1, N'7700111133', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (21, N'Tanu Sharma', 23, N'Female', 1, N'7700111129', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (22, N'Nita', 44, N'Female', 1, N'7300000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (24, N'Sumona', 33, N'Female', 2, N'8880000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (25, N'Sumona', 55, N'Female', 1, N'8790000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (26, N'asdf', 12, N'Male', 2, N'435345', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (27, N'Amer', 30, N'Male', 1, N'12345', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-26 21:40:08.010' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (28, N'Meghna', 12, N'Female', 1, N'1234567', NULL, 1, CAST(N'2021-09-06 02:23:01.397' AS DateTime), 1, CAST(N'2021-09-06 02:23:01.397' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (29, N'kiran', 20, N'Male', 1, N'88888', NULL, 1, CAST(N'2021-09-06 02:27:37.540' AS DateTime), 1, CAST(N'2021-09-06 02:27:37.540' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (30, N'Vinay', 20, N'Male', 1, N'676767', NULL, 1, CAST(N'2021-09-06 08:47:32.493' AS DateTime), 1, CAST(N'2021-09-06 08:47:32.493' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1030, N'Amer', 30, N'Male', NULL, NULL, NULL, 1, CAST(N'2021-09-16 12:36:14.920' AS DateTime), 1, CAST(N'2021-09-16 12:36:14.920' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1031, N'Amer', 30, N'Male', NULL, NULL, NULL, 1, CAST(N'2021-09-16 13:06:22.650' AS DateTime), 1, CAST(N'2021-09-16 13:06:22.650' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1032, N'Mr''s khan', 31, N'Female', NULL, N'9211', NULL, 1, CAST(N'2021-09-16 13:40:53.997' AS DateTime), 1, CAST(N'2021-09-16 14:10:13.163' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2030, N'Rohan', 20, N'Male', 1, N'7416873712', NULL, 1, CAST(N'2021-09-18 23:02:19.030' AS DateTime), 1, CAST(N'2021-09-18 23:17:46.437' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3030, N'Renuka ', 15, N'Female', 1, N'171717', NULL, 1, CAST(N'2021-09-22 22:39:24.697' AS DateTime), 1, CAST(N'2021-09-22 22:39:24.697' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3031, N'reema', 34, N'Male', 1, N'121212', NULL, 1, CAST(N'2021-09-23 17:07:24.983' AS DateTime), 1, CAST(N'2021-09-23 17:07:24.983' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3032, N'kara', 25, N'Female', 1, N'543212', NULL, 1, CAST(N'2021-09-23 17:15:56.653' AS DateTime), 1, CAST(N'2021-09-23 17:15:56.653' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3033, N'jp', 12, N'Male', 1, N'3333', NULL, 1, CAST(N'2021-09-23 17:48:01.223' AS DateTime), 1, CAST(N'2021-09-23 17:48:01.223' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3034, N'krish', 20, N'Male', 1, N'6464', NULL, 1, CAST(N'2021-09-23 17:50:05.710' AS DateTime), 1, CAST(N'2021-09-23 17:51:26.817' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3035, N'Rohan2', 30, N'Male', 2, N'545454', NULL, 1, CAST(N'2021-09-23 17:52:19.880' AS DateTime), 1, CAST(N'2021-09-23 17:52:19.880' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4032, N'Rohan3', 12, N'Male', 1, N'92111', NULL, 1, CAST(N'2021-09-24 17:07:02.003' AS DateTime), 1, CAST(N'2021-09-24 17:07:02.003' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5032, N'GOKU', 20, N'Male', 1, N'9999', NULL, 1, CAST(N'2021-09-26 16:49:56.943' AS DateTime), 1, CAST(N'2021-09-26 16:49:56.943' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5033, N'krish2', 20, N'Male', 1, N'98000', NULL, 1, CAST(N'2021-09-28 01:34:34.850' AS DateTime), 1, CAST(N'2021-09-28 01:34:34.850' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5034, N'raza', 34, N'Male', 1, N'9222', NULL, 1, CAST(N'2021-09-28 02:10:41.903' AS DateTime), 1, CAST(N'2021-09-28 02:10:41.903' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [RefDocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5035, N'prakash', 56, N'Male', 1, N'2222', NULL, 1, CAST(N'2021-09-28 02:37:59.013' AS DateTime), 1, CAST(N'2021-09-28 03:02:37.960' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] OFF
SET IDENTITY_INSERT [dbo].[tbl_Printer] ON 

INSERT [dbo].[tbl_Printer] ([Printer_id], [Printer_Name]) VALUES (1, N'Samsung SCX-3400 Series
')
SET IDENTITY_INSERT [dbo].[tbl_Printer] OFF
SET IDENTITY_INSERT [dbo].[tbl_ReportType] ON 

INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Clinical Biochemistory Report LIPID Profile', N'LPID', N'<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIO_CHEMISTORY_REPORT">CLINICAL BIO CHEMISTORY REPORT</label></td>
</tr>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="LIPID_PROFILE">LIPID PROFILE</label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="NORMAL_RANGES">NORMAL RANGES</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Cholestrol__T_">Serum Cholestrol (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;"> gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Desirabale &lt; 200 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="">(Methodology:CHOD-PAP)</label></td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Boderline high risk : 200-239 mg/dl</label></td>
</tr>
<tr></tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="H_D_L_Cholestrol">H D L Cholestrol</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Low risk : &gt; 60 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="V_L_D_L">V L D L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Less Than 30 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Triglyceride">Serum Triglyceride</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 150 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="LDL_HDL">LDL/HDL</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 </label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.7-3.5 </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Tital_Lipid">Tital Lipid</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">400-1000 mg/dl </label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Atharv</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', NULL, NULL, 1, CAST(N'2021-09-26 15:46:41.560' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Clinical Biochemistory Report LTF', N'LTF', N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="CLINICAL_BIOCHEMISTORY_REPORT_LIVER_FUNCTION_TEST__LTF__">CLINICAL BIOCHEMISTORY REPORT LIVER FUNCTION TEST {LTF} </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 6%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="Test_Description_">Test Description </label></td>
<td><label style="color: black; text-decoration: underline;" for="Value_Observed_">Value Observed </label></td>
<td><label style="color: black; text-decoration: underline;" for="Biological_Reference_Interval_">Biological Reference Interval </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__T_">Serum Bilirubin (T)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 gm/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults : 0.2-1.0 mg/dl</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">New Born : 1.0-12.0 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Bilirubin__D_">Serum Bilirubin (D)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">00-0.3 mg/dl</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Serum Bilirubin ID</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 mg/dl</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">0.2-0.8 mg/dl </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Asparate_Amino_Transferase__SGOT_">Serum Asparate Amino Transferase (SGOT)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alanine_Amino_Transferase_SGPT">Serum Alanine Amino Transferase SGPT</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">5-40 IU/L</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Total_Protein">Serum Total Protein</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">6.0-8.0 mg% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Albumin">Serum Albumin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">3.7-5.3 gm </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Glubulin">Serum Glubulin</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2.3-3.6 gm% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="AGRation">A/g Ration</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.0-2.3</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Serum_Alkaline_Phosphatse">Serum Alkaline Phosphatse</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 IU/L</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Upto 17 yrs : 500 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Male : 50-126 IU/L</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Female : 37-103 IU/L</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td align="center" width="40%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :-</strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="40%">&nbsp;</td>
<td align="left" width="20%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', NULL, NULL, 1, CAST(N'2021-09-26 15:48:51.907' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Computer Blood Picture Report', N'CBP', N'<hr style="position: relative; border: none; top: 5px; height: 2px; background: black !important; margin-bottom: 5px;" />
<table width="100%">
<tbody>
<tr>
<td align="center"><label style="color: black; text-decoration: underline;" for="COMPLETE_BLOOD_PICTURE_REPORT__CBP__">COMPLETE BLOOD PICTURE REPORT (CBP) </label></td>
</tr>
</tbody>
</table>
<hr style="position: relative; border: none; top: 1px; height: 2px; background: black !important; margin-top: 1px;" />
<table style="margin-left: 7%;" width="100%">
<tbody>
<tr>
<td><label style="color: black; text-decoration: underline;" for="PARAMETERS_">PARAMETERS </label></td>
<td><label style="color: black; text-decoration: underline;" for="RESULT_">RESULT </label></td>
<td><label style="color: black; text-decoration: underline;" for="REFERENCE_RANGES_">REFERENCE RANGES </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Haemoglobin_gm__">Haemoglobin gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">21 gm %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 14-18.0 gm %</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 11.5-16.0 gm %</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Erythrotyte_count__RBC_">Erythrotyte count (RBC)</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11 Mill/cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">M: 4.5-6.5 Mill/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">F: 3.8-5.5 Mill/cumms</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Total W.B.C. Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">4,000-11,000/cumms </label></td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="DIFFERENTIAL_LEUCOCYTE_COUNT_">DIFFERENTIAL LEUCOCYTE COUNT </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Neutrophils">Neutrophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 40-75%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Lymphocytes">Lymphocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">12 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Adults: 20-40%</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Childrens: 36-50%</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Eosinophils">Eosinophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1-6% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Monocytes">Eonocytes</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">33 %</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">2-8% </label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Basophils">Basophils</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">Not Found</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="3" align="center"><label style="color: black; text-decoration: underline;" for="PERIPHERAL_SMEAR_EXAMINATION">PERIPHERAL SMEAR EXAMINATION</label></td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="R_B_C__s">R B C ''s</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">11</label></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><label style="color: black; font-weight: normal; font-size: smaller;" for="Platelet_Count">Platelet Count</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">22 /cumms</label></td>
<td><label style="color: black; font-weight: normal; font-size: smaller;">1.5-5.0 Lakhs/cumms</label></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><label style="color: black; font-weight: normal; font-size: smaller;">Platelet Adequate on Smear.</label></td>
</tr>
</tbody>
</table>
<table width="100%">
<tbody>
<tr>
<td width="80%"><label style="color: black; font-weight: normal; font-size: smaller;"><strong><u>Methodology </u> :- </strong> Electronic Cell Counter &amp; Microscopy.</label></td>
<td width="10%">&nbsp;</td>
<td align="left" width="10%">&nbsp;</td>
</tr>
<tr>
<td align="center" width="40%">&nbsp;</td>
<td width="40%"><label style="color: black; font-weight: normal;">(Signature)</label></td>
<td align="left" width="20%"><label style="color: black; font-weight: normal; font-size: smaller;">Ajaz</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">MBBS</label><br /><label style="color: black; font-weight: normal; font-size: smaller;">Heart</label></td>
</tr>
</tbody>
</table>', NULL, NULL, 1, CAST(N'2021-09-26 15:48:18.973' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Other', N'Other', NULL, 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime), 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Kidney Test', N'KB', N'<p>Test For Kidney</p>', 1, CAST(N'2021-09-28 02:08:49.440' AS DateTime), 1, CAST(N'2021-09-28 02:08:49.440' AS DateTime))
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [ShortName], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'Uria', N'UR', N'<p style="text-align: center;"><strong>Blood Uria&nbsp;</strong></p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;">&nbsp;</p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ajaz</strong></p>
<p style="text-align: left;"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Pathology</strong></p>
<p style="text-align: center;">&nbsp;</p>
<p style="text-align: center;">&nbsp;</p>', 1, CAST(N'2021-09-28 03:01:20.050' AS DateTime), 1, CAST(N'2021-09-28 03:01:34.207' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ReportType] OFF
SET IDENTITY_INSERT [dbo].[tbl_UserLogin] ON 

INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'Namrata', N'n@gmail.com', N'123', 1, 1, 1, 1, NULL, NULL)
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, N'yawar', N'yawarali17@gmail.com', N'123', 0, 0, NULL, NULL, CAST(N'2021-09-05 20:11:45.503' AS DateTime), CAST(N'2021-09-05 20:11:45.503' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, N'Meghna', N'Meghna@gmail.com', N'123', 0, 1, NULL, NULL, CAST(N'2021-09-06 02:21:23.810' AS DateTime), CAST(N'2021-09-06 02:21:23.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_UserLogin] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uniqueEmail]    Script Date: 02-10-2021 12:11:03 ******/
ALTER TABLE [dbo].[tbl_UserLogin] ADD  CONSTRAINT [uniqueEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddBillingTransaction]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddBillingTransaction]  
(  
   
   @ReportId varchar(500),
   @Pid varchar(500),
   @CreatedBy int ,  
   @UpdatedBy int 
)  
as  
begin 
 declare  @BillID int =0;
 declare @Description nvarchar(max)=Null
   select @BillID= MAX(BilIingId) from tbl_BillingMaster --where Pid=@Pid
   print @BillID
   Select @Description=Description from tbl_ReportType where Id=@ReportId
    Insert into tbl_BillingReport   
   (
BillId,
ReportId,
Description,
CreatedBy,
UpdatedBy,
CreatedOn,
UpdatedOn)
values(
@BillID,
@ReportId,
@Description, 
@CreatedBy,
@UpdatedBy,  
getdate(),
getdate()
)  

  
End
 

 
 

GO
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewClinicalBiochemistoryReportLIPIDProfileDetails]  
(  
   @Pid int,      
   @serumCholestrol varchar (50),
   @hdlCholestrol varchar(50),
   @LDLCholestrol varchar(50),
   @VLDLCholestrol varchar(50),
   @serumTriglyceride varchar(50),
   @THDL varchar(50),
   @LDLHDL varchar(50),
   @titalLipid varchar(50),
   @CreatedBy int,
   @UpdatedBy int
)  
as  
begin  
   Insert into tbl_ClinicalBiochemistoryReportLIPIDProfile 
   (
   Pid,
   serumCholestrol,
   hdlCholestrol,
   LDLCholestrol,
   VLDLCholestrol,
   serumTriglyceride,
   THDL,
   LDLHDL,
   titalLipid,
   ReportTypeId, 
   CreatedBy, 
   CreatedOn, 
   UpdatedBy,  
   UpdatedOn  
   )
   values(
   @Pid,
   @serumCholestrol,
   @hdlCholestrol,
   @LDLCholestrol,
   @VLDLCholestrol,
   @serumTriglyceride,
   @THDL,
   @LDLHDL,
   @titalLipid,
   '1', 
   @CreatedBy, 
   getdate(), 
   @UpdatedBy,  
   getdate() 
   )  
End 
GO
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLTFDetails]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewClinicalBiochemistoryReportLTFDetails]  
(  
    @Pid int,      
    @serumBilirubin varchar (50),
    @serumBilirubinD varchar(50),
    @serumBilirubinID varchar(50),
    @serumAsparateAminoTransferase varchar(50),
    @serumAlanineAminoTransferase varchar(50),
    @serumTotalProtein varchar(50),
    @serumAlbumin varchar(50),
    @serumGlubulin varchar(50),
    @AGRation varchar(50),
    @serumAlkalinePhosphatse varchar(50),
	@DoctorName varchar(100),
	@Designation varchar(100),
	@Qualification varchar(100),
    @CreatedBy int,
    @UpdatedBy int
    )  
as  
begin  
   Insert into dbo.tbl_ClinicalBiochemistoryReportLTF(
    Pid      
   ,serumBilirubin  
   ,serumBilirubinD  
   ,serumBilirubinID  
   ,serumAsparateAminoTransferase  
   ,serumAlanineAminoTransferase  
   ,serumTotalProtein 
   ,serumAlbumin  
   ,serumGlubulin  
   ,AGRation  
   ,serumAlkalinePhosphatse ,
    ReportTypeId,
	DoctorName,
	Designation,
	Qualification,
    CreatedBy,
    CreatedOn,
    UpdatedBy,
    UpdatedOn)
  

    values(
    @Pid,
    @serumBilirubin,
	@serumBilirubinD,
	@serumBilirubinID,
	@serumAsparateAminoTransferase,
	@serumAlanineAminoTransferase,
	@serumTotalProtein,
	@serumAlbumin,
	@serumGlubulin,
	@AGRation,
	@serumAlkalinePhosphatse,
	@DoctorName,
	@Designation,
	@Qualification,
	'2',
    @CreatedBy,
    GetDate(),
    @UpdatedBy,
    Getdate())
  
End 
GO
/****** Object:  StoredProcedure [dbo].[AddNewComputerBloodPictureReportDetails]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewComputerBloodPictureReportDetails]  
(  
   @Pid int,      
   @Haemoglobin varchar (50),
   @ErythrocyteCount varchar (50),
   @TotalWBCCount varchar(50),
   @Neutrophils varchar(50),
   @Lymphocytes varchar(50),
   @Eosinophils varchar(50),
   @Monocytes varchar(50),
   @Basophils varchar(50),
   @Rbcs varchar(50),
   @PlateletCount varchar(50),
   @CreatedBy int,
   @UpdatedBy int
)  
as  
begin  
   Insert into tbl_ComputerBloodPictureReport(pid,
   Haemoglobin,
   ErythrocyteCount,
   TotalWBCCount,
   Neutrophils,
   Lymphocytes,
   Eosinophils,
   Monocytes,
   Basophils,
   Rbcs,
   PlateletCount,
   ReportTypeId,
   CreatedBy,
   CreatedOn,
   UpdatedBy,
   UpdatedOn)

   values(
   @Pid,
   @Haemoglobin,
   @ErythrocyteCount,
   @TotalWBCCount,
   @Neutrophils,
   @Lymphocytes,
   @Eosinophils,
   @Monocytes,
   @Basophils,
   @Rbcs,
   @PlateletCount,
   '3',
   @CreatedBy,
   GetDate(),
   @UpdatedBy,
   Getdate())
   

End 
GO
/****** Object:  StoredProcedure [dbo].[AddNewPatientInfoDetails]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewPatientInfoDetails]  
(  
   
   
   @Pname varchar (50),
   @Age tinyint,
   @Gender varchar(10),
   @RefDocId int,
   @mobileNo varchar(15),
   @CollectedById int,
   @CreatedBy int ,  
   @UpdatedBy int 
  
 
)  
as  
begin 
 declare @Pid int=0, @BillID int =0;
 IF((Select COUNT(*) From tbl_PatientInfo Where mobileNo=@mobileNo)=0)
 BEGIN 
   Insert into tbl_PatientInfo(Pname,Age,Gender,RefDocId,mobileNo,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn)
    values(@Pname,@Age,@Gender,@RefDocId,@mobileNo,@CreatedBy,getdate(),@UpdatedBy,getdate()) 
   SELECT mobileNo FROM tbl_PatientInfo WHERE mobileNo=@mobileNo
   
   END

   Else
   BEGIn
			Update tbl_PatientInfo set Pname=@Pname,Age=@Age,Gender=@Gender,RefDocId=@RefDocId,mobileNo=@mobileNo,UpdatedBy=@UpdatedBy,UpdatedOn=getdate()
			WHERE mobileNo=@mobileNo
			print 'pid'
			 print @Pid 
   END

  
 select @Pid=  Pid From tbl_PatientInfo Where mobileNo=@mobileNo
 print 'after update pid'
 print @Pid 
  Insert into tbl_BillingMaster
   (
   Pid,
   CollectedById,
   CreatedBy,
   CreatedOn,
   UpdatedBy,  
   UpdatedOn  
   )
   values(
   @Pid,
   @CollectedById,
   @CreatedBy,
   getdate(),
   @UpdatedBy,  
   getdate()
   )  

    
	select (cast(@Pid as int))
End 


GO
/****** Object:  StoredProcedure [dbo].[AddReportType_Details]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddReportType_Details]  (  @Pid int,   @Date datetime ,     @Pname varchar (50),   @RefByDoc varchar(250),   @ReportType varchar(100))  as  begin    Insert into tbl_ReportType values(@Pid,@ReportType,@Pname,@RefByDoc,@Date)       SELECT @@IDENTITY AS INT   End


GO
/****** Object:  StoredProcedure [dbo].[Doc_Pati_Registration]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Doc_Pati_Registration](@Name varchar(50),@Email varchar(50),@Passward varchar(50),@conformPassward varchar(50))asbegininsert into Doctor_Patient_Registration([Name],	Email,	Passward,	ConformPassward,	CreatedBy,	UpdatedBy)values(@Name,@Email,@Passward,@conformPassward,'','');End


GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetClinicalBiochemistoryReportLIPIDProfileDetails]    
(
@Pid int,
@ReportId int
)
as    
begin    
   select 
   pt.Pid,
   pt.Pname,
   d.DoctorName,
   pt.Pid as Srno,
   pt.Age,
   pt.Gender,
   d.DoctorName as RefByDoc,
   d.Specilization,
   d.Qualification,
   d.signature,
   
   lpd.hdlCholestrol,
   lpd.LDLCholestrol,
   lpd.VLDLCholestrol,
   lpd.serumTriglyceride,
   lpd.THDL,
   lpd.LDLHDL,
   lpd.titalLipid
   from tbl_ClinicalBiochemistoryReportLIPIDProfile lpd
   inner join tbl_PatientInfo pt on lpd.Pid=pt.Pid
   inner join tbl_Doctor d on d.docid=pt.RefDocId
   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   WHERE pt.Pid=@Pid and lpd.ReportId=@ReportId
End


GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLTFDetail]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetClinicalBiochemistoryReportLTFDetail]    
(
 @Pid int
,@ReportId int
)
as    
begin    
   select 
   pt.Pid,
   pt.Pname,
   d.DoctorName,
   pt.Pid as Srno,
   pt.Age,
   pt.Gender,
   d.DoctorName as RefByDoc,
   d.Specilization,
   d.Qualification,
   d.signature,
   ltf.serumBilirubin,
   ltf.serumBilirubinD,
   ltf.serumBilirubinID,
   ltf.serumAsparateAminoTransferase,
   ltf.serumAlanineAminoTransferase,
   ltf.serumTotalProtein,
   ltf.serumAlbumin,
   ltf.serumGlubulin,
   ltf.AGRation,
   ltf.serumAlkalinePhosphatse
   from tbl_ClinicalBiochemistoryReportLTF  ltf
   inner join tbl_PatientInfo pt on ltf.Pid=pt.Pid
   inner join tbl_Doctor d on d.docid=pt.RefDocId
   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   inner join tbl_CenterSettings cs on cs.CenterId=us.Center
   WHERE pt.Pid=@Pid and ltf.ReportId=@ReportId
End


GO
/****** Object:  StoredProcedure [dbo].[GetComputerBloodPictureReportDetails]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetComputerBloodPictureReportDetails]    (@Pid int,
@ReportId int)as    begin       select    pt.Pid,   pt.Pname,   d.DoctorName,   pt.Pid as Srno,   pt.Age,   pt.Gender,   d.DoctorName as RefByDoc,   d.Specilization,   d.Qualification,   d.signature,   cb.CreatedOn as date,   Haemoglobin,   ErythrocyteCount,   TotalWBCCount,   Neutrophils,   Lymphocytes,   Eosinophils,   Monocytes,   Basophils,   Rbcs,   PlateletCount    from tbl_ComputerBloodPictureReport  cb   inner join tbl_PatientInfo pt on cb.Pid=pt.Pid   inner join tbl_Doctor d on d.docid=pt.RefDocId   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   WHERE pt.Pid=@Pid and cb.ReportId=@ReportIdEnd



GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetEmployees]    
as    
begin    
   select Id as Empid,Name,City,Address from tbl_doc  
End 



GO
/****** Object:  StoredProcedure [dbo].[getReports]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getReports]
@BillId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL
As
BEGIN 
WITH BillList (BillID,Pname,Amount,Discount,Expenses,ReferalAmount,ShortName,CreatedOn,status,due,DoctorName) as  
  
(  
  
select distinct br.BillId,pt.Pname as PatientName,bm.Amount,bm.Discount,bm.Expenses,bm.ReferalAmount,rt.ShortName,bm.CreatedOn as Date,bm.status,bm.due,dc.DoctorName from dbo.tbl_BillingReport  br
  
left outer join tbl_ReportType  rt
  
on rt.Id=br.ReportId
  
left outer join  
  
tbl_BillingMaster  bm
  
on br.BillId =bm.BilIingId

left outer join  
tbl_PatientInfo pt
on pt.Pid=bm.PId  
left outer join
tbl_Doctor dc
on dc.DocId=pt.RefDocId
   
 where 
   br.BillId= (case when @BillId is null then br.BillId  ELSE  @BillId END)
 and bm.CreatedOn between (case when @BeginDate is null then bm.CreatedOn else @BeginDate END) 
 and (case when @EndDate is null then bm.CreatedOn else @EndDate END)
  or bm.CreatedOn=  DATEADD(day, -15, convert(date,GETDATE())) 

		   
),  
  
AllBillList as(  
  
SELECT  BillID ,Pname as PatientName,Amount,Discount ,Expenses,ReferalAmount,  LEFT(RptList , LEN(RptList)-1) AS ReportName , CreatedOn  as Date ,status,due,DoctorName
  
FROM BillList AS extern  
  
CROSS APPLY  
  
(  
  
SELECT ShortName + ' , '  
  
FROM BillList AS intern  
  
WHERE extern.BillID = intern.BillID  
  
FOR XML PATH('')  
  
)pre_trimmed(RptList)  
  
Group by BillID,Pname,Amount,Discount ,Expenses,ReferalAmount,RptList,CreatedOn,status,due,DoctorName
    
)  
  
  
SELECT  * FROM AllBillList order by 1 desc


		  END


GO
/****** Object:  StoredProcedure [dbo].[getReports_test]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getReports_test]
@BillId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL
As
BEGIN 
WITH BillList (BillID,Pname,Amount,Discount,Expenses,ReferalAmount,ShortName,CreatedOn,status,due,DoctorName,ReferalPercentage) as  
  
(  
  
select distinct br.BillId,pt.Pname as PatientName,bm.Amount,bm.Discount,bm.Expenses,bm.ReferalAmount,rt.ShortName,bm.CreatedOn as Date,bm.status,bm.due,dc.DoctorName,bm.ReferalPercentage from dbo.tbl_BillingReport  br
  
left outer join tbl_ReportType  rt
  
on rt.Id=br.ReportId
  
left outer join  
  
tbl_BillingMaster  bm
  
on br.BillId =bm.BilIingId

left outer join  
tbl_PatientInfo pt
on pt.Pid=bm.PId  
left outer join
tbl_Doctor dc
on dc.DocId=pt.RefDocId
   
 where 
   br.BillId= (case when @BillId is null then br.BillId  ELSE  @BillId END)
 and bm.CreatedOn between (case when @BeginDate is null then bm.CreatedOn else @BeginDate END) 
 and (case when @EndDate is null then bm.CreatedOn else @EndDate END)
  or bm.CreatedOn=  DATEADD(day, -15, convert(date,GETDATE())) 

		   
),  
  
AllBillList as(  
  
SELECT  BillID ,Pname as PatientName,Amount,Discount ,Expenses,ReferalAmount,  LEFT(RptList , LEN(RptList)-1) AS ReportName , CreatedOn  as Date ,status,due,DoctorName,ReferalPercentage
  
FROM BillList AS extern  
  
CROSS APPLY  
  
(  
  
SELECT ShortName + ' , '  
  
FROM BillList AS intern  
  
WHERE extern.BillID = intern.BillID  
  
FOR XML PATH('')  
  
)pre_trimmed(RptList)  
  
Group by BillID,Pname,Amount,Discount ,Expenses,ReferalAmount,RptList,CreatedOn,status,due,DoctorName,ReferalPercentage
    
)  
  
  
SELECT  * FROM AllBillList order by 1 desc


		  END


GO
/****** Object:  StoredProcedure [dbo].[getReportsByBillAndCreatedDate]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[getReportsByBillAndCreatedDate]
@BilIingId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL
As
BEGIN 
SELECT D.BilIingId, 
D.Amount,
D.Discount,
D.Expenses,
D.DUE,
D.ReferalAmount,
D.CreatedOn as Date,
c.pid,
c.pName,
 X.ReportList FROM    
tbl_patientinfo C
inner Join tbl_BillingMaster D on d.PId=c.Pid 

CROSS APPLY    
(    
SELECT STUFF    
            (    
                (    
                    SELECT ',' +e.shortname FROM dbo.tbl_BillingReport AS P      
  INNER JOIN dbo.tbl_BillingMaster AS CP ON P.BillId=CP.BilIingId  
  Inner Join tbl_ReportType e on e.Id=P.ReportId
                    WHERE CP.PId=C.Pid    
                    FOR XML PATH('')    
                )        
            ,1,1,'') as ReportList    
) as X

		 where  (D.BilIingId=@BilIingId or D.createdOn BETWEEN @BeginDate and  @EndDate )
		    or 
		    (@BilIingId is null and    @BeginDate is null and  @EndDate is null )

		  END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteReportById]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_DeleteReportById]

@Rid int
AS
BEGIN
	Delete from tbl_ReportType where Id=@Rid;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getLogin]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_getLogin]  (  @Email varchar(50),  @Passward varchar(50)  )  as  declare @Cnt int;  begin  if exists(select * from tbl_UserLogin where Email=@Email and Passward=@Passward)   begin   select * from tbl_UserLogin where Email=@Email and Passward=@Passward end  else   begin   set @Cnt=0;   end   select @Cnt;End




GO
/****** Object:  StoredProcedure [dbo].[sp_getReports]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getReports]
As
BEGIN
SELECT * From tbl_ReportType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReferDoctorById]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ReferDoctorById] @Rid int  AS   BEGIN  SELECT *  FROM [SUNDIGNOSTIC].[dbo].tbl_Doctor     where DocId=@Rid  END
GO
/****** Object:  StoredProcedure [dbo].[sp_ReportById]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ReportById]
@Rid int
AS
BEGIN
	Select * from tbl_ReportType where Id=@Rid;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_SaveReport]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveReport]
@RName varchar(max),
@ShortName varchar(max),
@Description nvarchar(max),
@CreatedBy int,
@UpdatedBy int
As
BEGIN
INSERT INTO tbl_ReportType(ReportType,ShortName,Description,Createdby,CreatedOn,UpdatedBy,UpdatedOn) Values(@RName,@ShortName,@Description,@CreatedBy,GETDATE(),@UpdatedBy,GetDate()) 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateReferDoctorById]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[sp_UpdateReferDoctorById]@DocId int,@DoctorName varchar(50),@UpdatedBy intAsBEGINUPDATE tbl_Doctor set DoctorName=@DoctorName,UpdatedOn=GetDate(),UpdatedBy=@UpdatedBywhere DocId=@DocIdEND

GO
/****** Object:  StoredProcedure [dbo].[usp_getAllReportsByPatientId]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getAllReportsByPatientId](@Pid int)AS BEGINSELECTbm.Pid,br.ReportId,rpt.ReportType as Name,br.ReportId,br.BillId,br.CreatedOn,br.UpdatedOn,br.CreatedBy,br.UpdatedByFROM tbl_BillingReport br inner join tbl_ReportType rpt on br.ReportId= rpt.idinner join tbl_BillingMaster bmon bm.BilIingId=br.BillId
where bm.PId=@Pid order by br.UpdatedBy
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getBillingTransactByBillId]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/

CREATE  PROCEDURE   [dbo].[usp_getBillingTransactByBillId]
@BillId int
AS
BEGIN
SELECT  
       bill.BillId 
      ,bill.PId 
      ,bill.ReportId 
      ,bill.Amount 
      ,bill.Discount 
      ,bill.Expenses 
      ,bill.ReferalAmount 
	  ,Rptype.id 
	  ,Rptype.ShortName  as ReportName
	  ,pat.Pname  as PatientName
      ,bill.Status 
      ,bill.CreatedBy
      ,bill.UpdatedBy
      ,bill.CreatedOn
      ,bill.UpdatedOn
  FROM [SUNDIGNOSTIC].[dbo].[tbl_BillingTransaction] bill
  INNER JOIN 
   tbl_ReportType  Rptype
   on Rptype.Id=bill.ReportId
    INNER JOIN 
   tbl_PatientInfo  pat
   on pat.Pid=bill.PId
  WHERE BillId=@BillId
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_getCenter]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getCenter]
AS
BEGIN
SELECT * FROM tbl_CenterSettings
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getPatientByBillStatus]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[usp_getPatientByBillStatus]
  As
  BEGIN
  select Distinct p.PId,p.PName from [tbl_PatientInfo] p
  inner join tbl_billingtransaction b
  on p.pid=b.pid
  where b.status=0
  END
GO
/****** Object:  StoredProcedure [dbo].[usp_getReferDoc]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_getReferDoc] --@DocId int  AS   BEGIN  SELECT *  FROM [SUNDIGNOSTIC].[dbo].tbl_Doctor     --where DocId=@DocId  END

GO
/****** Object:  StoredProcedure [dbo].[usp_getReportsByBill]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getReportsByBill]
@BilIingId int=null,
@BeginDate nvarchar(50)=NULL,
@EndDate nvarchar(50)=NULL
As
BEGIN
Declare @SQL  varchar(max);
Declare @Where  varchar(max);
IF(@BilIingId IS NOT NULL)
BEGIN

set @Where='where bm.BilIingId='+@BilIingId
 print @Where
END
ELSE IF(@BeginDate IS NOT NULL and @EndDate IS NOT NULL )
BEGIN
set @Where='where bm.createdOn BETWEEN '''+@BeginDate+''' and '''+ @EndDate+''''
END
ELSE  
BEGIN
set @Where=''
END
set @SQL='SELECT 
    pat.PId,
    pat.Pname as PatientName,
    bm.BilIingId as BillId,
    bm.Amount,
	bm.Discount, 
	bm.Expenses,
	bm.ReferalAmount,
	bm.DUE,
	bm.Status,
	bm.createdOn as Date,
   STUFF((SELECT '', '' +rt.ShortName  
          FROM tbl_ReportType  Rt 
          inner join 
		  tbl_BillingReport br
		  on Rt.Id=br.ReportId
      ORDER BY rt.ReportType
           FOR XML PATH('''')), 1, 1, '''') Investigation
FROM   tbl_BillingMaster bm 
INNER Join tbl_PatientInfo pat
on bm.PId=pat.PId '+@Where+'

GROUP BY 
bm.BilIingId,
bm.Amount,
bm.Discount, 
bm.Expenses,
bm.ReferalAmount,
bm.DUE,
bm.Status,
 pat.PId,
 pat.Pname,
 bm.createdOn'
  print @Sql;
 exec(@Sql)
 END


GO
/****** Object:  StoredProcedure [dbo].[usp_getReportsByBill_old]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_getReportsByBill_old]
@MobileNumber int=Null
As
BEGIN
SELECT 
    pat.PId,
    pat.Pname,
    bm.BilIingId,
    bm.Amount,
	bm.Discount, 
	bm.Expenses,
	bm.ReferalAmount,
	bm.DUE,
	bm.Status,
	bm.createdOn as CreatedDate,
   STUFF((SELECT ', ' +rt.ReportType  
          FROM tbl_ReportType  Rt 
          inner join 
		  tbl_BillingReport br
		  on br.ReportId=Rt.Id
      ORDER BY rt.ReportType
           FOR XML PATH('')), 1, 1, '') Investigation
FROM   tbl_BillingMaster bm 
INNER Join tbl_PatientInfo pat
on bm.PId=pat.PId
 where pat.MobileNo=@MobileNumber or pat.MobileNo=''
GROUP BY 
bm.BilIingId,
bm.Amount,
bm.Discount, 
bm.Expenses,
bm.ReferalAmount,
bm.DUE,
bm.Status,
 pat.PId,
 pat.Pname,
 bm.createdOn
 END 
   
GO
/****** Object:  StoredProcedure [dbo].[usp_getUserLogin]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getUserLogin](@Name varchar(50),@Email varchar(50),@Passward varchar(50),@Status bit,@CenterId int)AsBegininsert into tbl_UserLogin    ([Name],	Email,	Passward,	Status,	Center,	CreatedOn,	UpdatedOn)	values	(@Name,	 @Email,	 @Passward,	 @Status,	 @CenterId,	 GETDATE(),	 GETDATE()	 )		 End

GO
/****** Object:  StoredProcedure [dbo].[usp_PrintReport]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_PrintReport]    (@Pid int,@ReportId int,@BillId int)as    begin       select    pt.Pid,   pt.Pname,  d.DoctorName,   pt.Pid as Srno,   pt.Age,   pt.Gender,   d.DoctorName as RefByDoc,   br.Description, br.BillId,br.ReportId     FROM tbl_BillingReport br   inner join tbl_BillingMaster bm on bm.BilIingId=br.BillId   inner join tbl_PatientInfo pt on bm.Pid=pt.Pid  inner join tbl_Doctor d on d.docid=pt.RefDocId  inner join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy    WHERE pt.Pid=@Pid and br.ReportId=@ReportId and br.BillId=@BillIdEnd
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateBilling]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[usp_UpdateBilling]
@BillId int,
@Amount decimal(18,2),
@Discount decimal(18,2),
@Expenses decimal(18,2),
@ReferalAmount decimal(18,2),
@ReferalPercentage decimal(18,2),
@Status bit,
@DUE decimal(18,2),
@UpdatedBy int
As
BEGIN
UPDATE [dbo].[tbl_BillingMaster] set 
Amount=@Amount,
Discount=@Discount,
Expenses=@Expenses,
ReferalAmount=@ReferalAmount,
ReferalPercentage=@ReferalPercentage,
Due=@DUE,
status=@Status,
UpdatedOn=GetDate(),
UpdatedBy=@UpdatedBy
where BilIingId=@BillId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdatePrintReportById]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE Procedure [dbo].[usp_UpdatePrintReportById]
 @BillID int,
 @RptID int,
 @Description nvarchar(max),
 @UpdatedBy int

  As
  BEGIN
  Update  [dbo].[tbl_BillingReport]
  set  
      [Description]=@Description,updatedBy=@UpdatedBy,updatedOn=getdate()

	  where [BillId]= @BillID
       and [ReportId]=@RptID

  END
GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateReportById]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_UpdateReportById](@Rid int,@RName varchar(50),@Description nvarchar(MAX),@UpdatedBy int,@UpdatedOn datetime)AsBeginupdate tbl_ReportType set ReportType=@RName, Description=@Description, UpdatedBy=@UpdatedBy ,UpdatedOn=@UpdatedOn  where Id=@Ridend

GO
/****** Object:  StoredProcedure [dbo].[uspAddDoctor]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[uspAddDoctor] @DoctorName varchar(200),@CreatedBy int,@UpdatedBy int ASBEGIN	INSERT INTO  tbl_Doctor(DoctorName,	CreatedBy,	UpdatedBy,	CreatedOn,	UpdatedOn)	 values(	 @DoctorName,	 @CreatedBy,	 @UpdatedBy,	 GetDate(),	 GetDate())END

GO
/****** Object:  StoredProcedure [dbo].[uspGetDashborad]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[uspGetDashborad]
(
@Name_Mobile varchar(50)
)
AS 
BEGIN
Select * From tbl_PatientInfo

WHERE Pname=@Name_Mobile OR mobileNo=@Name_Mobile
order by  CREATEDON desc
END

 
GO
/****** Object:  StoredProcedure [dbo].[uspGetDoctotList]    Script Date: 02-10-2021 12:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetDoctotList]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM tbl_Doctor
END


GO
USE [master]
GO
ALTER DATABASE [SUNDIGNOSTIC] SET  READ_WRITE 
GO
