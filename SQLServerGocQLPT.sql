/** Tạo database của server gốc **/
create database QLPhongTro1
use QLPhongTro1
USE [master]
GO
GO
ALTER DATABASE [QLPhongTro1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLPhongTro1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLPhongTro1] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QLPhongTro1] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QLPhongTro1] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QLPhongTro1] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QLPhongTro1] SET ARITHABORT OFF
GO
ALTER DATABASE [QLPhongTro1] SET AUTO_CLOSE ON
GO
ALTER DATABASE [QLPhongTro1] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QLPhongTro1] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QLPhongTro1] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QLPhongTro1] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QLPhongTro1] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QLPhongTro1] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QLPhongTro1] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QLPhongTro1] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QLPhongTro1] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QLPhongTro1] SET  DISABLE_BROKER
GO
ALTER DATABASE [QLPhongTro1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QLPhongTro1] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QLPhongTro1] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QLPhongTro1] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QLPhongTro1] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QLPhongTro1] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [QLPhongTro1] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QLPhongTro1] SET  READ_WRITE
GO
ALTER DATABASE [QLPhongTro1] SET RECOVERY SIMPLE
GO
ALTER DATABASE [QLPhongTro1] SET  MULTI_USER
GO
ALTER DATABASE [QLPhongTro1] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QLPhongTro1] SET DB_CHAINING OFF
GO
USE [QLPhongTro1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng khách hàng và thêm dữ liệu**/
CREATE TABLE [dbo].[tblKhachHang](
	[ID] [varchar](10) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[CMND] [nvarchar](10) NULL,
	[DienThoai] [nvarchar](15) NULL,
	[QueQuan] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblKhachhang] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT [dbo].[tblKhachHang] ([ID], [HoTen], [CMND], [DienThoai], [QueQuan]) VALUES ('KH1',N'Trinh',N'330678952',N'0399032950',N'ThanhHoa')
INSERT [dbo].[tblKhachHang] ([ID], [HoTen], [CMND], [DienThoai], [QueQuan]) VALUES ('KH2',N'Tu',N'330674574',N'0367528910',N'HaNoi')
INSERT [dbo].[tblKhachHang] ([ID], [HoTen], [CMND], [DienThoai], [QueQuan]) VALUES ('KH3',N'Nam',N'330675789',N'0396231057',N'NamDinh')
INSERT [dbo].[tblKhachHang] ([ID], [HoTen], [CMND], [DienThoai], [QueQuan]) VALUES ('KH4',N'Thanh',N'33065703',N'0397846323',N'HaNoi')
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng loại phòng và thêm dữ liệu**/
CREATE TABLE [dbo].[tblLoaiPhong](
	[ID] [varchar](10) NOT NULL,
	[TenLoaiPhong] [nvarchar](50) NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_tblLoaiPhong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblLoaiPhong] ([ID], [TenLoaiPhong], [DonGia]) VALUES ('L1','P1', 3500)
INSERT [dbo].[tblLoaiPhong] ([ID], [TenLoaiPhong], [DonGia]) VALUES ('L2','P2', 3400)
INSERT [dbo].[tblLoaiPhong] ([ID], [TenLoaiPhong], [DonGia]) VALUES ('L3','P3', 3000)
INSERT [dbo].[tblLoaiPhong] ([ID], [TenLoaiPhong], [DonGia]) VALUES ('L4','P4', 2500)
INSERT [dbo].[tblLoaiPhong] ([ID], [TenLoaiPhong], [DonGia]) VALUES ('L5','P5', 2500)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng phòng và thêm dữ liệu**/
CREATE TABLE [dbo].[tblPhong](
	[ID] [varchar](10) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
	[IDLoaiPhong] [varchar](10) NULL REFERENCES [dbo].[tblLoaiPhong](ID),
	[TrangThai] [nvarchar](30) NULL,
 CONSTRAINT [PK_tblPhong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblPhong] ([ID], [TenPhong], [IDLoaiPhong], [TrangThai]) VALUES ('A1',N'P1',N'L1', N'DaCoNguoi')
INSERT [dbo].[tblPhong] ([ID], [TenPhong], [IDLoaiPhong], [TrangThai]) VALUES ('A2',N'P2',N'L2', N'DaCoNguoi')
INSERT [dbo].[tblPhong] ([ID], [TenPhong], [IDLoaiPhong], [TrangThai]) VALUES ('A3',N'P3',N'L3', N'DaCoNguoi')
INSERT [dbo].[tblPhong] ([ID], [TenPhong], [IDLoaiPhong], [TrangThai]) VALUES ('A4',N'P4',N'L4', N'ChuaCoNguoi')
INSERT [dbo].[tblPhong] ([ID], [TenPhong], [IDLoaiPhong], [TrangThai]) VALUES ('A5',N'P5',N'L5', N'ChuaCoNguoi')
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng thuê phòng và thêm dữ liệu **/
CREATE TABLE [dbo].[tblThuePhong](
	[ID] [varchar](10) NOT NULL,
	[IDKhachHang] [varchar](10) NULL REFERENCES [dbo].[tblKhachhang](ID),
	[IDPhong] [varchar](10) NULL REFERENCES [dbo].[tblPhong](ID),
	[GiaPhong] [int] NULL,
	[TienDatCoc] [int] NULL,
	[NgayThue] [date] NULL,
	[NgayTraPhong] [date] NULL,
	[Dathanhtoan] [int] NULL,
 CONSTRAINT [PK_tblThuePhong] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblThuePhong] ([ID], [IDKhachHang], [IDPhong], [GiaPhong], [TienDatCoc], [NgayThue], [NgayTraPhong], [Dathanhtoan]) VALUES ('B1','KH1','A1','2500','1000','2022-01-01','2022-12-12',50000)
INSERT [dbo].[tblThuePhong] ([ID], [IDKhachHang], [IDPhong], [GiaPhong], [TienDatCoc], [NgayThue], [NgayTraPhong], [Dathanhtoan]) VALUES ('B2','KH2','A2','2500','1000','2022-01-01', NULL,50000)
INSERT [dbo].[tblThuePhong] ([ID], [IDKhachHang], [IDPhong], [GiaPhong], [TienDatCoc], [NgayThue], [NgayTraPhong], [Dathanhtoan]) VALUES ('B3','KH3', 'A3','2500','1000','2022-05-03','2022-10-12',50000)
INSERT [dbo].[tblThuePhong] ([ID], [IDKhachHang], [IDPhong], [GiaPhong], [TienDatCoc], [NgayThue], [NgayTraPhong], [Dathanhtoan]) VALUES ('B4','KH4','A4','2500','1000','2022-06-07', NULL,50000)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng dịch vụ và thêm dữ liệu**/
CREATE TABLE [dbo].[tblDichVu](
	[ID] [varchar](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDichVu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDichVu] ([ID], [TenDichVu]) VALUES ('DV1','M1')
INSERT [dbo].[tblDichVu] ([ID], [TenDichVu]) VALUES ('DV2','M2')
INSERT [dbo].[tblDichVu] ([ID], [TenDichVu]) VALUES ('DV3','M3')
INSERT [dbo].[tblDichVu] ([ID], [TenDichVu]) VALUES ('DV4','M4')
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng điện nước và thêm dữ liệu**/
CREATE TABLE [dbo].[tblDienNuoc](
	[ID] [varchar](10) NOT NULL,
	[IDThue] [varchar](10) NULL REFERENCES [dbo].[tblThuePhong](ID),
	[TuNgay] [date] NULL,
	[ToiNgay] [date] NULL,
	[ChiSoMoi] [int] NULL,
	[ChiSoCu] [int] NULL,
	[DonGia] [int] NULL,
	[DaThanhToan] [int] NULL,
	[IDLoaiDV] [varchar](10) NULL REFERENCES [dbo].[tblDichVu](ID),
 CONSTRAINT [PK_tblDienNuoc] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDienNuoc] ([ID], [IDThue], [TuNgay], [ToiNgay], [ChiSoMoi], [ChiSoCu], [DonGia], [DaThanhToan], [IDLoaiDV]) VALUES ('01','B1','2022-01-02','2023-02-28',334,556,300,300,'DV1')
INSERT [dbo].[tblDienNuoc] ([ID], [IDThue], [TuNgay], [ToiNgay], [ChiSoMoi], [ChiSoCu], [DonGia], [DaThanhToan], [IDLoaiDV]) VALUES ('02','B2', '2022-01-02','2023-02-28',364,576,200,200,'DV2')
INSERT [dbo].[tblDienNuoc] ([ID], [IDThue], [TuNgay], [ToiNgay], [ChiSoMoi], [ChiSoCu], [DonGia], [DaThanhToan], [IDLoaiDV]) VALUES ('03','B3', '2022-01-02','2023-02-28',525,776,280,280,'DV3')
INSERT [dbo].[tblDienNuoc] ([ID], [IDThue], [TuNgay], [ToiNgay], [ChiSoMoi], [ChiSoCu], [DonGia], [DaThanhToan], [IDLoaiDV]) VALUES ('04','B4', '2022-01-02','2023-02-28',432,612,320,320,'DV4')
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng quản lý và thêm dữ liệu**/
CREATE TABLE [dbo].[tblQuanLy](
	[TaiKhoan] [varchar](20) NOT NULL,
	[MatKhau] [varchar](250) NOT NULL)
INSERT [dbo].[tblQuanly] ([TaiKhoan], [MatKhau]) VALUES (N'BIDV', N'abcdefg')
INSERT [dbo].[tblQuanly] ([TaiKhoan], [MatKhau]) VALUES (N'Vietinbank', N'viettinbank')
INSERT [dbo].[tblQuanly] ([TaiKhoan], [MatKhau]) VALUES (N'Tpbank', N'matkhauno')
INSERT [dbo].[tblQuanly] ([TaiKhoan], [MatKhau]) VALUES (N'BIDV', N'kbietmatkhau')
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng cấu hình và thêm dữ liệu**/
CREATE TABLE [dbo].[tblCauHinh](
	[TenPhongTro] [varchar](20) NOT NULL,
	[ChuPhongTro] [varchar](250) NOT NULL,
	[DiaChiPhongTro] [varchar](250) NOT NULL,
	[SoDienThoai] [varchar](50) NOT NULL)
INSERT [dbo].[tblCauHinh] ([TenPhongTro], [ChuPhongTro], [DiaChiPhongTro], [SoDienThoai]) VALUES ('P1',N'Tuan', N'HaNoi', '0836732845')
INSERT [dbo].[tblCauHinh] ([TenPhongTro], [ChuPhongTro], [DiaChiPhongTro], [SoDienThoai]) VALUES ('P2',N'Tuan', N'HaNoi', '0836732845')
INSERT [dbo].[tblCauHinh] ([TenPhongTro], [ChuPhongTro], [DiaChiPhongTro], [SoDienThoai]) VALUES ('P3',N'Tuan', N'HaNoi', '0836732845')
INSERT [dbo].[tblCauHinh] ([TenPhongTro], [ChuPhongTro], [DiaChiPhongTro], [SoDienThoai]) VALUES ('P4',N'Tuan', N'HaNoi', '0836732845')
/** Khóa ngoại**/
ALTER TABLE [dbo].[tblPhong]  WITH CHECK ADD  CONSTRAINT [FK_tblPhong_tblLoaiPhong] FOREIGN KEY([IDLoaiPhong])
REFERENCES [dbo].[tblLoaiPhong] ([ID])
GO
ALTER TABLE [dbo].[tblPhong] CHECK CONSTRAINT [FK_tblPhong_tblLoaiPhong]

ALTER TABLE [dbo].[tblThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_tblThuePhong_tblPhong] FOREIGN KEY([IDPhong])
REFERENCES [dbo].[tblPhong] ([ID])
GO
ALTER TABLE [dbo].[tblThuePhong] CHECK CONSTRAINT [FK_tblThuePhong_tblPhong]

ALTER TABLE [dbo].[tblThuePhong]  WITH CHECK ADD  CONSTRAINT [FK_tblThuePhong_tblKhachhang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[tblKhachhang] ([ID])
GO
ALTER TABLE [dbo].[tblThuePhong] CHECK CONSTRAINT [FK_tblThuePhong_tblKhachhang]

ALTER TABLE [dbo].[tblDienNuoc]  WITH CHECK ADD  CONSTRAINT [FK_tblDienNuoc_tblThuePhong] FOREIGN KEY([IDThue])
REFERENCES [dbo].[tblThuePhong] ([ID])
GO
ALTER TABLE [dbo].[tblDienNuoc] CHECK CONSTRAINT [FK_tblDienNuoc_tblThuePhong]

ALTER TABLE [dbo].[tblDienNuoc]  WITH CHECK ADD  CONSTRAINT [FK_tblDienNuoc_tblDichVu] FOREIGN KEY([IDLoaiDV])
REFERENCES [dbo].[tblDichVu] ([ID])
GO
ALTER TABLE [dbo].[tblDienNuoc] CHECK CONSTRAINT [FK_tblDienNuoc_tblDichVu]
/** phân tán dữ liệu**/
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblCauHinh] (TenPhongTro,ChuPhongTro,DiaChiPhongTro,SoDienThoai) SELECT TenPhongTro,ChuPhongTro,DiaChiPhongTro,SoDienThoai FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblCauHinh]
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblDichVu] (ID,TenDichVu) SELECT ID,TenDichVu FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblDichVu]
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblKhachHang] (ID,HoTen,CMND,DienThoai,QueQuan) SELECT ID,HoTen,CMND,DienThoai,QueQuan FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblKhachHang]
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblLoaiPhong] (ID,TenLoaiPhong,DonGia) SELECT ID,TenLoaiPhong,DonGia FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblLoaiPhong]
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblPhong] (ID,TenPhong,IDLoaiPhong,TrangThai) SELECT ID,TenPhong,IDLoaiPhong,TrangThai FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblPhong]
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblQuanLy] (TaiKhoan,MatKhau) SELECT TaiKhoan,MatKhau FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblQuanLy]
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblThuePhong] (ID,IDKhachHang,IDPhong,GiaPhong,TienDatCoc,NgayThue,NgayTraPhong,DaThanhToan) SELECT ID,IDKhachHang,IDPhong,GiaPhong,TienDatCoc,NgayThue,NgayTraPhong,DaThanhToan FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblThuePhong]
INSERT INTO [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblDienNuoc] (ID,IDThue,TuNgay,ToiNgay,ChiSoMoi,ChiSoCu,DonGia,DaThanhToan,IDLoaiDV) SELECT ID,IDThue,TuNgay,ToiNgay,ChiSoMoi,ChiSoCu,DonGia,DaThanhToan,IDLoaiDV FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblDienNuoc]
/** Update dữ liệu phân tán**/
/*Cập nhật dữ liệu của khách hàng có mã khách hàng là A1 tại Database phân tán thứ 2 với điều kiện tồn tại ở database chính là database thứ nhất*/
SELECT * FROM [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblThuePhong] WHERE ID= 'B1'
UPDATE [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblThuePhong] SET IDKhachHang = 'KH1', IDPhong = 'A1' WHERE EXISTS (SELECT 1 FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblThuePhong] TP2 WHERE TP2.IDKhachHang = IDKhachHang AND TP2. IDKhachHang = 'KH1')
/*Cập nhật dữ liệu của đơn giá điện nước có số tiền lớn hơn 100 lên 120 tại Database phân tán thứ 2 với điều kiện tồn tại ở database chính là database thứ nhất*/
SELECT * FROM [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblDienNuoc] WHERE DonGia > 100
UPDATE [PINGLUMINE\QLPHONGTRO1].[QLPhongTro1].[dbo].[tblDienNuoc] SET DonGia = 120 WHERE EXISTS (SELECT 1 FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblDienNuoc] DN2 WHERE DN2.ID = ID AND DonGia > 100)
/* Kết hợp dữ liệu */
SELECT ID,IDKhachHang,IDPhong,GiaPhong,TienDatCoc,NgayThue,NgayTraPhong,DaThanhToan FROM [PINGLUMINE].[QLPhongTro1].[dbo].[tblThuePhong] UNION SELECT ID,IDKhachHang,IDPhong,GiaPhong,TienDatCoc,NgayThue,NgayTraPhong,DaThanhToan FROM [QLPhongTro1].[dbo].[tblThuePhong]

