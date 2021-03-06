USE [master]
GO
/****** Object:  Database [test]    Script Date: 9/15/2017 11:27:16 AM ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [test] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [test]
GO
/****** Object:  Table [dbo].[department]    Script Date: 9/15/2017 11:27:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[dept_id] [int] IDENTITY(1,1) NOT NULL,
	[dept_name] [varchar](40) NULL,
	[dept_head_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 9/15/2017 11:27:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NULL,
	[gender] [varchar](40) NULL,
	[basic_salary] [int] NULL,
	[hr] [int] NULL,
	[da] [int] NULL,
	[tax] [int] NULL,
	[dept_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee_attendance]    Script Date: 9/15/2017 11:27:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_attendance](
	[emp_id] [int] NULL,
	[a_date] [date] NULL,
	[working_days] [int] NULL,
	[present_day] [int] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[department] ON 

INSERT [dbo].[department] ([dept_id], [dept_name], [dept_head_id]) VALUES (1, N'HR', 1)
INSERT [dbo].[department] ([dept_id], [dept_name], [dept_head_id]) VALUES (2, N'Admin', 2)
INSERT [dbo].[department] ([dept_id], [dept_name], [dept_head_id]) VALUES (3, N'Sales', 9)
INSERT [dbo].[department] ([dept_id], [dept_name], [dept_head_id]) VALUES (4, N'Engineering', 5)
SET IDENTITY_INSERT [dbo].[department] OFF
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (1, N'Anil', N'Male', 10000, 5000, 1000, 400, 1)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (2, N'Sanjana', N'Female', 12000, 6000, 1000, 500, 2)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (3, N'Johnny', N'Male', 5000, 2500, 500, 200, 3)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (4, N'Suresh', N'Male', 6000, 3000, 500, 250, 1)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (5, N'Anglia', N'Female', 11000, 5500, 1000, 500, 4)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (6, N'Saurabh', N'Male', 12000, 6000, 1000, 600, 1)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (7, N'Manish', N'Male', 4000, 2000, 500, 150, 2)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (8, N'Neeraj', N'Male', 5000, 2500, 500, 200, 3)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (9, N'Suman', N'Female', 5000, 2500, 500, 200, 4)
INSERT [dbo].[employee] ([id], [name], [gender], [basic_salary], [hr], [da], [tax], [dept_id]) VALUES (10, N'Tina', N'Female', 6000, 3000, 500, 220, 1)
SET IDENTITY_INSERT [dbo].[employee] OFF
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (1, CAST(0x4C320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (1, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (1, CAST(0x4E320B00 AS Date), 22, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (2, CAST(0x4C320B00 AS Date), 22, 22)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (2, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (2, CAST(0x4E320B00 AS Date), 22, 22)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (3, CAST(0x4C320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (3, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (3, CAST(0x4E320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (4, CAST(0x4C320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (4, CAST(0x4D320B00 AS Date), 20, 19)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (4, CAST(0x4E320B00 AS Date), 22, 22)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (5, CAST(0x4C320B00 AS Date), 22, 22)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (5, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (5, CAST(0x4E320B00 AS Date), 22, 22)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (6, CAST(0x4C320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (6, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (6, CAST(0x4E320B00 AS Date), 22, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (7, CAST(0x4C320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (7, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (7, CAST(0x4E320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (8, CAST(0x4C320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (8, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (8, CAST(0x4E320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (9, CAST(0x4C320B00 AS Date), 22, 22)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (9, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (9, CAST(0x4E320B00 AS Date), 22, 21)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (10, CAST(0x4C320B00 AS Date), 22, 22)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (10, CAST(0x4D320B00 AS Date), 20, 20)
INSERT [dbo].[employee_attendance] ([emp_id], [a_date], [working_days], [present_day]) VALUES (10, CAST(0x4E320B00 AS Date), 22, 22)
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([dept_id])
REFERENCES [dbo].[department] ([dept_id])
GO
ALTER TABLE [dbo].[employee_attendance]  WITH CHECK ADD FOREIGN KEY([emp_id])
REFERENCES [dbo].[employee] ([id])
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
