USE [master]
GO
/****** Object:  Database [HTShopDB]    Script Date: 21/12/2021 11:26:43 AM ******/
CREATE DATABASE [HTShopDB]
GO
ALTER DATABASE [HTShopDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HTShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HTShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HTShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HTShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HTShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HTShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HTShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HTShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HTShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HTShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HTShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HTShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HTShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HTShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HTShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HTShopDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HTShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HTShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HTShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HTShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HTShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HTShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HTShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HTShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [HTShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [HTShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HTShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HTShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HTShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HTShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HTShopDB', N'ON'
GO
ALTER DATABASE [HTShopDB] SET QUERY_STORE = OFF
GO
USE [HTShopDB]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 21/12/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[IDCart] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[IDCart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDH]    Script Date: 21/12/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDH](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SoDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 21/12/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](80) NOT NULL,
	[AnhDM] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 21/12/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[DiaChiGH] [nvarchar](70) NOT NULL,
	[TongTien] [int] NOT NULL,
	[MaTK] [int] NULL,
	[TinhTrang] [int] NULL,
	[HinhThucTT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 21/12/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLH] [int] IDENTITY(1,1) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[DienThoai] [varchar](11) NOT NULL,
	[ThoiGianLamViec] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 21/12/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[GiaBan] [int] NOT NULL,
	[AnhSP] [nvarchar](100) NULL,
	[MoTa] [nvarchar](max) NULL,
	[PhanTramKM] [int] NULL,
	[NgayTao] [datetime] NOT NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 21/12/2021 11:26:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[DiaChiEmail] [nvarchar](50) NOT NULL,
	[MatKhau] [varchar](20) NOT NULL,
	[HoTen] [nvarchar](40) NOT NULL,
	[VaiTro] [varchar](30) NULL,
	[GioiTinh] [nvarchar](4) NULL,
	[NgaySinh] [datetime] NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([IDCart], [MaTK], [quantity], [MaSP]) VALUES (29, 1, 1, 83)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[ChiTietDH] ON 

INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (10, 10, 81, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (15, 12, 78, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (21, 15, 75, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (27, 18, 81, 2)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (28, 19, 78, 2)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (29, 19, 77, 2)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (33, 21, 71, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (34, 22, 83, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (35, 23, 76, 2)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (36, 23, 68, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (37, 24, 83, 2)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (38, 24, 81, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (43, 10, 62, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (44, 28, 89, 2)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (45, 29, 81, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (47, 31, 89, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (48, 32, 83, 1)
INSERT [dbo].[ChiTietDH] ([id], [SoDH], [MaSP], [SoLuong]) VALUES (49, 33, 83, 1)
SET IDENTITY_INSERT [dbo].[ChiTietDH] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (6, N'Laptop MacBook', N'logo-macbook-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (7, N'Laptop Asus', N'logo-asus-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (8, N'Laptop HP', N'logo-hp-149x40-1.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (9, N'Laptop Lenovo', N'logo-lenovo-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (10, N'Laptop Acer', N'logo-acer-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (11, N'Laptop Dell', N'logo-dell-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (12, N'Laptop MSI', N'logo-msi-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (13, N'Laptop LG', N'logo-lg-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (14, N'Laptop GIGABYTE', N'logo-gigabyte-149x40.png')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (19, N'Laptop Huawei', N'huawei-logo.jpg')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [AnhDM]) VALUES (21, N'Laptop Microsoft', N'microsoft-logo.png')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (10, CAST(N'2021-12-06T20:32:35.623' AS DateTime), N'15 Khóm 1, Thị Trấn Mỹ Long, huyện Cầu Ngang, Trà Vinh', 109980000, 1, 3, 1)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (12, CAST(N'2021-11-15T18:59:36.227' AS DateTime), N'19 Đ.Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh', 28990000, 2, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (15, CAST(N'2021-11-15T19:02:47.800' AS DateTime), N'19 Đ.Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh', 29571300, 3, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (18, CAST(N'2021-11-15T19:04:53.270' AS DateTime), N'19 Đ.Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh', 181980000, 2, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (19, CAST(N'2021-11-15T19:07:52.703' AS DateTime), N'164 Đường Tân Mỹ, Tân Thuận Tây, Quận 7, Thành phố Hồ Chí Minh', 99273000, 3, 0, 1)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (21, CAST(N'2021-11-22T00:00:00.000' AS DateTime), N'Hồ Chí Minh', 8000000, 2, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (22, CAST(N'2021-12-06T20:34:23.557' AS DateTime), N'Trà Vinh', 13500000, 1, 1, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (23, CAST(N'2021-12-01T21:41:29.537' AS DateTime), N'Mỹ Long Nam, Cầu Ngang, Trà Vinh', 115014000, 1, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (24, CAST(N'2021-12-02T19:10:49.683' AS DateTime), N'Xã Mỹ Long Nam, Cầu Ngang, Trà Vinh', 117990000, 1, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (28, CAST(N'2021-12-19T11:48:11.013' AS DateTime), N'Xã Mỹ Long Nam, Cầu Ngang, Trà Vinh', 32300000, 1, 0, 1)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (29, CAST(N'2021-12-19T11:51:06.263' AS DateTime), N'Xã Mỹ Long Nam, Cầu Ngang, Trà Vinh', 90990000, 1, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (31, CAST(N'2021-12-19T20:25:31.690' AS DateTime), N'Xã Mỹ Long Nam, Cầu Ngang, Trà Vinh', 16150000, 17, 0, 0)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (32, CAST(N'2021-12-19T22:36:23.300' AS DateTime), N'Quận 7', 13500000, 17, 0, 1)
INSERT [dbo].[DonHang] ([SoDH], [NgayDat], [DiaChiGH], [TongTien], [MaTK], [TinhTrang], [HinhThucTT]) VALUES (33, CAST(N'2021-12-21T10:09:05.743' AS DateTime), N'19 Đ.Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh', 12490000, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([MaLH], [DiaChi], [Email], [DienThoai], [ThoiGianLamViec]) VALUES (2, N'19 Đ.Nguyễn Hữu Thọ, Tân Hưng, Quận 7, Thành phố Hồ Chí Minh', N'HTShop@gmail.com', N'0987654321', N'Thứ 2 đến thứ 7: 8h đến 22h')
SET IDENTITY_INSERT [dbo].[LienHe] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (55, 14, N'GIGABYTE Gaming G5 i5 11400H (51S1123SH)', 29990000, N'gigabyte-gaming-g5-i5-md51s1123sh-191021-102635-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 10500H 2.5GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBDDR4 2 khe (1 khe 8GB + 1 khe 8GB)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)144Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rời RTX 3060 6GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)Mini DisplayPortUSB 2.0USB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 361 mm - Rộng 258 mm - Dày 24.9 mm - Nặng 2.2 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Laptop Gigabyte&nbsp;</p>
	</li>
</ul>
', 10, CAST(N'2021-11-15T17:55:16.000' AS DateTime), 122)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (57, 14, N'GIGABUTE Gaming G5 i5 11400H (51S1121SH)', 26990000, N'gigabyte-g5-i5-51s1121sh-191021-102920-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 11400H 2.7GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBDDR4 2 khe (1 khe 8GB + 1 khe 8GB)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)144Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rờiRTX 3050 4GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)Mini DisplayPortUSB 2.0USB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 361 mm - Rộng 258 mm - Dày 24.9 mm - Nặng 2.2 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
</ul>
', 10, CAST(N'2021-11-15T17:59:04.000' AS DateTime), 26)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (59, 13, N'LG Gram 17 2021 i7 1165G7 (17Z90P-G.AH76A5)', 52890000, N'lg-gram-17-i7-17z90pgah76a5-3-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 1165G 72.8GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBLPDDR4X (On board)4266 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng</p>
	</li>
	<li>
	<p>Màn hình: 17"WQXGA (2560 x 1600)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợpIntel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x Thunderbolt 4 USB-C2 x USB 3.2HDMIJack tai nghe 3.5 mm</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home Standard</p>
	</li>
	<li>
	<p>Thiết kế: Hợp kim Nano Carbon - Magie</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 380.2 mm - Rộng 260.1 mm - Dày 17.8 mm - Nặng 1.35 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi:&nbsp;Phiếu mua hàng 5.000.000đ, tai nghe Không dây LG HBS-FN6&nbsp;(Hết quà hoàn tiền 1.750.000₫), túi đựng Laptop LG gram 17"&nbsp;(Hết quà hoàn tiền 750.000₫), tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&amp;S 2021</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:03:43.000' AS DateTime), 123)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (60, 13, N'LG Gram 16 2021 i7 1165G7 (16Z90P-G.AH75A5)', 50890000, N'lg-gram-16-i7-16z90pgah75a5-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 1165G 72.8GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBLPDDR4X (On board)4266 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng</p>
	</li>
	<li>
	<p>Màn hình: 16"WQXGA (2560 x 1600)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp Intel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x Thunderbolt 4 USB-C2 x USB 3.2HDMIJack tai nghe 3.5 mm</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home Standard</p>
	</li>
	<li>
	<p>Thiết kế: Hợp kim Nano Carbon - Magie</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 355.9 mm - Rộng 243.4 mm - Dày 16.8 mm - Nặng 1.19 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi:&nbsp;Phiếu mua hàng 5.000.000đ, tai nghe Không dây LG HBS-FN6&nbsp;(Hết quà hoàn tiền 1.750.000₫), túi đựng Laptop LG gram 17"&nbsp;(Hết quà hoàn tiền 750.000₫), tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&amp;S 2021</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:04:45.000' AS DateTime), 122)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (61, 12, N'MSI Gaming GF65 Thin 10UE i5 10500H (286VN)', 29490000, N'msi-gamin-gf65-thin-10ue-i5-10500h-16gb-512gb-6gb-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 10500H 2.5GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBDDR4 2 khe (1 khe 8GB + 1 khe 8GB)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)144Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rời RTX 3060 Max-Q 6GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.22 x USB Type-CHDMIJack tai nghe 3.5 mmLAN (RJ45)</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Nắp lưng và chiếu nghỉ tay bằng kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 359 mm - Rộng 254 mm - Dày 21.7 mm - Nặng 1.86 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Gaming</p>
	</li>
</ul>
', 5, CAST(N'2021-11-15T18:06:15.000' AS DateTime), 123)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (62, 12, N'MSI Modern 15 A11MU i5 1155G7 (680VN)', 18990000, N'msi-modern-15-a11mu-i5-680vn-22-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 1155G 72.5GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp Intel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.2HDMIJack tai nghe 3.5 mmUSB 2.0USB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 356.8 mm - Rộng 233.75 mm - Dày 16.9 mm - Nặng 1.6 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyễn mãi: Chuột Gaming</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:07:44.000' AS DateTime), 15)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (63, 12, N'MSI Modern 14 B11MOU i3 1115G4 (849VN)', 14190000, N'msi-modern-14-b11mou-i3-849vn-021121-113011-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i3 1115G 43GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 256 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)</p>
	</li>
	<li>
	<p>Màn hình: 14"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp Intel UHD</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.2HDMIJack tai nghe 3.5 mmUSB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 319 mm - Rộng 219 mm - Dày 18.1 mm - Nặng 1.3 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:08:48.000' AS DateTime), 10)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (64, 11, N'Dell Vostro 3400 i5 1135G7 (70253900)', 18890000, N'dell-vostro-3400-i5-1135g7-8gb-256gb-office-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 1135G 72.4GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)2666 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 256 GB SSD NVMe PCIeHỗ trợ khe cắm HDD SATA</p>
	</li>
	<li>
	<p>Màn hình: 14"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp Intel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)USB 2.0</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL + Office H&amp;S 2019 vĩnh viễn</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 328.7 mm - Rộng 239.5 mm - Dày 19.9 mm - Nặng 1.64 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo laptop Dell</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:11:16.000' AS DateTime), 20)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (66, 11, N'Dell Gaming G3 15 i7 10750H (P89F002BWH)', 31990000, N'dell-g3-15-i7-p89f002bwh-16-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 10750H 2.6GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBDDR4 2 khe (1 khe 8GB + 1 khe 8GB)2933 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIeHỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)120Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rời GTX 1660Ti 6GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 1 x USB 3.22 x USB 2.0HDMIJack tai nghe 3.5 mmLAN (RJ45)Mini DisplayPortThunderbolt 3</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 364.46 mm - Rộng 254 mm - Dày 30.96 mm - Nặng 2.58 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo laptop Dell</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:14:16.000' AS DateTime), 21)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (67, 10, N'Acer Nitro 5 Gaming AN515 57 727J i7 11800H', 29990000, N'acer-nitro-gaming-an515-57-727j-i7-nhqd9sv005-10-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 11800H 2.30 GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)144Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rờiRTX 3050Ti 4GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 3 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)USB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Acer</p>
	</li>
</ul>
', 6, CAST(N'2021-11-15T18:16:18.000' AS DateTime), 20)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (68, 10, N'Acer Nitro 5 Gaming AN515 57 5831 i5 11400H', 32990000, N'acer-nitro-5-gaming-an515-57-5831-i5-nhqdgsv003-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 11400H 2.7GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 2 khe (1 khe 8GB + 1 khe rời)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)144Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rời RTX 3060 6GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 3 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)USB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Acer</p>
	</li>
</ul>
', 5, CAST(N'2021-11-15T18:17:18.000' AS DateTime), 25)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (70, 9, N'Lenovo Ideapad 5 Pro 14ITL6 i5 1135G7 (82L30094VN)', 23090000, N'lenovo-ideapad-5-pro-14itl6-i5-82l30094vn-021121-034245-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 1135G 72.4GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 (On board)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB (2280) / 512GB (2242))</p>
	</li>
	<li>
	<p>Màn hình: 14"2.2K (2240x1400)</p>
	</li>
	<li>
	<p>Card màn hình: Card rời MX450 2GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 1 x USB 3.21 x USB 3.2 (Always on)2 x USB Type-C (Power Delivery and DisplayPort)HDMI</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 312.2 mm - Rộng 221 mm - Dày 17.99 mm - Nặng 1.41 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:19:20.000' AS DateTime), 121)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (71, 9, N'Lenovo Yoga 9 14ITL5 i7/1185G7 (82BG006EVN)', 49990000, N'lenovo-yoga-9-14itl5-i7-82bg006evn-21-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 1185G 73GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBLPDDR4 (On board)4266 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 1 TB SSD M.2 PCIe</p>
	</li>
	<li>
	<p>Màn hình: 14"4K/UHD (3840 x 2160)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợpIntel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 1 x USB 3.22 x Thunderbolt 4 USB-CJack tai nghe 3.5 mm</p>
	</li>
	<li>
	<p>Đặc biệt: Có màn hình cảm ứng Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 319.4 mm - Rộng 216.4 mm - Dày 15.7 mm - Nặng 1.37 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Laptop Lenovo</p>
	</li>
</ul>
', 10, CAST(N'2021-11-15T18:20:32.000' AS DateTime), 50)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (72, 9, N'Lenovo YOGA Slim 7 Carbon 13ITL5 i7 1165G7', 34990000, N'lenovo-yoga-slim-7-carbon-13itl5-i7-82ev0017vn-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 1165G 72.8GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBLPDDR4X (On board)4266 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 1 TB SSD M.2 PCIe</p>
	</li>
	<li>
	<p>Màn hình: 13.3"QHD (2560 x 1600)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp Intel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x Thunderbolt 4 USB-CJack tai nghe 3.5 mmUSB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Mặt lưng Carbon - Chiếu nghỉ tay bằng Nhôm Magie</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 295.88 mm - Rộng 208.85 mm - Dày 15 mm - Nặng 0.966 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
	<li>
	<p>Khuyễn mãi: Balo Laptop Lenovo</p>
	</li>
</ul>
', 5, CAST(N'2021-11-15T18:22:02.000' AS DateTime), 123)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (73, 8, N'HP Envy 13 ba1030TU i7 1165G7 (2K0B6PA)', 30390000, N'hp-envy-13-ba1030tu-i7-2k0b6pa-101820-091857-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 1165G 72.8GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 (On board)2933 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe</p>
	</li>
	<li>
	<p>Màn hình: 13.3"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợpIntel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.1 Jack tai nghe 3.5 mmThunderbolt 4 USB-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL + Office H&amp;S 2019 vĩnh viễn</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại nguyên khối</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 306.5 mm - Rộng 194.6 mm - Dày 16.9 mm - Nặng 1.236 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
	<li>
	<p>Khuyến&nbsp;mãi: Balo Laptop HP</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:23:05.000' AS DateTime), 15)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (74, 8, N'HP EliteBook X360 830 G8 i7 1165G7 (3G1A4PA)', 41590000, N'hp-elitebook-x360-830-g8-i7-3g1a4pa-19-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 1165G 72.8GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBDDR4 (On board)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe</p>
	</li>
	<li>
	<p>Màn hình: 13.3"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp Intel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x Thunderbolt 4 USB-C2 x USB 3.1HDMIJack tai nghe 3.5 mm</p>
	</li>
	<li>
	<p>Đặc biệt: Có màn hình cảm ứng, đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Pro</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 307.6 mm - Rộng 205 mm - Dày 17.8 mm - Nặng 1.476 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyễn mãi: Balo Laptop HP</p>
	</li>
</ul>
', 7, CAST(N'2021-11-15T18:24:59.000' AS DateTime), 55)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (75, 8, N'HP Envy 13 ba1031TU i7 1165G7 (2K0B7PA)', 33690000, N'hp-envy-13-ba1031tu-i7-2k0b7pa-103120-093102-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 1165G 72.8GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBDDR4 (On board)2933 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 1 TB SSD M.2 PCIe</p>
	</li>
	<li>
	<p>Màn hình: 13.3"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợpIntel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 3.1 Jack tai nghe 3.5 mmThunderbolt 3</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL + Office H&amp;S 2019 vĩnh viễn</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại nguyên khối</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 306.5 mm - Rộng 194.6 mm - Dày 16.9 mm - Nặng 1.236 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Laptop HP</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:26:25.000' AS DateTime), 5)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (76, 7, N'Asus ROG Zephyrus G14 Alan Walker GA401QEC R9 (K2064T)', 49990000, N'asus-rog-zephyrus-gaming-g14-ga401qec-r9-k2064t-17-600x600.jpg', N'<ul>
	<li>
	<p>CPU: Ryzen 95900HS 3GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBDDR4 2 khe (8GB onboard+ 1 khe 8GB)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe 3.0 mở rộng (nâng cấp dung lượng không giới hạn)&nbsp;1 TB SSD M.2 PCIe 3.0 (Có thể tháo ra, lắp thanh khác dung lượng không giới hạn)</p>
	</li>
	<li>
	<p>Màn hình: 14"QHD (2560 x 1440)120Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rời RTX 3050Ti 4GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC2 x USB 3.2HDMIJack tai nghe 3.5 mmUSB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa - nắp lưng bằng kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 324 mm - Rộng 220 mm - Dày 19.9 mm - Nặng 1.7 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Asus</p>
	</li>
</ul>
', 10, CAST(N'2021-11-15T18:27:45.000' AS DateTime), 15)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (77, 7, N'Asus ZenBook UX325EA i5 1135G7 (KG363T)', 23790000, N'asus-zenbook-ux325ea-i5-kg363t-16-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i5 1135G 72.4GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBLPDDR4X (On board)4267 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)</p>
	</li>
	<li>
	<p>Màn hình: 13.3"Full HD (1920 x 1080) OLED</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợpIntel Iris Xe</p>
	</li>
	<li>
	<p>Cổng kết nối: 1 x USB 3.22 x Thunderbolt 4 USB-CHDMI</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại nguyên khối</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 304.2 mm - Rộng 203 mm - Dày 13.9 mm - Nặng 1.14 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo asus</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:28:37.000' AS DateTime), 20)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (78, 7, N'Asus TUF Gaming FX516PC i7 11370H/8GB/512GB/4GB RTX3050/144Hz/Win10 (HN001T)', 28990000, N'asus-tuf-gaming-fx516pc-i7-11370h-8gb-512gb-600x600.jpg', N'<ul>
	<li>
	<p>CPU: i7 11370H 3.3GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 2 khe (1 khe 8GB onboard + 1 khe trống)3200 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)144Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card rời RTX 3050 4GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 3 x USB 3.2HDMIJack tai nghe 3.5 mmLAN (RJ45)Thunderbolt 4 USB-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ nhựa - nắp lưng bằng kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2021</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Asus</p>
	</li>
</ul>
', 6, CAST(N'2021-11-15T18:29:47.000' AS DateTime), 10)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (79, 6, N'MacBook Air M1 2020 7-core GPU', 28990000, N'macbook-air-m1-2020-gray-600x600.jpg', N'<ul>
	<li>
	<p>CPU: Apple M1</p>
	</li>
	<li>
	<p>RAM: 8 GB</p>
	</li>
	<li>
	<p>Ổ cứng: 256 GB SSD</p>
	</li>
	<li>
	<p>Màn hình: 13.3"Retina (2560 x 1600)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp 7 nhân GPU</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x Thunderbolt 3 (USB-C)Jack tai nghe 3.5 mm</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Mac OS</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại nguyên khối</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 304.1 mm - Rộng 212.4 mm - Dày 4.1 mm đến 16.1 mm - Nặng 1.29 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:31:21.000' AS DateTime), 10)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (80, 6, N'MacBook Pro M1 2020', 44990000, N'macbook-pro-m1-2020-gray-600x600.jpg', N'<ul>
	<li>
	<p>CPU: Apple M1</p>
	</li>
	<li>
	<p>RAM: 8 GB</p>
	</li>
	<li>
	<p>Ổ cứng: 256 GB SSD</p>
	</li>
	<li>
	<p>Màn hình: 13.3"Retina (2560 x 1600)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp 8 nhân GPU</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x Thunderbolt 3 (USB-C)Jack tai nghe 3.5 mm</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Mac OS</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại nguyên khối</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:32:12.000' AS DateTime), 123)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (81, 6, N'MacBook Pro 16 M1 Max 2021/32 core-GPU', 90990000, N'apple-macbook-pro-16-m1-max-2021-600x600.jpg', N'<ul>
	<li>
	<p>PU: Apple M1 Max400GB/s memory bandwidth</p>
	</li>
	<li>
	<p>RAM: 32 GB</p>
	</li>
	<li>
	<p>Ổ cứng: 1 TB SSD</p>
	</li>
	<li>
	<p>Màn hình: 16.2 inch Liquid Retina XDR display (3456 x 2234)120Hz</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợp 32 core-GPU</p>
	</li>
	<li>
	<p>Cổng kết nối: 3 x Thunderbolt 4 USB-CHDMIJack tai nghe 3.5 mm</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phím</p>
	</li>
	<li>
	<p>Hệ điều hành: Mac OS</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại nguyên khối</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 355.7 mm - Rộng 248.1 mm - Dày 16.8 mm - Nặng 2.2 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 10/2021</p>
	</li>
</ul>
', 0, CAST(N'2021-11-15T18:33:34.000' AS DateTime), 200)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (83, 19, N'Huawei MateBook D 15 R5 3500U 8GB/256GB+1TB/Win10 (Boh-WAQ9R)', 12490000, N'huawei-matebook.jpg', N'<ul>
	<li>
	<p>CPU: Ryzen 53500U 2.1GHz</p>
	</li>
	<li>
	<p>RAM: 8 GBDDR4 (On board)2400 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: SSD 256 GB NVMe PCIeHDD 1 TB SATA 3</p>
	</li>
	<li>
	<p>Màn hình: 15.6"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p>Card màn hình: Card tích hợpAMD Radeon Vega 8 Graphics</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB 2.0HDMIUSB 3.0USB Type-C</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 357.8 mm - Rộng 229.9 mm - Dày 16.9 mm - Nặng 1.62 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
</ul>
', 0, CAST(N'2021-11-22T10:42:12.000' AS DateTime), 10)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (89, 10, N'Acer Nitro AN515 43 R9FD R5 3550H/8GB/512GB/4GB GTX1650/Win10 (NH.Q6ZSV.003) ', 18990000, N'acer-nitro-an515-43-r5-nhq6zsv003-221409-600x600.jpg', N'<ul>
	<li>
	<p><strong>CPU:</strong> Ryzen 53550H 2.1GHz</p>
	</li>
	<li>
	<p><strong>RAM:</strong> 8 GBDDR4 (2 khe)2400 MHz</p>
	</li>
	<li>
	<p><strong>Ổ cứng:</strong> 512 GB SSD NVMe PCIeHỗ trợ khe cắm HDD SATA</p>
	</li>
	<li>
	<p><strong>Màn hình: </strong>15.6"Full HD (1920 x 1080)</p>
	</li>
	<li>
	<p><strong>Card màn hình: </strong>Card rờiGTX 1650 4GB</p>
	</li>
	<li>
	<p><strong>Cổng kết nối:</strong> 2 x USB 3.1HDMILAN (RJ45)USB 2.0USB Type-C</p>
	</li>
	<li>
	<p><strong>Đặc biệt:</strong> Có đèn bàn phím</p>
	</li>
	<li>
	<p><strong>Hệ điều hành:</strong> Windows 10 Home SL</p>
	</li>
	<li>
	<p><strong>Thiết kế:</strong> Vỏ nhựa</p>
	</li>
	<li>
	<p><strong>Kích thước, trọng lượng:</strong> Dài Dài 363.4 mm - Rộng Rộng 255 mm - Dày Dày 25.9 mm - Nặng 2.3 kg</p>
	</li>
	<li>
	<p><strong>Thời điểm ra mắt:</strong> 201</p>
	</li>
	<li>
	<p>Khuyến mãi: Balo Acer</p>
	</li>
</ul>
', 5, CAST(N'2021-12-06T12:44:50.000' AS DateTime), 10)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (97, 21, N'Laptop Microsoft Surface Book i7', 58579000, N'zwmpim963ifv5.jpg', N'<ul>
	<li>
	<p>Công nghệ CPU: Hãng không công bố</p>
	</li>
	<li>
	<p>RAM: 16GB</p>
	</li>
	<li>
	<p>Màn hình: 13.4"</p>
	</li>
	<li>
	<p>Công nghệ màn hình: 10 Fingers Touch</p>
	</li>
	<li>
	<p>Màn hình cảm ứng: Có</p>
	</li>
	<li>
	<p>Card màn hình: Card rời&nbsp;- Nvidia GeForce GTX 965M</p>
	</li>
	<li>
	<p>Công nghệ âm thanh: Headphones loa kép</p>
	</li>
	<li>
	<p>Cổng giao tiếp: USB 3.0</p>
	</li>
	<li>
	<p>Kết nối không dây: Bluetooth 4.0 + LE</p>
	</li>
	<li>
	<p>Khe đọc thẻ nhớ: SDXC</p>
	</li>
	<li>
	<p>Webcam: HD webcam</p>
	</li>
	<li>
	<p>Tính năng khác: Cảm biến: Gia tốc, Con quay hồi chuyển, La bàn, Ánh sáng</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài 232.1 mm - Rộng 312.3 mm - Dày 14.9 - 22.8 - Nặng 1.6 kg</p>
	</li>
	<li>
	<p>Chất liệu: Vỏ kim loại</p>
	</li>
	<li>
	<p>Thông tin Pin: Khoảng 10 tiếng</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
</ul>
', 1, CAST(N'2021-12-20T16:30:17.167' AS DateTime), 15)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (98, 21, N'Surface Laptop Studio (2021) – Intel Core i7/16GB/512GB RTX-3050 Ti', 720000000, N'169376c0-1bbb-11ec-befd-df0830f0f3d8.jpeg', N'<ul>
	<li><strong>CPU :&nbsp;</strong>3.3GHz Quad-core 11th Gen Intel Core H35 i7-11300H (12MB cache, Up to 4.8GHz)</li>
	<li><strong>Ram :&nbsp;</strong>32GB LPDDR4x memory</li>
	<li><strong>Ổ cứng :&nbsp;</strong>512GB (Removable SSD)</li>
	<li><strong>Màn hình :&nbsp;</strong>14.4” PixelSense Flow Display with 2400 x 1600 (201 PPI), 120Hz</li>
	<li><strong>Card đồ hoạ :&nbsp;</strong>NVIDIA GeForce RTX 3050 Ti (4GB GDDR6)</li>
	<li><strong>Tình trạng :&nbsp;</strong>Hàng New, Nguyên Seal</li>
	<li><strong>Phụ kiện :&nbsp;</strong>Sản phẩm chưa bao gồm Bút</li>
</ul>
', 8, CAST(N'2021-12-20T16:34:12.167' AS DateTime), 10)
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [GiaBan], [AnhSP], [MoTa], [PhanTramKM], [NgayTao], [SoLuong]) VALUES (99, 19, N'Laptop Huawei MateBook 13 i5 10210U/16GB/512GB/2GB MX250/Win10', 29990000, N'637340548361250950_huawei-matebook-13-xam-2.jfif', N'<ul>
	<li>
	<p>CPU: i510210U1.6GHz</p>
	</li>
	<li>
	<p>RAM: 16 GBLPDDR3 (On board)2133 MHz</p>
	</li>
	<li>
	<p>Ổ cứng: 512 GB SSD NVMe PCIe</p>
	</li>
	<li>
	<p>Màn hình: 13"2K (2160 x 1440)</p>
	</li>
	<li>
	<p>Card màn hình: Card rờiNVIDIA GeForce MX250 2 GB</p>
	</li>
	<li>
	<p>Cổng kết nối: 2 x USB Type-C</p>
	</li>
	<li>
	<p>Đặc biệt: Có đèn bàn phímCó màn hình cảm ứng</p>
	</li>
	<li>
	<p>Hệ điều hành: Windows 10 Home SL</p>
	</li>
	<li>
	<p>Thiết kế: Vỏ kim loại</p>
	</li>
	<li>
	<p>Kích thước, trọng lượng: Dài Dài 286 mm - Rộng Rộng 211 mm - Dày Dày 14.9 mm - Nặng 1.32 kg</p>
	</li>
	<li>
	<p>Thời điểm ra mắt: 2020</p>
	</li>
</ul>
', 5, CAST(N'2021-12-20T16:38:48.400' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (1, N'admin@gmail.com', N'MTIzNDU2', N'Admin', N'Administrator', N'Nam', CAST(N'2000-09-16T00:00:00.000' AS DateTime), N'0813027001', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (2, N'lamvanbao@gmail.com', N'MTIzNDU2', N'Lâm Văn bảo', N'User', N'Nam', CAST(N'2003-11-15T00:00:00.000' AS DateTime), N'0971647423', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (3, N'user2@gmail.com', N'MTIzNDU2', N'Nguyễn Thị Hoài Thương', N'User', N'Nữ', CAST(N'2002-08-28T00:00:00.000' AS DateTime), N'0834645541', 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (10, N'tung@gmail.com', N'MTIzNDU2', N'Lê Thanh Tùng', N'User', N'Nam', CAST(N'2000-09-15T00:00:00.000' AS DateTime), N'0982716851', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (12, N'tram@gmail.com', N'MTIzNDU2', N'Huỳnh Ngọc Trâm', N'User', N'Nữ', CAST(N'2000-01-18T00:00:00.000' AS DateTime), N'0813027001', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (17, N'hieu@gmail.com', N'MTIzNDU2', N'Nguyễn Minh Hiếu', N'Administrator', N'Nam', CAST(N'2021-12-05T00:00:00.000' AS DateTime), N'0834645541', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (18, N'maivi@gmail.com', N'MTIzNDU2', N'Mai Võ Phương Vi', N'User', N'Nữ', CAST(N'2000-01-17T00:00:00.000' AS DateTime), N'0971647423', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (20, N'himanonymous18@gmail.com', N'MTIzNDU2', N'Hiếu', N'User', N'Nam', CAST(N'2000-09-15T00:00:00.000' AS DateTime), N'0971647423', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (21, N'letung844@gmail.com', N'MTIzNDU2', N'User 1', N'User', N'Nam', CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'0813027001', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (22, N'letung1@gmail.com', N'MTIzNDU2', N'User 1', N'User', N'Nam', CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'0813027002', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [DiaChiEmail], [MatKhau], [HoTen], [VaiTro], [GioiTinh], [NgaySinh], [SoDienThoai], [TrangThai]) VALUES (23, N'letung111@gmail.com', N'MTIzNDU2', N'User 2', N'User', N'Nam', CAST(N'2021-12-21T00:00:00.000' AS DateTime), N'0981311300', 1)
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__79A7D016B6BA8454]    Script Date: 21/12/2021 11:26:43 AM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[DiaChiEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__79A7D016BEBE3CB7]    Script Date: 21/12/2021 11:26:43 AM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[DiaChiEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_SanPham]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_TaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_TaiKhoan]
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [fkHoaDon1] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DonHang] ([SoDH])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [fkHoaDon1]
GO
ALTER TABLE [dbo].[ChiTietDH]  WITH CHECK ADD  CONSTRAINT [fkHoaDon2] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDH] CHECK CONSTRAINT [fkHoaDon2]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
USE [master]
GO
ALTER DATABASE [HTShopDB] SET  READ_WRITE 
GO
