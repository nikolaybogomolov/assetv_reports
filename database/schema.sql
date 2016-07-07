USE [master]
GO

/****** Object:  Database [reportsdb]    Script Date: 7/7/2016 5:52:12 PM ******/
DROP DATABASE [reportsdb]
GO

/****** Object:  Database [reportsdb]    Script Date: 7/7/2016 5:52:12 PM ******/
CREATE DATABASE [reportsdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'reportsdb', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\reportsdb.mdf' , SIZE = 14336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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

ALTER DATABASE [reportsdb] SET  READ_WRITE 
GO

