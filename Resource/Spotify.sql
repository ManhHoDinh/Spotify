create database Spotify

create table Song
(
	ID int identity(1,1) primary key,
	SongName nvarchar(max),
	SongLink nvarchar(max),
	SingerName nvarchar(max),
	SongImage nvarchar(max),
	AlbumName nvarchar(max),
	Descriptions nvarchar(max),
	PostTime smalldatetime,
	SongDuration smalldatetime,
)

create table Album
(
	ID int identity(1,1) primary key,
	AlbumName nvarchar(max),
	Descriptions nvarchar(max),
	AlbumImage nvarchar(max),
	AlbumColor nvarchar(max),
)

create table Users
(
	UserID int identity(1,1) primary key,
	UserName nvarchar(max),
	Password nvarchar(max),
	UserImage nvarchar(max),
)

create table Playlist
(
	ID int identity(1,1) primary key,
	PlaylistName nvarchar(max),
	Descriptions nvarchar(max),
	PlaylistImage nvarchar(max),
	UserID int not null,

	foreign key (UserID) references Users(UserID),
)

create table AlbumAndSongRelation
(
	AlbumID int not null,
	SongID int not null

	foreign key (AlbumID) references Album(ID),
	foreign key (SongID) references Song(ID)
)

alter table AlbumAndSongRelation add constraint PK_AASR primary key (AlbumID, SongID)

create table PlaylistAndSongRelation
(
	PlaylistID int not null,
	SongID int not null,

	foreign key (PlaylistID) references Playlist(ID),
	foreign key (SongID) references Song(ID)
)
alter table PlaylistAndSongRelation add constraint PK_PASR primary key (PlaylistID, SongID)

insert into Song values (N'Ánh Trăng Tình Ái', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.mp3', N'Dương Edward', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.jpg', Null, null, '2021', '04:04')
insert into Song values (N'Bao Tiền Một Mớ Bình Yên', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.mp3', N'14 Casper - Bon Nghiêm', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.jpg', Null, null, '2020', '05:00')

insert into Song values (N'Bất Bình Thường', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.mp3', N'WHEE!', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.jpg', Null, null, '2020', '06:56')
insert into Song values (N'Bên Trên Tầng Lầu', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.mp3', N'Tăng Duy Tân', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.jpg', Null, null, '2022', '03:04')
insert into Song values (N'Bước Qua Mùa Cô Đơn', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.mp3', N'Vũ', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.jpg', Null, null, '2020', '04:38')
insert into Song values (N'Buồn Thì Cứ Khóc Đi', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.mp3', N'Lynk Lee', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.jpg', Null, null, '2019', '03:42')
insert into Song values (N'Cảm Nắng', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.mp3', N'Suni Hạ Linh', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.jpg', Null, null, '2017', '03:48')
insert into Song values (N'Cảm Ơn Và Xin Lỗi', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.mp3', N'Chillies', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.jpg', Null, null, '2019', '05:16')
insert into Song values (N'Chờ Anh Nhé (feat.Hoàng Rob)', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe(feat.HoangRob).mp3', N'Hoàng Dũng, Hoang Rob', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe.jpg', N'Tình Ca Hoàng Dũng', null, '2018', '05:22')
insert into Song values (N'Chuyện Nhà Bé Thôi, Con Đừng Về', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoi,ConDungVe.mp3', N'Kai Đinh, MIN', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoiConDungVe.jpg', Null, null, '2021', '04:13')
insert into Song values (N'Chuyện Rằng', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.mp3', N'Thịnh Suy', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.jpg', Null, null, '2020', '04:32')
insert into Song values (N'Có Điều Gì, Sao Không Nói Cùng Anh_(Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion).mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh.jpg', Null, null, '2021', '04:17')
insert into Song values (N'Có Một Người Sẽ Đến', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.mp3', N'Vy Vy', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.jpg', Null, null, '2020', '04:40')
insert into Song values (N'Có Người', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.mp3', N'Vu Cat Tuong', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.jpg', Null, null, '2019', '03:56')
insert into Song values (N'Dấu Mưa', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.jpg', Null, null, '2013', '04:20')
insert into Song values (N'Đi Qua Mùa Hạ', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.mp3', N'Thái Đinh', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.jpg', Null, null, '2018', '04:43')
insert into Song values (N'Đôi Lời', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.jpg', N'Tình Ca Hoàng Dũng', null, '2018', '03:52')
insert into Song values (N'Dù Cho Mai Về Sau (Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/DuChoMaiVeSau_AcousticVersion.mp3', N'buitruonglinh', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/ChoDuMaiVeSau.jpg', null, null, '2020', '03:33')
insert into Song values (N'Đúng Cũng Thành Sai', N'pack://siteoforigin:,,,/Resource/Songs/DungCungThanhSai/DungCungThanhSai.mp3', N'Mỹ Tâm', N'pack://siteoforigin:,,,/Resource/Songs/DungCungThanhSai/DungCungThanhSai.jpg', null, null, '2020', '04:47')
insert into Song values (N'Gác Lại Âu Lo (feat.MiuLe)', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo(feat.MiuLe).mp3', N'Da LAB, Miu Lê', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo.jpg', null, null, '2020', '04:42')
insert into Song values (N'Hẹn Ước Từ Hư Vô', N'pack://siteoforigin:,,,/Resource/Songs/HenUocTuHuVo/HenUocTuHuVo.mp3', N'Mỹ Tâm', N'pack://siteoforigin:,,,/Resource/Songs/HenUocTuHuVo/HenUocTuHuVo.jpg', null, null, '2022', '04:07')
insert into Song values (N'Khi Cô Đơn Em Nhớ Đến Ai', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.mp3', N'GREY D, Suni Hạ Linh, Orange, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.jpg', N'Hương Mùa Hè EP.01', null, '2022', '04:29')
insert into Song values (N'Mùa Thu Cho Em', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.jpg', null, null, '2017', '04:31')
insert into Song values (N'Nàng Thơ', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.jpg', null, null, '2020', '04:14')
insert into Song values (N'Nàng Thơ... Trời Giấu Trời Mang Đi', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.mp3', N'AMEE, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.jpg', N'dreAMEE', null, '2020', '04:22')
insert into Song values (N'Nếu Mai Gặp Lại (feat.Vũ Đặng Quốc Việt)', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai(feat.VuDangQuocViet).mp3', N'Nguyen Ha, Vũ Đặng Quốc Việt', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai.jpg', null, null, '2020', '05:15')
insert into Song values (N'Ngày Xưa Em Đến', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.mp3', N'Anh Khang', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.jpg', N'Những Bài Hát Bất Hủ Thập Niên 8x 9x Của Anh Khanh (Vol.2)', null, '2021', '04:13')
insert into Song values (N'Phố Không Em', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.mp3', N'Thái Đinh', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.jpg', null, null, '2016', '04:46')
insert into Song values (N'Phút Ban Đầu', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.mp3', N'Vũ.', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.jpg', null, null, '2013', '04:03')
insert into Song values (N'Suýt Nữa Thì', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.mp3', N'Andiez', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.jpg', null, null, '2018', '04:46')
insert into Song values (N'Tình Em Là Đại Dương', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.mp3', N'Hoàng Dũng, GREY D', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.jpg', N'Hương Mùa Hè EP.02', null, '2022', '03:46')
insert into Song values (N'Trời Sáng Rồi (Theme Song From "Trời Sáng Rồi, Ta Ngủ Đi Thôi")', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemeSongFrom_TroiSangRoi,TaNguDiThoi)/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi.jpg', null, null, '2019', '04:12')
insert into Song values (N'Từ Đó', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.jpg', null , null, '2020', '02:56')
insert into Song values (N'Ước Một Ngày (7 Deep Cuts Session)', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay(7DeepCutsSession).mp3', N'Phùng Khánh Linh', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay.jpg', null , null, '2020', '04:04')
insert into Song values (N'Vẫn Nhớ', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.mp3', N'Ha Nhi', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.jpg', null , null, '2020', '04:04')
insert into Song values (N'Vào Hạ', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.mp3', N'Suni Hạ Linh', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.jpg', N'Hương Mùa Hè EP.01' , null, '2022', '03:16')
insert into Song values (N'Với Anh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.mp3', N'Thai Trinh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.jpg', N'Trinh Acoustic', null, '2020', '06:06')
insert into Song values (N'Xin Lỗi', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.jpg', null, null, '2019', '04:04')
insert into Song values (N'Xuân, Hạ, Thu, Đông, Rồi Lại Xuân', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.mp3', N'AMEE', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.jpg', N'dreAMEE', null, '2020', '04:50')
insert into Song values (N'Yếu Đuối', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.jpg', N'Tình Ca Hoàng Dũng', null, '2018', '05:23')
insert into Song values (N'Yêu Không Hối Tiếc (Remake)', N'pack://siteoforigin:,,,/Resource/Songs/YeuKhongHoiTiec_Remake/YeuKhongHoiTiec_Remake.mp3', N'Huỳnh Tú', N'pack://siteoforigin:,,,/Resource/Songs/YeuKhongHoiTiec_Remake/YeuKhongHoiTiec.jpg', null, null, '2018', '03:36')



insert into Album values (N'Tình Ca Hoàng Dũng', null , N'pack://siteoforigin:,,,/Resource/Album/TinhCaHoangDung/TinhCaHoangDung.jpg', N'orange')
insert into Album values (N'Hương Mùa Hè EP.01', null , N'pack://siteoforigin:,,,/Resource/Album/HuongMuaHeEP.01/HuongMuaHeEP.01.jpg', N'gray')
insert into Album values (N'Trinh Acoustic', null , N'pack://siteoforigin:,,,/Resource/Album/TrinhAcoustic/TrinhAcoustic.jpg', N'blue')
insert into Album values (N'Những Bài Hát Bất Hủ Thập Niên 8x 9x Của Anh Khanh (Vol.2)', null , N'pack://siteoforigin:,,,/Resource/Album/NhungBaiHatBatHuCuaAnhKhang(Vol2)/NhungBaiHatBatHuCuaAnhKhang(Vol2).jpg', N'dark blue')
insert into Album values (N'Hương Mùa Hè EP.02', null , N'pack://siteoforigin:,,,/Resource/Album/HuongMuaHeEP.02/HuongMuaHeEP.02.jpg', N'light gray')













