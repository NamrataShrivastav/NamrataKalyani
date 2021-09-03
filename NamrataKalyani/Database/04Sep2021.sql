USE [master]
GO
/****** Object:  Database [SUNDIGNOSTIC]    Script Date: 04-09-2021 00:42:05 ******/
CREATE DATABASE [SUNDIGNOSTIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SUNDIGNOSTIC', FILENAME = N'E:\MSSQL12.MSSQLSERVER\MSSQL\DATA\SUNDIGNOSTIC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SUNDIGNOSTIC_log', FILENAME = N'E:\MSSQL12.MSSQLSERVER\MSSQL\DATA\SUNDIGNOSTIC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [SUNDIGNOSTIC] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [SUNDIGNOSTIC] SET  DISABLE_BROKER 
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
ALTER DATABASE [SUNDIGNOSTIC] SET RECOVERY FULL 
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
EXEC sys.sp_db_vardecimal_storage_format N'SUNDIGNOSTIC', N'ON'
GO
USE [SUNDIGNOSTIC]
GO
/****** Object:  Table [dbo].[Doctor_Patient_Registration]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctor_Patient_Registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Passward] [varchar](50) NULL,
	[ConformPassward] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedBy] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile](
	[ReportLIPIDPid] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[serumCholestrol] [varchar](50) NULL,
	[hdlCholestrol] [varchar](50) NULL,
	[LDLCholestrol] [varchar](50) NULL,
	[VLDLCholestrol] [varchar](50) NULL,
	[serumTriglyceride] [varchar](50) NULL,
	[THDL] [varchar](50) NULL,
	[LDLHDL] [varchar](50) NULL,
	[titalLipid] [varchar](50) NULL,
	[Date] [datetime] NULL,
	[Name] [varchar](150) NULL,
 CONSTRAINT [PK_tbl_ClinicalBiochemistoryReportLTF] PRIMARY KEY CLUSTERED 
(
	[ReportLIPIDPid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ClinicalBiochemistoryReportLTF]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ClinicalBiochemistoryReportLTF](
	[ReportLTFid] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_tbl_ClinicalBiochemistoryReportLIPIDProfile] PRIMARY KEY CLUSTERED 
(
	[ReportLTFid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ComputerBloodPictureReport]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ComputerBloodPictureReport](
	[Cbpid] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_tbl_ComputerBloodPictureReport] PRIMARY KEY CLUSTERED 
(
	[Cbpid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Doctor]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Doctor](
	[docid] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [int] NULL,
	[Specilization] [varchar](50) NULL,
	[Qualification] [varchar](50) NULL,
	[descriptions] [varchar](max) NULL,
	[fullAddress] [varchar](max) NULL,
	[branchLocation] [varchar](50) NULL,
	[signature] [varchar](50) NULL,
	[Doc_Name] [varchar](55) NULL,
	[Email_Id] [varchar](55) NULL,
	[Passward] [varchar](55) NULL,
 CONSTRAINT [PK_tbl_Doctor] PRIMARY KEY CLUSTERED 
(
	[docid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_PatientInfo]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_PatientInfo](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[Srno] [int] NULL,
	[Date] [datetime] NULL,
	[Pname] [varchar](50) NULL,
	[Age] [tinyint] NULL,
	[RefByDoc] [varchar](250) NULL,
	[Gender] [varchar](10) NULL,
	[docid] [int] NULL,
	[mobileNo] [varchar](15) NULL,
 CONSTRAINT [PK_tbl_PatientInfo] PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ReportType]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ReportType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pid] [int] NULL,
	[Rtype] [varchar](255) NULL,
	[Pname] [varchar](50) NULL,
	[RefByDoc] [varchar](50) NULL,
	[Tdate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor_Patient_Registration] ON 

INSERT [dbo].[Doctor_Patient_Registration] ([Id], [Name], [Email], [Passward], [ConformPassward], [CreatedBy], [UpdatedBy]) VALUES (1, N'Namrata', N'n@gmail.com', N'123', N'123', N'', N'')
SET IDENTITY_INSERT [dbo].[Doctor_Patient_Registration] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportLIPIDPid], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Date], [Name]) VALUES (1, 10, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLIPIDProfile')
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportLIPIDPid], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Date], [Name]) VALUES (2, 5, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLIPIDProfile')
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportLIPIDPid], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Date], [Name]) VALUES (3, 2, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLIPIDProfile')
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] ([ReportLIPIDPid], [Pid], [serumCholestrol], [hdlCholestrol], [LDLCholestrol], [VLDLCholestrol], [serumTriglyceride], [THDL], [LDLHDL], [titalLipid], [Date], [Name]) VALUES (4, 4, N'192', N'45', N'126', N'21', N'105', N'4.2', N'2.8', N'489', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLIPIDProfile')
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLIPIDProfile] OFF
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ON 

INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportLTFid], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name]) VALUES (1, 4, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF')
INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] ([ReportLTFid], [Pid], [serumBilirubin], [serumBilirubinD], [serumBilirubinID], [serumAsparateAminoTransferase], [serumAlanineAminoTransferase], [serumTotalProtein], [serumAlbumin], [serumGlubulin], [AGRation], [serumAlkalinePhosphatse], [Date], [Name]) VALUES (2, 10, N'0.7', N'0.2', N'0.5', N'13', N'15', N'6.8', N'3.9', N'2.9', N'1.3', N'66', CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'ClinicalBiochemistoryReportLTF')
SET IDENTITY_INSERT [dbo].[tbl_ClinicalBiochemistoryReportLTF] OFF
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] ON 

INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (1, 4, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0 ', N'3.9 ', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic
', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (2, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'test', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (3, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (4, 0, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (5, 1, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (6, 5, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (7, 6, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (8, 7, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (9, 8, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (10, 9, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (11, 10, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11.0', N'3.9', N'4,900', N'64', N'30', N'04', N'02', N'Not Found', N'Normocytic Normochromic', N'3,21,000', N'ComputerBloodPictureReport')
INSERT [dbo].[tbl_ComputerBloodPictureReport] ([Cbpid], [Pid], [Date], [Haemoglobin], [ErythrocyteCount], [TotalWBCCount], [Neutrophils], [Lymphocytes], [Eosinophils], [Monocytes], [Basophils], [Rbcs], [PlateletCount], [Name]) VALUES (12, NULL, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'11', N'233', N'123', N'232', N'322', N'23', N'11', N'23', N'22', N'23', N'ComputerBloodPictureReport')
SET IDENTITY_INSERT [dbo].[tbl_ComputerBloodPictureReport] OFF
SET IDENTITY_INSERT [dbo].[tbl_Doctor] ON 

INSERT [dbo].[tbl_Doctor] ([docid], [Logo], [Specilization], [Qualification], [descriptions], [fullAddress], [branchLocation], [signature], [Doc_Name], [Email_Id], [Passward]) VALUES (1, NULL, N'Consultant Pathologist', N'M B B S D C P(Path)', N'The copyright in all of the copyright works contained within these pages is either owned by Verdict Media Limited. or licensed to it. ', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Hyderabad', N'Dr Aijaz', N'Dr Aijaz', N'a@gmail.com', N'123')
INSERT [dbo].[tbl_Doctor] ([docid], [Logo], [Specilization], [Qualification], [descriptions], [fullAddress], [branchLocation], [signature], [Doc_Name], [Email_Id], [Passward]) VALUES (2, NULL, N'Consultant Pathologist', N'M B B S D C P(Path)', N'The copyright in all of the copyright works contained within these pages is either owned by Verdict Media Limited. or licensed to it. ', N'H.No. 4-18-26/A , Opp Noorani Masjid, Hassan Nagar, Hyderabad, T.S.', N'Pune', N'Dr Ritu', N'Dr Ritu', N'r@gmail.com', N'123')
SET IDENTITY_INSERT [dbo].[tbl_Doctor] OFF
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] ON 

INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (1, 227845, CAST(N'2021-08-21 00:00:00.000' AS DateTime), N'Namrata Shrivastav', 28, N'Dr  Aijaz', N'F', 1, N'8888804930')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (2, 424178, CAST(N'2021-08-22 00:00:00.000' AS DateTime), N'Tanya Varma', 24, N'Dr  Aijiz', N'1', 1, N'9800000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (3, 45745, CAST(N'2021-08-22 00:00:00.000' AS DateTime), N'Supriya Sinha', 22, N'Dr  Aijiz', N'F', 1, N'9100000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (4, 23212, CAST(N'2021-08-22 00:00:00.000' AS DateTime), N'Gudda', 18, N'Dr  Aijiz', N'1', 1, N'9900000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (5, 23233, CAST(N'2021-08-22 00:00:00.000' AS DateTime), N'Tanuja', 32, N'Dr  Aijiz', N'1', 1, N'8800000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (6, 334442, CAST(N'2021-08-21 00:00:00.000' AS DateTime), N'Priya', 21, N'Dr Aijiz', N'1', 1, N'7700000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (7, 2321, CAST(N'2021-08-22 00:00:00.000' AS DateTime), N'Prince', 23, N'Dr  Aijiz', N'1', 1, N'6600000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (8, 23443, CAST(N'2021-08-22 00:00:00.000' AS DateTime), N'Salman', 52, N'Dr  Aijiz', N'1', 1, N'9700000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (9, 1254, CAST(N'2021-08-23 00:00:00.000' AS DateTime), N'Rubina', 25, N'Dr  Aijiz', N'1', 1, N'8700000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (10, 2444, CAST(N'2021-08-27 00:00:00.000' AS DateTime), N'Tripti Sharma', 23, N'Dr  Aijiz', N'Female', 1, N'9300000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (15, 1222, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'Sakshi', 22, N'Dr Kulkarni', N'Female', 1, N'9988778899')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (16, 11, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'Minu', 55, N'Ravi', N'Female', 1, N'9144000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (17, 332, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'Sakshi', 33, N'Meera', N'Female', 1, N'7700111111')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (18, 232, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'Aman', 22, N'Dr Kulkarni', N'Female', 1, N'7700111122')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (19, 12, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'Aman', 23, N'Dr Kulkarni', N'Male', 1, N'7700111123')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (20, 434, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'Tanu Sharma', 23, N'Dr Kulkarni', N'Female', 1, N'7700111133')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (21, 3455, CAST(N'2021-09-02 00:00:00.000' AS DateTime), N'Tanu Sharma', 23, N'Meera', N'Female', 1, N'7700111129')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (22, 44, CAST(N'2021-09-03 00:00:00.000' AS DateTime), N'Nita', 44, N'Meera', N'Female', 1, N'7300000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (24, 44, CAST(N'2021-09-03 00:00:00.000' AS DateTime), N'Sumona', 33, N'Dr Kulkarni', N'Female', 2, N'8880000000')
INSERT [dbo].[tbl_PatientInfo] ([Pid], [Srno], [Date], [Pname], [Age], [RefByDoc], [Gender], [docid], [mobileNo]) VALUES (25, 122, CAST(N'2021-09-03 00:00:00.000' AS DateTime), N'Sumona', 55, N'Dr Kulkarni', N'Female', 1, N'8790000000')
SET IDENTITY_INSERT [dbo].[tbl_PatientInfo] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [uniqueEmail]    Script Date: 04-09-2021 00:42:06 ******/
ALTER TABLE [dbo].[Doctor_Patient_Registration] ADD  CONSTRAINT [uniqueEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddNewClinicalBiochemistoryReportLIPIDProfileDetails]  
(  
   @Pid int,      
   @ReportLIPIDPid varchar (50),
   @serumCholestrol varchar (50),
   @hdlCholestrol varchar(50),
   @LDLCholestrol varchar(50),
   @VLDLCholestrol varchar(50),
   @serumTriglyceride varchar(50),
   @THDL varchar(50),
   @LDLHDL varchar(50),
   @titalLipid varchar(50)
)  
as  
begin  
   Insert into tbl_ClinicalBiochemistoryReportLIPIDProfile values(
   @Pid,@serumCholestrol,@hdlCholestrol,@LDLCholestrol,@VLDLCholestrol,@serumTriglyceride,@THDL,@LDLHDL,
   @titalLipid
   )  
End 

GO
/****** Object:  StoredProcedure [dbo].[AddNewClinicalBiochemistoryReportLTFDetails]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddNewClinicalBiochemistoryReportLTFDetails]  
(  
   @Pid int,      
   @ReportLTFid varchar (50),
   @serumBilirubin varchar (50),
   @serumBilirubinD varchar(50),
   @serumBilirubinID varchar(50),
   @serumAsparateAminoTransferase varchar(50),
   @serumAlanineAminoTransferase varchar(50),
   @serumTotalProtein varchar(50),
   @serumAlbumin varchar(50),
   @serumGlubulin varchar(50),
   @AGRation varchar(50),
   @serumAlkalinePhosphatse varchar(50)
)  
as  
begin  
   Insert into tbl_ClinicalBiochemistoryReportLTF values(
   @Pid,@serumBilirubin,@serumBilirubinD,@serumBilirubinID,@serumAsparateAminoTransferase,@serumAlanineAminoTransferase,
   @serumTotalProtein,@serumAlbumin,@serumGlubulin,
   @AGRation,@serumAlkalinePhosphatse
   )  
End 

GO
/****** Object:  StoredProcedure [dbo].[AddNewComputerBloodPictureReportDetails]    Script Date: 04-09-2021 00:42:06 ******/
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
   @PlateletCount varchar(50)
)  
as  
begin  
   Insert into tbl_ComputerBloodPictureReport values(
   @Pid,GETDATE(),@Haemoglobin,@ErythrocyteCount,@TotalWBCCount,@Neutrophils,@Lymphocytes,@Eosinophils,
   @Monocytes,@Basophils,@Rbcs,@PlateletCount
   )  
End 

GO
/****** Object:  StoredProcedure [dbo].[AddNewPatientInfoDetails]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddNewPatientInfoDetails]  
(  
   @Srno varchar (50),  
   @Date datetime ,  
   @Pname varchar (50),
   @Age tinyint,
   @RefByDoc varchar(250),
   @Gender varchar(10),
   @docid int,
   @mobileNo varchar(15)
   
)  
as  
begin 
 
 IF((Select COUNT(*) From tbl_PatientInfo Where mobileNo=@mobileNo)=0)
 BEGIN 
   Insert into tbl_PatientInfo values(@Srno,@Date,@Pname,@Age,@RefByDoc,@Gender,@docid,@mobileNo) 
   SELECT mobileNo FROM tbl_PatientInfo WHERE mobileNo=@mobileNo
   
   END
 
End 
GO
/****** Object:  StoredProcedure [dbo].[AddReportType_Details]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddReportType_Details]  (  @Pid int,   @Date datetime ,     @Pname varchar (50),   @RefByDoc varchar(250),   @ReportType varchar(100))  as  begin    Insert into tbl_ReportType values(@Pid,@ReportType,@Pname,@RefByDoc,@Date)       SELECT @@IDENTITY AS INT   End

GO
/****** Object:  StoredProcedure [dbo].[Doc_Pati_Registration]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[Doc_Pati_Registration](@Name varchar(50),@Email varchar(50),@Passward varchar(50),@conformPassward varchar(50))asbegininsert into Doctor_Patient_Registration([Name],	Email,	Passward,	ConformPassward,	CreatedBy,	UpdatedBy)values(@Name,@Email,@Passward,@conformPassward,'','');End

GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLIPIDProfileDetails]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetClinicalBiochemistoryReportLIPIDProfileDetails]    
(
@Pid int
)
as    
begin    
   select B.Pid,B.Pname,C.Doc_Name,Srno,Age,Gender,RefByDoc,C.Specilization,C.Qualification,C.signature,C.descriptions,C.branchLocation,C.fullAddress,
  serumCholestrol,hdlCholestrol,LDLCholestrol,VLDLCholestrol,serumTriglyceride,THDL,LDLHDL,
   titalLipid
   from tbl_ClinicalBiochemistoryReportLIPIDProfile A
   inner join tbl_PatientInfo B on A.Pid=B.Pid
   inner join tbl_Doctor c on c.docid=b.docid
   WHERE b.Pid=@Pid
End

GO
/****** Object:  StoredProcedure [dbo].[GetClinicalBiochemistoryReportLTFDetail]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetClinicalBiochemistoryReportLTFDetail]    
(
@Pid int
)
as    
begin    
   select B.Pid,B.Pname,C.Doc_Name,Srno,Age,Gender,RefByDoc,C.Specilization,C.Qualification,C.signature,C.descriptions,C.branchLocation,C.fullAddress,
 serumBilirubin,serumBilirubinD,serumBilirubinID,serumAsparateAminoTransferase,serumAlanineAminoTransferase,
   serumTotalProtein,serumAlbumin,serumGlubulin,
   AGRation,serumAlkalinePhosphatse
   from tbl_ClinicalBiochemistoryReportLTF  A
   inner join tbl_PatientInfo B on A.Pid=B.Pid
   inner join tbl_Doctor c on c.docid=b.docid
   WHERE b.Pid=@Pid
End

GO
/****** Object:  StoredProcedure [dbo].[GetComputerBloodPictureReportDetails]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetComputerBloodPictureReportDetails]    (@Pid int)as    begin       select B.Pid,B.Pname,C.Doc_Name,Srno,Age,Gender,RefByDoc,C.Specilization,C.Qualification,C.signature,C.descriptions,C.branchLocation,C.fullAddress,A.Date,   Haemoglobin,ErythrocyteCount,TotalWBCCount,Neutrophils,Lymphocytes,Eosinophils,Monocytes,Basophils,Rbcs,PlateletCount    from tbl_ComputerBloodPictureReport  A   inner join tbl_PatientInfo B on A.Pid=B.Pid   inner join tbl_Doctor c on c.docid=b.docid   WHERE b.Pid=@PidEnd


GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 04-09-2021 00:42:06 ******/
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
/****** Object:  StoredProcedure [dbo].[GetPatientInfoDetails]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetPatientInfoDetails]    
as    
begin    
   select Pid as Srno,Date,Pname,Age,RefByDoc,Gender,mobileNo,ReportType from tbl_PatientInfo  
End 


GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 04-09-2021 00:42:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_Login]  (  @Email varchar(50),  @Passward varchar(50)  )  as  declare @Cnt int;  begin  if exists(select * from Doctor_Patient_Registration where Email=@Email and Passward=@Passward)   begin   select * from Doctor_Patient_Registration where Email=@Email and Passward=@Passward end  else   begin   set @Cnt=0;   end   select @Cnt;End



GO
/****** Object:  StoredProcedure [dbo].[usp_getAllReportsByPatientId]    Script Date: 04-09-2021 00:42:06 ******/
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
SELECT Pid,Name,Date FROM tbl_ClinicalBiochemistoryReportLIPIDProfile WHERE Pid=@Pid UNION  
SELECT Pid,Name,Date FROM tbl_ClinicalBiochemistoryReportLTF WHERE Pid=@Pid UNION 
SELECT Pid,Name,Date FROM tbl_ComputerBloodPictureReport WHERE Pid=@Pid
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetDashborad]    Script Date: 04-09-2021 00:42:06 ******/
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
order by  [Date] desc
END

GO
/****** Object:  StoredProcedure [dbo].[uspGetDoctotList]    Script Date: 04-09-2021 00:42:06 ******/
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
	SELECT docid,Doc_Name FROM tbl_Doctor
END

GO
USE [master]
GO
ALTER DATABASE [SUNDIGNOSTIC] SET  READ_WRITE 
GO
