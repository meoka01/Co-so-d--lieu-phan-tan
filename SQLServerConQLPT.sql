/** Tạo database của server con **/
create database QLPhongTro1
/** Tạo bảng khách hàng trên server con**/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng loại phòng trên server con **/
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng phòng trên server con **/
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng thuê phòng trên server con **/
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng dịch vụ trên server con **/
CREATE TABLE [dbo].[tblDichVu](
	[ID] [varchar](10) NOT NULL,
	[TenDichVu] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblDichVu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng điện nước trên server con **/
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng quản lý trên server con **/
CREATE TABLE [dbo].[tblQuanLy](
	[TaiKhoan] [varchar](20) NOT NULL,
	[MatKhau] [varchar](250) NOT NULL)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/** Tạo bảng cấu hình trên server con **/
CREATE TABLE [dbo].[tblCauHinh](
	[TenPhongTro] [varchar](20) NOT NULL,
	[ChuPhongTro] [varchar](250) NOT NULL,
	[DiaChiPhongTro] [varchar](250) NOT NULL,
	[SoDienThoai] [varchar](50) NOT NULL)