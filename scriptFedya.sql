USE [master]
GO
/****** Object:  Database [AdmissionСommitteeDb]    Script Date: 31.10.2024 0:12:47 ******/
CREATE DATABASE [AdmissionСommitteeDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdmissionСommitteeDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AdmissionСommitteeDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdmissionСommitteeDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AdmissionСommitteeDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AdmissionСommitteeDb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdmissionСommitteeDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdmissionСommitteeDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET  MULTI_USER 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdmissionСommitteeDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdmissionСommitteeDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AdmissionСommitteeDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [AdmissionСommitteeDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AdmissionСommitteeDb]
GO
/****** Object:  Table [dbo].[EducationalInstituition]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalInstituition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EducationalInstituition] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamList]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_ExamList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamResults]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamResults](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectExamListId] [int] NOT NULL,
	[Mark] [int] NOT NULL,
 CONSTRAINT [PK_ExamResults] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Faculty]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MaxStudentsAmount] [int] NOT NULL,
	[StudentsAmount] [int] NOT NULL,
 CONSTRAINT [PK_Faculty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[PassportNumber] [char](10) NOT NULL,
	[EducationalInstitutionId] [int] NOT NULL,
	[DateOfGraduation] [date] NOT NULL,
	[IsHaveGoldMedal] [bit] NOT NULL,
	[IsHaveSilverMedal] [bit] NOT NULL,
	[FacultyId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubjectExamList]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectExamList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[ExamList] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_SubjectExamList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.10.2024 0:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EducationalInstituition] ON 

INSERT [dbo].[EducationalInstituition] ([Id], [Name]) VALUES (1, N'ГБПОУ ТПСК Им. Максимчука')
INSERT [dbo].[EducationalInstituition] ([Id], [Name]) VALUES (2, N'Школа 12')
INSERT [dbo].[EducationalInstituition] ([Id], [Name]) VALUES (3, N'Школа 13')
SET IDENTITY_INSERT [dbo].[EducationalInstituition] OFF
GO
SET IDENTITY_INSERT [dbo].[ExamList] ON 

INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (2, 2, 2, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (3, 3, 3, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (4, 4, 4, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (5, 5, 1, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (6, 6, 2, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (7, 7, 3, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (8, 8, 4, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (9, 9, 1, NULL)
INSERT [dbo].[ExamList] ([Id], [StudentId], [GroupId], [UserId]) VALUES (10, 10, 2, NULL)
SET IDENTITY_INSERT [dbo].[ExamList] OFF
GO
SET IDENTITY_INSERT [dbo].[Faculty] ON 

INSERT [dbo].[Faculty] ([Id], [Name], [MaxStudentsAmount], [StudentsAmount]) VALUES (1, N'Информационные системы и технологии', 50, 10)
INSERT [dbo].[Faculty] ([Id], [Name], [MaxStudentsAmount], [StudentsAmount]) VALUES (2, N'Веб-Дизайн', 45, 44)
SET IDENTITY_INSERT [dbo].[Faculty] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([Id], [Number]) VALUES (1, 10)
INSERT [dbo].[Group] ([Id], [Number]) VALUES (2, 11)
INSERT [dbo].[Group] ([Id], [Number]) VALUES (3, 12)
INSERT [dbo].[Group] ([Id], [Number]) VALUES (4, 13)
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (1, N'Лапухов', N'Степан', N'Прокопьевич', N'4063162553', 1, CAST(N'2024-08-10' AS Date), 0, 1, 1)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (2, N'Огурцов', N'Максим', N'Лукьевич', N'4253269165', 2, CAST(N'2024-08-11' AS Date), 0, 0, 2)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (3, N'Кондратов', N'Артем', N'Викторович', N'4158470917', 3, CAST(N'2024-08-12' AS Date), 0, 0, 1)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (4, N'Панкратова', N'Ульяна', N'Васильевна', N'4395728165', 1, CAST(N'2024-08-13' AS Date), 0, 0, 2)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (5, N'Лигачёв', N'Игнат', N'Александрович', N'4926742343', 2, CAST(N'2024-08-14' AS Date), 1, 0, 1)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (6, N'Ширяев', N'Антон', N'Егорович', N'4368361605', 3, CAST(N'2024-08-15' AS Date), 0, 0, 2)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (7, N'Берестов', N'Федот', N'Игнатьевич', N'4030825801', 1, CAST(N'2024-08-16' AS Date), 0, 0, 1)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (8, N'Карявин', N'Трофим', N'Ираклиевич', N'4186241749', 2, CAST(N'2024-08-17' AS Date), 1, 0, 2)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (9, N'Погребной', N'Кирилл', N'Макарович', N'4798379711', 3, CAST(N'2024-08-18' AS Date), 0, 0, 1)
INSERT [dbo].[Student] ([Id], [Lastname], [Name], [Surname], [PassportNumber], [EducationalInstitutionId], [DateOfGraduation], [IsHaveGoldMedal], [IsHaveSilverMedal], [FacultyId]) VALUES (10, N'Бугаева', N'Екатерина', N'Игнатьевна', N'4412647676', 1, CAST(N'2024-08-19' AS Date), 0, 0, 2)
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Id], [Name]) VALUES (1, N'Математика')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (2, N'Физика')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (3, N'Английский язык')
INSERT [dbo].[Subject] ([Id], [Name]) VALUES (4, N'Обществознание')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[SubjectExamList] ON 

INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (1, 1, 1, CAST(N'2024-10-30' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (2, 2, 2, CAST(N'2024-10-31' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (3, 3, 3, CAST(N'2024-11-01' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (4, 4, 4, CAST(N'2024-11-02' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (5, 1, 5, CAST(N'2024-11-03' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (6, 2, 6, CAST(N'2024-11-04' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (7, 3, 7, CAST(N'2024-11-05' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (8, 4, 8, CAST(N'2024-11-06' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (9, 1, 9, CAST(N'2024-11-07' AS Date))
INSERT [dbo].[SubjectExamList] ([Id], [SubjectId], [ExamList], [Date]) VALUES (10, 2, 10, CAST(N'2024-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[SubjectExamList] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (1, N'1', N'1')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[ExamList]  WITH CHECK ADD  CONSTRAINT [FK_ExamList_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([Id])
GO
ALTER TABLE [dbo].[ExamList] CHECK CONSTRAINT [FK_ExamList_Group]
GO
ALTER TABLE [dbo].[ExamList]  WITH CHECK ADD  CONSTRAINT [FK_ExamList_Student] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([Id])
GO
ALTER TABLE [dbo].[ExamList] CHECK CONSTRAINT [FK_ExamList_Student]
GO
ALTER TABLE [dbo].[ExamList]  WITH CHECK ADD  CONSTRAINT [FK_ExamList_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ExamList] CHECK CONSTRAINT [FK_ExamList_User]
GO
ALTER TABLE [dbo].[ExamResults]  WITH CHECK ADD  CONSTRAINT [FK_ExamResults_SubjectExamList] FOREIGN KEY([SubjectExamListId])
REFERENCES [dbo].[SubjectExamList] ([Id])
GO
ALTER TABLE [dbo].[ExamResults] CHECK CONSTRAINT [FK_ExamResults_SubjectExamList]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_EducationalInstituition] FOREIGN KEY([EducationalInstitutionId])
REFERENCES [dbo].[EducationalInstituition] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_EducationalInstituition]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Faculty] FOREIGN KEY([FacultyId])
REFERENCES [dbo].[Faculty] ([Id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Faculty]
GO
ALTER TABLE [dbo].[SubjectExamList]  WITH CHECK ADD  CONSTRAINT [FK_SubjectExamList_ExamList] FOREIGN KEY([ExamList])
REFERENCES [dbo].[ExamList] ([Id])
GO
ALTER TABLE [dbo].[SubjectExamList] CHECK CONSTRAINT [FK_SubjectExamList_ExamList]
GO
ALTER TABLE [dbo].[SubjectExamList]  WITH CHECK ADD  CONSTRAINT [FK_SubjectExamList_Subject] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[SubjectExamList] CHECK CONSTRAINT [FK_SubjectExamList_Subject]
GO
USE [master]
GO
ALTER DATABASE [AdmissionСommitteeDb] SET  READ_WRITE 
GO
