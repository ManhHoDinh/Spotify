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
alter table Song alter column PostTime nvarchar(max)
alter table Song alter column SongDuration nvarchar(max)

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
	PlaylistType int,
	foreign key (UserID) references Users(UserID),
)

create table PlaylistAndSongRelation
(
	PlaylistID int not null,
	SongID int not null,
	foreign key (PlaylistID) references Playlist(ID),
	foreign key (SongID) references Song(ID)
)

create table AlbumAndSongRelation
(
	AlbumID int not null,
	SongID int not null,
	foreign key (AlbumID) references Album(ID),
	foreign key (SongID) references Song(ID)
)

alter table AlbumAndSongRelation add constraint PK_AASR primary key (AlbumID, SongID)
alter table PlaylistAndSongRelation add constraint PK_PASR primary key (PlaylistID, SongID)

insert into Song values (N'Ánh Trang Tình Ái', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.mp3', N'Duong Edward', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.jpg', Null, null, '2021', '04:04')
insert into Song values (N'Bao Ti?n M?t M? Bình Yên', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.mp3', N'14 Casper - Bon Nghiêm', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.jpg', Null, null, '2020', '05:00')

insert into Song values (N'B?t Bình Thu?ng', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.mp3', N'WHEE!', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.jpg', Null, null, '2020', '06:56')
insert into Song values (N'Bên Trên T?ng L?u', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.mp3', N'Tang Duy Tân', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.jpg', Null, null, '2022', '03:04')
insert into Song values (N'Bu?c Qua Mùa Cô Ðon', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.mp3', N'Vu', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.jpg', Null, null, '2020', '04:38')
insert into Song values (N'Bu?n Thì C? Khóc Ði', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.mp3', N'Lynk Lee', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.jpg', Null, null, '2019', '03:42')
insert into Song values (N'C?m N?ng', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.mp3', N'Suni H? Linh', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.jpg', Null, null, '2017', '03:48')
insert into Song values (N'C?m On Và Xin L?i', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.mp3', N'Chillies', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.jpg', Null, null, '2019', '05:16')
insert into Song values (N'Ch? Anh Nhé (feat.Hoàng Rob)', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe(feat.HoangRob).mp3', N'Hoàng Dung, Hoang Rob', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe.jpg', N'Tình Ca Hoàng Dung', null, '2018', '05:22')
insert into Song values (N'Chuy?n Nhà Bé Thôi, Con Ð?ng V?', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoi,ConDungVe.mp3', N'Kai Ðinh, MIN', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoiConDungVe.jpg', Null, null, '2021', '04:13')
insert into Song values (N'Chuy?n R?ng', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.mp3', N'Th?nh Suy', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.jpg', Null, null, '2020', '04:32')
insert into Song values (N'Có Ði?u Gì, Sao Không Nói Cùng Anh_(Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion).mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh.jpg', Null, null, '2021', '04:17')
insert into Song values (N'Có M?t Ngu?i S? Ð?n', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.mp3', N'Vy Vy', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.jpg', Null, null, '2020', '04:40')
insert into Song values (N'Có Ngu?i', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.mp3', N'Vu Cat Tuong', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.jpg', Null, null, '2019', '03:56')
insert into Song values (N'D?u Mua', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.jpg', Null, null, '2013', '04:20')
insert into Song values (N'Ði Qua Mùa H?', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.mp3', N'Thái Ðinh', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.jpg', Null, null, '2018', '04:43')
insert into Song values (N'Ðôi L?i', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.mp3', N'Hoàng Dung', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.jpg', N'Tình Ca Hoàng Dung', null, '2018', '03:52')
insert into Song values (N'Dù Cho Mai V? Sau (Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/DuChoMaiVeSau_AcousticVersion.mp3', N'buitruonglinh', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/ChoDuMaiVeSau.jpg', null, null, '2020', '03:33')
insert into Song values (N'Ðúng Cung Thành Sai', N'pack://siteoforigin:,,,/Resource/Songs/DungCungThanhSai/DungCungThanhSai.mp3', N'M? Tâm', N'pack://siteoforigin:,,,/Resource/Songs/DungCungThanhSai/DungCungThanhSai.jpg', null, null, '2020', '04:47')
insert into Song values (N'Gác L?i Âu Lo (feat.MiuLe)', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo(feat.MiuLe).mp3', N'Da LAB, Miu Lê', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo.jpg', null, null, '2020', '04:42')
insert into Song values (N'H?n U?c T? Hu Vô', N'pack://siteoforigin:,,,/Resource/Songs/HenUocTuHuVo/HenUocTuHuVo.mp3', N'M? Tâm', N'pack://siteoforigin:,,,/Resource/Songs/HenUocTuHuVo/HenUocTuHuVo.jpg', null, null, '2022', '04:07')
insert into Song values (N'Khi Cô Ðon Em Nh? Ð?n Ai', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.mp3', N'GREY D, Suni H? Linh, Orange, Hoàng Dung', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.jpg', N'Huong Mùa Hè EP.01', null, '2022', '04:29')
insert into Song values (N'Mùa Thu Cho Em', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.jpg', null, null, '2017', '04:31')
insert into Song values (N'Nàng Tho', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.mp3', N'Hoàng Dung', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.jpg', null, null, '2020', '04:14')
insert into Song values (N'Nàng Tho... Tr?i Gi?u Tr?i Mang Ði', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.mp3', N'AMEE, Hoàng Dung', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.jpg', N'dreAMEE', null, '2020', '04:22')
insert into Song values (N'N?u Mai G?p L?i (feat.Vu Ð?ng Qu?c Vi?t)', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai(feat.VuDangQuocViet).mp3', N'Nguyen Ha, Vu Ð?ng Qu?c Vi?t', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai.jpg', null, null, '2020', '05:15')
insert into Song values (N'Ngày Xua Em Ð?n', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.mp3', N'Anh Khang', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.jpg', N'Nh?ng Bài Hát B?t H? Th?p Niên 8x 9x C?a Anh Khanh (Vol.2)', null, '2021', '04:13')
insert into Song values (N'Ph? Không Em', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.mp3', N'Thái Ðinh', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.jpg', null, null, '2016', '04:46')
insert into Song values (N'Phút Ban Ð?u', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.mp3', N'Vu.', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.jpg', null, null, '2013', '04:03')
insert into Song values (N'Suýt N?a Thì', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.mp3', N'Andiez', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.jpg', null, null, '2018', '04:46')
insert into Song values (N'Tình Em Là Ð?i Duong', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.mp3', N'Hoàng Dung, GREY D', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.jpg', N'Huong Mùa Hè EP.02', null, '2022', '03:46')
insert into Song values (N'Tr?i Sáng R?i (Theme Song From "Tr?i Sáng R?i, Ta Ng? Ði Thôi")', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemeSongFrom_TroiSangRoi,TaNguDiThoi)/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi.jpg', null, null, '2019', '04:12')
insert into Song values (N'T? Ðó', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.jpg', null , null, '2020', '02:56')
insert into Song values (N'U?c M?t Ngày (7 Deep Cuts Session)', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay(7DeepCutsSession).mp3', N'Phùng Khánh Linh', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay.jpg', null , null, '2020', '04:04')
insert into Song values (N'V?n Nh?', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.mp3', N'Ha Nhi', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.jpg', null , null, '2020', '04:04')
insert into Song values (N'Vào H?', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.mp3', N'Suni H? Linh', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.jpg', N'Huong Mùa Hè EP.01' , null, '2022', '03:16')
insert into Song values (N'V?i Anh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.mp3', N'Thai Trinh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.jpg', N'Trinh Acoustic', null, '2020', '06:06')
insert into Song values (N'Xin L?i', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.jpg', null, null, '2019', '04:04')
insert into Song values (N'Xuân, H?, Thu, Ðông, R?i L?i Xuân', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.mp3', N'AMEE', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.jpg', N'dreAMEE', null, '2020', '04:50')
insert into Song values (N'Y?u Ðu?i', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.mp3', N'Hoàng Dung', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.jpg', N'Tình Ca Hoàng Dung', null, '2018', '05:23')
insert into Song values (N'Yêu Không H?i Ti?c (Remake)', N'pack://siteoforigin:,,,/Resource/Songs/YeuKhongHoiTiec_Remake/YeuKhongHoiTiec_Remake.mp3', N'Hu?nh Tú', N'pack://siteoforigin:,,,/Resource/Songs/YeuKhongHoiTiec_Remake/YeuKhongHoiTiec.jpg', null, null, '2018', '03:36')



insert into Album values (N'Tình Ca Hoàng Dung', null , N'pack://siteoforigin:,,,/Resource/Album/TinhCaHoangDung/TinhCaHoangDung.jpg', N'orange')
insert into Album values (N'Huong Mùa Hè EP.01', null , N'pack://siteoforigin:,,,/Resource/Album/HuongMuaHeEP.01/HuongMuaHeEP.01.jpg', N'gray')
insert into Album values (N'Trinh Acoustic', null , N'pack://siteoforigin:,,,/Resource/Album/TrinhAcoustic/TrinhAcoustic.jpg', N'blue')
insert into Album values (N'Nh?ng Bài Hát B?t H? Th?p Niên 8x 9x C?a Anh Khanh (Vol.2)', null , N'pack://siteoforigin:,,,/Resource/Album/NhungBaiHatBatHuCuaAnhKhang(Vol2)/NhungBaiHatBatHuCuaAnhKhang(Vol2).jpg', N'dark blue')
insert into Album values (N'Huong Mùa Hè EP.02', null , N'pack://siteoforigin:,,,/Resource/Album/HuongMuaHeEP.02/HuongMuaHeEP.02.jpg', N'light gray')
insert into Album values (N'DreAMEE', null, N'pack://siteoforigin:,,,/Resource/Album/DreAMEE/DreAMEE.jpg', N'light pink')


insert into AlbumAndSongRelation values (1,9)
insert into AlbumAndSongRelation values (1, 17)
insert into AlbumAndSongRelation values (1, 40)
insert into AlbumAndSongRelation values (6, 25)
insert into AlbumAndSongRelation values (6, 39)
insert into AlbumAndSongRelation values (4, 27)
insert into AlbumAndSongRelation values (3, 37)
insert into AlbumAndSongRelation values (2, 22)
insert into AlbumAndSongRelation values (2, 36)
insert into AlbumAndSongRelation values (5, 31)
insert into Users values ('Admin','Admin',null)
insert into Playlist values('Likesong','','',1, 0)
insert into Playlist values('Recently Search','','',1,1)













