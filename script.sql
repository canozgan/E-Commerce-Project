USE [master]
GO
/****** Object:  Database [Data]    Script Date: 28.12.2022 16:49:31 ******/
CREATE DATABASE [Data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Data_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Data] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Data] SET ARITHABORT OFF 
GO
ALTER DATABASE [Data] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Data] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Data] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Data] SET  MULTI_USER 
GO
ALTER DATABASE [Data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Data] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Data', N'ON'
GO
ALTER DATABASE [Data] SET QUERY_STORE = OFF
GO
USE [Data]
GO
/****** Object:  Table [dbo].[Adres]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adres](
	[AdresID] [int] IDENTITY(1,1) NOT NULL,
	[Sehir] [nvarchar](15) NOT NULL,
	[Ilce] [nvarchar](20) NOT NULL,
	[Cadde_Sokak] [nvarchar](50) NOT NULL,
	[Numara] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_Adres] PRIMARY KEY CLUSTERED 
(
	[AdresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beden]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beden](
	[BarkodNo] [int] NOT NULL,
	[Beden] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Beden] PRIMARY KEY CLUSTERED 
(
	[BarkodNo] ASC,
	[Beden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Email]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Email](
	[Email] [nvarchar](50) NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_Email] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favoriler]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favoriler](
	[KullaniciID] [int] NOT NULL,
	[BarkodNo] [int] NOT NULL,
	[Tarih] [smalldatetime] NULL,
 CONSTRAINT [PK_Favoriler] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC,
	[BarkodNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fis]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fis](
	[FisID] [int] IDENTITY(1,1) NOT NULL,
	[ToplamTutar] [decimal](15, 6) NOT NULL,
	[İndirimliOdenenTutar] [decimal](15, 6) NOT NULL,
	[KrediKartiNo] [decimal](16, 0) NOT NULL,
	[Tarih] [smalldatetime] NOT NULL,
	[Sehir] [nvarchar](15) NOT NULL,
	[Ilce] [nvarchar](20) NOT NULL,
	[Cadde_Sokak] [nvarchar](50) NOT NULL,
	[Numara] [int] NOT NULL,
	[IletisimMaili] [nvarchar](50) NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_Fis] PRIMARY KEY CLUSTERED 
(
	[FisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FisUrun]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FisUrun](
	[FisID] [int] NOT NULL,
	[BarkodNo] [int] NOT NULL,
	[Miktar] [int] NOT NULL,
	[IadeDurumu] [bit] NOT NULL,
	[Yorum] [nvarchar](max) NULL,
	[Resim] [nvarchar](100) NULL,
	[FisUrunID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_FisUrun_1] PRIMARY KEY CLUSTERED 
(
	[FisUrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KrediKarti]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KrediKarti](
	[KrediKarti] [decimal](16, 0) NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_KrediKarti] PRIMARY KEY CLUSTERED 
(
	[KrediKarti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](20) NOT NULL,
	[Soyad] [nvarchar](20) NOT NULL,
	[Sifre] [nvarchar](10) NOT NULL,
	[Yetki] [char](1) NOT NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[KullaniciID] [int] NOT NULL,
	[Bakiye] [decimal](7, 2) NOT NULL,
	[Puan] [int] NOT NULL,
 CONSTRAINT [PK_Musteri] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Renk]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Renk](
	[BarkodNo] [int] NOT NULL,
	[Renk] [nvarchar](20) NOT NULL,
	[Resim] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Renk] PRIMARY KEY CLUSTERED 
(
	[BarkodNo] ASC,
	[Renk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sepet]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sepet](
	[KullaniciID] [int] NOT NULL,
	[SepetID] [int] IDENTITY(1,1) NOT NULL,
	[Miktar] [int] NOT NULL,
	[BarkodNo] [int] NOT NULL,
	[Renk] [nvarchar](20) NOT NULL,
	[Beden] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Sepet_1] PRIMARY KEY CLUSTERED 
(
	[SepetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sube]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sube](
	[SubeID] [int] IDENTITY(1,1) NOT NULL,
	[Sehir] [nvarchar](15) NOT NULL,
	[Ilce] [nvarchar](20) NOT NULL,
	[Cadde_Sokak] [nvarchar](50) NOT NULL,
	[PostaKodu] [int] NOT NULL,
 CONSTRAINT [PK_Sube] PRIMARY KEY CLUSTERED 
(
	[SubeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[BarkodNo] [int] IDENTITY(1,1) NOT NULL,
	[Fiyat] [decimal](7, 2) NOT NULL,
	[Cinsiyet] [char](5) NOT NULL,
	[Kategori] [nvarchar](20) NOT NULL,
	[SatisSayisi] [smallint] NOT NULL,
	[Malzeme] [nvarchar](max) NOT NULL,
	[Dış] [nvarchar](50) NOT NULL,
	[Ad] [nvarchar](50) NOT NULL,
	[Açıklama] [nvarchar](max) NOT NULL,
	[EklenmeTarihi] [smalldatetime] NULL,
	[IadeMiktari] [int] NULL,
	[YasAraligi] [nvarchar](50) NULL,
	[FavoriSayisi] [int] NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[BarkodNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunDetay]    Script Date: 28.12.2022 16:49:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunDetay](
	[BarkodNo] [int] NOT NULL,
	[CantaFlag] [bit] NOT NULL,
	[Sap] [nvarchar](20) NULL,
	[AnaMalzeme] [nvarchar](20) NULL,
	[UzunAski] [nvarchar](20) NULL,
	[Yükseklik] [smallint] NULL,
	[Genislik] [smallint] NULL,
	[Derinlik] [smallint] NULL,
	[AyakkabiFlag] [bit] NOT NULL,
	[Ust] [nvarchar](20) NULL,
	[Taban] [nvarchar](20) NULL,
	[IcTaban] [nvarchar](20) NULL,
	[Dil] [nvarchar](20) NULL,
	[CocukFlag] [bit] NOT NULL,
	[YasAraligi] [nvarchar](20) NULL,
	[CocukCinsiyet] [nvarchar](20) NULL,
	[DolguluFlag] [bit] NOT NULL,
	[Dolgu] [nvarchar](30) NULL,
	[SusluFlag] [bit] NOT NULL,
	[Susler] [nvarchar](30) NULL,
	[FonKumasFlag] [bit] NOT NULL,
	[FonKumas] [nvarchar](30) NULL,
	[Kaplama] [nvarchar](30) NULL,
	[IkincilTekstilFlag] [bit] NOT NULL,
	[DisAnaKumas] [nvarchar](30) NULL,
	[IkincilTekstil] [nvarchar](30) NULL,
	[AstarFlag] [bit] NOT NULL,
	[Astar] [nvarchar](30) NULL,
 CONSTRAINT [PK_UrunDetay] PRIMARY KEY CLUSTERED 
(
	[BarkodNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Adres] ON 

INSERT [dbo].[Adres] ([AdresID], [Sehir], [Ilce], [Cadde_Sokak], [Numara], [KullaniciID]) VALUES (1, N'ANKARA', N'KEÇİÖREN', N'1099', 0, 2)
SET IDENTITY_INSERT [dbo].[Adres] OFF
GO
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (2, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (2, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (2, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (2, N'XL')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (3, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (3, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (3, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (4, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (4, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (4, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (5, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (5, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (5, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (6, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (6, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (6, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (7, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (7, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (7, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (16, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (16, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (16, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (17, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (17, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (17, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (18, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (18, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (18, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (19, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (19, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (19, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (20, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (20, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (20, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (38, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (38, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (38, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (39, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (39, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (39, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (40, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (40, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (40, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (41, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (41, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (41, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (42, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (42, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (42, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (44, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (44, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (44, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (45, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (45, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (45, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (46, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (46, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (46, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (47, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (47, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (47, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (48, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (48, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (48, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (59, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (59, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (59, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (61, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (61, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (61, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (62, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (62, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (62, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (63, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (63, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (63, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (64, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (64, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (64, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (65, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (65, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (65, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (66, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (66, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (66, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (67, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (67, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (67, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (68, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (68, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (68, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (69, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (69, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (69, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (71, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (71, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (71, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (82, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (82, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (82, N'S')
GO
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (83, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (83, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (83, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (84, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (84, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (84, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (85, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (85, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (86, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (86, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (86, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (87, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (87, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (87, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (88, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (88, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (88, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (89, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (89, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (89, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (90, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (90, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (90, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (91, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (91, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (91, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (92, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (92, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (92, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (93, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (93, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (93, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (94, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (94, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (94, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (95, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (95, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (95, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (96, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (96, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (96, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (97, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (97, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (97, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (100, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (100, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (100, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (102, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (102, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (102, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (103, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (103, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (103, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (104, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (104, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (104, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (105, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (105, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (105, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (106, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (106, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (106, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (107, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (107, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (107, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (109, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (109, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (109, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (111, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (111, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (111, N'S')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (112, N'L')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (112, N'M')
INSERT [dbo].[Beden] ([BarkodNo], [Beden]) VALUES (112, N'S')
GO
INSERT [dbo].[Email] ([Email], [KullaniciID]) VALUES (N'alirizaaslan2000@gmail.com', 2)
INSERT [dbo].[Email] ([Email], [KullaniciID]) VALUES (N'aysegmail.com', 6)
INSERT [dbo].[Email] ([Email], [KullaniciID]) VALUES (N'canozgan@gmail.com', 3)
INSERT [dbo].[Email] ([Email], [KullaniciID]) VALUES (N'hasan@gmail.com', 5)
INSERT [dbo].[Email] ([Email], [KullaniciID]) VALUES (N'veli@gmail.com', 4)
INSERT [dbo].[Email] ([Email], [KullaniciID]) VALUES (N'zeyno@gmail.com', 7)
GO
SET IDENTITY_INSERT [dbo].[Fis] ON 

INSERT [dbo].[Fis] ([FisID], [ToplamTutar], [İndirimliOdenenTutar], [KrediKartiNo], [Tarih], [Sehir], [Ilce], [Cadde_Sokak], [Numara], [IletisimMaili], [KullaniciID]) VALUES (1, CAST(6995.000000 AS Decimal(15, 6)), CAST(6995.000000 AS Decimal(15, 6)), CAST(1111222233334444 AS Decimal(16, 0)), CAST(N'2022-12-28T14:28:00' AS SmallDateTime), N'ANKARA', N'KEÇİÖREN', N'1099', 0, N'alirizaaslan2000@gmail.com', 2)
INSERT [dbo].[Fis] ([FisID], [ToplamTutar], [İndirimliOdenenTutar], [KrediKartiNo], [Tarih], [Sehir], [Ilce], [Cadde_Sokak], [Numara], [IletisimMaili], [KullaniciID]) VALUES (2, CAST(5098.000000 AS Decimal(15, 6)), CAST(5098.000000 AS Decimal(15, 6)), CAST(1111222233334444 AS Decimal(16, 0)), CAST(N'2022-12-28T14:32:00' AS SmallDateTime), N'ANKARA', N'KEÇİÖREN', N'1099', 0, N'alirizaaslan2000@gmail.com', 2)
SET IDENTITY_INSERT [dbo].[Fis] OFF
GO
SET IDENTITY_INSERT [dbo].[FisUrun] ON 

INSERT [dbo].[FisUrun] ([FisID], [BarkodNo], [Miktar], [IadeDurumu], [Yorum], [Resim], [FisUrunID]) VALUES (1, 71, 5, 0, N'kötü', NULL, 1)
INSERT [dbo].[FisUrun] ([FisID], [BarkodNo], [Miktar], [IadeDurumu], [Yorum], [Resim], [FisUrunID]) VALUES (2, 20, 1, 0, NULL, NULL, 2)
INSERT [dbo].[FisUrun] ([FisID], [BarkodNo], [Miktar], [IadeDurumu], [Yorum], [Resim], [FisUrunID]) VALUES (2, 46, 1, 0, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[FisUrun] OFF
GO
INSERT [dbo].[KrediKarti] ([KrediKarti], [KullaniciID]) VALUES (CAST(1111222233334444 AS Decimal(16, 0)), 2)
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [Ad], [Soyad], [Sifre], [Yetki]) VALUES (2, N'alirıza', N'aslan', N'12345', N'K')
INSERT [dbo].[Kullanici] ([KullaniciID], [Ad], [Soyad], [Sifre], [Yetki]) VALUES (3, N'Can', N'Özgan', N'123465', N'Y')
INSERT [dbo].[Kullanici] ([KullaniciID], [Ad], [Soyad], [Sifre], [Yetki]) VALUES (4, N'Veli', N'Karadağ', N'123456', N'K')
INSERT [dbo].[Kullanici] ([KullaniciID], [Ad], [Soyad], [Sifre], [Yetki]) VALUES (5, N'Hasan', N'Kara', N'123456', N'K')
INSERT [dbo].[Kullanici] ([KullaniciID], [Ad], [Soyad], [Sifre], [Yetki]) VALUES (6, N'Ayşe', N'Yılmaz', N'123456', N'K')
INSERT [dbo].[Kullanici] ([KullaniciID], [Ad], [Soyad], [Sifre], [Yetki]) VALUES (7, N'Zeynep', N'Fakir', N'123456', N'K')
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
INSERT [dbo].[Musteri] ([KullaniciID], [Bakiye], [Puan]) VALUES (2, CAST(0.00 AS Decimal(7, 2)), 50)
INSERT [dbo].[Musteri] ([KullaniciID], [Bakiye], [Puan]) VALUES (4, CAST(0.00 AS Decimal(7, 2)), 60)
INSERT [dbo].[Musteri] ([KullaniciID], [Bakiye], [Puan]) VALUES (5, CAST(0.00 AS Decimal(7, 2)), 100)
INSERT [dbo].[Musteri] ([KullaniciID], [Bakiye], [Puan]) VALUES (6, CAST(0.00 AS Decimal(7, 2)), 50)
INSERT [dbo].[Musteri] ([KullaniciID], [Bakiye], [Puan]) VALUES (7, CAST(0.00 AS Decimal(7, 2)), 30)
GO
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (2, N'KAHVERENGİ', N'/img/kadın18blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (3, N'SİYAH', N'/img/kadın4blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (4, N'Siyah', N'/img/kadın12kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (5, N'siyah', N'/img/kadın15kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (6, N'beyaz', N'/img/kadın1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (7, N'beyaz', N'/img/ceket1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (16, N'siyah', N'/img/erkek15sweatshirt.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (17, N'siyah', N'/img/erkek10ceket.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (18, N'siyah', N'/img/erkek12pantolon.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (19, N'siyah', N'/img/erkek14blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (20, N'beyaz', N'/img/kadın1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (38, N'BEYAZ', N'/img/kadın10kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (39, N'siyah', N'/img/kadın11kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (40, N'yesil', N'/img/kadın12kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (41, N'siyah', N'/img/kadın15kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (42, N'siyah', N'/img/kadın21kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (44, N'siyah', N'/img/erkek16kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (45, N'kahverengi', N'/img/erkek20kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (46, N'siyah', N'/img/erkek4kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (47, N'siyah', N'/img/erkek5kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (48, N'siyah', N'/img/erkekyelek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (59, N'siyah', N'/img/ceket6.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (61, N'kahverengi', N'/img/ceket7.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (62, N'yesil', N'/img/ceket8.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (63, N'gri', N'/img/kadın20ceket.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (64, N'siyah', N'/img/kadın22ceket.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (65, N'yesil', N'/img/ceket1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (66, N'gri', N'/img/ceket2.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (67, N'mavi', N'/img/ceket3.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (68, N'siyah', N'/img/ceket4.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (69, N'mavi', N'/img/ceket4.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (71, N'siyah', N'/img/kadın4blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (82, N'siyah', N'/img/kadın18blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (83, N'siyah', N'/img/kadın2.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (84, N'mavi', N'/img/erkek14blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (85, N'siyah', N'/img/erkek17blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (86, N'beyaz', N'/img/erkek8blazer.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (87, N'siyah', N'/img/kadın16yelek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (88, N'siyah', N'/img/yelek1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (89, N'siyah', N'/img/kadın2.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (90, N'siyah', N'/img/erkek4yelek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (91, N'siyah', N'/img/erkek18yelek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (92, N'siyah', N'/img/erkek2yelek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (93, N'kırmızı', N'/img/kadın19elbise.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (94, N'mavi', N'/img/kadın6kaban.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (95, N'renkli', N'/img/Kazak1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (96, N'kremrengi', N'/img/kadın7gömlek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (97, N'gri', N'/img/erkek7kazak.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (100, N'siyah', N'/img/erkek21kazak.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (102, N'cizgili', N'/img/gömlek1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (103, N'beyaz', N'/img/kadın23gömlek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (104, N'beyaz', N'/img/erkek23gömlek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (105, N'mavi', N'/img/erkek24gömlek.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (106, N'siyah', N'/img/top1.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (107, N'siyah', N'/img/kadıntop2.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (109, N'kırmızı', N'/img/erkek22sweatshirt.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (111, N'gri', N'/img/erkek15sweatshirt.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (112, N'kahverengi', N'/img/kadın13sweatshirt.jpg')
INSERT [dbo].[Renk] ([BarkodNo], [Renk], [Resim]) VALUES (113, N'siyah', N'/img/kadın24sweatshirt.jpg')
GO
SET IDENTITY_INSERT [dbo].[Sepet] ON 

INSERT [dbo].[Sepet] ([KullaniciID], [SepetID], [Miktar], [BarkodNo], [Renk], [Beden]) VALUES (2, 4, 1, 20, N'beyaz', N'L')
SET IDENTITY_INSERT [dbo].[Sepet] OFF
GO
SET IDENTITY_INSERT [dbo].[Sube] ON 

INSERT [dbo].[Sube] ([SubeID], [Sehir], [Ilce], [Cadde_Sokak], [PostaKodu]) VALUES (1, N'Trabzon', N'Ortahisar', N'Kalkınma', 61200)
INSERT [dbo].[Sube] ([SubeID], [Sehir], [Ilce], [Cadde_Sokak], [PostaKodu]) VALUES (2, N'Samsun', N'İlkadım', N'Selahiye', 55100)
INSERT [dbo].[Sube] ([SubeID], [Sehir], [Ilce], [Cadde_Sokak], [PostaKodu]) VALUES (3, N'Ankara', N'Kızılay', N'Karanfil', 6200)
SET IDENTITY_INSERT [dbo].[Sube] OFF
GO
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (2, CAST(2899.00 AS Decimal(7, 2)), N'Kadın', N'Basic', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'75% yün · 25% poliamit', N'KEMERLİ YÜN KARIŞIMLI KABAN', N'Yün karışımlı uzun kaban. Katlı yaka, düğmeli ve bantlı uzun kollu. Aynı kumaştan bağcıklı kemerli. Önü cepli. Uyumlu renkte astarlı. Yanları yırtmaçlı.', CAST(N'2022-12-27T23:45:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (3, CAST(859.00 AS Decimal(7, 2)), N'Kadın', N'Basic', 2, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'KAPÜŞONLU VE KEMERLİ YUMUŞAK KABAN', N'Uzun kollu, kapüşonlu kaban. Önü biyeli cepli, kruvaze düğmeli ve uyumlu kemerli.


Açık yeşil

Bej

Ekru

', CAST(N'2022-12-28T00:00:00' AS SmallDateTime), 0, N'y', 4)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (4, CAST(999.00 AS Decimal(7, 2)), N'Kadın', N'Basic', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'KAPÜŞONLU VE KEMERLİ YUMUŞAK KABAN', N'Uzun kollu, kapüşonlu kaban. Önü biyeli cepli, kruvaze düğmeli ve uyumlu kemerli.', CAST(N'2022-12-28T00:05:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (5, CAST(1499.00 AS Decimal(7, 2)), N'Kadın', N'Basic', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'75% yün · 25% poliamit
', N'PREMIUM YÜN KARIŞIMLI UZUN KABAN

', N'Yün karışımlı uzun kaban. Uyumlu renkte çıkarılabilir suni kürk şeritli katlı yaka. Uzun kollu. Yanı cepli. Aynı kumaştan kuşak kemerli. %100 İtalyan kumaş: Yüksek dayanıklılık standartlarını sağlamak için tasarlanmış geri dönüştürülmüş bir kumaş. Uyumlu renkte astarlı.', CAST(N'2022-12-28T00:06:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (6, CAST(1999.00 AS Decimal(7, 2)), N'kadın', N'Basic', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'ASTAR DETAYLI KISA CEKET', N'Uzun kollu ve dik yaka ceket. Önü fermuarlı cepli. Kemer köprülü ve uyumlu renkte metal tokalı kemerli. Kontrast astarlı. Metal fermuarlı.', CAST(N'2022-12-28T00:08:00' AS SmallDateTime), 5, N'y', 2)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (7, CAST(1599.00 AS Decimal(7, 2)), N'Erkek', N'Basic', 9, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'51% polyester · 24% viskoz · 22% yün · 3% elastan', N'KUŞGÖZÜ DETAYLI KLASİK BLAZER', N'Katlı kelebek yaka straight fit blazer. Manşetleri düğmeli uzun kollu. Biyeli göğüs cepli ve kapaklı kalça hizasında cepli. İç cep detaylı. Arka yırtmaçlı kenarlı. Önü düğmeli.


Mavi

LACİVERT

', CAST(N'2022-12-28T00:10:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (16, CAST(859.00 AS Decimal(7, 2)), N'Erkek', N'Basic', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'68% polyester · 28% viskoz · 4% elastan', N'DOKULU KLASİK BLAZER', N'Çentikli katlı yaka slim fit blazer. Manşetleri düğmeli uzun kollu. Biyeli göğüs cepli ve kalça hizasında cepli. İç cepli, arkası ortadan yırtmaçlı kenarlı ve önü düğmeli.


Kirli-beyaz

LACİVERT

Siyah

', CAST(N'2022-12-28T00:14:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (17, CAST(1599.00 AS Decimal(7, 2)), N'Erkek', N'Basic', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'56% viskoz · 37% polyester · 7% elastan', N'SLIM FIT TAKIM BLAZER''I', N'Çentikli katlı yaka blazer. Manşetleri düğmeli uzun kollu. Biyeli göğüs cepli ve kalça hizasında kapak cepli. İç cepli. Önü düğmeli.', CAST(N'2022-12-28T00:16:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (18, CAST(1699.00 AS Decimal(7, 2)), N'Erkek', N'Basic', 4, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'RAHAT KESİM KABAN', N'Bi stretch kumaş kaban. Çentikli katlı yaka, uzun kollu, biyeli kalça hizasında cepli, iç cepli, arka kenarı ortadan yırtmaçlı ve önü düğmeli.', CAST(N'2022-12-28T00:18:00' AS SmallDateTime), 10, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (19, CAST(1399.00 AS Decimal(7, 2)), N'Erkek', N'Basic', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'52% polyester · 44% yün · 4% diger lifler', N'YÜN KARIŞIMLI KABAN', N'Yün karışımlı kumaş kaban. Sivri katlı yaka ve uzun kollu. Biyeli bel cepli ve iç cepli. Arka kenarı ortadan yırtmaçlı. Önü düğmeli.', CAST(N'2022-12-28T00:19:00' AS SmallDateTime), 0, N'y', 3)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (20, CAST(2899.00 AS Decimal(7, 2)), N'Kadın', N'Kaban', 1, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'97% yün · 3% poliamit', N'PREMIUM YÜN KABAN', N'Vatkalı, uzun kollu ve yakalı kruvaze kaban. Önü kapaklı cepli ve kruvaze düğmeli, arkadan yırtmaçlı.', CAST(N'2022-12-28T00:22:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (38, CAST(1499.00 AS Decimal(7, 2)), N'Kadın', N'Kaban', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'75% yün · 25% poliamit', N'KAŞMİR KARIŞIMLI OVERSIZE KABAN', N'Yün karışımlı oversize kaban. Katlı yaka ve uzun kollu. Kontrast astarlı. Önü cepli ve kruvaze düğmeli.', CAST(N'2022-12-28T00:30:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (39, CAST(2399.00 AS Decimal(7, 2)), N'Kadın', N'Kaban', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester
', N'UZUN BUKLET KABAN - LIMITED EDITION', N'Uzun kollu ve katlı yaka uzun kaban. Kontrast suni deri kuşak kemerli, önü cepli ve uyumlu renkte astarlı.', CAST(N'2022-12-28T00:31:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (40, CAST(2299.00 AS Decimal(7, 2)), N'Kadın', N'Kaban', 7, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'7% diger lifler · 49% yün · 44% polyester', N'UYUMLU RENKTE BOMBER KABAN', N'Yün karışımlı kumaş bomber kaban. Katlı yaka. Fermuarlı cep detaylı elastik manşetli kontrast kapitone uzun kollu. Aynı kumaştan kuşak kemerli. Yan cepli. Arkası yırtmaçlı. Kontrast astarlı.', CAST(N'2022-12-28T00:32:00' AS SmallDateTime), 8, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (41, CAST(2199.00 AS Decimal(7, 2)), N'Kadın', N'Kaban', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'ÇİFT TARAFLI ASTAR DETAYLI KABAN', N'Uzun kollu, katlı yaka, çift taraflı uzun kaban. Yama ön cepli. Uyumlu renk suni yün astarlı. Önü düğmeli.', CAST(N'2022-12-28T00:34:00' AS SmallDateTime), 0, N'y', 1)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (42, CAST(1299.00 AS Decimal(7, 2)), N'Kadın', N'Kaban', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'OVERSIZE KABAN', N'Uzun kollu, katlı yaka, bol kesim blazer. Kapaklı ön cepli ve önü kruvaze düğmeli.', CAST(N'2022-12-28T00:35:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (44, CAST(1099.00 AS Decimal(7, 2)), N'Erkek', N'Kaban', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'2’Sİ 1 ARADA SU GEÇİRMEZ CEKET', N'Teknik kumaş ceket. Dik yaka, kapüşonlu ve ayarlanabilen bantlı manşetli uzun kollu. Kapaklı kalça hizasında cepli. Çıkarılabilir şişme yelek astarlı. Yanları elastik ayarlanabilen kenarlı ve önü çıtçıt düğmeli patletle gizlenen fermuarlı.', CAST(N'2022-12-28T00:38:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (45, CAST(1099.00 AS Decimal(7, 2)), N'Erkek', N'Kaban', 3, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'98% polyester · 2% elastan', N'ÇIKARILABİLEN YAKALI KABAN', N'İçi çıkarılabilen dik yaka kaban. Fitilli şeritli ve ayarlanabilen bantlı uzun kollu. Biyeli kalça hizasında cepli ve iç cep detaylı. Önü içten fermuarlı ve dışı gizli çıtçıt kapamalı.', CAST(N'2022-12-28T00:39:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (46, CAST(2199.00 AS Decimal(7, 2)), N'Erkek', N'Kaban', 1, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'100% polyester', N'KAPÜŞONLU ŞİŞME PARKA', N'Kapitone astarlı parka. Ayarlanabilen kapüşonlu dik yaka ve çıkarılabilen suni kürk şeritli. Biyeli göğüs cepli ve kapaklı yama kalça hizasında cepli. Büzgü ipli içten ayarlanabilen belli. Önü düğmeli patletle gizlenen fermuarlı.', CAST(N'2022-12-28T00:39:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (47, CAST(2199.00 AS Decimal(7, 2)), N'Erkek', N'Kaban', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% naylon', N'SUNİ YÜNLÜ CEKETLİ PARKA', N'Teknik kumaştan bol kesim parka. Çıkarılabilen suni yünlü ceket detaylı astarlı. Ayarlanabilen kapüşonlu dik yaka ve ayarlanabilen düğmeli manşetli uzun kollu. Kapaklı kalça hizasında cepli. İçten ayarlanabilen belli. Önü çıtçıt düğmeli patletle gizlenen fermuarlı.', CAST(N'2022-12-28T00:41:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (48, CAST(1799.00 AS Decimal(7, 2)), N'Erkek', N'Kaban', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'53% polyester · 45% pamuk · 2% elastan', N'DOKULU KABAN', N'Uzun kollu, dik yaka kaban. Biyeli bel cepli ve iç cep detaylı. Arka kenarı ortadan yırtmaçlı. Önü çıtçıt düğmeli patletle gizlenen fermuarlı.', CAST(N'2022-12-28T00:42:00' AS SmallDateTime), 5, N'y', 4)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (59, CAST(859.00 AS Decimal(7, 2)), N'Kadın', N'Ceket', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'100% polyester', N'SOFT BIKER CEKET', N'Uzun kollu ve katlı yaka crop ceket. Önü fermuarlı cepli ve kruvaze metal fermuarlı.', CAST(N'2022-12-28T00:45:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (61, CAST(799.00 AS Decimal(7, 2)), N'Kadın', N'Ceket', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester
', N'DORE DÜĞMELİ YUMUŞAK CEKET', N'Uzun kollu, katlı yakalı crop ceket. Önü kapaklı yama cepli. Önü kabartmalı dore düğmeli.


Gri

', CAST(N'2022-12-28T00:47:00' AS SmallDateTime), 0, N'Y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (62, CAST(1299.00 AS Decimal(7, 2)), N'Kadın', N'Ceket', 9, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'KEMERLİ CROP ASTAR DETAYLI CEKET', N'Suni yün astarlı yakalı ceket. Yakası bantlı ve uzun kollu. Önü fermuarlı cepli. Kenarı kemerli. Önden metal fermuarlı.', CAST(N'2022-12-28T00:47:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (63, CAST(1799.00 AS Decimal(7, 2)), N'Kadın', N'Ceket', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'100% polyester', N'ASTAR DETAYLI CEKET', N'Uzun kollu, dik yaka ceket. Fermuarlı ön cepli. Kemer köprülü ve metal tokalı uyumlu renk kemerli. Kontrast astarlı. Metal fermuarlı.', CAST(N'2022-12-28T00:48:00' AS SmallDateTime), 3, N'y', 2)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (64, CAST(1099.00 AS Decimal(7, 2)), N'Kadın', N'Ceket', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'86% polyester · 14% pamuk', N'SUNİ DERİ OVERSIZE CEKET', N'Uzun kollu, katlı klapalı ceket. Önü metal fermuarlı cepli, vatkalı, aynı kumaştan tokalı kemerli ve metal fermuarlı.', CAST(N'2022-12-28T00:50:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (65, CAST(1799.00 AS Decimal(7, 2)), N'Erkek', N'Ceket', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'ÇİFT YÜZLÜ SUNİ DERİ MONT', N'Suni yünlü astarlı kumaş ceket. Yakası bantlı. Uzun kollu. Biyeli ön cepli. Önü fermuarlı.', CAST(N'2022-12-28T00:51:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (66, CAST(799.00 AS Decimal(7, 2)), N'Erkek', N'Ceket', 0, N'Care for water: daha az su kullanılarak üretilmiştir.

Ürünlerimizin çevre etkisini azaltmaya yardımcı olan teknolojiler ve ham maddeler kullanılarak imal edilen kıyafetleri Join Life olarak etiketlendiriyoruz. ', N'99% pamuk · 1% elastan', N'BASIC DENIM CEKET', N'Düğmeli manşetli uzun kollu, yaka detaylı ceket. Göğsü kapak cepli ve biyeli kalça hizasında cepli. Soluk efektli. Önü düğmeli.', CAST(N'2022-12-28T00:52:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (67, CAST(2499.00 AS Decimal(7, 2)), N'Erkek', N'Ceket', 4, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'72% naylon · 28% pamuk', N'TEKNİK CEKET', N'Hafif teknik kumaştan, hakim yaka, uzun kollu, manşetleri fitilli ceket. Kalça hizasında fermuarlı cepli, bir iç cepli, elastik kenarlı ve önü fermuarlıdır.', CAST(N'2022-12-28T00:53:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (68, CAST(1599.00 AS Decimal(7, 2)), N'Erkek', N'Ceket', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'KONTRAST BOMBER CEKET', N'İçi hafif dolgulu kolej ceket. Fitilli yaka ve elastik manşetli uzun kollu. Biyeli bel cepli ve iç cepli. Fitilli kenarlı. Önü çıtçıt düğmeli.', CAST(N'2022-12-28T00:55:00' AS SmallDateTime), 2, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (69, CAST(2199.00 AS Decimal(7, 2)), N'Erkek', N'Ceket', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'75% yün · 25% poliamit', N'YÜN KARIŞIMLI CEKET - LIMITED EDITION', N'Yün karışımlı kumaştan boxy fit ceket. Katlı yaka ve uzun kollu. Yama göğüs cepli. Önü patletle gizlenen düğmeli.', CAST(N'2022-12-28T00:56:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (71, CAST(1399.00 AS Decimal(7, 2)), N'Kadın', N'Blazer', 5, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'50% yün · 50% polyester', N'BUKLET DOKULU YÜN KARIŞIMLI UZUN BLAZER', N'Yün karışımlı blazer. Katlı yaka, vatkalı ve uzun kollu. Önü kapaklı cepli ve kabartmalı metalik düğmeli kruvaze.', CAST(N'2022-12-28T11:08:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (82, CAST(1199.00 AS Decimal(7, 2)), N'Kadın', N'Blazer', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'74% polyester · 19% viskoz · 7% elastan', N'KRUVAZE OVERSIZE BLAZER', N'Önü kruvaze düğmeli ve kapaklı cepli, omuzları belirgin, uzun kollu, katlı yaka ve dökümlü blazer ceket.', CAST(N'2022-12-28T11:13:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (83, CAST(1099.00 AS Decimal(7, 2)), N'Kadın', N'Blazer', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'64% polyester · 32% viskoz · 4% elastan', N'ÖZEL DİKİM KRUVAZE BLAZER

', N'Katlı yaka, uzun kollu blazer ceket. Omuzları belirgin, kapaklı ön cepli ve önü kruvaze metal düğme iliklemeli.', CAST(N'2022-12-28T11:15:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (84, CAST(1299.00 AS Decimal(7, 2)), N'Erkek', N'Blazer', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'DIŞI KAUÇUK KAPLAMALI İNCE CEKET', N'Dışı kauçuk kaplamalı kumaştan, yakalı ince ceket. Dolgulu astarlı. Düğmeli manşetli uzun kollu. Göğsü kapaklı yama cepli ve önü çıtçıt düğmeli.


Yoğun yeşil

Kirli-beyaz

', CAST(N'2022-12-28T11:16:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (85, CAST(799.00 AS Decimal(7, 2)), N'Erkek', N'Blazer', 6, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'SUNİ YÜNLÜ İNCE CEKET', N'Düğmeli manşetli uzun kollu, yakalı ince ceket. Göğsü yama cepli. Önü düğmeli.', CAST(N'2022-12-28T11:16:00' AS SmallDateTime), 0, N'y', 8)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (86, CAST(999.00 AS Decimal(7, 2)), N'Erkek', N'Blazer', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'80% polyester · 10% akrilik · 10% viskoz', N'CEPLİ İNCE CEKET', N'Uzun kollu, manşetleri düğmeli, önü düğmeli, yakalı, relaxed fit ince ceket. Kapaklı yama göğüs cepli ve kalça hizasında yan ceplidir.', CAST(N'2022-12-28T11:17:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (87, CAST(1199.00 AS Decimal(7, 2)), N'Kadın', N'Yelek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'100% polyester', N'ASTAR DETAYLI YELEK', N'Katlı yaka yelek. Fermuarlı ön cepli. Beli ayarlanabilir kemerli. Uyumlu renk astarlı. Önü metal fermuarlı.', CAST(N'2022-12-28T11:18:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (88, CAST(1199.00 AS Decimal(7, 2)), N'Kadın', N'Yelek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'SUNİ KÜRK YELEK', N'Ön cepli, bisiklet yaka yelek. Önü çoban düğmeli ve suni deri aplikeli.', CAST(N'2022-12-28T11:19:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (89, CAST(999.00 AS Decimal(7, 2)), N'Kadın', N'Yelek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester
', N'SU GEÇİRMEZ ÇİFT TARAFLI YELEK

', N'Bağcıklı kapüşonlu, dik yaka kolsuz yelek. Astarlı ve düğmeli kapaklı ön cepli. Yanları fermuarlı kenarlı. Önü fermuarlı.', CAST(N'2022-12-28T11:20:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (90, CAST(859.00 AS Decimal(7, 2)), N'Erkek', N'Yelek', 8, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% naylon', N'ŞİŞME YELEK', N'Yırtılmaya karşı dayanıklı, dokulu rip-stop şişme yelek. Dik yakalı. Kalça hizasında fermuarlı biyeli cepli. Yanlardan elastik ayarlanabilen kenarlı. Önü fermuarlı.', CAST(N'2022-12-28T11:21:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (91, CAST(699.00 AS Decimal(7, 2)), N'Erkek', N'Yelek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'KAPLAMALI YÜZEYLİ YELEK', N'Yüzeyi kaplamalı kumaşlı şişme yelek. Kolsuz ve dik yaka tasarımlı. Göğsü fermuarlı yama cepli ve biyeli bel cepli. Önü fermuarlı.

', CAST(N'2022-12-28T11:22:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (92, CAST(999.00 AS Decimal(7, 2)), N'Erkek', N'Yelek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'85% polyester · 15% pamuk', N'KAPÜŞONLU ŞİŞME YELEK', N'Ayarlanabilir kapüşonlu, dik yaka şişme yelek. Kapaklı bel cepli ve iç cepli. Yanları elastik detaylı kenarlı. Önü çıtçıtlı patletle gizlenen fermuarlı.', CAST(N'2022-12-28T11:23:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (93, CAST(699.00 AS Decimal(7, 2)), N'Kadın', N'Elbise', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'SUNİ DERİ ELBİSE', N'Omzu açık, düz yaka midi elbise. Büzgü detaylı. Arkadan yırtmaçlı. Uyumlu renkte astarlı. Yanı gizli fermuarlı.', CAST(N'2022-12-28T11:25:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (94, CAST(599.00 AS Decimal(7, 2)), N'Kadın', N'Elbise', 17, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'43% polyester · 42% akrilik · 8% yün · 7% viskoz', N'FİYONKLU TRİKO MİNİ ELBİSE', N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', CAST(N'2022-12-28T11:26:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (95, CAST(859.00 AS Decimal(7, 2)), N'Kadın', N'Triko', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'100% yün
', N'%100 YÜN ÇİZGİLİ KAZAK', N'%100 yün kazak. Uzun kollu ve bisiklet yaka.', CAST(N'2022-12-28T11:28:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (96, CAST(659.00 AS Decimal(7, 2)), N'Kadın', N'Triko', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'53% polyester · 35% akrilik · 9% yün · 3% elastan', N'SIRT DEKOLTELİ DİK YAKA TRİKO KAZAK', N'Bağcıklı sırt dekolteli, dik yaka, uzun kollu, crop kazak.', CAST(N'2022-12-28T11:29:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (97, CAST(799.00 AS Decimal(7, 2)), N'Erkek', N'Kazak', 0, N'Care for water: daha az su kullanılarak üretilmiştir.

Ürünlerimizin çevre etkisini azaltmaya yardımcı olan teknolojiler ve ham maddeler kullanılarak imal edilen kıyafetleri Join Life olarak etiketlendiriyoruz. ', N'100% pamuk', N'FERMUARLI DİK YAKA KAZAK', N'İnceltilmiş pamuklu kumaş kazak. Uzun kollu, önü fermuarlı dik yaka ve fitilli kenarlı.


LACİVERT

', CAST(N'2022-12-28T11:30:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (100, CAST(599.00 AS Decimal(7, 2)), N'Erkek', N'Kazak', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'51% akrilik · 31% polyester · 15% yün · 3% elastan', N'DOKULU KAZAK', N'Fitilli şeritli, uzun kollu, bisiklet yaka kazak.', CAST(N'2022-12-28T00:00:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (102, CAST(559.00 AS Decimal(7, 2)), N'Kadın', N'Gömlek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester', N'FIRFIRLI SATEN GÖMLEK', N'Uzun kollu, yakalı gömlek. Fırfır şeritli. Önü patletle gizlenen düğmeli.', CAST(N'2022-12-28T11:33:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (103, CAST(559.00 AS Decimal(7, 2)), N'Kadın', N'Gömlek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% polyester
', N'ÇİZGİLİ OVERSIZE GÖMLEK', N'Uzun kollu, geniş katlı yaka ve önü düğmeli saten gömlek.', CAST(N'2022-12-28T11:34:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (104, CAST(599.00 AS Decimal(7, 2)), N'Erkek', N'Gömlek', 5, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% pamuk', N'İNCE FİTİLLİ KADİFE GÖMLEK', N'Uzun kollu, manşetleri düğmeli, yama göğüs cepli, yakalı, regular fit gömlek. Önü düğmelidir.', CAST(N'2022-12-28T11:36:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (105, CAST(659.00 AS Decimal(7, 2)), N'Erkek', N'Gömlek', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'67% polyester · 32% viskoz · 1% elastan
', N'CEPLİ DOKULU GÖMLEK', N'Dokulu elastik kumaştan regular fit gömlek. Yakalı ve düğmeli manşetli uzun kollu. Yama göğüs cepli. Önü düğmeli.', CAST(N'2022-12-28T11:37:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (106, CAST(279.00 AS Decimal(7, 2)), N'Kadın', N'Top', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'95% pamuk · 5% elastan
', N'BÜZGÜLÜ TOP', N'Dik yaka ve uzun kollu büzgülü bluz.', CAST(N'2022-12-28T11:38:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (107, CAST(599.00 AS Decimal(7, 2)), N'Kadın', N'Top', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'100% viskoz', N'VATKALI TOP', N'Viskoz kolsuz top. Dik yaka, vatkalı ve gizli fermuarlı.', CAST(N'2022-12-28T11:39:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (109, CAST(699.00 AS Decimal(7, 2)), N'Erkek', N'Sweatshirt', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'58% polyester · 42% pamuk', N'FERMUARLI YAKA SWEATSHIRT', N'Kenarları fitilli, uzun kollu, önü fermuarlı dik yaka sweatshirt.


Koyu kırmızı

LACİVERT

', CAST(N'2022-12-28T11:41:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (111, CAST(749.00 AS Decimal(7, 2)), N'Erkek', N'Sweatshirt', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'67% pamuk · 33% polyester', N'RENKLİ SWEATSHIRT', N'Uzun kollu, fitilli kenarlı, bisiklet yaka sweatshirt.', CAST(N'2022-12-28T11:43:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (112, CAST(599.00 AS Decimal(7, 2)), N'Kadın', N'Sweatshirt', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.
', N'63% pamuk · 37% polyester', N'İP İŞLEMELİ SWEATSHIRT', N'Uzun kollu, bisiklet yaka sweatshirt. Önü işleme detaylı. Kenarı fitilli.', CAST(N'2022-12-28T11:45:00' AS SmallDateTime), 0, N'y', 0)
INSERT [dbo].[Urun] ([BarkodNo], [Fiyat], [Cinsiyet], [Kategori], [SatisSayisi], [Malzeme], [Dış], [Ad], [Açıklama], [EklenmeTarihi], [IadeMiktari], [YasAraligi], [FavoriSayisi]) VALUES (113, CAST(399.00 AS Decimal(7, 2)), N'Kadın', N'Sweatshirt', 0, N'Ürünlerimizin sosyal ve çevresel standartların yanı sıra sağlık ve güvenlik standartlarına uymasını sağlamak için takip programlarıyla birlikte çalışıyoruz.

Uyumluluğu değerlendirmek adına bir denetim programı ve sürekli gelişim planları oluşturduk.', N'55% polyester · 45% pamuk', N'YUMUŞAK SWEATSHIRT', N'Uzun kollu, bisiklet yaka sweatshirt. Yumuşak dokulu kumaş.', CAST(N'2022-12-28T11:46:00' AS SmallDateTime), 0, N'y', 0)
SET IDENTITY_INSERT [dbo].[Urun] OFF
GO
ALTER TABLE [dbo].[Favoriler] ADD  CONSTRAINT [DF_Favoriler_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[Fis] ADD  CONSTRAINT [DF_Fis_Tarih]  DEFAULT (getdate()) FOR [Tarih]
GO
ALTER TABLE [dbo].[Urun] ADD  CONSTRAINT [DF_Urun_EklenmeTarihi]  DEFAULT (getdate()) FOR [EklenmeTarihi]
GO
ALTER TABLE [dbo].[Adres]  WITH CHECK ADD  CONSTRAINT [FK_Adres_Musteri] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Musteri] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Adres] CHECK CONSTRAINT [FK_Adres_Musteri]
GO
ALTER TABLE [dbo].[Beden]  WITH CHECK ADD  CONSTRAINT [FK_Beden_Urun] FOREIGN KEY([BarkodNo])
REFERENCES [dbo].[Urun] ([BarkodNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Beden] CHECK CONSTRAINT [FK_Beden_Urun]
GO
ALTER TABLE [dbo].[Email]  WITH CHECK ADD  CONSTRAINT [FK_Email_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Email] CHECK CONSTRAINT [FK_Email_Kullanici]
GO
ALTER TABLE [dbo].[Favoriler]  WITH CHECK ADD  CONSTRAINT [FK_Favoriler_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favoriler] CHECK CONSTRAINT [FK_Favoriler_Kullanici]
GO
ALTER TABLE [dbo].[Favoriler]  WITH CHECK ADD  CONSTRAINT [FK_Favoriler_Urun] FOREIGN KEY([BarkodNo])
REFERENCES [dbo].[Urun] ([BarkodNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favoriler] CHECK CONSTRAINT [FK_Favoriler_Urun]
GO
ALTER TABLE [dbo].[Fis]  WITH CHECK ADD  CONSTRAINT [FK_Fis_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Fis] CHECK CONSTRAINT [FK_Fis_Kullanici]
GO
ALTER TABLE [dbo].[FisUrun]  WITH CHECK ADD  CONSTRAINT [FK_FisUrun_Fis] FOREIGN KEY([FisID])
REFERENCES [dbo].[Fis] ([FisID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FisUrun] CHECK CONSTRAINT [FK_FisUrun_Fis]
GO
ALTER TABLE [dbo].[FisUrun]  WITH CHECK ADD  CONSTRAINT [FK_FisUrun_Urun] FOREIGN KEY([BarkodNo])
REFERENCES [dbo].[Urun] ([BarkodNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FisUrun] CHECK CONSTRAINT [FK_FisUrun_Urun]
GO
ALTER TABLE [dbo].[KrediKarti]  WITH CHECK ADD  CONSTRAINT [FK_KrediKarti_Musteri] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Musteri] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KrediKarti] CHECK CONSTRAINT [FK_KrediKarti_Musteri]
GO
ALTER TABLE [dbo].[Musteri]  WITH CHECK ADD  CONSTRAINT [FK_Musteri_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Musteri] CHECK CONSTRAINT [FK_Musteri_Kullanici]
GO
ALTER TABLE [dbo].[Renk]  WITH CHECK ADD  CONSTRAINT [FK_Renk_Urun] FOREIGN KEY([BarkodNo])
REFERENCES [dbo].[Urun] ([BarkodNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Renk] CHECK CONSTRAINT [FK_Renk_Urun]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Kullanici] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanici] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Kullanici]
GO
ALTER TABLE [dbo].[Sepet]  WITH CHECK ADD  CONSTRAINT [FK_Sepet_Urun] FOREIGN KEY([BarkodNo])
REFERENCES [dbo].[Urun] ([BarkodNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sepet] CHECK CONSTRAINT [FK_Sepet_Urun]
GO
ALTER TABLE [dbo].[UrunDetay]  WITH CHECK ADD  CONSTRAINT [FK_UrunDetay_Urun] FOREIGN KEY([BarkodNo])
REFERENCES [dbo].[Urun] ([BarkodNo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UrunDetay] CHECK CONSTRAINT [FK_UrunDetay_Urun]
GO
USE [master]
GO
ALTER DATABASE [Data] SET  READ_WRITE 
GO
