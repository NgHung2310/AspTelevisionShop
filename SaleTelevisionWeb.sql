USE [master]
GO
/****** Object:  Database [SaleTelevisionWeb]    Script Date: 4/11/2023 8:41:34 AM ******/
CREATE DATABASE [SaleTelevisionWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SaleTelevisionWeb', FILENAME = N'C:\Users\bagia\SaleTelevisionWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SaleTelevisionWeb_log', FILENAME = N'C:\Users\bagia\SaleTelevisionWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SaleTelevisionWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SaleTelevisionWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SaleTelevisionWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SaleTelevisionWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SaleTelevisionWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SaleTelevisionWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SaleTelevisionWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SaleTelevisionWeb] SET  MULTI_USER 
GO
ALTER DATABASE [SaleTelevisionWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SaleTelevisionWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SaleTelevisionWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SaleTelevisionWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SaleTelevisionWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SaleTelevisionWeb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SaleTelevisionWeb] SET QUERY_STORE = OFF
GO
USE [SaleTelevisionWeb]
GO
/****** Object:  Table [dbo].[CustomerCart]    Script Date: 4/11/2023 8:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[TelevisionId] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Time] [datetime] NULL,
	[Total] [varchar](20) NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_CustomerCart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Television]    Script Date: 4/11/2023 8:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Television](
	[Id] [varchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Image] [nvarchar](100) NULL,
	[Size] [int] NULL,
	[Resolution] [nvarchar](50) NULL,
	[Brandname] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Price] [varchar](20) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Television] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 4/11/2023 8:41:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](20) NULL,
	[Role] [varchar](50) NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomerCart] ON 

INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (1005, 2, N'52LG4096', 1, CAST(N'2023-03-17T08:20:40.000' AS DateTime), N'4999999', N'Completed')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (1006, 2, N'60Xi720', 2, CAST(N'2023-03-17T08:20:44.000' AS DateTime), N'9000000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (1007, 2, N'42SS81922', 2, CAST(N'2023-03-17T08:20:44.000' AS DateTime), N'15000000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (1009, 2, N'42SS81921', 1, CAST(N'2023-03-17T08:35:01.000' AS DateTime), N'7000000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (1010, 2, N'60Xi720', 1, CAST(N'2023-03-17T08:35:51.000' AS DateTime), N'4500000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (2002, 2, N'42SS81922', 1, CAST(N'2023-03-27T23:25:17.000' AS DateTime), N'7500000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (2003, 2, N'60Xi7201', 1, CAST(N'2023-03-27T23:25:17.000' AS DateTime), N'9500000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (3002, 2, N'52LG40961', 1, CAST(N'2023-03-27T23:25:17.000' AS DateTime), N'6000000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (3003, 2, N'42SS81921', 3, CAST(N'2023-03-27T23:28:30.000' AS DateTime), N'21000000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (3004, 2, N'60Xi720', 1, CAST(N'2023-03-27T23:28:30.000' AS DateTime), N'4500000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (3005, 2, N'52LG4096', 3, CAST(N'2023-03-27T23:30:08.000' AS DateTime), N'15000000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (3006, 2, N'42SS8192', 1, CAST(N'2023-03-27T23:30:08.000' AS DateTime), N'8000000', N'Shipping')
INSERT [dbo].[CustomerCart] ([Id], [CustomerId], [TelevisionId], [Quantity], [Time], [Total], [State]) VALUES (3007, 2, N'52LG40961', 1, CAST(N'2023-03-27T23:37:23.000' AS DateTime), N'6000000', N'Shipping')
SET IDENTITY_INSERT [dbo].[CustomerCart] OFF
GO
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'2TC32EG2X', N'Android Tivi Sharp 32 inch ', N'android-tivi-sharp-32-inch-5-550x340.jpg', 32, N'2k', N'Sharp', N'Smart TV', N'4490000', N'Android Tivi Sharp 32 inch 2T-C32EG2X có kích thướcc 32 inch, độ phân giải HD đảm bảo hình ảnh xem duc chun nét. Công ngh HDR10 làm tang thêm d tuong phn và màu sc trên tivi, Wide Color Gamut tang s lung màu sc làm cho hình nh chân thc hon, Dolby Audio âm thanh vòm sng dng, mnh m. H diu hành Android 11 thân thin, d s dng, kho ng dng phong phú.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'32HX6200', N'Smart Tivi Casper 32 inch ', N'casper-32hx6200-550x340.jpg', 32, N'2k', N'Casper', N'Smart TV', N'4300000', N'Smart Tivi Casper 32 inch 32HX6200 thit k lch lãm vi gam màu den sang trng, màn hình tràn vin 3 cnh, cho tm nhìn ca bn "khóa cht" vào ni dung dang duc trình chiu, hn ch xao nhãng khi xem tivi. Chân d ch V úp nguc gi tivi dng n dnh trên mt bàn, k.

Kích c tivi 32 inch nh gn, bày trí phù hp cho phòng ng, phòng khách, van phòng nh theo kiu d bàn hoc treo tung tùy theo thit k ni tht ca ngôi nhà, công ty.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'32LQ636BPSA', N'Smart Tivi LG 32 inch ', N'smart-lg-32-inch-32lq636bpsa-160522-095442-550x340.png', 32, N'2k', N'LG', N'Smart TV', N'8000000', N'- Smart Tivi LG 32 inch 32LQ636BPSA có kt cu chc chn, dung vin màu den mnh m, tôn lên nét thanh lch, hin di ca mi không gian sng.

- Màn hình kích c 32 inch b trí gn gàng trong các phòng khách, phòng ng, phòng làm vic có din tích nh và va.

- Chân d nha bn b, kiu dáng ch V úp nguc nâng d tivi n dnh khi dt trên bàn, k t. Bn cung có th lp dt kiu treo tung d không gian ni tht thêm thoáng rng.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'32S52', N'Android Tivi iFFALCON 32 inch ', N'android-tivi-iffalcon-32-inch-32s52-120822-054335-550x340.jpg', 32, N'2k', N'iFFALCON', N'Smart TV', N'4290000', N'Android Tivi iFFalcon 32 inch 32S52 nh gn, tinh t, cht lung khung hình HD rõ nét vi công ngh tuong phn tt HDR10 và HLG, âm thanh Dolby Audio mnh m, lan ta, gii trí tha sc cùng kho ng dng trên h diu hành Android 11.0, dáp ng nhu cu gia dình.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'42SS8192', N'TV SamSung 42inch 8k', N'42SS8192.png', 42, N'8K Oled', N'Samsung', N'Smart TV', N'8000000', N'Description TV SamSung 42inch 8k')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'42SS81921', N'TV SamSung 42inch 8k', N'42SS8192.png', 42, N'8K Oled', N'Samsung', N'Smart TV', N'7000000', N'Description TV SamSung 42inch 8k')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'42SS81922', N'TV SamSung 42inch 8k', N'42SS8192.png', 42, N'8K Oled', N'Samsung', N'Basic TV', N'7500000', N'Description TV SamSung 42inch 8k')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'43FG5200', N'Android Tivi Casper 43 inch ', N'casper-43fg5200-1.-550x340.jpg', 43, N'2k', N'Casper', N'Smart TV', N'5990000', N'Android Tivi Casper 43 inch 43FG5200 có kiu dáng ti gin, sang trng vi gam màu den thanh lch, dng vng vàng trên mt bàn, k tivi nh có chân d hình ch V úp nguc cng cáp. Nu không thích kiu b trí d bàn, bn cung có th chn cách treo tung, tivi lp dt don gin và tin li.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'43FX6200', N'Smart Tivi Casper 43 inch 43FX6200', N'casper-43fx6200-1-550x340.jpg', 43, N'2k', N'Casper', N'Smart TV', N'5930000', N'Smart Tivi Casper 43 inch 43FX6200 duc thit k vi màn hình tràn vin ba cnh sang trng, mang li tri nghim vô cùng hoàn ho và n tung. Chân d ch V úp nguc giúp tivi dng vng vàng và n dnh. 

Tivi Casper 43 inch gn gàng, phù hp dt  các v trí nhu: phòng khách, phòng ng, van phòng nh...')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'43U62', N'Google Tivi iFFALCON 4K 43 inch ', N'google-tivi-iffalcon-4k-43-inch-43u62-120822-061012-550x340.jpg', 43, N'4K', N'iFFALCON', N'Smart TV', N'6350000', N'Google Tivi iFFalcon 4K 43 inch 43U62 thit k thanh mnh, sang trng, màn hình 4K sc nét, sng dng vi tuong phn HDR10 và HLG, âm thanh da chiu Dolby Audio lan ta, cùng vi kho ng dng phong phú trên Google TV và các tin ích thông minh khác cho bn tri nghim dm chìm trong tng khung gi gii trí.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'48C2PSA', N'Smart Tivi OLED LG 4K 48 inch ', N'smart-oled-lg-4k-48-inch-48c2psa-160622-100815-550x340.jpg', 48, N'4K', N'LG', N'Smart TV', N'26900000', N'- Smart Tivi OLED LG 4K 48 inch 48C2PSA hoàn thin tinh t vi màn hình mng thanh mnh, chân d và khung vin kim loi chc chn, bn b, b trí dp c khi dt bàn hay treo tung, tang tính thm m ca không gian sng hin di.

-  Kích thuc màn hình 48 inch gn gàng, phù hp cho các phòng nh nhu h gia dình, chung cu,...')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'50UG6100', N'Android Tivi Casper 4K 50 inch ', N'led-casper-50ug6100-231122-110905-550x340.jpg', 50, N'4K', N'Casper', N'Smart TV', N'8878000', N'Clip TVFPT PlayGoogle PlayMP3 ZingMyTVNetflixNhaccuatuiPOPS KidsSpotifyTrình duyt webVieONYouTubeYouTube KidsZing TV
4K HDRMàn hình siêu sáng Super Brightness
Google Assistant có ting Vit')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'52LG4096', N'TV LG 52inch 4K', N'52LG4096.png', 52, N'4K Oled', N'LG', N'Basic TV', N'5000000', N'Description TV LG 52inch 4K')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'52LG40961', N'TV LG 52inch 4K', N'52LG4096.png', 52, N'4K Oled', N'LG', N'Basic TV', N'6000000', N'Description TV LG 52inch 4K')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'55A2PSA', N'Smart Tivi OLED LG 4K 55 inch ', N'smart-oled-lg-4k-55-inch-55a2psa-160522-103208-550x340.png', 55, N'4K', N'LG', N'Smart TV', N'24900000', N'- Smart Tivi OLED LG 4K 55 inch 55A2PSA thit k thanh mnh, gn gàng, kt hp hài hòa lin mch vi thit k ni tht ca da dim mà bn chn b trí. 

- Màn hình 55 inch trang trí cho không gian phòng ng, phòng khách, phòng khách sn, van phòng làm vic thêm sang trng, thi thung. Nâng d tivi thang bng, hn ch nghiêng, d vi chân d ch V úp nguc vng chc. ')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'55C350LP', N'Google Tivi Toshiba 4K 55 inch', N'google-tivi-toshiba-4k-55-inch-55c350lp-10-550x340.jpg', 55, N'4K', N'55C350LP', N'Smart TV', N'9999000', N'- Toshiba 55C350LP có v ngoài thi thung, thit k mng du, cho tivi kt ni lin mch vi mi phi cnh, to nên dim nhn sang trng cho không gian phòng khách, phòng ng, phòng hi ngh ca bn. Màn hình tràn vin cho phm vi hin th ni dung m rng, mang dn tm nhìn vô tn ta nhu tri nghim rp chiu phim dích thc. ')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'55QNED80SQA', N'Smart Tivi QNED LG 4K 55 inch ', N'smart-qned-lg-4k-55-inch-55qned80sqa-110522-051820-550x340.jpg', 55, N'4K', N'LG', N'Smart TV', N'17900000', N'Smart Tivi QNED LG 4K 55 inch 55QNED80SQA gi tm mt bn dm chìm trong màn hình 4K rõ nét, b x lý a7 Gen5 AI 4K nâng cao cht lung khung hình, công ngh Quantum Dot NanoCell Color tái to hình nh tuoi tn, t nhiên, ch d FilmMaker Mode xem phim din nh hp dn, công ngh AI Acoustic Tuning tinh chnh âm thanh phù hp vi không gian, tìm kim bng ging nói ting Vit nhanh chóng thông qua LG Voice Search và Magic Remote, h diu hành hin di webOS 22.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'55UG6100', N'Casper Android Tivi 4K 55 Inch', N'casper-android-_main_37_450.png', 55, N'4K', N'Casper', N'Smart TV', N'9790000', N'- Màn hình 55" vi d phân gii 4K siêu sc nét
- Công ngh HDR tái to rc r bc tranh cuc sng
- Công ngh âm thanh vòm Dolby Audio hoàn ho
- B x lý thông minh vi chip x lý 4 nhân mnh m')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'55UQ7550PSF', N'Smart Tivi LG 4K 55 inch 55UQ7550PSF', N'smart-lg-4k-55-inch-55uq7550psf-00-550x340.jpg', 55, N'4K', N'LG', N'Smart TV', N'10990000', N'Lp dt min phí lúc giao hàng

Hu gì di ny 12 tháng tn nhà (min phí tháng du) Xem chi tit

Bo hành chính hãng tivi 2 nam, có ngui dn tn nhà

Thùng tivi có: Remote, Chân d

Bo hành Remote 1 nam')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'55UW6000', N'Smart Tivi Casper 4K 55 inch 55UW6000', N'smart-casper-4k-55-inch-55uw6000-251122-022306-550x340.jpg', 55, N'4K', N'Casper', N'Smart TV', N'7990000', N'Lp dt min phí lúc giao hàng

Hu gì di ny 12 tháng tn nhà (min phí tháng du) Xem chi tit

Bo hành chính hãng tivi 2 nam, có ngui dn tn nhà

Thùng tivi có: Sách hung dn, Chân d, Remote Casper

Bo hành Remote 6 tháng')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'60Xi720', N'TV Xiaomi 60inch HD', N'60Xi720.png', 60, N'HD LCD', N'Xiaomi', N'Smart TV', N'4500000', N'Description TV Xiaomi 60inch HD')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'60Xi7201', N'TV Xiaomi 60inch HD', N'60Xi720.png', 60, N'HD LCD', N'Xiaomi', N'Smart TV', N'9500000', N'Description TV Xiaomi 60inch HD')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'65NANO76SQA', N'Smart Tivi NanoCell LG 4K 65 inch ', N'smart-nanocell-lg-4k-65-inch-65nano76sqa-200223-095518-550x340.jpg', 65, N'4K', N'LG', N'Smart TV', N'17900000', N'- Smart Tivi NanoCell LG 4K 65 inch 65NANO76SQA cu to màn hình phng tinh gin, thanh lch, hài hòa cho mi không gian.

- Chân d hình bán nguyt tinh t, to th d chc chn cho màn hình, n dnh khi lp d bàn và d tháo ri khi mun b trí tivi treo tung.

- Tivi LG s hu màn hình 65 inch d dùng cho không gian gia dình, b trí dp  phòng khách, phòng ng, hoc dùng cho phòng hp công ty, snh nh…')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'KD-55X75K', N'Google Tivi Sony 4K 55 inch KD-55X75K VN3', N'10051995-google-tivi-sony-4k-55-inch-kd-55x75k-vn3-1.jpg', 55, N'4K', N'Sony', N'Smart TV', N'13900000', N'Th h mi')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'KD-75X80K', N'Google Tivi Sony 4K 75 Inch KD-75X80K', N'google-tivi-son_main_738_1020.png', 75, N'4K', N'Sony', N'Smart TV', N'27290000', N'- 4K HDR GoogleTV
- Tích hp tr lý o Google Assistant
- Thiê´t kê´ TV màn hình tràn vin, chân dê´ co´ vân
- Công ngh to màu Triluminos PRO vi hon 1 t màu sc sng dng
- Youtube, Netflix, FPT Play, Galaxy Play, VieON,...
- Remote RMF-TX800P mi - Tích hp micro tìm kim bng ging nói')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'KD32W830K', N'Google Tivi Sony 32 inch ', N'google-sony-32-inch-kd-32w830k-291122-105316-550x340.jpg', 32, N'2k', N'Sony', N'Smart TV', N'8200000', N'Google Tivi Sony 32 inch KD-32W830K trang b các công ngh x lý hình nh, âm thanh hin di nhu nâng cp hình nh X-Reality PRO, chuyn dng mut Motionflow XR 200, S-Master Digital Amplifier, dc bit h diu hành Google TV dáp ng da dng nhu cu gii trí ca ngui s dng.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'KD50X75', N'Android Tivi Sony 4K 50 inch ', N'x75-550x340.jpg', 50, N'4K', N'Sony', N'Smart TV', N'11190000', N'Auto Mode Chuyn dng mut Motionflow XR 200HDR10HLGKim soát dèn nn Direct LED Frame DimmingNâng cp hình nh 4K X-Reality PRO
Ðiu khin bng ging nói

Google Assistant có ting Vit Tìm kim ging nói trên YouTube bng ting Vit')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'KD55X75K', N'Google Tivi Sony 4K 55 inch ', N'google-tivi-son_main_738_1020.png', 55, N'4K', N'Sony', N'Smart TV', N'13900000', N'Google Tivi Sony 4K 55 inch KD-55X75K mang dn tri nghim xem n tung vi hình nh sng dng nh b x lý X1 4K HDR, âm thanh din nh chân thc vi công ngh DTS Digital Surround, tích hp h diu hành Google TV d s dng, có Google Assistant cho phép diu khin bng ging nói ting Vit tin li.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'KD65X85K', N'Google Tivi Sony 4K 65 inch ', N'google-tivi-son_main_738_1020.png', 65, N'4K', N'Sony', N'Smart TV', N'22500000', N'Clip TVFPT PlayGalaxy Play (Fim+)NetflixVieONVTVcab ONYouTube
Chuyn dng mut Motionflow XR 800Tang cung màu sc Triluminos Pro
Google Assistant có ting VitTìm kim ging nói trên YouTube bng ting Vit')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'QA55Q65A', N'Smart Tivi QLED 4K 55 inch Samsung  ', N'qled-4k-samsung-qa55q65a-221122-040010-550x340.jpg', 55, N'4K', N'Samsung', N'Smart TV', N'9900000', N'Thit k thanh mnh, màn hình tràn vin 4 cnh n tung
Smart Tivi QLED 4K 55 inch Samsung QA55Q65A vi thit k vi màn hình tràn vin 4 cnh, cho ngui dùng tri nghim khung hình gii trí trên tivi chân thc nhu thc t dang xy ra truc mt.

Tivi Samsung 55 inch có chân d duc thit k gn gàng, vng chc. Mang li s thanh lch, sang trng cho chic tivi, phù hp trung bày  phòng khách, phòng ng,...')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'QA55S95B', N'Smart Tivi OLED Samsung 4K 55 inch ', N'smart-tivi-oled-samsung-4k-55-inch-qa55s95b-9-550x340.jpg', 55, N'4K', N'Samsung', N'Smart TV', N'34500000', N'- Samsung QA55S95B thit k Laser siêu mng, vin màn hình tinh gin d to không gian tri nghim m rng, nét sang trng hài hòa vào không gian ni tht hin di.

- Kích thuc màn hình 55 inch thích hp s dng cho phòng khách, phòng ng gia dình, phòng hp có din tích va và nh.

- Chân d ch L gn gàng, nâng d tivi chc chn trên các mt phng nhu bàn, k t,… Có th lp dt kiu treo tung d tit kim không gian, thêm tinh gin và sang dp cho gian phòng b trí.')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'QA75QN85A', N'Smart Tivi Neo QLED 4K 75 inch Samsung', N'neoqn85a-550x340.jpg', 75, N'4K', N'Samsung', N'Smart TV', N'45900000', N'Thit k tinh t, màn hình tràn vin 4 cnh dc dáo
Smart Tivi Neo QLED 4K 75 inch Samsung QA75QN85A duc thit k tinh t vi màn hình tràn vin 4 cnh dc dáo, ngui dùng có th tri nghim mt tuyt tác tivi vi nhng ni dung xem vô cùng hoàn ho.

Tivi Samsung 75 inch vi thit k màn hình tràn vin 75 inch cùng chân d vng chc, giúp to dim nhn cho các không gian ni tht nhà bn nhu: Phòng khách, phòng ng ln, phòng hp,...')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'UA32T4500', N'Smart Tivi Samsung 32 inch ', N'samsung-ua32t4500-111122-034127-550x340.jpg', 32, N'2k', N'Samsung', N'Smart TV', N'7400000', N'Smart Tivi Samsung 32 inch UA32T4500 gây n tung mnh vi vin và chân d màu den tuyn cun hút, mnh m.

Kích c tivi Samsung 32 inch nh gn, b trí hài hòa trong các không gian có din tích va và nh nhu: phòng khách, phòng ng, phòng làm vic...')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'UA32T4500A', N'Samsung Smart Tivi 32 Inch UA32T4500A', N'samsung-smart-t_main_876_1020.png', 32, N'2k', N'Samsung', N'Smart TV', N'7390000', N'- Công sut loa 10W 2Ch
- Tìm kim ging nói Voice Search+
- Sn xut Vit Nam, Bo Hành 12 tháng
- Ð  phân gii màn hình HD (1,366 * 768)
- H Ðiu Hành Tizen  2 x HDMI, 1 x USB')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'UA65AU8100', N'Smart Tivi Samsung 4K Crystal UHD 65 inch', N'led-4k-samsung-ua65au8100-221122-040829-550x340.jpg', 65, N'4K', N'Samsung', N'Smart TV', N'19000000', N'Thit k don gin, vin mng sang trng
Smart Tivi Samsung 4K 65 inch UA65AU8100 có thit k Airslim không vin 3 cnh sang trng và tinh t. Mang li tng th cho không gian trung bày thêm dim nhn vô cùng n tung.

Màn hình tivi Samsung 65 inch cùng chân d vng chc phù hp trung bày các không gian nhu: Phòng khách, phòng ng, phòng hp,...')
INSERT [dbo].[Television] ([Id], [Title], [Image], [Size], [Resolution], [Brandname], [Type], [Price], [Description]) VALUES (N'XR55X90K', N'Google Tivi Sony 4K 55 inch XR-55X90K', N'google-sony-4k-55-inch-xr-55x90k-291122-105657-550x340.jpg', 55, N'4K', N'Sony', N'Smart TV', N'24400000', N'Chuyn dng mut Motionflow XR 800Hiu chun màu sc Netflix Calibrated ModeKim soát dèn nn - Local DimmingLàm mut chuyn dng XR Motion ClarityTang cung màu sc Triluminos ProTang cung tuong phn XR Contrast Booster 10Ðng b khung hình/tn s quét choi game VRR')
GO
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([Id], [Username], [Password], [Name], [Address], [Phone], [Role]) VALUES (1, N'admin', N'admin', N'admin', N' ', N'0', N'admin')
INSERT [dbo].[UserAccount] ([Id], [Username], [Password], [Name], [Address], [Phone], [Role]) VALUES (2, N'customer', N'customer', N'5425432534', N'253253253253', N'234', N'customer')
INSERT [dbo].[UserAccount] ([Id], [Username], [Password], [Name], [Address], [Phone], [Role]) VALUES (3, N'abcd', N'1234', N'Nguyễn Văn A', N'Hà Nội', N'0999999999', N'customer')
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
GO
ALTER TABLE [dbo].[CustomerCart]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCart_Television] FOREIGN KEY([TelevisionId])
REFERENCES [dbo].[Television] ([Id])
GO
ALTER TABLE [dbo].[CustomerCart] CHECK CONSTRAINT [FK_CustomerCart_Television]
GO
ALTER TABLE [dbo].[CustomerCart]  WITH CHECK ADD  CONSTRAINT [FK_CustomerCart_UserAccount] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[UserAccount] ([Id])
GO
ALTER TABLE [dbo].[CustomerCart] CHECK CONSTRAINT [FK_CustomerCart_UserAccount]
GO
USE [master]
GO
ALTER DATABASE [SaleTelevisionWeb] SET  READ_WRITE 
GO
