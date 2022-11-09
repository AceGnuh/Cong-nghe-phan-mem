CREATE DATABASE CINEMA
GO
USE CINEMA
GO

CREATE TABLE BapNuoc
(
  maDichVu CHAR(10) NOT NULL,
  donGia MONEY NOT NULL,
  tenCombo NVARCHAR(100) NOT NULL,
  PRIMARY KEY (maDichVu)
);

CREATE TABLE KhachHang
(
  maKhachHang CHAR(10) NOT NULL,
  tenKhachHang NVARCHAR(100) NOT NULL,
  ngaySinh DATE NOT NULL,
  soDienThoai VARCHAR(100) NOT NULL,
  diaChi NVARCHAR(100) NOT NULL,
  diemTichLuy INT NOT NULL,
  PRIMARY KEY (maKhachHang)
);

CREATE TABLE Admin
(
  maAdmin CHAR(10) NOT NULL,
  chucVu NVARCHAR(50) NOT NULL,
  maKhachHang CHAR(10) NOT NULL,
  PRIMARY KEY (maAdmin),
  FOREIGN KEY (maKhachHang) REFERENCES KhachHang(maKhachHang)
);

CREATE TABLE Phim
(
  maPhim CHAR(10) NOT NULL,
  tenPhim NVARCHAR(100) NOT NULL,
  theLoai VARCHAR(100) NOT NULL,
  PRIMARY KEY (maPhim)
);

CREATE TABLE KhuVuc
(
  maKhuVuc CHAR(10) NOT NULL,
  tenKhuVuc NVARCHAR(50) NOT NULL,
  PRIMARY KEY (maKhuVuc)
);

CREATE TABLE Rap
(
  maRap CHAR(10) NOT NULL,
  tenRap NVARCHAR(50) NOT NULL,
  maKhuVuc CHAR(10) NOT NULL,
  PRIMARY KEY (maRap),
  FOREIGN KEY (maKhuVuc) REFERENCES KhuVuc(maKhuVuc)
);

CREATE TABLE DanhGia
(
  maKhachHang CHAR(10) NOT NULL,
  maPhim CHAR(10) NOT NULL,
  PRIMARY KEY (maKhachHang, maPhim),
  FOREIGN KEY (maKhachHang) REFERENCES KhachHang(maKhachHang),
  FOREIGN KEY (maPhim) REFERENCES Phim(maPhim)
);

CREATE TABLE PhongChieu
(
  maPhongChieu CHAR(10) NOT NULL,
  soPhongChieu INT NOT NULL,
  maRap CHAR(10) NOT NULL,
  PRIMARY KEY (maPhongChieu),
  FOREIGN KEY (maRap) REFERENCES Rap(maRap)
);

CREATE TABLE SuatChieu
(
  ngayChieu DATE NOT NULL,
  donGia MONEY NOT NULL,
  maSuatChieu CHAR(10) NOT NULL,
  maPhim CHAR(10) NOT NULL,
  maPhongChieu CHAR(10) NOT NULL,
  PRIMARY KEY (maSuatChieu),
  FOREIGN KEY (maPhim) REFERENCES Phim(maPhim),
  FOREIGN KEY (maPhongChieu) REFERENCES PhongChieu(maPhongChieu)
);

CREATE TABLE HoaDon
(
  maHoaDon CHAR(10) NOT NULL,
  tongTien MONEY NOT NULL,
  ngayLapHoaDon DATE NOT NULL,
  maDichVu CHAR(10) NOT NULL,
  maSuatChieu CHAR(10) NOT NULL,
  PRIMARY KEY (maHoaDon),
  FOREIGN KEY (maDichVu) REFERENCES BapNuoc(maDichVu),
  FOREIGN KEY (maSuatChieu) REFERENCES SuatChieu(maSuatChieu)
);

CREATE TABLE Ve
(
  soGhe INT NOT NULL,
  maVe CHAR(10) NOT NULL,
  maHoaDon CHAR(10) NOT NULL,
  PRIMARY KEY (maVe),
  FOREIGN KEY (maHoaDon) REFERENCES HoaDon(maHoaDon)
);

CREATE TABLE LichSu
(
  maKhachHang CHAR(10) NOT NULL,
  maHoaDon CHAR(10) NOT NULL,
  PRIMARY KEY (maKhachHang, maHoaDon),
  FOREIGN KEY (maKhachHang) REFERENCES KhachHang(maKhachHang),
  FOREIGN KEY (maHoaDon) REFERENCES HoaDon(maHoaDon)
);

INSERT INTO KhuVuc(maKhuVuc, tenKhuVuc) VALUES ('KV01', N'Hồ Chí Minh');
INSERT INTO KhuVuc(maKhuVuc, tenKhuVuc) VALUES ('KV02', N'Hà Nội');
INSERT INTO KhuVuc(maKhuVuc, tenKhuVuc) VALUES ('KV03', N'Đà Nẵng');
INSERT INTO KhuVuc(maKhuVuc, tenKhuVuc) VALUES ('KV04', N'Đà Lạt');
INSERT INTO KhuVuc(maKhuVuc, tenKhuVuc) VALUES ('KV05', N'Huế');
select * from KhuVuc

INSERT INTO Rap(maRap, tenRap, maKhuVuc) VALUES ('R01', N'CGV Hồ Chí Minh', 'KV01');
INSERT INTO Rap(maRap, tenRap, maKhuVuc) VALUES ('R02', N'CGV Hà Nội', 'KV02');
INSERT INTO Rap(maRap, tenRap, maKhuVuc) VALUES ('R03', N'CGV Đà Nẵng', 'KV03');
INSERT INTO Rap(maRap, tenRap, maKhuVuc) VALUES ('R04', N'CGV Đà Lạt', 'KV04');
INSERT INTO Rap(maRap, tenRap, maKhuVuc) VALUES ('R05', N'CGV Huế', 'KV05');
SELECT * FROM Rap

INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC01R01', '01', 'R01')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC02R01', '02', 'R01')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC01R02', '01', 'R02')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC02R02', '02', 'R02')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC01R03', '01', 'R03')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC02R03', '02', 'R03')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC01R04', '01', 'R04')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC02R04', '02', 'R04')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC01R05', '01', 'R05')
INSERT INTO PhongChieu(maPhongChieu, soPhongChieu, maRap) VALUES ('PC02R05', '02', 'R05')
SELECT * FROM PhongChieu

INSERT INTO KhachHang(maKhachHang, tenKhachHang, soDienThoai, ngaySinh, diaChi, diemTichLuy) VALUES ('KH01', N'Trần Tấn Hưng', '0123456789', CAST('2022-11-10T12:00:00.000' AS DateTime), N'Hồ Chí Minh', 0);
INSERT INTO KhachHang(maKhachHang, tenKhachHang, soDienThoai, ngaySinh, diaChi, diemTichLuy) VALUES ('KH02', N'Trần Đăng Quang', '0123456789', CAST('2022-11-20T12:00:00.000' AS DateTime), N'Hồ Chí Minh', 0);
INSERT INTO KhachHang(maKhachHang, tenKhachHang, soDienThoai, ngaySinh, diaChi, diemTichLuy) VALUES ('KH03', N'Phạm Thái Học', '0123456789', CAST('2022-11-20T12:00:00.000' AS DateTime), N'Hồ Chí Minh', 0);
INSERT INTO KhachHang(maKhachHang, tenKhachHang, soDienThoai, ngaySinh, diaChi, diemTichLuy) VALUES ('KH04', N'Phạm Nguyễn', '0123456789', CAST('2022-11-20T12:00:00.000' AS DateTime), N'Hồ Chí Minh', 0);
INSERT INTO KhachHang(maKhachHang, tenKhachHang, soDienThoai, ngaySinh, diaChi, diemTichLuy) VALUES ('KH05', N'Học Thứ Hai', '0123456789', CAST('2022-11-20T12:00:00.000' AS DateTime), N'Đà Nẵng', 0);
SELECT * FROM KhachHang
DELETE FROM KhachHang

INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P01', 'FORREST GUMP', N'Tâm Lý')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P02', 'HEM CUT', N'Hài')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P03', 'LOST IN TRANSLATION', N'lãng mạng')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P04', 'VIRUS CUONG LOAI', N'Kinh dị')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P05', 'BONG DUNG TRUNG SO', N'Hài')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P06', 'YES MAN', N'Tâm Lý')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P07', 'ONE PIECE FILM RED', N'Hoạt Hình')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P08', 'IRON MAN', N'Khoa học viễn tưởng')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P09', 'NHA BA NU', N'Gia đình')
INSERT INTO Phim(maPhim, tenPhim, theLoai) VALUES ('P010', 'BO GIA', N'Gia đình')

INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV01', N'1 bắp lớn và 2 nước lớn', 105000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'1 bặp lớn và 2 nước lớn', 85000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'1 bắp vừa và 1 nước lớn', 85000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'combo Onepice', 199000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'1 bắp vị ngọt', 59000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'1 bắp vị mặn', 59000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'1 bắp vị caramel', 74000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'1 bắp vị phô mai', 74000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'1 bắp vị chocolate', 74000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'Nước ngọt tươi', 38000)
INSERT INTO BapNuoc(maDichVu, tenCombo, donGia) VALUES ('DV02', N'Trà sữa đặc biệt', 35000)


INSERT INTO SuatChieu(maSuatChieu,maPhongChieu, maPhim, ngayChieu, donGia) VALUES ('SC01')

--UPDATE TICH DIEM TRONG BANG KHACH HANG
-- TINH TONG TIEN