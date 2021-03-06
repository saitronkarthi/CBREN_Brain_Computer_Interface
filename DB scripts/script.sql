USE [master]
GO
/****** Object:  Database [depassist]    Script Date: 12/1/2016 9:53:00 PM ******/
CREATE DATABASE [depassist]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'depassist', FILENAME = N'D:\RDSDBDATA\DATA\depassist.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'depassist_log', FILENAME = N'D:\RDSDBDATA\DATA\depassist_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [depassist] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [depassist].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [depassist] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [depassist] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [depassist] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [depassist] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [depassist] SET ARITHABORT OFF 
GO
ALTER DATABASE [depassist] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [depassist] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [depassist] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [depassist] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [depassist] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [depassist] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [depassist] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [depassist] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [depassist] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [depassist] SET  DISABLE_BROKER 
GO
ALTER DATABASE [depassist] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [depassist] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [depassist] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [depassist] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [depassist] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [depassist] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [depassist] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [depassist] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [depassist] SET  MULTI_USER 
GO
ALTER DATABASE [depassist] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [depassist] SET DB_CHAINING OFF 
GO
ALTER DATABASE [depassist] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [depassist] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [depassist] SET DELAYED_DURABILITY = DISABLED 
GO
USE [depassist]
GO
/****** Object:  User [karthik]    Script Date: 12/1/2016 9:53:01 PM ******/
CREATE USER [karthik] FOR LOGIN [karthik] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [karthik]
GO
/****** Object:  Table [dbo].[LikeabilitySetting]    Script Date: 12/1/2016 9:53:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeabilitySetting](
	[LikeabilityId] [int] IDENTITY(1,1) NOT NULL,
	[Alphalevel] [decimal](2, 2) NULL,
	[Thetalevel] [decimal](2, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LikeCount]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeCount](
	[LikeCountId] [int] IDENTITY(1,1) NOT NULL,
	[LikeCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LinguisticAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LinguisticAnswers](
	[LTId] [int] IDENTITY(1,1) NOT NULL,
	[Ltq1] [int] NULL,
	[Ltq2] [int] NULL,
	[Ltq3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MemoryAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemoryAnswers](
	[MId] [int] IDENTITY(1,1) NOT NULL,
	[Mq1] [int] NULL,
	[Mq2] [int] NULL,
	[Mq3] [int] NULL,
	[Mq4] [int] NULL,
	[Mq5] [int] NULL,
	[Mq6] [int] NULL,
	[Mq7] [int] NULL,
	[Mq8] [int] NULL,
	[Mq9] [int] NULL,
	[Mq10] [int] NULL,
	[Mq11] [int] NULL,
	[Mq12] [int] NULL,
	[Mq13] [int] NULL,
	[Mq14] [int] NULL,
	[Mq15] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NeuralSettings]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NeuralSettings](
	[Neuralid] [int] IDENTITY(1,1) NOT NULL,
	[LeftFrontalAlpha] [decimal](2, 2) NULL,
	[RightFrontalAlpha] [decimal](2, 2) NULL,
	[Theta] [decimal](2, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostLinguisticAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostLinguisticAnswers](
	[ULAId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Ltq1] [int] NULL,
	[Ltq2] [int] NULL,
	[Ltq3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostMemoryAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostMemoryAnswers](
	[UMId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Mq1] [int] NULL,
	[Mq2] [int] NULL,
	[Mq3] [int] NULL,
	[Mq4] [int] NULL,
	[Mq5] [int] NULL,
	[Mq6] [int] NULL,
	[Mq7] [int] NULL,
	[Mq8] [int] NULL,
	[Mq9] [int] NULL,
	[Mq10] [int] NULL,
	[Mq11] [int] NULL,
	[Mq12] [int] NULL,
	[Mq13] [int] NULL,
	[Mq14] [int] NULL,
	[Mq15] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostPuzzleAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostPuzzleAnswers](
	[UPId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Pq1] [int] NULL,
	[Pq2] [int] NULL,
	[Pq3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostTestResults]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTestResults](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Linguistic] [int] NULL,
	[Puzzle] [int] NULL,
	[Memory] [int] NULL,
	[Total] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PreLinguisticAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreLinguisticAnswers](
	[ULAId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Ltq1] [int] NULL,
	[Ltq2] [int] NULL,
	[Ltq3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PreMemoryAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreMemoryAnswers](
	[UMId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Mq1] [int] NULL,
	[Mq2] [int] NULL,
	[Mq3] [int] NULL,
	[Mq4] [int] NULL,
	[Mq5] [int] NULL,
	[Mq6] [int] NULL,
	[Mq7] [int] NULL,
	[Mq8] [int] NULL,
	[Mq9] [int] NULL,
	[Mq10] [int] NULL,
	[Mq11] [int] NULL,
	[Mq12] [int] NULL,
	[Mq13] [int] NULL,
	[Mq14] [int] NULL,
	[Mq15] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrePuzzleAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrePuzzleAnswers](
	[UPId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Pq1] [int] NULL,
	[Pq2] [int] NULL,
	[Pq3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PreTestResults]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreTestResults](
	[ResultId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Linguistic] [int] NULL,
	[Puzzle] [int] NULL,
	[Memory] [int] NULL,
	[Total] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PuzzleAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PuzzleAnswers](
	[PId] [int] IDENTITY(1,1) NOT NULL,
	[Pq1] [int] NULL,
	[Pq2] [int] NULL,
	[Pq3] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLikeabilitySetting]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLikeabilitySetting](
	[ULSettingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Alphalevel] [decimal](2, 2) NULL,
	[Thetalevel] [decimal](2, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserNeuralSettings]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserNeuralSettings](
	[UNSettingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[LeftFrontalAlpha] [decimal](2, 2) NULL,
	[RightFrontalAlpha] [decimal](2, 2) NULL,
	[Theta] [decimal](2, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](200) NULL,
	[LastName] [varchar](200) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Email] [varchar](200) NULL,
	[Dob] [varchar](100) NULL,
	[Gender] [char](1) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[UserLikeabilitySetting]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
/****** Object:  StoredProcedure [dbo].[sp_CalculateResult]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_CalculateResult]
(
@UserId int,
@Mode char(5)
)
as 
begin
declare @tot int;
declare @ltot int;
declare @ptot int;
declare @mtot int;

declare @Lc1 int;
declare @Lc2 int;
declare @Lc3 int;
	set @Lc1=(select Ltq1 from LinguisticAnswers);
	set @Lc2=(select Ltq2 from LinguisticAnswers);
	set @Lc3=(select Ltq3 from LinguisticAnswers);

declare @Pc1 int;
declare @Pc2 int;
declare @Pc3 int;
	set @Pc1=(select Pq1 from PuzzleAnswers);
	set @Pc2=(select Pq2 from PuzzleAnswers);
	set @Pc3=(select Pq3 from PuzzleAnswers);

declare @Mc1 int;
declare @Mc2 int;
declare @Mc3 int;
declare @Mc4 int;
declare @Mc5 int;
declare @Mc6 int;
declare @Mc7 int;
declare @Mc8 int;
declare @Mc9 int;
declare @Mc10 int;
declare @Mc11 int;
declare @Mc12 int;
declare @Mc13 int;
declare @Mc14 int;
declare @Mc15 int;
	set @Mc1=(select Mq1 from MemoryAnswers);
	set @Mc2=(select Mq2 from MemoryAnswers);
	set @Mc3=(select Mq3 from MemoryAnswers);
	set @Mc4=(select Mq4 from MemoryAnswers);
	set @Mc5=(select Mq5 from MemoryAnswers);
	set @Mc6=(select Mq6 from MemoryAnswers);
	set @Mc7=(select Mq7 from MemoryAnswers);
	set @Mc8=(select Mq8 from MemoryAnswers);
	set @Mc9=(select Mq9 from MemoryAnswers);
	set @Mc10=(select Mq10 from MemoryAnswers);
	set @Mc11=(select Mq11 from MemoryAnswers);
	set @Mc12=(select Mq12 from MemoryAnswers);
	set @Mc13=(select Mq13 from MemoryAnswers);
	set @Mc14=(select Mq14 from MemoryAnswers);
	set @Mc15=(select Mq15 from MemoryAnswers);

declare @La1 int;
declare @La2 int;
declare @La3 int;

declare @Pa1 int;
declare @Pa2 int;
declare @Pa3 int;

declare @Ma1 int;
declare @Ma2 int;
declare @Ma3 int;
declare @Ma4 int;
declare @Ma5 int;
declare @Ma6 int;
declare @Ma7 int;
declare @Ma8 int;
declare @Ma9 int;
declare @Ma10 int;
declare @Ma11 int;
declare @Ma12 int;
declare @Ma13 int;
declare @Ma14 int;
declare @Ma15 int;

set @tot=0;
set @ltot=0;
set @ptot=0;
set @mtot=0;

if(@Mode='Pre')
		begin
							set @La1=(select Ltq1 from PreLinguisticAnswers where UserId=@UserId);
							set @La2=(select Ltq2 from PreLinguisticAnswers where UserId=@UserId);
							set @La3=(select Ltq3 from PreLinguisticAnswers where UserId=@UserId);
							if(@La1=@Lc1)  
							  set @ltot=@ltot+5;
	  
							if(@La2=@Lc2)	  
							  set @ltot=@ltot+5;
	  
							 if(@La3=@Lc3)
	 							  set @ltot=@ltot+5;

								  --Puzzle
							set @Pa1=(select Pq1 from PrePuzzleAnswers where UserId=@UserId);
							set @Pa2=(select Pq2 from PrePuzzleAnswers where UserId=@UserId);
							set @Pa3=(select Pq3 from PrePuzzleAnswers where UserId=@UserId);
							if(@Pa1=@Pc1)  
							  set @ptot=@ptot+5;
	  
							if(@Pa2=@Pc2)	  
							  set @ptot=@ptot+5;
	  
							 if(@Pa3=@Pc3)
	 							  set @ptot=@ptot+5;

								  --Memory

       						set @Ma1=(select Mq1 from PreMemoryAnswers where UserId=@UserId);
							set @Ma2=(select Mq2 from PreMemoryAnswers where UserId=@UserId);
							set @Ma3=(select Mq3 from PreMemoryAnswers where UserId=@UserId);
							set @Ma4=(select Mq4 from PreMemoryAnswers where UserId=@UserId);
							set @Ma5=(select Mq5 from PreMemoryAnswers where UserId=@UserId);
							set @Ma6=(select Mq6 from PreMemoryAnswers where UserId=@UserId);
							set @Ma7=(select Mq7 from PreMemoryAnswers where UserId=@UserId);
							set @Ma8=(select Mq8 from PreMemoryAnswers where UserId=@UserId);
							set @Ma9=(select Mq9 from PreMemoryAnswers where UserId=@UserId);
							set @Ma10=(select Mq10 from PreMemoryAnswers where UserId=@UserId);
							set @Ma11=(select Mq11 from PreMemoryAnswers where UserId=@UserId);
							set @Ma12=(select Mq12 from PreMemoryAnswers where UserId=@UserId);
							set @Ma13=(select Mq13 from PreMemoryAnswers where UserId=@UserId);
							set @Ma14=(select Mq14 from PreMemoryAnswers where UserId=@UserId);
							set @Ma15=(select Mq15 from PreMemoryAnswers where UserId=@UserId);
							if(@Ma1=@Mc1)  
							  set @mtot=@mtot+2;
	 
						  if(@Ma2=@Mc2)  
							  set @mtot=@mtot+2;

							if(@Ma3=@Mc3)  
							  set @mtot=@mtot+2;

							if(@Ma4=@Mc4)  
							  set @mtot=@mtot+2;

							 if(@Ma5=@Mc5)  
							  set @mtot=@mtot+2;

							  if(@Ma6=@Mc6)  
							  set @mtot=@mtot+2;

							  if(@Ma7=@Mc7)  
							  set @mtot=@mtot+2;

							  if(@Ma8=@Mc8)  
							  set @mtot=@mtot+2;

							  if(@Ma9=@Mc9)  
							  set @mtot=@mtot+2;

							  if(@Ma10=@Mc10)  
							  set @mtot=@mtot+2;

							  if(@Ma11=@Mc11)  
							  set @mtot=@mtot+2;

							  if(@Ma12=@Mc12)  
							  set @mtot=@mtot+2;
		
							  if(@Ma13=@Mc13)  
							  set @mtot=@mtot+2;

							  if(@Ma14=@Mc14)  
							  set @mtot=@mtot+2;

							 if(@Ma15=@Mc15)  
							  set @mtot=@mtot+2;

                   set @tot=@ltot+@ptot+@mtot;
				   insert into PreTestResults (UserId,Linguistic,Puzzle,Memory,Total)
				   values(@UserId,@ltot,@ptot,@mtot,@tot);

	  	end


else
	 begin
							set @La1=(select Ltq1 from PostLinguisticAnswers where UserId=@UserId);
							set @La2=(select Ltq2 from PostLinguisticAnswers where UserId=@UserId);
							set @La3=(select Ltq3 from PostLinguisticAnswers where UserId=@UserId);
							if(@La1=@Lc1)  
							  set @ltot=@ltot+5;
	  
							if(@La2=@Lc2)	  
							  set @ltot=@ltot+5;
	  
							 if(@La3=@Lc3)
	 							  set @ltot=@ltot+5;

								  --Puzzle
							set @Pa1=(select Pq1 from PostPuzzleAnswers where UserId=@UserId);
							set @Pa2=(select Pq2 from PostPuzzleAnswers where UserId=@UserId);
							set @Pa3=(select Pq3 from PostPuzzleAnswers where UserId=@UserId);
							if(@Pa1=@Pc1)  
							  set @ptot=@ptot+5;
	  
							if(@Pa2=@Pc2)	  
							  set @ptot=@ptot+5;
	  
							 if(@Pa3=@Pc3)
	 							  set @ptot=@ptot+5;

								  --Memory

       						set @Ma1=(select Mq1 from PostMemoryAnswers where UserId=@UserId);
							set @Ma2=(select Mq2 from PostMemoryAnswers where UserId=@UserId);
							set @Ma3=(select Mq3 from PostMemoryAnswers where UserId=@UserId);
							set @Ma4=(select Mq4 from PostMemoryAnswers where UserId=@UserId);
							set @Ma5=(select Mq5 from PostMemoryAnswers where UserId=@UserId);
							set @Ma6=(select Mq6 from PostMemoryAnswers where UserId=@UserId);
							set @Ma7=(select Mq7 from PostMemoryAnswers where UserId=@UserId);
							set @Ma8=(select Mq8 from PostMemoryAnswers where UserId=@UserId);
							set @Ma9=(select Mq9 from PostMemoryAnswers where UserId=@UserId);
							set @Ma10=(select Mq10 from PostMemoryAnswers where UserId=@UserId);
							set @Ma11=(select Mq11 from PostMemoryAnswers where UserId=@UserId);
							set @Ma12=(select Mq12 from PostMemoryAnswers where UserId=@UserId);
							set @Ma13=(select Mq13 from PostMemoryAnswers where UserId=@UserId);
							set @Ma14=(select Mq14 from PostMemoryAnswers where UserId=@UserId);
							set @Ma15=(select Mq15 from PostMemoryAnswers where UserId=@UserId);
							if(@Ma1=@Mc1)  
							  set @mtot=@mtot+2;
	 
						  if(@Ma2=@Mc2)  
							  set @mtot=@mtot+2;

							if(@Ma3=@Mc3)  
							  set @mtot=@mtot+2;

							if(@Ma4=@Mc4)  
							  set @mtot=@mtot+2;

							 if(@Ma5=@Mc5)  
							  set @mtot=@mtot+2;

							  if(@Ma6=@Mc6)  
							  set @mtot=@mtot+2;

							  if(@Ma7=@Mc7)  
							  set @mtot=@mtot+2;

							  if(@Ma8=@Mc8)  
							  set @mtot=@mtot+2;

							  if(@Ma9=@Mc9)  
							  set @mtot=@mtot+2;

							  if(@Ma10=@Mc10)  
							  set @mtot=@mtot+2;

							  if(@Ma11=@Mc11)  
							  set @mtot=@mtot+2;

							  if(@Ma12=@Mc12)  
							  set @mtot=@mtot+2;
		
							  if(@Ma13=@Mc13)  
							  set @mtot=@mtot+2;

							  if(@Ma14=@Mc14)  
							  set @mtot=@mtot+2;

							 if(@Ma15=@Mc15)  
							  set @mtot=@mtot+2;

            set @tot=@ltot+@ptot+@mtot;
				   insert into PostTestResults (UserId,Linguistic,Puzzle,Memory,Total)
				   values(@UserId,@ltot,@ptot,@mtot,@tot);
	 end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_Ins_LinguisticAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Ins_LinguisticAnswers]
(
@UserId int,
@Ltq1 int,
@Ltq2 int,
@Ltq3 int,
@Mode char(5)
)
as
begin
if(@Mode='Pre')
insert into PreLinguisticAnswers(UserId,Ltq1,Ltq2,Ltq3)
values(@UserId,@Ltq1,@Ltq2,@Ltq3);
else
begin
delete from PostLinguisticAnswers  where UserId=@UserId;
insert into PostLinguisticAnswers(UserId,Ltq1,Ltq2,Ltq3)
values(@UserId,@Ltq1,@Ltq2,@Ltq3);
end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Ins_MemoryAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Ins_MemoryAnswers]
(
@UserId int,
@Mq1 int,
@Mq2 int,
@Mq3 int,
@Mq4 int,
@Mq5 int,
@Mq6 int,
@Mq7 int,
@Mq8 int,
@Mq9 int,
@Mq10 int,
@Mq11 int,
@Mq12 int,
@Mq13 int,
@Mq14 int,
@Mq15 int,
@Mode char(5)
)
as
begin
if(@Mode='Pre')
			begin
				insert into PreMemoryAnswers values(@UserId,@Mq1,@Mq2,@Mq3,@Mq4,@Mq5,@Mq6,
				@Mq7,@Mq8,@Mq9,@Mq10,@Mq11,@Mq12,@Mq13,@Mq14,@Mq15);
				exec sp_CalculateResult @UserId,@Mode;
			end

else
	begin
			delete from PostMemoryAnswers  where UserId=@UserId;
			insert into PostMemoryAnswers values(@UserId,@Mq1,@Mq2,@Mq3,@Mq4,@Mq5,@Mq6,
			@Mq7,@Mq8,@Mq9,@Mq10,@Mq11,@Mq12,@Mq13,@Mq14,@Mq15)
			exec sp_CalculateResult @UserId,@Mode;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Ins_PuzzleAnswers]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_Ins_PuzzleAnswers]
(
@UserId int,
@Pq1 int,
@Pq2 int,
@Pq3 int,
@Mode char(5)
)
as
begin
if(@Mode='Pre')
insert into PrePuzzleAnswers(UserId,Pq1,Pq2,Pq3)
values(@UserId,@Pq1,@Pq2,@Pq3);
else
begin
delete from PostPuzzleAnswers where UserId=@UserId;
insert into PostPuzzleAnswers(UserId,Pq1,Pq2,Pq3)
values(@UserId,@Pq1,@Pq2,@Pq3);
end

end
GO
/****** Object:  StoredProcedure [dbo].[sp_Ins_users]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Ins_users]
(
@UserId int,
@Firstname varchar(200),
@Lastname varchar(200),
@Username varchar(50),
@Password varchar(50),
@Email varchar(200),
@Dob varchar(100),
@Gender char(1)

)
AS

BEGIN
if(@UserId=0)
 begin
	   IF NOT EXISTS(SELECT * FROM Users WHERE Username = @Username)
	   begin
			insert into Users (FirstName,LastName,UserName,Password,Email,DOB,Gender) 
			values (@Firstname,@Lastname,@Username,@Password,@Email,@Dob,@Gender);
			select 'Successful';
		end
		else
		
			select 'Unsuccessful'
 end
 else
  begin
   update Users set FirstName=@Firstname, LastName=@Lastname,Email=@Email
   where UserId=@UserId;
   select 'Successful';
   end
 	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertLikeCount]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_InsertLikeCount]
(
@LikeCount int
)
as
begin
delete from LikeCount;
insert into LikeCount values(@LikeCount);
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsUpdConfig]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_InsUpdConfig]
(
@UserId int,
@Value1 decimal(2,2),
@Value2 decimal(2,2),
@Value3 decimal(2,2),
@Mode char(1)
)
as
declare @rcount int;
begin
	if(@Mode='L')
	begin
		select @rcount=count(*) from UserLikeabilitySetting where UserId=@UserId;
		if(@rcount=0)
		insert into UserLikeabilitySetting (UserId,Alphalevel,Thetalevel)
		values(@UserId,@Value1,@Value2);
		else
		update UserLikeabilitySetting set Alphalevel=@Value1,Thetalevel=@Value2
		where UserId=@UserId;
	end
	else
		begin
			select @rcount=count(*) from UserNeuralSettings where UserId=@UserId;
			if(@rcount=0)
			insert into UserNeuralSettings (UserId,LeftFrontalAlpha,RightFrontalAlpha,Theta)
			values(@UserId,@Value1,@Value2,@Value3);
			else
			update UserNeuralSettings set LeftFrontalAlpha=@Value1,RightFrontalAlpha=@Value2,Theta=@Value3
			where UserId=@UserId;
		end
end


GO
/****** Object:  StoredProcedure [dbo].[sp_LoadConfig]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_LoadConfig]
(
@UserId int
)
as
begin
declare @LCount int;
declare @NCount int;
select @LCount=count(*) from UserLikeabilitySetting where UserId=@UserId;
select @NCount=count(*) from UserNeuralSettings where UserId=@UserId;
if(@LCount=0 and @NCount=0)
	begin
	select Alphalevel,Thetalevel from LikeabilitySetting;
	select LeftFrontalAlpha,RightFrontalAlpha,Theta from NeuralSettings;
	end

else if(@LCount>0 and @NCount>0)
	begin
	select Alphalevel,Thetalevel from UserLikeabilitySetting where UserId=@UserId;
	select LeftFrontalAlpha,RightFrontalAlpha,Theta from UserNeuralSettings where UserId=@UserId;
	end

else if(@LCount>0 and @NCount=0)
	begin
	select Alphalevel,Thetalevel from UserLikeabilitySetting where UserId=@UserId;
	select LeftFrontalAlpha,RightFrontalAlpha,Theta from NeuralSettings;
	end

	else

	begin
	select Alphalevel,Thetalevel from LikeabilitySetting;
	select LeftFrontalAlpha,RightFrontalAlpha,Theta from UserNeuralSettings where UserId=@UserId;
	end
end
GO
/****** Object:  StoredProcedure [dbo].[sp_Sel_UserLogin]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_Sel_UserLogin]
(
@Username varchar(50),
@Password varchar(50)
)
as
begin
select Username,UserId from Users where
Username=@Username and Password=@Password

end
GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 12/1/2016 9:53:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [rds_deny_backups_trigger] ON DATABASE WITH EXECUTE AS 'dbo' FOR
 ADD_ROLE_MEMBER, GRANT_DATABASE AS BEGIN
   SET NOCOUNT ON;
   SET ANSI_PADDING ON;
 
   DECLARE @data xml;
   DECLARE @user sysname;
   DECLARE @role sysname;
   DECLARE @type sysname;
   DECLARE @sql NVARCHAR(MAX);
   DECLARE @permissions TABLE(name sysname PRIMARY KEY);
   
   SELECT @data = EVENTDATA();
   SELECT @type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    
   IF @type = 'ADD_ROLE_MEMBER' BEGIN
      SELECT @user = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
       @role = @data.value('(/EVENT_INSTANCE/RoleName)[1]', 'sysname');

      IF @role IN ('db_owner', 'db_backupoperator') BEGIN
         SELECT @sql = 'DENY BACKUP DATABASE, BACKUP LOG TO ' + QUOTENAME(@user);
         EXEC(@sql);
      END
   END ELSE IF @type = 'GRANT_DATABASE' BEGIN
      INSERT INTO @permissions(name)
      SELECT Permission.value('(text())[1]', 'sysname') FROM
       @data.nodes('/EVENT_INSTANCE/Permissions/Permission')
      AS DatabasePermissions(Permission);
      
      IF EXISTS (SELECT * FROM @permissions WHERE name IN ('BACKUP DATABASE',
       'BACKUP LOG'))
         RAISERROR('Cannot grant backup database or backup log', 15, 1) WITH LOG;       
   END
END


GO
ENABLE TRIGGER [rds_deny_backups_trigger] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [depassist] SET  READ_WRITE 
GO
