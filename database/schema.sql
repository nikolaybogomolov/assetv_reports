USE [master]
GO
/****** Object:  Database [reportsdb]    Script Date: 7/29/2016 4:50:17 PM ******/
CREATE DATABASE [reportsdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reportsdb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\reportsdb.mdf' , SIZE = 18432KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'reportsdb_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\reportsdb_log.ldf' , SIZE = 20096KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [reportsdb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [reportsdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [reportsdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [reportsdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [reportsdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [reportsdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [reportsdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [reportsdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [reportsdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [reportsdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [reportsdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [reportsdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [reportsdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [reportsdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [reportsdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [reportsdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [reportsdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [reportsdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [reportsdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [reportsdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [reportsdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [reportsdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [reportsdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [reportsdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [reportsdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [reportsdb] SET  MULTI_USER 
GO
ALTER DATABASE [reportsdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [reportsdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [reportsdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [reportsdb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [reportsdb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [reportsdb]
GO
/****** Object:  User [jxthomas]    Script Date: 7/29/2016 4:50:17 PM ******/
CREATE USER [jxthomas] FOR LOGIN [jxthomas] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Area_report]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Area_report](
	[AID] [int] IDENTITY(0,1) NOT NULL,
	[AArea] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AudienceProfile]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AudienceProfile](
	[APID] [int] IDENTITY(1,1) NOT NULL,
	[APCID] [int] NULL,
	[APPeriod] [nvarchar](255) NULL,
	[APYear] [int] NULL,
	[APWirehouseAdvisors] [decimal](18, 5) NULL,
	[APindependent_BD] [decimal](18, 5) NULL,
	[APRIA] [decimal](18, 5) NULL,
	[APInsurance_CPAs_BankTrust] [decimal](18, 5) NULL,
	[APInvestmentConsultant] [decimal](18, 5) NULL,
	[APEndowment_Foundation] [decimal](18, 5) NULL,
	[APPlanSponsor] [decimal](18, 5) NULL,
	[APAssetManager] [decimal](18, 5) NULL,
	[APPrivateBank_WM] [decimal](18, 5) NULL,
	[APIFA] [decimal](18, 5) NULL,
	[APOther] [decimal](18, 5) NULL,
	[APArea] [int] NULL,
 CONSTRAINT [pk_audienceprofile] PRIMARY KEY CLUSTERED 
(
	[APID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Blog](
	[BID] [int] IDENTITY(10000,1) NOT NULL,
	[BCID] [int] NOT NULL,
	[BTitle] [varchar](200) NOT NULL,
	[BDatePublished] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BlogStats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogStats](
	[BSID] [int] IDENTITY(10000,1) NOT NULL,
	[BBID] [int] NOT NULL,
	[BMonth] [int] NOT NULL,
	[BViews] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CID] [int] NOT NULL,
	[CName] [varchar](100) NOT NULL,
	[CReportSinceMonth] [int] NULL,
	[CReportSinceYear] [int] NULL,
	[CType] [int] NOT NULL,
 CONSTRAINT [pk_company1] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company_Type]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company_Type](
	[company_type_id] [int] IDENTITY(0,1) NOT NULL,
	[company_type] [varchar](20) NOT NULL,
 CONSTRAINT [pk_company_type] PRIMARY KEY CLUSTERED 
(
	[company_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[data_dump_video]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[data_dump_video](
	[V_ID] [varchar](50) NULL,
	[V_Title] [varchar](50) NULL,
	[V_DateFilmed] [varchar](50) NULL,
	[V_DatePublished] [varchar](50) NULL,
	[V_Duration] [varchar](50) NULL,
	[V_VideoLink] [varchar](50) NULL,
	[V_Type] [varchar](50) NULL,
	[V_ImageURL] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Email]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[ECID] [int] NULL,
	[ETitle] [ntext] NULL,
	[EDate] [date] NULL,
 CONSTRAINT [pk_email] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmailStats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailStats](
	[ESID] [int] IDENTITY(10000,1) NOT NULL,
	[EEID] [int] NULL,
	[EMonth] [int] NULL,
	[ESends] [int] NULL,
	[EOpens] [int] NULL,
	[ECTR] [int] NULL,
	[EWirehouseAdvisors] [decimal](18, 5) NULL,
	[EIndepentBD] [decimal](18, 5) NULL,
	[ERIA] [decimal](18, 5) NULL,
	[EInsuranceCPAsBankTrust] [decimal](18, 5) NULL,
	[EInvestmentConsultant] [decimal](18, 5) NULL,
	[EEndowmentFoundation] [decimal](18, 5) NULL,
	[EPlanSponsor] [decimal](18, 5) NULL,
	[EAssetManager] [decimal](18, 5) NULL,
	[EOther] [decimal](18, 5) NULL,
	[EArea] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ESID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Month]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Month](
	[month] [int] NULL,
	[month_name] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Month_current]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Month_current](
	[month_key] [int] NULL,
	[month_number] [int] NULL,
	[month_year] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Month_report]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Month_report](
	[month_id] [int] NOT NULL,
	[month_short_name] [varchar](3) NULL,
	[month_name] [varchar](20) NULL,
	[month_number] [int] NULL,
	[month_year] [int] NULL,
 CONSTRAINT [pk_report_month] PRIMARY KEY CLUSTERED 
(
	[month_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[my_video_stats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[my_video_stats](
	[VS_ID] [varchar](50) NULL,
	[V_ID] [varchar](50) NULL,
	[Date_Filmed] [varchar](50) NULL,
	[Vtype] [varchar](50) NULL,
	[Speriod] [varchar](50) NULL,
	[SYear] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[Total_Views] [varchar](50) NULL,
	[Average_Minutes] [varchar](50) NULL,
	[Total_Hours] [varchar](50) NULL,
	[Completed_Views] [varchar](50) NULL,
	[Terminal_Views] [varchar](50) NULL,
	[Wirehouse_Advisors] [varchar](50) NULL,
	[Independent_BD] [varchar](50) NULL,
	[RIA] [varchar](50) NULL,
	[Insurance_CPAs_BankTrust] [varchar](50) NULL,
	[ Investment_Consultant] [varchar](50) NULL,
	[Endowment_Foundation] [varchar](50) NULL,
	[Plan_Sponsor] [varchar](50) NULL,
	[Asset_Manager] [varchar](50) NULL,
	[PrivateBank_WM] [varchar](50) NULL,
	[IFA] [varchar](50) NULL,
	[Other] [varchar](50) NULL,
	[Finished] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParticipantsList_dontneed]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantsList_dontneed](
	[PLID] [int] IDENTITY(1,1) NOT NULL,
	[PLVID] [int] NULL,
	[PLCID] [int] NULL,
	[VideoID_New] [int] NULL,
 CONSTRAINT [pk_participantsList] PRIMARY KEY CLUSTERED 
(
	[PLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Query4]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Query4](
	[VID] [int] NOT NULL,
	[VType] [varchar](500) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReportPage]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportPage](
	[RPID] [int] NULL,
	[PageDesc] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportType]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportType](
	[RTID] [int] NULL,
	[ReportType] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RunTotalTestData]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RunTotalTestData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[value] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SCRAPED_VIDEO_DATA]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[SCRAPED_VIDEO_DATA](
	[scrape_id] [int] IDENTITY(1,1) NOT NULL,
	[channel_name] [varchar](100) NOT NULL,
	[og_image] [varchar](500) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA] ADD [og_title] [varchar](200) NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA] ADD [og_url] [varchar](500) NOT NULL
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA] ADD [video_core_id] [varchar](20) NOT NULL
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA] ADD [video_duration] [float] NOT NULL
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA] ADD [run_time] [datetime] NULL
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA] ADD [published_time] [datetime] NULL
 CONSTRAINT [pk_scraped_video_data] PRIMARY KEY CLUSTERED 
(
	[scrape_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SCRAPED_VIDEO_DATA_TAGS]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SCRAPED_VIDEO_DATA_TAGS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[scrape_id] [int] NOT NULL,
	[tag_name] [varchar](200) NOT NULL,
	[tag_type] [varchar](20) NOT NULL,
 CONSTRAINT [pk_scraped_video_data_tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tag](
	[T_ID] [int] IDENTITY(1,1) NOT NULL,
	[T_TAG] [varchar](200) NULL,
	[T_Type] [varchar](20) NULL,
	[ReportType] [varchar](50) NULL,
 CONSTRAINT [pk_tag] PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TagList]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagList](
	[TL_ID] [int] IDENTITY(1,1) NOT NULL,
	[TL_VID] [int] NOT NULL,
	[TL_TID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TagReportList]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagReportList](
	[TID] [int] NULL,
	[RPID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TagReportTypeList]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagReportTypeList](
	[TPLID] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NOT NULL,
	[F3] [nvarchar](255) NOT NULL,
	[ReportType] [nvarchar](255) NOT NULL,
	[RTID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tags]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags](
	[vtitle] [ntext] NULL,
	[tags] [ntext] NULL,
	[videolink] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TopCompany]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopCompany](
	[TCID] [int] IDENTITY(1,1) NOT NULL,
	[TCCID] [int] NULL,
	[TCPeriod] [nvarchar](255) NULL,
	[TCYear] [int] NULL,
	[TCCompany] [nvarchar](255) NULL,
	[TCViews] [smallint] NULL,
	[TCMonth] [int] NULL,
	[TCArea] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video](
	[V_ID] [int] NOT NULL,
	[V_Title] [varchar](200) NULL,
	[V_DateFilmed] [date] NULL,
	[V_DatePublished] [date] NOT NULL,
	[V_Duration] [float] NOT NULL,
	[V_VideoLink] [varchar](500) NOT NULL,
	[V_Type] [nchar](50) NULL,
	[V_ImageURL] [varchar](500) NOT NULL,
	[V_Report_Finished] [bit] NULL,
 CONSTRAINT [pk_video1] PRIMARY KEY CLUSTERED 
(
	[V_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video_OLD]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Video_OLD](
	[VID] [int] IDENTITY(1,1) NOT NULL,
	[VTitle] [varchar](200) NULL,
	[VDateFilmed] [datetime2](7) NULL,
	[VDatePublished] [datetime2](7) NULL,
	[VDuration] [decimal](18, 5) NULL,
	[VVideoLink] [varchar](500) NULL,
	[VPlayerLink] [ntext] NULL,
	[VType] [nvarchar](255) NULL,
	[VParticipant] [nvarchar](255) NULL,
	[VSubComp] [nvarchar](255) NULL,
	[Finished] [bit] NULL,
	[Tags] [ntext] NULL,
	[Bookmarked] [bit] NULL,
 CONSTRAINT [pk_video] PRIMARY KEY CLUSTERED 
(
	[VID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VideoStats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VideoStats](
	[VS_ID] [int] IDENTITY(1,1) NOT NULL,
	[V_ID] [int] NULL,
	[VType] [varchar](20) NULL,
	[SPeriod] [varchar](20) NULL,
	[SYear] [int] NULL,
	[Total_Views] [int] NULL,
	[Avgerage_Minutes] [float] NULL,
	[Total_Hours] [float] NULL,
	[Completed_Views] [int] NULL,
	[Terminal_Views] [int] NULL,
	[Wirehouse_Advisors] [float] NULL,
	[Independent_BD] [float] NULL,
	[RIA] [float] NULL,
	[Insurance_CPAs_BankTrust] [float] NULL,
	[Investment_Consultant] [float] NULL,
	[Endowment_Foundation] [float] NULL,
	[Plan_Sponsor] [float] NULL,
	[Asset_Manager] [float] NULL,
	[PrivateBank_WM] [float] NULL,
	[IFA] [float] NULL,
	[Other] [float] NULL,
	[Finished] [int] NULL,
	[VSMonth] [int] NULL,
	[VSArea] [int] NULL,
 CONSTRAINT [pk_video_stats] PRIMARY KEY CLUSTERED 
(
	[VS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VideoTopCompany]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoTopCompany](
	[VTCID] [int] IDENTITY(1,1) NOT NULL,
	[VTCVID] [int] NULL,
	[VTCPeriod] [nvarchar](255) NULL,
	[VTCYear] [smallint] NULL,
	[VTCCompany] [nvarchar](255) NULL,
	[VTCViews] [smallint] NULL,
	[VTCMonth] [int] NULL,
	[VTCArea] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Whitepaper]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Whitepaper](
	[WID] [int] IDENTITY(10000,1) NOT NULL,
	[WCID] [int] NOT NULL,
	[WTitle] [varchar](200) NOT NULL,
	[WDatePublished] [date] NOT NULL,
 CONSTRAINT [PK__Whitepaper] PRIMARY KEY CLUSTERED 
(
	[WID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WhitepaperStats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WhitepaperStats](
	[WSID] [int] IDENTITY(10000,1) NOT NULL,
	[WWID] [int] NOT NULL,
	[WMonth] [int] NOT NULL,
	[WViews] [int] NOT NULL,
 CONSTRAINT [PK__WhitepaperStats] PRIMARY KEY CLUSTERED 
(
	[WSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VW_VIDEO_TRANSLATION]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
Create view [dbo].[VW_VIDEO_TRANSLATION] AS

SELECT  a.VID old_video_id,a.VTitle old_title,b.V_ID new_video_id, b.V_Title new_title
   
  FROM [reportsdb].[dbo].[Video_access] a, [reportsdb].[dbo].Video b
  where a.Vtitle = b.V_Title


GO
/****** Object:  View [dbo].[VW_VIDEO_PARTICIPANTS]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[VW_VIDEO_PARTICIPANTS] as
  SELECT  
      pl.PLVID
      ,pl.PLCID,c.CName company_name ,v.V_Title video_title
  FROM [reportsdb].[dbo].[ParticipantsList] pl,
  [reportsdb].[dbo].[Company] c,
  [reportsdb].[dbo].[VW_VIDEO_TRANSLATION] t,
  [reportsdb].[dbo].[Video] v
  where t.old_video_id = pl.PLVID and
  pl.PLCID = c.CID and
  v.V_ID =  pl.PLVID 
GO
/****** Object:  View [dbo].[VW_CHANNEL_REPORTS_ALL_TIME]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CHANNEL_REPORTS_ALL_TIME] as
select 
t.T_ID,
vs.SPeriod,
vs.SYear,
Wirehouse_Advisors ,
Independent_BD,
RIA,
Insurance_CPAs_BankTrust,
Investment_Consultant,
Endowment_Foundation,
Plan_Sponsor,
Asset_Manager,
PrivateBank_WM,
IFA,
Other
from VideoStats vs , TagList tl, Tag t, Video v
where vs.V_ID  = tl.TL_VID
and tl.TL_TID = t.T_ID
and t.T_Type = 'Companies'
and v.V_ID = vs.V_ID
GO
/****** Object:  View [dbo].[VW_GET_YTD_MONTH_YEAR]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_GET_YTD_MONTH_YEAR] as
select m.*
from Month_report m,Month_current c
where m.month_number = c.month_number 
and c.month_year = m.month_year
union
select m.*
from Month_report m,Month_current c
where m.month_number < c.month_number 
and c.month_year = m.month_year
GO
/****** Object:  View [dbo].[VW_CHANNEL_YTD_Audience_Category]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[VW_CHANNEL_YTD_Audience_Category] as
select T_ID,
sum(Wirehouse_Advisors) as Wirehouse_Advisors,
sum(Independent_BD) as Independent_BD,
sum(RIA) as	RIA,
sum(Insurance_CPAs_BankTrust) as Insurance_CPAs_BankTrust,
sum(Investment_Consultant) as Investment_Consultant,
sum(Endowment_Foundation) as Endowment_Foundation,
sum(Plan_Sponsor) as Plan_Sponsor,
sum(Asset_Manager) as Asset_Manager,
sum(PrivateBank_WM) as PrivateBank_WM,
sum(IFA) as IFA,
Sum(Other) as Other
from VW_CHANNEL_REPORTS_ALL_TIME d, 
     VW_GET_YTD_MONTH_YEAR month_year
where 
d.SPeriod = month_year.month_name and
d.SYear = month_year.month_year
Group by T_ID
GO
/****** Object:  View [dbo].[videoID_change]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[videoID_change] as
select Video.V_ID as newVideoID, Video.V_Title, Video.V_DatePublished, Video_OLD.VID as oldVideoID, Video_OLD.VTitle, Video_OLD.VDatePublished
from Video, Video_OLD
where Video.V_Title = Video_OLD.VTitle
and Video.V_DatePublished = Video_OLD.VDatePublished;
GO
/****** Object:  View [dbo].[VW_All_Time_Results]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[VW_All_Time_Results] (
C_ID,
V_ID,
V_Title ,
V_DatePublished ,
V_Duration ,
Total_Views ,
Average_Time ,
Total_Time ) as
select 10001,123,'MASTERCLASS: Where Now for Equity Markets?','20015-0915',29.4,6511,18.5,2002.8;
GO
/****** Object:  View [dbo].[VW_Audience_Profile_Company]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_Audience_Profile_Company] (
C_ID,
View_Completes,
Viewer_Role,
View_Month,
View_Year ) as

select 10002,31,'Wirehouse Advisors',06,2016 union
select 10002,27,'Independent B/D',06,2016 union
select 10002,15,'RIA',06,2016 union
select 10002,4,'Insurance, CPAs, Bank Trust',06,2016 union
select 10002,8,'Investment Consultant',06,2016 union
select 10002,4,'Plan Sponsor',06,2016 union
select 10002,8,'Asset Manager',06,2016 union
select 10002,1,'Other',06,2016
GO
/****** Object:  View [dbo].[VW_Audience_Profile_Video]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Audience_Profile_Video] (
V_ID,
View_Completes,
Viewer_Role,
View_Month,
View_Year ) as

select 456,31,'Wirehouse Advisors',06,2016 union
select 456,27,'Independent B/D',06,2016 union
select 456,15,'RIA',06,2016 union
select 456,4,'Insurance, CPAs, Bank Trust',06,2016 union
select 456,8,'Investment Consultant',06,2016 union
select 456,4,'Plan Sponsor',06,2016 union
select 456,8,'Asset Manager',06,2016 union
select 456,1,'Other',06,2016
GO
/****** Object:  View [dbo].[VW_Channel_EMail_Stats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[VW_Channel_EMail_Stats] as
select  e.ECID,e.ETitle,e.EDate,es.ESends,es.EOpens,es.ECTR,[EWirehouseAdvisors],
[EIndepentBD],[ERIA],[EInvestmentConsultant],[EPlanSponsor],[EAssetManager],[EOther]
from Email e, EmailStats es
where e.EID = es.EEID
GO
/****** Object:  View [dbo].[VW_CHANNEL_REPORTS]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CHANNEL_REPORTS] as
select t.T_ID,
 t.T_TAG,
sum(vs.total_views) as Sum_Total_Views,
sum(vs.Total_Hours) Sum_Total_Hours,
sum(vs.Completed_Views) Sum_Completed_Views
from VideoStats vs , TagList tl, Tag t, Month_current mc, Video v, Month_report m
where vs.V_ID  = tl.TL_VID
and tl.TL_TID = t.T_ID
and t.T_Type = 'Companies'
and vs.SYear = mc.month_year
and m.month_year = mc.month_year
and m.month_number <= mc.month_number
and m.month_name = vs.SPeriod
and v.V_ID = vs.V_ID
group by t.T_ID,
 t.T_TAG
GO
/****** Object:  View [dbo].[VW_CHANNEL_REPORTS_ALL_TIME_2]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CHANNEL_REPORTS_ALL_TIME_2] as
select 
t.T_ID, t.T_TAG,v.V_DatePublished,v.V_Title,v.V_Duration, 
sum(vs.total_views) as Total_Views,
avg(vs.Avgerage_Minutes) as Average_Minutes,
sum(vs.Total_Hours)  Total_Hours,
avg(vs.Avgerage_Minutes/v.V_Duration) Engagement
from VideoStats vs , TagList tl, Tag t, Video v
where vs.V_ID  = tl.TL_VID
and tl.TL_TID = t.T_ID
and t.T_Type = 'Companies'
and v.V_ID = vs.V_ID
group by t.T_ID, t.T_TAG,v.V_DatePublished,v.V_Title,v.V_Duration 

GO
/****** Object:  View [dbo].[VW_CHANNEL_REPORTS_LAST_MONTH]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CHANNEL_REPORTS_LAST_MONTH] as
select last_month.month_id, t.T_ID,
 t.T_TAG,
sum(vs.total_views) as Sum_Total_Views,
sum(vs.Total_Hours) Sum_Total_Hours,
sum(Wirehouse_Advisors) as Wirehouse_Advisors,
sum(Independent_BD) as Independent_BD,
sum(RIA) as	RIA,
sum(Insurance_CPAs_BankTrust) as Insurance_CPAs_BankTrust,
sum(Investment_Consultant) as Investment_Consultant,
sum(Endowment_Foundation) as Endowment_Foundation,
sum(Plan_Sponsor) as Plan_Sponsor,
sum(Asset_Manager) as Asset_Manager,
sum(PrivateBank_WM) as PrivateBank_WM,
sum(IFA) as IFA,
Sum(Other) as Other
from VideoStats vs , TagList tl, Tag t, Month_current mc, Video v, Month_report m, Month_report last_month
where vs.V_ID  = tl.TL_VID
and tl.TL_TID = t.T_ID
and t.T_Type = 'Companies'
and v.V_ID = vs.V_ID
and m.month_id - 1 = last_month.month_id
and m.month_year = mc.month_year
and m.month_number = mc.month_number
and vs.SYear = last_month.month_year
and vs.SPeriod = last_month.month_name 
group by  last_month.month_id,t.T_ID, t.T_TAG

GO
/****** Object:  View [dbo].[VW_CHANNEL_REPORTS_LAST_MONTH_DETAIL]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CHANNEL_REPORTS_LAST_MONTH_DETAIL] as
select last_month.month_id, t.T_ID,
t.T_TAG,
v.V_Title,
v.V_DatePublished,
v.V_Duration,
vs.total_views as Total_Views,
vs.Total_Hours Total_Hours,
Wirehouse_Advisors as Wirehouse_Advisors,
Independent_BD as Independent_BD,
RIA as	RIA,
Insurance_CPAs_BankTrust as Insurance_CPAs_BankTrust,
Investment_Consultant as Investment_Consultant,
Endowment_Foundation as Endowment_Foundation,
Plan_Sponsor as Plan_Sponsor,
Asset_Manager as Asset_Manager,
PrivateBank_WM as PrivateBank_WM,
IFA as IFA,
Other as Other
from VideoStats vs , TagList tl, Tag t, Month_current mc, Video v, Month_report m, Month_report last_month
where vs.V_ID  = tl.TL_VID
and tl.TL_TID = t.T_ID
and t.T_Type = 'Companies'
and v.V_ID = vs.V_ID
and m.month_id - 1 = last_month.month_id
and m.month_year = mc.month_year
and m.month_number = mc.month_number
and vs.SYear = last_month.month_year
and vs.SPeriod = last_month.month_name 
GO
/****** Object:  View [dbo].[VW_CL_Video_Stats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_CL_Video_Stats] as
SELECT Video.V_Type, Video.V_VideoLink, 
       Video.V_DatePublished, Company.CName, 
	   Video.V_Title, Video.V_DateFilmed, Video.V_Duration, 
	   Stats.SPeriod, Stats.SYear, Stats.SArea, 
	   Stats.STotalViews, Stats.SAvgMin, Stats.STotalHr,
	   Stats.SCmplViews, Stats.STerminalViews, 
	   Stats.SWirehouseAdvisors, Stats.[SIndependentB/D], 
	   Stats.SRIA, Stats.[SInsurance/CPAs/BankTrust], 
	   Stats.SInvestmentConsultant, Stats.[SEndowment/Foundation], 
	   Stats.SPlanSponsor, Stats.SAssetManager, Stats.[SPrivateBank/WM], 
	   Stats.SIFA, Stats.SOther
FROM (Company INNER JOIN 
     (Video INNER JOIN ParticipantsList ON Video.V_ID = ParticipantsList.PLVID) 
	 ON Company.CID = ParticipantsList.PLCID) INNER JOIN Stats ON Video.V_ID = Stats.SVID
WHERE (((Stats.SYear) Is Not Null) AND ((Company.CType) Like 'CHANNEL'));
GO
/****** Object:  View [dbo].[VW_COMPANY_LIST]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_COMPANY_LIST] AS
select c.CID,c.CName, m.month_name,
c.CReportSinceYear,
ct.company_type
from Company c, Company_Type ct, Month m
where c.CType = ct.company_type_id and m.month = c.[CReportSinceMonth]
GO
/****** Object:  View [dbo].[VW_Company_Tag]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View [dbo].[VW_Company_Tag] as
SELECT CID Company_ID
      ,[CName] Company_Name
      ,[CReportSinceMonth]
      ,[CReportSinceYear]
      ,ct.company_type Company_Type
	  ,t.T_ID Tag_ID
	  ,T_TAG Tag_Company_Name
	  ,T_Type Tag_Type
  FROM [reportsdb].[dbo].[Company] c,
  [reportsdb].[dbo].[Company_Type] ct,
  [reportsdb].[dbo].[Tag] t
  where c.CType = ct.company_type_id 
  and lower(t.T_TAG) = lower(c.CName)
  and t.T_Type = 'Companies'
GO
/****** Object:  View [dbo].[VW_Current_Month]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Current_Month] as
SELECT  Month_current.month_number
      , Month_current.month_year,Month_report.month_id,
	  Month_report.month_name,month_short_name
  FROM Month_current ,Month_report
  where  Month_current.month_number = Month_report.month_number and  
   Month_current.month_year = Month_report.month_year


GO
/****** Object:  View [dbo].[VW_LAST_REPORT_MONTH]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_LAST_REPORT_MONTH] as
select Month_report.*
from Month_report
where month_id in (select month_id -1
from Month_report, Month_current
where Month_report.month_number = Month_current.month_number
and Month_report.month_year = Month_current.month_year)

GO
/****** Object:  View [dbo].[VW_MASTERCLASS_BAR_CHART]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_MASTERCLASS_BAR_CHART] AS
select m.month_id,vs.V_ID,vs.SPeriod,vs.SYear,m.month_short_name,vs.Total_Views
,sum(vs.Total_Views) OVER (PARTITION BY vs.V_ID ORDER BY vs.V_ID,month_id ) SUM_TOTAL_VIEWS
 from VideoStats vs,
(select r.month_id,r.month_number , r.month_name, r.month_short_name,r.month_year
from Month_report r
where r.month_year =2016
and month_name in  (select r.month_name 
from Month_report r, Month_current c
where r.month_year = c.month_year and r.month_number <= c.month_number
) )m   

where m.month_name = vs.SPeriod and m.month_year = vs.SYear
 and  vs.V_ID = 100233
GO
/****** Object:  View [dbo].[VW_SINGLE_REPORT]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_SINGLE_REPORT] as
select  m.month_id,vs.V_ID,vs.SPeriod,vs.SYear,m.month_short_name,v.V_Title,v.V_ImageURL,v.V_VideoLink,v.V_DatePublished,vs.VType ,vs.total_views,
vs.Completed_Views,vs.Avgerage_Minutes,vs.Total_Hours,v.V_Duration,
vs.Wirehouse_Advisors,
vs.Independent_BD,  vs.Insurance_CPAs_BankTrust,
vs.RIA,vs.Investment_Consultant, vs.Plan_Sponsor , vs.Endowment_Foundation , 
vs.Asset_Manager, vs.Other,vs.VS_ID
 from VideoStats vs join
 Video v on vs.V_ID = v.V_ID
 join Month_report m on m.month_name = vs.SPeriod and  m.month_year = vs.SYear
 union
select  0,vs.V_ID,vs.SPeriod,vs.SYear,'1W',v.V_Title,v.V_ImageURL,v.V_VideoLink,v.V_DatePublished,vs.VType ,vs.total_views,
vs.Completed_Views,vs.Avgerage_Minutes,vs.Total_Hours,v.V_Duration,
vs.Wirehouse_Advisors,
vs.Independent_BD , vs.Insurance_CPAs_BankTrust ,
vs.RIA,vs.Investment_Consultant, vs.Plan_Sponsor, vs.Endowment_Foundation, 
vs.Asset_Manager, vs.Other,vs.VS_ID
 from VideoStats vs join
 Video v on vs.V_ID = v.V_ID
 where  vs.SPeriod = '1W'


GO
/****** Object:  View [dbo].[VW_THIS_REPORT_MONTH]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_THIS_REPORT_MONTH] as
select report_month.*
from report_month, current_month
where report_month.month_number = current_month.month_number
and report_month.month_year = current_month.month_year

GO
/****** Object:  View [dbo].[VW_TOP_COMPANIES]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_TOP_COMPANIES] as
select distinct VTC.VTCID,VTC.VTCVID,VTC.VTCCompany,VTC.VTCViews
from [dbo].[VideoTopCompany] VTC,
Month_report,Month_current
where VTC.VTCPeriod = Month_report.month_name and
VTC.VTCYear = Month_report.month_year
and Month_report.month_number = Month_current.month_number
and Month_report.month_year = Month_current.month_year

GO
/****** Object:  View [dbo].[VW_TOP_COMPANIES_MASTERCLASS]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[VW_TOP_COMPANIES_MASTERCLASS] as (
 select VTCVID,SUM(VTCViews) SUM_VIEWS, VTCCompany 
 from VideoTopCompany 
where  VTCMonth in (select r.month_id 
from Month_report r, Month_current c
where r.month_year = c.month_year and r.month_number <= c.month_number
)
group by VTCVID,VTCCompany

 )
GO
/****** Object:  View [dbo].[VW_Video_Company_Tag_Stats]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Video_Company_Tag_Stats] as
select tl.TL_TID,v.V_Title,v.V_DatePublished,v.V_Duration,v.V_VideoLink,v.V_ImageURL,vs.*
from [dbo].[TagList] tl,[dbo].[Video] v, [dbo].[VideoStats] vs
where  tl.TL_VID = v.V_ID
--and tl.TL_TID = 1368 
and vs.V_ID = v.V_ID
GO
/****** Object:  View [dbo].[VW_VIDEO_TAG_COMPANIES]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_VIDEO_TAG_COMPANIES] AS
select Taglist.TL_ID,Taglist.TL_VID as video_id,Tag.T_TAG as tag_name, Tag.T_TYPE as tag_type
 from Tag , Taglist
 where Tag.T_ID = Taglist.TL_TID
GO
/****** Object:  View [dbo].[VW_YTD_CHANNEL_REPORTS]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_YTD_CHANNEL_REPORTS] as
select 
t.T_ID, t.T_TAG,v.V_ID,v.V_DatePublished,v.V_Title,v.V_Duration, 
sum(vs.total_views) as YTD_Views,
sum(vs.Avgerage_Minutes) YTD_Avg_Min,
sum(vs.Total_Hours) YTD_Total_Hours,
sum(vs.Completed_Views) YTD_Completed_Views,
sum(vs.Wirehouse_Advisors) YTD_Wirehouse_Advisors,
sum(vs.Independent_BD) YTD_Independent_BD ,
sum(vs.Insurance_CPAs_BankTrust) YTD_Insurance_CPAs_BankTrust ,
sum(vs.RIA) YTD_RIA,
sum(vs.Investment_Consultant) YTD_Investment_Consultant, 
sum(vs.Plan_Sponsor) YTD_Plan_Sponsor,
sum(vs.Endowment_Foundation) YTD_Endowment_Foundation, 
sum(vs.Asset_Manager) YTD_Asset_Manager,
sum(vs.Other) YTD_Other,
sum(PrivateBank_WM) YTD_PrivateBank_WM,
sum(IFA) YTD_IFA
from VideoStats vs , TagList tl, Tag t, Video v, Month_current mc
where vs.V_ID  = tl.TL_VID
and tl.TL_TID = t.T_ID
and t.T_Type = 'Companies'
and v.V_ID = vs.V_ID
and vs.SYear = mc.month_year
and vs.SPeriod in ( 
select month_name from 
Month, Month_current
where Month.month <= Month_current.month_number
and month_name != 'All')
group by t.T_ID, t.T_TAG,v.V_ID,v.V_DatePublished,v.V_Title,v.V_Duration 

GO
/****** Object:  View [dbo].[VW_YTD_REPORT_MONTH]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_YTD_REPORT_MONTH] as
select report_month.*
from report_month
where month_id in
(
select month_id
from report_month, current_month
where report_month.month_number <= current_month.month_number
and report_month.month_year  = current_month.month_year)
GO
/****** Object:  View [dbo].[VW_YTD_Results]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VW_YTD_Results](
C_ID,
V_ID,
V_Title,
V_DatePublished,
V_Duration,
View_Starts,
View_Completes,
Average_Completion_Rate,
Average_Time,
Total_Time,
Bloomberg_Terminal_Views) as
select 10021,456,'The importance of saving for retirement','2016-01-05',2.2,2927,2199,0.75,1.5,73.1,147
union
select 10021,457,'Helping millennials with innovative DC plan design','2016-01-05',2.2,2927,2133,0.95,1.5,73.1,147

GO
/****** Object:  View [dbo].[VW_YTD_Results_Detailed]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VW_YTD_Results_Detailed](
C_ID,
V_ID,
V_Title,
V_DatePublished,
V_Duration,
View_Starts,
View_Completes,
Average_Completion_Rate,
Average_Time,
Total_Time,
Bloomberg_Terminal_Views,
View_Month,
View_Year) as
select 10021,100132,'The importance of saving for retirement','2016-01-05',2.2,2927,2199,0.75,1.5,73.1,147,03,2016
union
select 10021,100159,'Helping millennials with innovative DC plan design','2016-01-05',2.2,2927,2133,0.95,1.5,73.1,147,3,2016
union
select 10021,457,'Nobody looks at me','2016-01-05',2.2,2927,8,0.95,1.5,73.1,147,3,2016


GO
/****** Object:  Index [index_url_search]    Script Date: 7/29/2016 4:50:17 PM ******/
CREATE NONCLUSTERED INDEX [index_url_search] ON [dbo].[SCRAPED_VIDEO_DATA]
(
	[og_url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_video_name]    Script Date: 7/29/2016 4:50:17 PM ******/
CREATE NONCLUSTERED INDEX [index_video_name] ON [dbo].[Video]
(
	[V_Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AudienceProfile]  WITH CHECK ADD  CONSTRAINT [fk_audienceprofile_company] FOREIGN KEY([APCID])
REFERENCES [dbo].[Company] ([CID])
GO
ALTER TABLE [dbo].[AudienceProfile] CHECK CONSTRAINT [fk_audienceprofile_company]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([BCID])
REFERENCES [dbo].[Company] ([CID])
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [fk_email_company] FOREIGN KEY([ECID])
REFERENCES [dbo].[Company] ([CID])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [fk_email_company]
GO
ALTER TABLE [dbo].[EmailStats]  WITH CHECK ADD  CONSTRAINT [fk_email_stats] FOREIGN KEY([EEID])
REFERENCES [dbo].[Email] ([EID])
GO
ALTER TABLE [dbo].[EmailStats] CHECK CONSTRAINT [fk_email_stats]
GO
ALTER TABLE [dbo].[ParticipantsList_dontneed]  WITH CHECK ADD  CONSTRAINT [fk_participant_company] FOREIGN KEY([PLCID])
REFERENCES [dbo].[Company] ([CID])
GO
ALTER TABLE [dbo].[ParticipantsList_dontneed] CHECK CONSTRAINT [fk_participant_company]
GO
ALTER TABLE [dbo].[ParticipantsList_dontneed]  WITH CHECK ADD  CONSTRAINT [fk_video_participantsList] FOREIGN KEY([PLVID])
REFERENCES [dbo].[Video_OLD] ([VID])
GO
ALTER TABLE [dbo].[ParticipantsList_dontneed] CHECK CONSTRAINT [fk_video_participantsList]
GO
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA_TAGS]  WITH CHECK ADD  CONSTRAINT [fk_scraped_video_data] FOREIGN KEY([scrape_id])
REFERENCES [dbo].[SCRAPED_VIDEO_DATA] ([scrape_id])
GO
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA_TAGS] CHECK CONSTRAINT [fk_scraped_video_data]
GO
ALTER TABLE [dbo].[TagList]  WITH CHECK ADD  CONSTRAINT [fk_taglist_tag] FOREIGN KEY([TL_TID])
REFERENCES [dbo].[Tag] ([T_ID])
GO
ALTER TABLE [dbo].[TagList] CHECK CONSTRAINT [fk_taglist_tag]
GO
ALTER TABLE [dbo].[TagList]  WITH CHECK ADD  CONSTRAINT [fk_taglist_video] FOREIGN KEY([TL_VID])
REFERENCES [dbo].[Video] ([V_ID])
GO
ALTER TABLE [dbo].[TagList] CHECK CONSTRAINT [fk_taglist_video]
GO
ALTER TABLE [dbo].[Whitepaper]  WITH CHECK ADD  CONSTRAINT [FK__Whitepaper__WCID] FOREIGN KEY([WCID])
REFERENCES [dbo].[Company] ([CID])
GO
ALTER TABLE [dbo].[Whitepaper] CHECK CONSTRAINT [FK__Whitepaper__WCID]
GO
ALTER TABLE [dbo].[WhitepaperStats]  WITH CHECK ADD  CONSTRAINT [FK__Whitepaper__WWID] FOREIGN KEY([WWID])
REFERENCES [dbo].[Whitepaper] ([WID])
GO
ALTER TABLE [dbo].[WhitepaperStats] CHECK CONSTRAINT [FK__Whitepaper__WWID]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CHECK_COMPANY_MONTH] CHECK  (([CReportSinceMonth]>=(0) AND [CReportSinceMonth]<=(12)))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CHECK_COMPANY_MONTH]
GO
/****** Object:  StoredProcedure [dbo].[LOAD_SCRAPED]    Script Date: 7/29/2016 4:50:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAD_SCRAPED]  AS

       ---------------------------------------------------------------------
	  -- new videos that contain TAGS that we do NOT have in the Tag Table
	  --   update TAG Table
	  ---------------------------------------------------------------------
	  DECLARE @tag_name varchar(200), @tag_type varchar(200)
	  DECLARE tag_cursor CURSOR FOR 
	  	   select distinct  tag_name, tag_type
            from SCRAPED_VIDEO_DATA_TAGS tags join SCRAPED_VIDEO_DATA svd on svd.scrape_id = tags.scrape_id
			 left join  Video v on cast(svd.video_core_id as int) = v.V_ID
             where v.V_ID is null
			 EXCEPT
			 select distinct  T_TAG, T_Type
			 from Tag
      OPEN tag_cursor;
	  FETCH NEXT FROM tag_cursor INTO @tag_name, @tag_type;
	  WHILE @@FETCH_STATUS = 0  
           BEGIN TRY  
		   	 INSERT INTO Tag (T_TAG, T_Type)
			   values (@tag_name, @tag_type);
             FETCH NEXT FROM tag_cursor INTO @tag_name, @tag_type;
           END TRY        
		   BEGIN CATCH
		     SELECT  ERROR_NUMBER() AS ErrorNumber  ,ERROR_MESSAGE() AS ErrorMessage;  
		     PRINT  CAST(ERROR_NUMBER() as VARCHAR) + ' / ' + CAST(ERROR_MESSAGE() as VARCHAR)  + ' Tag on( ' +
			   @tag_name +',' + @tag_type  + ') ';
		   END CATCH;
      CLOSE tag_cursor;  
      DEALLOCATE tag_cursor;  
      ---------------------------------------------------------------------
	  -- new videos that we do NOT have in the Video Table
	  ---------------------------------------------------------------------
	  DECLARE @og_image varchar(500), @og_title varchar(200), @og_url varchar(500), @pk int,
			        @video_duration float,  @published_time datetime
						  
	  DECLARE  video_cursor CURSOR FOR
	     select og_image,og_title,og_url,cast(video_core_id as int) pk,video_duration,published_time
            from SCRAPED_VIDEO_DATA  svd left join  Video v 
		    on cast(svd.video_core_id as int) = v.V_ID
             where v.V_ID is null;

	  OPEN video_cursor;  
      FETCH NEXT FROM video_cursor INTO @og_image, @og_title, @og_url, @pk,
			        @video_duration,  @published_time ;  
      WHILE @@FETCH_STATUS = 0  
          BEGIN TRY  
		   	 INSERT INTO Video (V_ImageURL, V_Title, V_VideoLink,V_ID,V_Duration,V_DatePublished)
			   values (@og_image, @og_title,@og_url, Cast(@pk as int),@video_duration,  @published_time);
             FETCH NEXT FROM video_cursor INTO @og_image, @og_title, @og_url, @pk,
			        @video_duration,  @published_time;  

           END TRY  
		   BEGIN CATCH
		     SELECT  ERROR_NUMBER() AS ErrorNumber  ,ERROR_MESSAGE() AS ErrorMessage;  
		     PRINT  CAST(ERROR_NUMBER() as VARCHAR) + ' / ' + CAST(ERROR_MESSAGE() as VARCHAR)  + ' Video on( ' +
			   CAST(@pk as VARCHAR)  + ') / ' +  @og_title;
		   END CATCH;
      CLOSE video_cursor;  
      DEALLOCATE video_cursor;  

     
     --
     -- Load The TagList
     --
	 DECLARE @t_id int;
	 DECLARE tag_list_cursor CURSOR FOR 
	  	   select cast(video_core_id as int) pk, T_ID
            from SCRAPED_VIDEO_DATA_TAGS tags join SCRAPED_VIDEO_DATA svd on svd.scrape_id = tags.scrape_id
			 join Tag t on (t.T_TAG = tags.tag_name  and t.T_Type = tags.tag_type) 
			 left join  TagList tl  on t.T_ID = tl.TL_TID and   cast(svd.video_core_id as int) = tl.TL_VID
             where tl.TL_VID is null and tl.TL_TID is null;

	  OPEN tag_list_cursor;  
      FETCH NEXT FROM tag_list_cursor INTO @pk, @t_id; 
      WHILE @@FETCH_STATUS = 0  
          BEGIN TRY  
		   	 INSERT INTO TagList(TL_TID,TL_VID) 
               VALUES(@t_id,@pk)
             FETCH NEXT FROM tag_list_cursor INTO @pk, @t_id;		        

          END TRY  
		  BEGIN CATCH
		     SELECT  ERROR_NUMBER() AS ErrorNumber  ,ERROR_MESSAGE() AS ErrorMessage;  
		     PRINT  CAST(ERROR_NUMBER() as VARCHAR) + ' / ' + CAST(ERROR_MESSAGE() as VARCHAR)  + ' TagList on( ' +
			   CAST(@pk as VARCHAR)  + ') / ' +  @t_id;
		   END CATCH;
      CLOSE tag_list_cursor;  
      DEALLOCATE tag_list_cursor;  


     

GO
USE [master]
GO
ALTER DATABASE [reportsdb] SET  READ_WRITE 
GO
