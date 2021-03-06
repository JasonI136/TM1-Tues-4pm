USE [master]
GO
/****** Object:  Database [Electronic Health Care System]    Script Date: 5/05/2020 4:55:44 PM ******/
CREATE DATABASE [Electronic Health Care System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Electronic Health Care System', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Electronic Health Care System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Electronic Health Care System_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Electronic Health Care System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Electronic Health Care System] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Electronic Health Care System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Electronic Health Care System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Electronic Health Care System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Electronic Health Care System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Electronic Health Care System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Electronic Health Care System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Electronic Health Care System] SET  MULTI_USER 
GO
ALTER DATABASE [Electronic Health Care System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Electronic Health Care System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Electronic Health Care System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Electronic Health Care System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Electronic Health Care System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Electronic Health Care System] SET QUERY_STORE = OFF
GO
USE [Electronic Health Care System]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Electronic Health Care System]
GO
/****** Object:  Table [dbo].[Consultation]    Script Date: 5/05/2020 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsultationTime] [time](7) NULL,
	[ConsultationDate] [date] NULL,
	[PatientId] [bigint] NULL,
	[DoctorId] [bigint] NULL,
	[MedicalCentreId] [bigint] NULL,
 CONSTRAINT [PK_Consultation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 5/05/2020 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[Speciality] [nvarchar](50) NULL,
	[PersonId] [nchar](10) NULL,
	[MedicalCentreId] [bigint] NULL,
	[ConsultationId] [bigint] NULL,
	[PrescriptionId] [bigint] NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCentre]    Script Date: 5/05/2020 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCentre](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[StreetNo] [nvarchar](50) NULL,
	[Suburb] [nvarchar](50) NULL,
	[Postcode] [int] NULL,
	[State] [nvarchar](50) NULL,
	[DoctorId] [bigint] NULL,
 CONSTRAINT [PK_MedicalCentre] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 5/05/2020 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Patient_Email] [nvarchar](255) NULL,
	[MedicareNum] [nvarchar](50) NULL,
	[MedicareId] [int] NULL,
	[PersonId] [bigint] NULL,
	[ConsultationId] [bigint] NULL,
	[SubscriptionId] [bigint] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 5/05/2020 4:55:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[Postcode] [int] NULL,
	[Suburb] [nvarchar](255) NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 5/05/2020 4:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ConsultationId] [bigint] NOT NULL,
	[MedicationName] [nvarchar](255) NULL,
	[Dosage] [nvarchar](50) NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD  CONSTRAINT [FK_Consultation_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[Consultation] CHECK CONSTRAINT [FK_Consultation_Doctor]
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD  CONSTRAINT [FK_Consultation_MedicalCentre] FOREIGN KEY([MedicalCentreId])
REFERENCES [dbo].[MedicalCentre] ([Id])
GO
ALTER TABLE [dbo].[Consultation] CHECK CONSTRAINT [FK_Consultation_MedicalCentre]
GO
ALTER TABLE [dbo].[Consultation]  WITH CHECK ADD  CONSTRAINT [FK_Consultation_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([Id])
GO
ALTER TABLE [dbo].[Consultation] CHECK CONSTRAINT [FK_Consultation_Patient]
GO
ALTER TABLE [dbo].[MedicalCentre]  WITH CHECK ADD  CONSTRAINT [FK_MedicalCentre_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[MedicalCentre] CHECK CONSTRAINT [FK_MedicalCentre_Doctor]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Person] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Person]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Doctor] FOREIGN KEY([Id])
REFERENCES [dbo].[Doctor] ([Id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Doctor]
GO
ALTER TABLE [dbo].[Subscription]  WITH CHECK ADD  CONSTRAINT [FK_Subscription_Consultation] FOREIGN KEY([ConsultationId])
REFERENCES [dbo].[Consultation] ([Id])
GO
ALTER TABLE [dbo].[Subscription] CHECK CONSTRAINT [FK_Subscription_Consultation]
GO
USE [master]
GO
ALTER DATABASE [Electronic Health Care System] SET  READ_WRITE 
GO
