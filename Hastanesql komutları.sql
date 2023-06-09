USE [master]
GO
/****** Object:  Database [Hastane]    Script Date: 20.03.2023 16:44:35 ******/
CREATE DATABASE [Hastane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hastane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hastane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hastane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hastane] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hastane] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hastane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hastane]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[DogumTarihi] [int] NULL,
	[Adres] [varchar](50) NULL,
	[Brans] [nchar](10) NULL,
	[MezunOlduguOkul] [varchar](50) NULL,
	[PoliklinikNo] [int] NULL,
 CONSTRAINT [PK_Doktorlarr] PRIMARY KEY CLUSTERED 
(
	[DoktorNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[HastaTc] [nchar](11) NULL,
	[Boy] [nchar](10) NULL,
	[Yas] [nchar](10) NULL,
	[DoktorNo] [int] NULL,
 CONSTRAINT [PK_Hastalarr] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanıcılar]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanıcılar](
	[KullanıcıNo] [int] IDENTITY(1,1) NOT NULL,
	[KullanıcıAdi] [varchar](50) NULL,
	[Sifre] [nchar](10) NULL,
 CONSTRAINT [PK_Kullanıcılar] PRIMARY KEY CLUSTERED 
(
	[KullanıcıNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinikler]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinikler](
	[PoliklinikNo] [int] IDENTITY(1,1) NOT NULL,
	[KlinikAdi] [varchar](50) NULL,
	[YatakSayisi] [int] NULL,
	[PoliklinikUzmanSayisi] [int] NULL,
	[PoliklinikBaskani] [varchar](50) NULL,
	[PoliklinikBashemsire] [varchar](50) NULL,
 CONSTRAINT [PK_Poliklinikler] PRIMARY KEY CLUSTERED 
(
	[PoliklinikNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (1, N'Hakan Emir', 20061999, N'papatya mahallesi', N'kbb       ', N'marmara', 1)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (7, N'Başak Yıld', 20061999, N'Düzce', N'Göz       ', N'İstanbul Teknik', 2)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (8, N'ahmet     ', 56668888, N'Tokat', N'beyin     ', N'cumhuriyet üniversitrsi', 3)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (9, N'mehmet kar', 19021967, N'İstanbul', N'kalp      ', N'İstanbul üniversitesi', 4)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (10, N'Ayşe Fırat', 55355386, N'Sivas', N'Göz       ', N'Marmara', 5)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (11, N'Sinem Arslan', 20061999, N'Ataşehir', N'dahiliye  ', N'istanbul', 1)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (12, N'Aslı      ', 20061999, N'ataşehir', N'kalp      ', N'istanbul', 3)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (13, N'Melisa', 20061999, N'istanbul', N'kalp      ', N'tokat', 2)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (14, N'Sinem     ', 20061999, N'tokat', N'kbb       ', N'aöf', 2)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (15, N'ahmet     ', 56668888, N'Tokat', N'beyin     ', N'cumhuriyet üniversitrsi', 3)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (16, N'Beste Kartal', 5051999, N'Antalya', N'Göz       ', N'itü', 7)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (17, N'Mehmet Avc', 556665, N'Sivas', N'kbb       ', N'Aydın Üviversitesi', 4)
INSERT [dbo].[Doktorlar] ([DoktorNo], [AdSoyad], [DogumTarihi], [Adres], [Brans], [MezunOlduguOkul], [PoliklinikNo]) VALUES (20, N'fhnfhnf', 4021879, N'hyjfyj', N'yjryjr    ', N'tjrr', 1)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (1, N'dg', N'6546       ', N'67        ', N'32        ', 1)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (4, N'ahmet', N'6565658    ', N'165       ', N'40        ', 7)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (5, N'zeynep', N'1566689898 ', N'56        ', N'19        ', 8)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (6, N'Fatma', N'5468798798 ', N'15        ', N'65        ', 9)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (7, N'Kerem', N'25646878789', N'180       ', N'25        ', 10)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (8, N'Kamil', N'12345678910', N'170       ', N'23        ', 9)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (9, N'Büşra Kuş', N'12345678   ', N'165       ', N'60        ', 16)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (10, N'Sertap Arslan', N'46586465846', N'170       ', N'25        ', 7)
INSERT [dbo].[Hastalar] ([HastaNo], [AdSoyad], [HastaTc], [Boy], [Yas], [DoktorNo]) VALUES (11, N'Doruk Çarpar', N'12345678910', N'180       ', N'24        ', 7)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanıcılar] ON 

INSERT [dbo].[Kullanıcılar] ([KullanıcıNo], [KullanıcıAdi], [Sifre]) VALUES (1, N'sa', N'1234      ')
INSERT [dbo].[Kullanıcılar] ([KullanıcıNo], [KullanıcıAdi], [Sifre]) VALUES (2, N'ak', N'777       ')
INSERT [dbo].[Kullanıcılar] ([KullanıcıNo], [KullanıcıAdi], [Sifre]) VALUES (3, N'bp', N'888       ')
INSERT [dbo].[Kullanıcılar] ([KullanıcıNo], [KullanıcıAdi], [Sifre]) VALUES (4, N'mka', N'444       ')
INSERT [dbo].[Kullanıcılar] ([KullanıcıNo], [KullanıcıAdi], [Sifre]) VALUES (5, N'kkk', N'111       ')
SET IDENTITY_INSERT [dbo].[Kullanıcılar] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinikler] ON 

INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (1, N'dahiliye', 2, 4, N'3', N'2')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (2, N'kardiyoloji', 5, 5, N'2', N'1')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (3, N'kbb', 10, 2, N'1', N'1')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (4, N'psikiyatri', 20, 5, N'2', N'6')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (5, N'ortopedi', 7, 2, N'2', N'3')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (6, N'göz', 15, 5, N'1', N'2')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (7, N'KadınHastalıkları ve doğum', 30, 8, N'5', N'4')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (8, N'Üroloji', 25, 10, N'5', N'4')
INSERT [dbo].[Poliklinikler] ([PoliklinikNo], [KlinikAdi], [YatakSayisi], [PoliklinikUzmanSayisi], [PoliklinikBaskani], [PoliklinikBashemsire]) VALUES (10, N'ppp', 5, 6, N'7', N'7')
SET IDENTITY_INSERT [dbo].[Poliklinikler] OFF
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlarr_Poliklinikler] FOREIGN KEY([PoliklinikNo])
REFERENCES [dbo].[Poliklinikler] ([PoliklinikNo])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlarr_Poliklinikler]
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalarr_Doktorlarr] FOREIGN KEY([DoktorNo])
REFERENCES [dbo].[Doktorlar] ([DoktorNo])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalarr_Doktorlarr]
GO
/****** Object:  StoredProcedure [dbo].[Doktaradsoyadveklinikad]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Doktaradsoyadveklinikad]
as
select Adsoyad,klinikadi from Doktorlar inner join Poliklinikler on Doktorlar.PoliklinikNo=Poliklinikler.PoliklinikNo
GO
/****** Object:  StoredProcedure [dbo].[Doktorhastabilgi]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Doktorhastabilgi]
as 
select *  from Hastalar inner join Doktorlar on Hastalar.DoktorNo=Hastalar.DoktorNo
GO
/****** Object:  StoredProcedure [dbo].[DoktorlarEkle]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DoktorlarEkle]
@AdSoyad varchar(50),
@DogumTarihi int,
@Adres varchar(50),
@Brans nchar(10),
@MezunOlduguOkul varchar(50),
@PoliklinikNo int
as begin
insert into
Doktorlar(AdSoyad,DogumTarihi,Adres,Brans,MezunOlduguOkul,PoliklinikNo)values(@AdSoyad,@DogumTarihi,@Adres,@Brans,@MezunOlduguOkul,@PoliklinikNo)
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorlarListele]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DoktorlarListele]
as begin
select*from Doktorlar
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorlarYenile]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DoktorlarYenile]
@DoktorNo int,
@AdSoyad nchar(10),
@DogumTarihi int,
@Adres varchar(50),
@Brans nchar(10),
@MezunOlduguOkul varchar(50),
@PoliklinikNo int
as begin
update Doktorlar set AdSoyad=@AdSoyad,DogumTarihi=@DogumTarihi,Adres=@Adres,Brans=@Brans,MezunOlduguOkul=@MezunOlduguOkul,PoliklinikNo=@PoliklinikNo where DoktorNo=@DoktorNo 
end
GO
/****** Object:  StoredProcedure [dbo].[DoktorSil]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DoktorSil]
@DoktorNo int
as begin
delete from Doktorlar where @DoktorNo=DoktorNo
end
GO
/****** Object:  StoredProcedure [dbo].[HastaAdiSirala]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaAdiSirala]
as begin
select * from Hastalarr order by
AdSoyad desc
end
GO
/****** Object:  StoredProcedure [dbo].[HastaEkle]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaEkle]
@AdSoyad varchar(50),
@HastaTc nvarchar(11),
@Boy nvarchar(10),
@Yas nvarchar(10),
@DoktorNo int
as begin
insert into
Hastalar(AdSoyad,HastaTc,Boy,Yas,DoktorNo)values(@AdSoyad,@HastaTc,@Boy,@Yas,@DoktorNo)
end
GO
/****** Object:  StoredProcedure [dbo].[HastalarListele]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HastalarListele]
as begin 
select *from Hastalar
end
GO
/****** Object:  StoredProcedure [dbo].[Hastalaryas]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Hastalaryas]
as
select AdSoyad,yas from Hastalar order by Yas desc
GO
/****** Object:  StoredProcedure [dbo].[HastaSırala]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaSırala]
as begin
select *from Hastalarr order by
AdSoyad desc
end
GO
/****** Object:  StoredProcedure [dbo].[HastaSil]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaSil] 
@HastaNo int
as begin
delete from Hastalar where @HastaNo=HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HastaYenile]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HastaYenile]
@HastaNo int,
@AdSoyad varchar(50),
@HastaTc nvarchar(11),
@Boy nvarchar (10),
@Yas nvarchar(10),
@DoktorNo int
as begin
update Hastalar set AdSoyad=@AdSoyad,HastaTc=@HastaTc,Boy=@Boy,Yas=@Yas,DoktorNo=@DoktorNo where HastaNo=@HastaNo end
GO
/****** Object:  StoredProcedure [dbo].[KullanıcılarListele]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KullanıcılarListele]
as begin
select *from Kullanıcılar
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikEkle]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PoliklinikEkle]
@KlinikAdi varchar(50),
@YatakSayisi int,
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBashemsire varchar(50)
as begin
insert into
Poliklinikler(KlinikAdi,YatakSayisi,PoliklinikUzmanSayisi,PoliklinikBaskani,PoliklinikBashemsire)values(@KlinikAdi,@YatakSayisi,@PoliklinikUzmanSayisi,@PoliklinikBaskani,@PoliklinikBashemsire)
end
GO
/****** Object:  StoredProcedure [dbo].[PolikliniklerListele]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PolikliniklerListele]
as begin
select *from Poliklinikler
end
GO
/****** Object:  StoredProcedure [dbo].[PoliklinikSil]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklinikSil]
@Poliklinikno int
as begin
delete from Poliklinikler where @PoliklinikNo=PoliklinikNo
end
GO
/****** Object:  StoredProcedure [dbo].[Poliklinikuzmansayisinagore]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Poliklinikuzmansayisinagore]
as
select KlinikAdi,PoliklinikUzmanSayisi from Poliklinikler order by PoliklinikUzmanSayisi asc
GO
/****** Object:  StoredProcedure [dbo].[Poliklinikyataksayisi]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Poliklinikyataksayisi]
as 
select klinikadi,yataksayisi from Poliklinikler order by YatakSayisi desc
GO
/****** Object:  StoredProcedure [dbo].[PoliklniklerYenile]    Script Date: 20.03.2023 16:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PoliklniklerYenile]
@Poliklinikno int,
@KlinikAdi varchar(50),
@YatakSayisi int,
@PoliklinikUzmanSayisi int,
@PoliklinikBaskani varchar(50),
@PoliklinikBashemsire varchar(50)
as begin
update Poliklinikler set KlinikAdi=@KlinikAdi,YatakSayisi=@YatakSayisi,PoliklinikUzmanSayisi=@PoliklinikUzmanSayisi,PoliklinikBaskani=@PoliklinikBaskani,PoliklinikBashemsire=@PoliklinikBashemsire where PoliklinikNo=@PoliklinikNo
end
GO
USE [master]
GO
ALTER DATABASE [Hastane] SET  READ_WRITE 
GO
