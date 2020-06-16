USE [master]
GO
/****** Object:  Database [QLTRASUA]    Script Date: 16/06/2020 3:38:18 PM ******/
CREATE DATABASE [QLTRASUA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTRASUA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MINHDUC\MSSQL\DATA\QLTRASUA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLTRASUA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MINHDUC\MSSQL\DATA\QLTRASUA_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLTRASUA] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTRASUA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTRASUA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTRASUA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTRASUA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTRASUA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTRASUA] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTRASUA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLTRASUA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTRASUA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTRASUA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTRASUA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTRASUA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTRASUA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTRASUA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTRASUA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTRASUA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTRASUA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTRASUA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTRASUA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTRASUA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTRASUA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTRASUA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTRASUA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTRASUA] SET RECOVERY FULL 
GO
ALTER DATABASE [QLTRASUA] SET  MULTI_USER 
GO
ALTER DATABASE [QLTRASUA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTRASUA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTRASUA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTRASUA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLTRASUA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLTRASUA', N'ON'
GO
ALTER DATABASE [QLTRASUA] SET QUERY_STORE = OFF
GO
USE [QLTRASUA]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserAdmin] [varchar](30) NOT NULL,
	[PassAdmin] [varchar](30) NOT NULL,
	[Hoten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[MaBanner] [int] IDENTITY(1,1) NOT NULL,
	[MaTS] [int] NULL,
	[NoiDung] [nvarchar](100) NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[MaBanner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHITIETDONTHANG]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDONTHANG](
	[MaDonHang] [int] NOT NULL,
	[MaTS] [int] NOT NULL,
	[Soluong] [int] NULL,
	[Dongia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CTDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[Dathanhtoan] [bit] NULL,
	[Tinhtranggiaohang] [bit] NULL,
	[Ngaydat] [datetime] NULL,
	[Ngaygiao] [datetime] NOT NULL,
	[MaKH] [int] NULL,
	[DiaChiGiao] [nvarchar](50) NULL,
	[SDTNguoiNhan] [varchar](12) NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Taikhoan] [varchar](50) NOT NULL,
	[Matkhau] [varchar](50) NOT NULL,
	[Email] [varchar](100) NULL,
	[DiachiKH] [nvarchar](200) NULL,
	[DienthoaiKH] [varchar](50) NULL,
	[Ngaysinh] [datetime] NULL,
 CONSTRAINT [PK_Khachhang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAI]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAI](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRASUA]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRASUA](
	[MaTS] [int] IDENTITY(1,1) NOT NULL,
	[TenTS] [nvarchar](100) NOT NULL,
	[Giaban] [decimal](18, 0) NULL,
	[Anhbia] [varchar](50) NULL,
	[MaLoai] [int] NULL,
 CONSTRAINT [PK_TraSua] PRIMARY KEY CLUSTERED 
(
	[MaTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([UserAdmin], [PassAdmin], [Hoten]) VALUES (N'admin', N'admin', N'Minh Đức')
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([MaBanner], [MaTS], [NoiDung]) VALUES (1, 29, NULL)
INSERT [dbo].[Banner] ([MaBanner], [MaTS], [NoiDung]) VALUES (2, 31, NULL)
INSERT [dbo].[Banner] ([MaBanner], [MaTS], [NoiDung]) VALUES (3, 32, NULL)
INSERT [dbo].[Banner] ([MaBanner], [MaTS], [NoiDung]) VALUES (4, 35, NULL)
INSERT [dbo].[Banner] ([MaBanner], [MaTS], [NoiDung]) VALUES (5, 36, NULL)
SET IDENTITY_INSERT [dbo].[Banner] OFF
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaTS], [Soluong], [Dongia]) VALUES (1, 23, 1, CAST(20000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaTS], [Soluong], [Dongia]) VALUES (2, 26, 3, CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[CHITIETDONTHANG] ([MaDonHang], [MaTS], [Soluong], [Dongia]) VALUES (2, 36, 1, CAST(47000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [DiaChiGiao], [SDTNguoiNhan]) VALUES (1, 0, 0, CAST(N'2020-06-16T10:18:01.840' AS DateTime), CAST(N'2020-06-17T00:00:00.000' AS DateTime), 1, NULL, N'0918062755')
INSERT [dbo].[DONDATHANG] ([MaDonHang], [Dathanhtoan], [Tinhtranggiaohang], [Ngaydat], [Ngaygiao], [MaKH], [DiaChiGiao], [SDTNguoiNhan]) VALUES (2, 1, 1, CAST(N'2020-06-16T11:14:12.690' AS DateTime), CAST(N'2020-06-17T00:00:00.000' AS DateTime), 1, NULL, N'0918062755')
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTen], [Taikhoan], [Matkhau], [Email], [DiachiKH], [DienthoaiKH], [Ngaysinh]) VALUES (1, N'KhachHang', N'khachhang', N'123456', N'phetcm@hgmail.com', N'12 Trần Huy Liệu', N'0918062755', CAST(N'1976-08-20T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAI] ON 

INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (1, N'Thức uống đặc biệt')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (2, N'Trà Sữa')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (3, N'Trà Nguyên Chất')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (4, N'Thức uống sáng tạo')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (5, N'Thức uống đá xay')
INSERT [dbo].[LOAI] ([MaLoai], [TenLoai]) VALUES (6, N'Topping')
SET IDENTITY_INSERT [dbo].[LOAI] OFF
SET IDENTITY_INSERT [dbo].[TRASUA] ON 

INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (20, N'Trà Đào ', CAST(10000 AS Decimal(18, 0)), N'hong_tra_vai_2.jpg', 3)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (21, N'Lục Trà ', CAST(10000 AS Decimal(18, 0)), N'ly-tra-sua-lam-tu-tra-den-huong-socola.jpg', 3)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (22, N'Trà sữa ', CAST(20000 AS Decimal(18, 0)), N'timthumb.jpg', 2)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (23, N'Lục trà sữa ', CAST(20000 AS Decimal(18, 0)), N'7-loai-tra-sua-8.jpg', 2)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (24, N'Trà sữa Thái  ', CAST(20000 AS Decimal(18, 0)), N'hong-tra-tran-chau-173012-1466605784.jpg', 2)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (25, N'Trà Thanos', CAST(200000 AS Decimal(18, 0)), N'tra-sua-hot-and-cold-menu.fid_.jpg', 1)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (26, N'Trà BatMan', CAST(200000 AS Decimal(18, 0)), N'5eb527f993bc3b290a698b6e429e1edf.jpg', 1)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (28, N'Trà Đen Machiato', CAST(5000 AS Decimal(18, 0)), N'slider-20171115-1510763558916839.jpg', 4)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (29, N'Hồng Trà Đen Machiato', CAST(5000 AS Decimal(18, 0)), N'tra-sua-tran-chau00021.png', 4)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (31, N'Đá xay Chanh dây', CAST(50000 AS Decimal(18, 0)), N'ccf09c3c-6864-4040-836f-728abf505a84.jpg', 5)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (32, N'Đá xay Xoài', CAST(50000 AS Decimal(18, 0)), N'cover-tra-sua-thu-tuc-giay-to.jpg', 5)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (35, N'Trà sữa trân châu topping', CAST(47000 AS Decimal(18, 0)), N'5eb527f993bc3b290a698b6e429e1edf.jpg', 6)
INSERT [dbo].[TRASUA] ([MaTS], [TenTS], [Giaban], [Anhbia], [MaLoai]) VALUES (36, N'Trà sữa Phô mai topping', CAST(47000 AS Decimal(18, 0)), N'2 (1).jpg', 6)
SET IDENTITY_INSERT [dbo].[TRASUA] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 16/06/2020 3:38:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 16/06/2020 3:38:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 16/06/2020 3:38:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 16/06/2020 3:38:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 16/06/2020 3:38:18 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 16/06/2020 3:38:18 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__7FB3F64F14966B19]    Script Date: 16/06/2020 3:38:18 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [UQ__KHACHHAN__7FB3F64F14966B19] UNIQUE NONCLUSTERED 
(
	[Taikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__KHACHHAN__A9D1053471E1FF5E]    Script Date: 16/06/2020 3:38:18 PM ******/
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [UQ__KHACHHAN__A9D1053471E1FF5E] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Banner]  WITH CHECK ADD  CONSTRAINT [FK_Banner_TRASUA] FOREIGN KEY([MaTS])
REFERENCES [dbo].[TRASUA] ([MaTS])
GO
ALTER TABLE [dbo].[Banner] CHECK CONSTRAINT [FK_Banner_TRASUA]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_Madh] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DONDATHANG] ([MaDonHang])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_Madh]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD  CONSTRAINT [FK_MaTs] FOREIGN KEY([MaTS])
REFERENCES [dbo].[TRASUA] ([MaTS])
GO
ALTER TABLE [dbo].[CHITIETDONTHANG] CHECK CONSTRAINT [FK_MaTs]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_Khachhang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_Khachhang]
GO
ALTER TABLE [dbo].[TRASUA]  WITH CHECK ADD  CONSTRAINT [FK_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAI] ([MaLoai])
GO
ALTER TABLE [dbo].[TRASUA] CHECK CONSTRAINT [FK_Loai]
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Dongia]>=(0)))
GO
ALTER TABLE [dbo].[CHITIETDONTHANG]  WITH CHECK ADD CHECK  (([Soluong]>(0)))
GO
ALTER TABLE [dbo].[TRASUA]  WITH CHECK ADD CHECK  (([Giaban]>=(0)))
GO
/****** Object:  StoredProcedure [dbo].[DoanhThu]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DoanhThu] 
@ngaybatdau date, @ngayketthuc date, @DoanhThu bigint out
as
begin
	set	@DoanhThu = (select sum(Soluong*Dongia)
	from CHITIETDONTHANG c, DONDATHANG d
	where c.MaDonHang = d.MaDonHang and d.Dathanhtoan = 1 and  d.Ngaydat between @ngaybatdau and @ngayketthuc)
	return @DoanhThu 
end
GO
/****** Object:  StoredProcedure [dbo].[LoadBanner]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LoadBanner]
as
begin
	select t.*, b.NoiDung, l.TenLoai
	from Banner b, TRASUA t,LOAI l
	where b.MaTS = t.MaTS and t.MaLoai=l.MaLoai
end
GO
/****** Object:  StoredProcedure [dbo].[topbanchay]    Script Date: 16/06/2020 3:38:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[topbanchay]
as
begin
select TOP(10) b.MaTS ,Sum(b.Soluong) as 'Tong so luong'  
from TRASUA a, CHITIETDONTHANG b 
where a.MaTS = b.MaTS 
group by b.MaTS 
order by 'Tong so luong' desc 
end
GO
USE [master]
GO
ALTER DATABASE [QLTRASUA] SET  READ_WRITE 
GO
