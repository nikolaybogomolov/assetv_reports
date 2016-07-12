USE [master]
GO
/****** Object:  Database [reportsdb]    Script Date: 7/12/2016 5:55:16 PM ******/
CREATE DATABASE [reportsdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reportsdb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\reportsdb.mdf' , SIZE = 15360KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  User [jxthomas]    Script Date: 7/12/2016 5:55:16 PM ******/
CREATE USER [jxthomas] FOR LOGIN [jxthomas] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[All_Top_Company]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[All_Top_Company](
	[CName] [varchar](50) NULL,
	[VTCPeriod] [varchar](50) NULL,
	[VTCYear] [varchar](50) NULL,
	[VTCArea] [varchar](50) NULL,
	[VTCCompany] [varchar](50) NULL,
	[VTCViews] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AudienceProfile]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AudienceProfile](
	[APID] [int] IDENTITY(1,1) NOT NULL,
	[APCID] [int] NULL,
	[APPeriod] [nvarchar](255) NULL,
	[APYear] [int] NULL,
	[APArea] [nvarchar](255) NULL,
	[APWirehouseAdvisors] [decimal](18, 5) NULL,
	[APindependentB\D] [decimal](18, 5) NULL,
	[APRIA] [decimal](18, 5) NULL,
	[APInsurance/CPAs/BankTrust] [decimal](18, 5) NULL,
	[APInvestmentConsultant] [decimal](18, 5) NULL,
	[APEndowment/Foundation] [decimal](18, 5) NULL,
	[APPlanSponsor] [decimal](18, 5) NULL,
	[APAssetManager] [decimal](18, 5) NULL,
	[APPrivateBank/WM] [decimal](18, 5) NULL,
	[APIFA] [decimal](18, 5) NULL,
	[APOther] [decimal](18, 5) NULL,
 CONSTRAINT [pk_audienceprofile] PRIMARY KEY CLUSTERED 
(
	[APID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[Company_OLD]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_OLD](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[CName] [nvarchar](255) NULL,
	[CReportSinceMonth] [nvarchar](255) NULL,
	[CReportSinceYear] [smallint] NULL,
	[CDateFilmed] [bit] NULL,
	[CType] [nvarchar](255) NULL,
 CONSTRAINT [pk_company] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Type]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[current_month]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[current_month](
	[month_number] [int] NULL,
	[month_year] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Email]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[ECID] [int] NULL,
	[EPeriod] [nvarchar](255) NULL,
	[EYear] [smallint] NULL,
	[EArea] [nvarchar](255) NULL,
	[ETitle] [ntext] NULL,
	[ESends] [int] NULL,
	[EOpens] [int] NULL,
	[ECTR] [int] NULL,
	[EDate] [datetime2](7) NULL,
	[EAPWirehouseAdvisors] [decimal](18, 5) NULL,
	[EAPindependentB\D] [decimal](18, 5) NULL,
	[EAPRIA] [decimal](18, 5) NULL,
	[EAPInsurance/CPAs/BankTrust] [decimal](18, 5) NULL,
	[EAPInvestmentConsultant] [decimal](18, 5) NULL,
	[EAPEndowment/Foundation] [decimal](18, 5) NULL,
	[EAPPlanSponsor] [decimal](18, 5) NULL,
	[EAPAssetManager] [decimal](18, 5) NULL,
	[EAPOther] [decimal](18, 5) NULL,
 CONSTRAINT [pk_email] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Month]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[moo]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[moo](
	[CName] [varchar](50) NULL,
	[VID] [varchar](50) NULL,
	[VTitle] [varchar](50) NULL,
	[VType] [varchar](50) NULL,
	[Old] [varchar](50) NULL,
	[VDateFilmed] [varchar](50) NULL,
	[VDatePublished] [varchar](50) NULL,
	[VParticipant] [varchar](50) NULL,
	[VDuration] [varchar](50) NULL,
	[VVideoLink] [varchar](50) NULL,
	[VPlayerLink] [varchar](50) NULL,
	[SPeriod] [varchar](50) NULL,
	[SYear] [varchar](50) NULL,
	[SArea] [varchar](50) NULL,
	[STotalViews] [varchar](50) NULL,
	[SAvgMin] [varchar](50) NULL,
	[STotalHr] [varchar](50) NULL,
	[SCmplViews] [varchar](50) NULL,
	[STerminalViews] [varchar](50) NULL,
	[SWirehouseAdvisors] [varchar](50) NULL,
	[SIndependentB D] [varchar](50) NULL,
	[SRIA] [varchar](50) NULL,
	[SInsurance CPAs BankTrust] [varchar](50) NULL,
	[SInvestmentConsultant] [varchar](50) NULL,
	[SEndowment Foundation] [varchar](50) NULL,
	[SPlanSponsor] [varchar](50) NULL,
	[SAssetManager] [varchar](50) NULL,
	[SPrivateBank WM] [varchar](50) NULL,
	[SIFA] [varchar](50) NULL,
	[SOther] [varchar](50) NULL,
	[Finished] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[my_video_stats]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[Non_Channel_Stats_index]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Non_Channel_Stats_index](
	[NCS_Index_ID] [int] IDENTITY(1,1) NOT NULL,
	[CName] [nvarchar](255) NULL,
	[VID] [float] NULL,
	[VTitle] [nvarchar](255) NULL,
	[VType] [nvarchar](255) NULL,
	[Old] [bit] NOT NULL,
	[VDateFilmed] [datetime] NULL,
	[VDatePublished] [datetime] NULL,
	[VParticipant] [nvarchar](255) NULL,
	[VDuration] [float] NULL,
	[VVideoLink] [nvarchar](255) NULL,
	[VPlayerLink] [nvarchar](255) NULL,
	[SPeriod] [nvarchar](255) NULL,
	[SYear] [float] NULL,
	[SArea] [nvarchar](255) NULL,
	[STotalViews] [float] NULL,
	[SAvgMin] [float] NULL,
	[STotalHr] [float] NULL,
	[SCmplViews] [float] NULL,
	[STerminalViews] [float] NULL,
	[SWirehouseAdvisors] [float] NULL,
	[SIndependentB/D] [float] NULL,
	[SRIA] [float] NULL,
	[SInsurance/CPAs/BankTrust] [float] NULL,
	[SInvestmentConsultant] [float] NULL,
	[SEndowment/Foundation] [float] NULL,
	[SPlanSponsor] [float] NULL,
	[SAssetManager] [float] NULL,
	[SPrivateBank/WM] [float] NULL,
	[SIFA] [float] NULL,
	[SOther] [float] NULL,
	[Finished] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Non_Channel_Stats_index_temp]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Non_Channel_Stats_index_temp](
	[CName] [varchar](150) NULL,
	[VID] [varchar](50) NULL,
	[VTitle] [varchar](150) NULL,
	[VType] [varchar](50) NULL,
	[Old] [varchar](50) NULL,
	[VDateFilmed] [varchar](50) NULL,
	[VDatePublished] [varchar](50) NULL,
	[VParticipant] [varchar](50) NULL,
	[VDuration] [varchar](50) NULL,
	[VVideoLink] [varchar](500) NULL,
	[VPlayerLink] [varchar](500) NULL,
	[SPeriod] [varchar](50) NULL,
	[SYear] [varchar](50) NULL,
	[SArea] [varchar](50) NULL,
	[STotalViews] [varchar](50) NULL,
	[SAvgMin] [varchar](50) NULL,
	[STotalHr] [varchar](50) NULL,
	[SCmplViews] [varchar](50) NULL,
	[STerminalViews] [varchar](50) NULL,
	[SWirehouseAdvisors] [varchar](50) NULL,
	[SIndependentB D] [varchar](50) NULL,
	[SRIA] [varchar](50) NULL,
	[SInsurance CPAs BankTrust] [varchar](50) NULL,
	[SInvestmentConsultant] [varchar](50) NULL,
	[SEndowment Foundation] [varchar](50) NULL,
	[SPlanSponsor] [varchar](50) NULL,
	[SAssetManager] [varchar](50) NULL,
	[SPrivateBank WM] [varchar](50) NULL,
	[SIFA] [varchar](50) NULL,
	[SOther] [varchar](50) NULL,
	[Finished] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Non_Channel_TopCompany_index]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Non_Channel_TopCompany_index](
	[NCTCI_ID] [int] IDENTITY(1,1) NOT NULL,
	[CName] [varchar](150) NULL,
	[VTitle] [varchar](1550) NULL,
	[VType] [varchar](50) NULL,
	[VTCPeriod] [varchar](50) NULL,
	[VTCYear] [varchar](50) NULL,
	[VTCArea] [varchar](50) NULL,
	[VTCCompany] [varchar](250) NULL,
	[VTCViews] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ParticipantsList]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParticipantsList](
	[PLID] [int] IDENTITY(1,1) NOT NULL,
	[PLVID] [int] NULL,
	[PLCID] [int] NULL,
 CONSTRAINT [pk_participantsList] PRIMARY KEY CLUSTERED 
(
	[PLID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[report_month]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report_month](
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
/****** Object:  Table [dbo].[SCRAPED_VIDEO_DATA]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[SCRAPED_VIDEO_DATA_TAGS]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[Stats]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[SVID] [int] NULL,
	[Old] [bit] NULL,
	[SPeriod] [nvarchar](255) NULL,
	[SYear] [smallint] NULL,
	[SArea] [nvarchar](255) NULL,
	[STotalViews] [smallint] NULL,
	[SAvgMin] [decimal](18, 5) NULL,
	[STotalHr] [decimal](18, 5) NULL,
	[SCmplViews] [smallint] NULL,
	[STerminalViews] [int] NULL,
	[SWirehouseAdvisors] [decimal](18, 5) NULL,
	[SIndependentB/D] [decimal](18, 5) NULL,
	[SRIA] [decimal](18, 5) NULL,
	[SInsurance/CPAs/BankTrust] [decimal](18, 5) NULL,
	[SInvestmentConsultant] [decimal](18, 5) NULL,
	[SEndowment/Foundation] [decimal](18, 5) NULL,
	[SPlanSponsor] [decimal](18, 5) NULL,
	[SAssetManager] [decimal](18, 5) NULL,
	[SPrivateBank/WM] [decimal](18, 5) NULL,
	[SIFA] [decimal](18, 5) NULL,
	[SOther] [decimal](18, 5) NULL,
 CONSTRAINT [pk_stats] PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 7/12/2016 5:55:17 PM ******/
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
 CONSTRAINT [pk_tag] PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TagList]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[tags]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Table [dbo].[TopCompany]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TopCompany](
	[TCID] [int] IDENTITY(1,1) NOT NULL,
	[TCCID] [int] NULL,
	[TCPeriod] [nvarchar](255) NULL,
	[TCYear] [int] NULL,
	[TCArea] [nvarchar](255) NULL,
	[TCCompany] [nvarchar](255) NULL,
	[TCViews] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TXT_CL_Video_Stats]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TXT_CL_Video_Stats](
	[CName] [varchar](50) NULL,
	[VTitle] [varchar](1000) NULL,
	[VDateFilmed] [varchar](50) NULL,
	[VDatePublished] [varchar](50) NULL,
	[SPeriod] [varchar](50) NULL,
	[SYear] [varchar](50) NULL,
	[SArea] [varchar](50) NULL,
	[STotalViews] [varchar](50) NULL,
	[STotalHr] [varchar](50) NULL,
	[VDuration] [varchar](50) NULL,
	[SAvgMin] [varchar](50) NULL,
	[VType] [varchar](50) NULL,
	[VVideoLink] [varchar](50) NULL,
	[VImage] [varchar](50) NULL,
	[SCmplViews] [varchar](50) NULL,
	[STerminalViews] [varchar](50) NULL,
	[SWirehouseAdvisors] [varchar](50) NULL,
	[SIndependentB D] [varchar](50) NULL,
	[SRIA] [varchar](50) NULL,
	[SInsurance CPAs BankTrust] [varchar](50) NULL,
	[SInvestmentConsultant] [varchar](50) NULL,
	[SEndowment Foundation] [varchar](50) NULL,
	[SPlanSponsor] [varchar](50) NULL,
	[SAssetManager] [varchar](50) NULL,
	[SPrivateBank WM] [varchar](50) NULL,
	[SIFA] [varchar](50) NULL,
	[SOther] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video]    Script Date: 7/12/2016 5:55:17 PM ******/
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
 CONSTRAINT [pk_video1] PRIMARY KEY CLUSTERED 
(
	[V_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Video_access]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video_access](
	[VID] [float] NULL,
	[VTitle] [nvarchar](max) NULL,
	[VDateFilmed] [datetime] NULL,
	[VDatePublished] [datetime] NULL,
	[VDuration] [float] NULL,
	[VVideoLink] [nvarchar](max) NULL,
	[VPlayerLink] [nvarchar](max) NULL,
	[VType] [nvarchar](255) NULL,
	[VParticipant] [nvarchar](255) NULL,
	[VSubComp] [nvarchar](255) NULL,
	[Finished] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Bookmarked] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Video_OLD]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video_OLD](
	[VID] [int] IDENTITY(1,1) NOT NULL,
	[VTitle] [ntext] NULL,
	[VDateFilmed] [datetime2](7) NULL,
	[VDatePublished] [datetime2](7) NULL,
	[VDuration] [decimal](18, 5) NULL,
	[VVideoLink] [ntext] NULL,
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
/****** Object:  Table [dbo].[VideoStats]    Script Date: 7/12/2016 5:55:17 PM ******/
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
	[Area] [varchar](10) NULL,
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
 CONSTRAINT [pk_video_stats] PRIMARY KEY CLUSTERED 
(
	[VS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VideoTopCompany]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoTopCompany](
	[VTCID] [int] IDENTITY(1,1) NOT NULL,
	[VTCVID] [int] NULL,
	[VTCPeriod] [nvarchar](255) NULL,
	[VTCYear] [smallint] NULL,
	[VTCArea] [nvarchar](255) NULL,
	[VTCCompany] [nvarchar](255) NULL,
	[VTCViews] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VW_VIDEO_TRANSLATION]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_VIDEO_PARTICIPANTS]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[CL_Company_index]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Company_index] as
SELECT Company.CName, Company.CReportSinceMonth, Company.CReportSinceYear, Company.CDateFilmed, Company.CType
FROM dbo.Company
WHERE (((Company.CType)='CHANNEL'));
--ORDER BY Company.CName;
GO
/****** Object:  View [dbo].[CL_Email_Stats]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CL_Email_Stats] as
SELECT Company.CName, Email.ETitle, Email.EPeriod, Email.EYear, Email.EArea,
 Email.EDate, Email.ESends, Email.EOpens, Email.ECTR, Email.EAPWirehouseAdvisors, 
 Email.[EAPindependentB\D], Email.EAPRIA, Email.[EAPInsurance/CPAs/BankTrust],
 Email.EAPInvestmentConsultant, Email.[EAPEndowment/Foundation], 
 Email.EAPPlanSponsor, Email.EAPAssetManager, Email.EAPOther
FROM Company INNER JOIN Email ON Company.CID = Email.ECID;
GO
/****** Object:  View [dbo].[VW_All_Time_Results]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_Audience_Profile_Company]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_Audience_Profile_Video]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_CL_Video_Stats]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_COMPANY_LIST]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_Current_Month]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_Current_Month] as
SELECT current_month.month_number
      ,current_month.month_year,report_month.month_id,
	  report_month.month_name,month_short_name
  FROM current_month,report_month
  where current_month.month_number = report_month.month_number and  
  current_month.month_year = report_month.month_year

GO
/****** Object:  View [dbo].[VW_LAST_REPORT_MONTH]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_LAST_REPORT_MONTH] as
select report_month.*
from report_month
where month_id in (select month_id -1
from report_month, current_month
where report_month.month_number = current_month.month_number
and report_month.month_year = current_month.month_year)
GO
/****** Object:  View [dbo].[VW_SINGLE_REPORT]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_SINGLE_REPORT] as
select  m.month_id,vs.V_ID,vs.SPeriod,vs.SYear,v.V_Title,v.V_ImageURL,v.V_VideoLink,v.V_DatePublished,vs.VType ,vs.total_views,
vs.Wirehouse_Advisors,vs.Independent_BD + vs.Insurance_CPAs_BankTrust as Independent_BD,
vs.RIA,vs.Investment_Consultant, vs.Plan_Sponsor + vs.Endowment_Foundation as Plan_Sponsor, 
vs.Asset_Manager, vs.Other,vs.VS_ID
 from VideoStats vs join
 Video v on vs.V_ID = v.V_ID
 join  report_month m on m.month_name = vs.SPeriod and  m.month_year = vs.SYear
 union
select  0,vs.V_ID,vs.SPeriod,vs.SYear,v.V_Title,v.V_ImageURL,v.V_VideoLink,v.V_DatePublished,vs.VType ,vs.total_views,
vs.Wirehouse_Advisors,vs.Independent_BD + vs.Insurance_CPAs_BankTrust as Independent_BD,
vs.RIA,vs.Investment_Consultant, vs.Plan_Sponsor + vs.Endowment_Foundation as Plan_Sponsor, 
vs.Asset_Manager, vs.Other,vs.VS_ID
 from VideoStats vs join
 Video v on vs.V_ID = v.V_ID
 where  vs.SPeriod = '1W'
GO
/****** Object:  View [dbo].[VW_THIS_REPORT_MONTH]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_TOP_COMPANIES]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_TOP_COMPANIES] as
select distinct VTC.VTCID,VTC.VTCVID,VTC.VTCCompany,VTC.VTCViews
from [dbo].[VideoTopCompany] VTC,
report_month, current_month
where VTC.VTCPeriod = report_month.month_name and
VTC.VTCYear = report_month.month_year
and report_month.month_number = current_month.month_number
and report_month.month_year =  current_month.month_year
GO
/****** Object:  View [dbo].[VW_VIDEO_TAG_COMPANIES]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_VIDEO_TAG_COMPANIES] AS
select Taglist.TL_ID,Taglist.TL_VID as video_id,Tag.T_TAG as tag_name, Tag.T_TYPE as tag_type
 from Tag , Taglist
 where Tag.T_ID = Taglist.TL_TID
GO
/****** Object:  View [dbo].[VW_YTD_REPORT_MONTH]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_YTD_Results]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  View [dbo].[VW_YTD_Results_Detailed]    Script Date: 7/12/2016 5:55:17 PM ******/
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
/****** Object:  Index [index_url_search]    Script Date: 7/12/2016 5:55:17 PM ******/
CREATE NONCLUSTERED INDEX [index_url_search] ON [dbo].[SCRAPED_VIDEO_DATA]
(
	[og_url] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [index_video_name]    Script Date: 7/12/2016 5:55:17 PM ******/
CREATE NONCLUSTERED INDEX [index_video_name] ON [dbo].[Video]
(
	[V_Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AudienceProfile]  WITH CHECK ADD  CONSTRAINT [fk_company_audienceprofile] FOREIGN KEY([APCID])
REFERENCES [dbo].[Company_OLD] ([CID])
GO
ALTER TABLE [dbo].[AudienceProfile] CHECK CONSTRAINT [fk_company_audienceprofile]
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [fk_company_email] FOREIGN KEY([ECID])
REFERENCES [dbo].[Company_OLD] ([CID])
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [fk_company_email]
GO
ALTER TABLE [dbo].[ParticipantsList]  WITH CHECK ADD  CONSTRAINT [fk_company_participantsList] FOREIGN KEY([PLCID])
REFERENCES [dbo].[Company_OLD] ([CID])
GO
ALTER TABLE [dbo].[ParticipantsList] CHECK CONSTRAINT [fk_company_participantsList]
GO
ALTER TABLE [dbo].[ParticipantsList]  WITH CHECK ADD  CONSTRAINT [fk_video_participantsList] FOREIGN KEY([PLVID])
REFERENCES [dbo].[Video_OLD] ([VID])
GO
ALTER TABLE [dbo].[ParticipantsList] CHECK CONSTRAINT [fk_video_participantsList]
GO
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA_TAGS]  WITH CHECK ADD  CONSTRAINT [fk_scraped_video_data] FOREIGN KEY([scrape_id])
REFERENCES [dbo].[SCRAPED_VIDEO_DATA] ([scrape_id])
GO
ALTER TABLE [dbo].[SCRAPED_VIDEO_DATA_TAGS] CHECK CONSTRAINT [fk_scraped_video_data]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [fk_videostats] FOREIGN KEY([SVID])
REFERENCES [dbo].[Video_OLD] ([VID])
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [fk_videostats]
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
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [CHECK_COMPANY_MONTH] CHECK  (([CReportSinceMonth]>=(0) AND [CReportSinceMonth]<=(12)))
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [CHECK_COMPANY_MONTH]
GO
/****** Object:  StoredProcedure [dbo].[LOAD_SCRAPED]    Script Date: 7/12/2016 5:55:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LOAD_SCRAPED]  AS

    --
    -- Load The Videos
    --
    --INSERT INTO Video (V_ImageURL, V_Title, V_VideoLink,V_ID,V_Duration,V_DatePublished)
    --   select og_image,og_title,og_url,cast(video_core_id as int) pk,video_duration,published_time
    --   from SCRAPED_VIDEO_DATA;

	  DECLARE @og_image varchar(500), @og_title varchar(200), @og_url varchar(500), @pk int,
			        @video_duration float,  @published_time datetime

	  DECLARE  video_cursor CURSOR FOR
	     select og_image,og_title,og_url,cast(video_core_id as int) pk,video_duration,published_time
            from SCRAPED_VIDEO_DATA;

	  OPEN video_cursor;  
      FETCH NEXT FROM video_cursor;  
      WHILE @@FETCH_STATUS = 0  
          BEGIN TRY  
		   	 INSERT INTO Video (V_ImageURL, V_Title, V_VideoLink,V_ID,V_Duration,V_DatePublished)
			   values (@og_image, @og_title,@og_url, Cast(@pk as int),@video_duration,  @published_time);
             FETCH NEXT FROM video_cursor INTO @og_image, @og_title, @og_url, @pk,
			        @video_duration,  @published_time;  

           END TRY  
		   BEGIN CATCH
		     SELECT  ERROR_NUMBER() AS ErrorNumber  ,ERROR_MESSAGE() AS ErrorMessage;  
		     PRINT  CAST(ERROR_NUMBER() as VARCHAR) + ' / ' + CAST(ERROR_MESSAGE() as VARCHAR)  + ' on( ' +
			   CAST(@pk as VARCHAR)  + ') / ' +  @og_title;
		   END CATCH;
      CLOSE video_cursor;  
      DEALLOCATE video_cursor;  

     --
     -- Load The Tags
     --
     insert into Tag (T_TAG) select  distinct tag_name from SCRAPED_VIDEO_DATA_TAGS;

     --
     -- Load The TagList
     --
     INSERT INTO TagList(TL_TID,TL_VID) 
        select Tag.T_ID,cast(scraped_video.video_core_id as int)
           from Tag,[dbo].[SCRAPED_VIDEO_DATA_TAGS] video_tags,[dbo].[SCRAPED_VIDEO_DATA] scraped_video
           where video_tags.tag_name =  Tag.T_Tag
            and video_tags.scrape_id = scraped_video.scrape_id;

GO
USE [master]
GO
ALTER DATABASE [reportsdb] SET  READ_WRITE 
GO
