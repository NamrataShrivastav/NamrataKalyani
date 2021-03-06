USE [master]
GO
/****** Object:  Database [SUNDIGNOSTIC]    Script Date: 06-09-2021 16:14:03 ******/
CREATE DATABASE [SUNDIGNOSTIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SUNDIGNOSTIC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SUNDIGNOSTIC.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[tbl_CenterSettings]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLTF]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  Table [dbo].[tbl_ComputerBloodPictureReport]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  Table [dbo].[tbl_Doctor]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  Table [dbo].[tbl_PatientInfo]    Script Date: 06-09-2021 16:14:03 ******/
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
	[DocId] [int] NULL,
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
/****** Object:  Table [dbo].[tbl_ReportType]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ReportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [varchar](max) NULL,
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
/****** Object:  Table [dbo].[tbl_UserLogin]    Script Date: 06-09-2021 16:14:03 ******/
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
SET IDENTITY_INSERT [dbo].[tbl_CenterSettings] ON 

INSERT [dbo].[tbl_CenterSettings] ([CenterId], [CenterName], [FullAddress], [BranchLocation], [Logo], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Akbar', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Hyderabad', NULL, N'test', 1, NULL, 1, NULL)
INSERT [dbo].[tbl_CenterSettings] ([CenterId], [CenterName], [FullAddress], [BranchLocation], [Logo], [Description], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Sun', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Pune', NULL, N'test', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_CenterSettings] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 10, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 5, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 2, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 4, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', N'ClinicalBiochemistoryReportLIPIDProfile', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, 1, 12, CAST(N'2021-09-04 16:16:19.120' AS DateTime), 12, CAST(N'2021-09-04 16:16:19.120' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, 1, 12, CAST(N'2021-09-05 18:09:40.803' AS DateTime), 12, CAST(N'2021-09-05 18:09:40.803' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 27, N'123', N'123', N'123', N'123', N'123', N'123', N'123', N'123', NULL, 1, 123, CAST(N'2021-09-05 20:14:25.797' AS DateTime), 123, CAST(N'2021-09-05 20:14:25.797' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 27, N'42', N'11', N'32', N'22', N'11', N'11', N'22', N'33', NULL, 1, 33, CAST(N'2021-09-05 22:03:09.737' AS DateTime), 33, CAST(N'2021-09-05 22:03:09.737' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 27, N'62', N'11', N'62', N'22', N'11', N'11', N'22', N'33', NULL, 1, 33, CAST(N'2021-09-05 22:05:12.493' AS DateTime), 33, CAST(N'2021-09-05 22:05:12.493' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 27, N'66', N'11', N'44', N'33', N'33', N'55', N'22', N'77', NULL, 1, 77, CAST(N'2021-09-05 22:08:24.210' AS DateTime), 77, CAST(N'2021-09-05 22:08:24.210' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 29, N'10', N'14', N'11', N'15', N'12', N'16', N'13', N'17', NULL, 1, 17, CAST(N'2021-09-06 02:29:30.250' AS DateTime), 17, CAST(N'2021-09-06 02:29:30.250' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportId], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 30, N'123', N'12', N'12', N'15', N'12', N'16', N'12', N'12', NULL, 1, 12, CAST(N'2021-09-06 08:48:44.233' AS DateTime), 12, CAST(N'2021-09-06 08:48:44.233' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 4, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 10, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF', 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 1, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, NULL, 2, NULL, CAST(N'2021-09-04 16:27:09.660' AS DateTime), NULL, CAST(N'2021-09-04 16:27:09.660' AS DateTime))
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportId], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 27, N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', N'12', NULL, NULL, 2, 1, CAST(N'2021-09-06 02:11:36.330' AS DateTime), 1, CAST(N'2021-09-06 02:11:36.330' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] OFF
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] ON 

INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 4, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0 ', N'3.9 ', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic
', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 5, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 6, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 7, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 8, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 9, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 10, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, NULL, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11', N'233', N'123', N'232', N'322', N'23', N'11', N'23', N'22', N'23', N'ComputerBloodPictureReport', 3, NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([ReportId], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name], [ReportTypeId], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 27, NULL, N'21', N'11', N'22', N'33', N'12', N'22', N'33', N'11', N'11', N'22', NULL, 3, NULL, CAST(N'2021-09-05 22:46:34.387' AS DateTime), NULL, CAST(N'2021-09-05 22:46:34.387' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] OFF
SET IDENTITY_INSERT [dbo].[tbl_Doctor] ON 

INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Ajaz', N'Heart', N'Ajaz', N'MBBS', 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_Doctor] ([DocId], [DoctorName], [Specilization], [Signature], [Qualification], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Suriya', N'Ear', N'Suriya', N'MD', 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_Doctor] OFF
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] ON 

INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Namrata Shrivastav', 28, N'F', 1, N'8888804930', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Tanya Varma', 24, N'1', 1, N'9800000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Supriya Sinha', 22, N'F', 1, N'9100000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Gudda', 18, N'1', 1, N'9900000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Tanuja', 32, N'1', 1, N'8800000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'Priya', 21, N'1', 1, N'7700000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, N'Prince', 23, N'1', 1, N'6600000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, N'Salman', 52, N'1', 1, N'9700000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, N'Rubina', 25, N'1', 1, N'8700000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, N'Tripti Sharma', 23, N'Female', 1, N'9300000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (15, N'Sakshi', 22, N'Female', 1, N'9988778899', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (16, N'Minu', 55, N'Female', 1, N'9144000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (17, N'Sakshi', 33, N'Female', 1, N'7700111111', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (18, N'Aman', 22, N'Female', 1, N'7700111122', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (19, N'Aman', 23, N'Male', 1, N'7700111123', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (20, N'Tanu Sharma', 23, N'Female', 1, N'7700111133', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (21, N'Tanu Sharma', 23, N'Female', 1, N'7700111129', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (22, N'Nita', 44, N'Female', 1, N'7300000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (24, N'Sumona', 33, N'Female', 2, N'8880000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (25, N'Sumona', 55, N'Female', 1, N'8790000000', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (26, N'asdf', 12, N'Male', 2, N'435345', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (27, N'Amer', 30, N'Male', 1, N'12345', NULL, 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime), 1, CAST(N'2021-09-05 22:25:26.680' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (28, N'Meghna', 12, N'Female', 1, N'1234567', NULL, 1, CAST(N'2021-09-06 02:23:01.397' AS DateTime), 1, CAST(N'2021-09-06 02:23:01.397' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (29, N'kiran', 20, N'Male', 1, N'88888', NULL, 1, CAST(N'2021-09-06 02:27:37.540' AS DateTime), 1, CAST(N'2021-09-06 02:27:37.540' AS DateTime))
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Pname], [Age], [Gender], [DocId], [MobileNo], [Email], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (30, N'Vinay', 20, N'Male', 1, N'676767', NULL, 1, CAST(N'2021-09-06 08:47:32.493' AS DateTime), 1, CAST(N'2021-09-06 08:47:32.493' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] OFF
SET IDENTITY_INSERT [dbo].[tbl_ReportType] ON 

INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Clinical Biochemistory Report LIPID Profile', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Clinical Biochemistory Report LTF', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Computer Blood Picture Report', NULL, NULL, NULL, NULL)
INSERT [dbo].[tbl_ReportType] ([Id], [ReportType], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Test', 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime), 1, CAST(N'2021-09-04 14:17:39.570' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_ReportType] OFF
SET IDENTITY_INSERT [dbo].[tbl_UserLogin] ON 

INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (1, N'Namrata', N'n@gmail.com', N'123', 1, 1, 1, 1, NULL, NULL)
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (2, N'yawar', N'yawarali17@gmail.com', N'123', 0, 0, NULL, NULL, CAST(N'2021-09-05 20:11:45.503' AS DateTime), CAST(N'2021-09-05 20:11:45.503' AS DateTime))
INSERT [dbo].[tbl_UserLogin] ([Id], [Name], [Email], [Passward], [Status], [Center], [CreatedBy], [UpdatedBy], [CreatedOn], [UpdatedOn]) VALUES (3, N'Meghna', N'Meghna@gmail.com', N'123', 0, 1, NULL, NULL, CAST(N'2021-09-06 02:21:23.810' AS DateTime), CAST(N'2021-09-06 02:21:23.810' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_UserLogin] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uniqueEmail]    Script Date: 06-09-2021 16:14:03 ******/
ALTER TABLE [dbo].[tbl_UserLogin] ADD  CONSTRAINT [uniqueEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLTFDetails]    Script Date: 06-09-2021 16:14:03 ******/
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
	'2',
    @CreatedBy,
    GetDate(),
    @UpdatedBy,
    Getdate())
  
End 
GO
/****** Object:  StoredProcedure [dbo].[AddNewComputerBloodPictureReportDetails]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[AddNewPatientInfoDetails]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewPatientInfoDetails]  
(  
   
   
   @Pname varchar (50),
   @Age tinyint,
   @Gender varchar(10),
   @docid int,
   @mobileNo varchar(15),
   @CreatedBy int ,  
   @UpdatedBy int 
)  
as  
begin 
 
 IF((Select COUNT(*) From tbl_PatientInfo Where mobileNo=@mobileNo)=0)
 BEGIN 
   Insert into tbl_PatientInfo(Pname,Age,Gender,docid,mobileNo,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn)
    values(@Pname,@Age,@Gender,@docid,@mobileNo,@CreatedBy,getdate(),@UpdatedBy,getdate()) 
   SELECT mobileNo FROM tbl_PatientInfo WHERE mobileNo=@mobileNo
   
   END
 
End 

GO
/****** Object:  StoredProcedure [dbo].[AddReportType_Details]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddReportType_Details]  (  @Pid int,   @Date datetime ,     @Pname varchar (50),   @RefByDoc varchar(250),   @ReportType varchar(100))  as  begin    Insert into tbl_ReportType values(@Pid,@ReportType,@Pname,@RefByDoc,@Date)       SELECT @@IDENTITY AS INT   End


GO
/****** Object:  StoredProcedure [dbo].[Doc_Pati_Registration]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Doc_Pati_Registration](@Name varchar(50),@Email varchar(50),@Passward varchar(50),@conformPassward varchar(50))asbegininsert into Doctor_Patient_Registration([Name],	Email,	Passward,	ConformPassward,	CreatedBy,	UpdatedBy)values(@Name,@Email,@Passward,@conformPassward,'','');End


GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 06-09-2021 16:14:03 ******/
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
   cs.description,
   cs.branchLocation,
   cs.fullAddress,
   lpd.serumCholestrol,
   lpd.hdlCholestrol,
   lpd.LDLCholestrol,
   lpd.VLDLCholestrol,
   lpd.serumTriglyceride,
   lpd.THDL,
   lpd.LDLHDL,
   lpd.titalLipid
   from tbl_ClinicalBiochemistoryReportLIPIDProfile lpd
   inner join tbl_PatientInfo pt on lpd.Pid=pt.Pid
   inner join tbl_Doctor d on d.docid=pt.docid
   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   inner join tbl_CenterSettings cs on cs.CenterId=us.Center
   WHERE pt.Pid=@Pid and lpd.ReportId=@ReportId
End


GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLTFDetail]    Script Date: 06-09-2021 16:14:03 ******/
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
   cs.description,
   cs.branchLocation,
   cs.fullAddress,
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
   inner join tbl_Doctor d on d.docid=pt.docid
   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   inner join tbl_CenterSettings cs on cs.CenterId=us.Center
   WHERE pt.Pid=@Pid and ltf.ReportId=@ReportId
End


GO
/****** Object:  StoredProcedure [dbo].[GetComputerBloodPictureReportDetails]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetComputerBloodPictureReportDetails]    (@Pid int,
@ReportId int)as    begin       select    pt.Pid,   pt.Pname,   d.DoctorName,   pt.Pid as Srno,   pt.Age,   pt.Gender,   d.DoctorName as RefByDoc,   d.Specilization,   d.Qualification,   d.signature,   cs.description,   cs.branchLocation,   cs.fullAddress,   cb.CreatedOn as date,   Haemoglobin,   ErythrocyteCount,   TotalWBCCount,   Neutrophils,   Lymphocytes,   Eosinophils,   Monocytes,   Basophils,   Rbcs,   PlateletCount    from tbl_ComputerBloodPictureReport  cb   inner join tbl_PatientInfo pt on cb.Pid=pt.Pid   inner join tbl_Doctor d on d.docid=pt.docid   left join tbl_UserLogin us on us.CreatedBy=pt.CreatedBy 
   inner join tbl_CenterSettings cs on cs.CenterId=us.Center
   WHERE pt.Pid=@Pid and cb.ReportId=@ReportIdEnd



GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_getLogin]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_getLogin]  (  @Email varchar(50),  @Passward varchar(50)  )  as  declare @Cnt int;  begin  if exists(select * from tbl_UserLogin where Email=@Email and Passward=@Passward)   begin   select * from tbl_UserLogin where Email=@Email and Passward=@Passward end  else   begin   set @Cnt=0;   end   select @Cnt;End




GO
/****** Object:  StoredProcedure [dbo].[sp_getReports]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getReports]
As
BEGIN
SELECT Id,ReportType From tbl_ReportType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_SaveReport]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SaveReport]
@ReportType varchar(max),
@CreatedBy int,
@UpdatedBy int
As
BEGIN
INSERT INTO tbl_ReportType(ReportType,Createdby,CreatedOn,UpdatedBy,UpdatedOn) Values(@ReportType,@CreatedBy,GETDATE(),@UpdatedBy,GetDate()) 
END


GO
/****** Object:  StoredProcedure [dbo].[usp_getAllReportsByPatientId]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getAllReportsByPatientId]
(
@Pid int
)
AS 
BEGIN
SELECT
cb.Pid,
cb.ReportTypeId,
rpt.ReportType as Name,
cb.ReportId,
cb.CreatedOn,
cb.UpdatedOn,
cb.CreatedBy,
cb.UpdatedBy
FROM tbl_ClinicalBiochemistoryReportLIPIDProfile cb
inner join tbl_ReportType rpt
on cb.ReportTypeId=rpt.id
WHERE Pid=@Pid
UNION  
SELECT 
cb.Pid,
cb.ReportTypeId,
rpt.ReportType as Name,
cb.ReportId,
cb.CreatedOn,
cb.UpdatedOn,
cb.CreatedBy,
cb.UpdatedBy
FROM tbl_ClinicalBiochemistoryReportLTF cb
inner join tbl_ReportType rpt
on cb.ReportTypeId=rpt.id
WHERE Pid=@Pid
 UNION 
SELECT
 cb.Pid,
cb.ReportTypeId,
rpt.ReportType as Name,
cb.ReportId,
cb.CreatedOn,
cb.UpdatedOn,
cb.CreatedBy,
cb.UpdatedBy
 FROM tbl_ComputerBloodPictureReport cb
inner join tbl_ReportType rpt
on cb.ReportTypeId=rpt.id
  WHERE Pid=@Pid
END

GO
/****** Object:  StoredProcedure [dbo].[usp_getCenter]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_getUserLogin]    Script Date: 06-09-2021 16:14:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getUserLogin](@Name varchar(50),@Email varchar(50),@Passward varchar(50),@Status bit,@CenterId int)AsBegininsert into tbl_UserLogin    ([Name],	Email,	Passward,	Status,	Center,	CreatedOn,	UpdatedOn)	values	(@Name,	 @Email,	 @Passward,	 @Status,	 @CenterId,	 GETDATE(),	 GETDATE()	 )		 End

GO
/****** Object:  StoredProcedure [dbo].[uspGetDashborad]    Script Date: 06-09-2021 16:14:03 ******/
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
/****** Object:  StoredProcedure [dbo].[uspGetDoctotList]    Script Date: 06-09-2021 16:14:03 ******/
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
