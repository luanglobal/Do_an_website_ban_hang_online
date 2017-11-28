CREATE DATABASE QLNHANVIEN
GO

CREATE TABLE NHANVIEN(
	MANHANVIEN varchar(255) not null,
	TENNHANVIEN varchar(255) not null,
	DIACHI varchar(255) not null,
	MABOPHAN varchar (12) not null,
	TENBOPHAN varchar(255) not null,
	NGAYSINH DATE not null,
	EMAIL varchar(255) not null,
	SODIENTHOAI int  not null
)
ALTER TABLE NHANVIEN
ADD CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANHANVIEN)

CREATE TABLE KHACHHANG(
	MAKHACHHANG varchar(255) not null,
	TENKHACHHANG varchar(255) not null,
	DIACHI varchar(255) not null,
	NGAYSINH DATE not null,
	EMAIL varchar(255) not null,
	TAIKHOANNGANHANG varchar(255) not null,
	MANHANVIEN varchar(255) not null
)
ALTER TABLE KHACHHANG
ADD CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKHACHHANG)

CREATE TABLE SANPHAM(
	MASANPHAM varchar(255) not null,
	TENSANPHAM varchar(255) not null,
	SOLUONG int not null,
	LOAISANPHAM int not null
)
ALTER TABLE SANPHAM
ADD CONSTRAINT PK_SANPHAM PRIMARY KEY (MASANPHAM)

CREATE TABLE DONHANG(
	MADONHANG varchar(255),
	SOLUONG int not null,
	MAKHACHHANG varchar(255) not null,
	TENKHACHHANG varchar (12) not null,
	TINHTRANG varchar(255) not null,
	MASANPHAM varchar(255) not null
)

/* ----------------------------------------------------------*/
ALTER TABLE KHACHHANG
ADD CONSTRAINT FK_KHACHHANG_NHANVIEN FOREIGN KEY (MANHANVIEN)
references NHANVIEN(MANHANVIEN)

ALTER TABLE DONHANG
ADD CONSTRAINT FK_DONHANG_KHACHHANG FOREIGN KEY (MAKHACHHANG)
references KHACHHANG(MAKHACHHANG)

ALTER TABLE DONHANG
ADD CONSTRAINT FK_DONHANG_SANPHAM FOREIGN KEY (MASANPHAM)
references SANPHAM(MASANPHAM)

/* Ràng buộc unique */
ALTER TABLE DONHANG
ADD CONSTRAINT UQ_DONHANG_MADONHANG UNIQUE (MADONHANG)

/* Ràng buộc dữ liệu mặc định */
ALTER TABLE KHACHHANG
ADD CONSTRAINT DF_KHACHHANG DEFAULT ('NV01') FOR MANHANVIEN