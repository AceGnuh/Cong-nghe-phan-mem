CREATE TABLE BapNuoc
(
  maDichVu CHAR(10) NOT NULL,
  donGia MONEY NOT NULL,
  tenCombo VARCHAR(100) NOT NULL,
  PRIMARY KEY (maDichVu)
);

CREATE TABLE KhachHang
(
  maKhachHang CHAR(10) NOT NULL,
  tenKhachHang VARCHAR(50) NOT NULL,
  ngaySinh DATE NOT NULL,
  soDienThoai VARCHAR(100) NOT NULL,
  diaChi VARCHAR(100) NOT NULL,
  diemTichLuy INT NOT NULL,
  PRIMARY KEY (maKhachHang)
);

CREATE TABLE Admin
(
  maAdmin CHAR(10) NOT NULL,
  chucVu VARCHAR(50) NOT NULL,
  maKhachHang CHAR(10) NOT NULL,
  PRIMARY KEY (maAdmin),
  FOREIGN KEY (maKhachHang) REFERENCES KhachHang(maKhachHang)
);

CREATE TABLE Phim
(
  maPhim CHAR(10) NOT NULL,
  tenPhim VARCHAR(100) NOT NULL,
  theLoai VARCHAR(100) NOT NULL,
  PRIMARY KEY (maPhim)
);

CREATE TABLE KhuVuc
(
  maKhuVuc CHAR(10) NOT NULL,
  tenKhuVuc VARCHAR(50) NOT NULL,
  PRIMARY KEY (maKhuVuc)
);

CREATE TABLE Rap
(
  maRap CHAR(10) NOT NULL,
  tenRap VARCHAR(50) NOT NULL,
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