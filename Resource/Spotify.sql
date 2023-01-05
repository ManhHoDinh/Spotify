drop database spotify

create database Spotify
go
use Spotify
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

alter table Users add Email nvarchar(max)

--PlaylistType :  0 : Likedsong, 1 : Reccent Search, 2 : Playlist normal
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

alter table PlaylistAndSongRelation add constraint PK_PASR primary key (PlaylistID, SongID)
create table AlbumAndSongRelation
(
	AlbumID int not null,
	SongID int not null

	foreign key (AlbumID) references Album(ID),
	foreign key (SongID) references Song(ID)
)

alter table AlbumAndSongRelation add constraint PK_AASR primary key (AlbumID, SongID)

insert into Song values (N'Ai Cũng Có Ngày Xưa', N'pack://siteoforigin:,,,/Resource/Songs/AiCungCoNgayXua/AiCungCoNgayXua.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/AiCungCoNgayXua/AiCungCoNgayXua.jpg', Null, N'Dòng tin đăng quê hương tôi nay đang bão, gió lớn cuốn mấy mái ngói bay...', '2017', '04:12')
insert into Song values (N'Anh Không Đòi Quà', N'pack://siteoforigin:,,,/Resource/Songs/AnhKhongDoiQua/AnhKhongDoiQua.mp3', N'Only C, Karik', N'pack://siteoforigin:,,,/Resource/Songs/AnhKhongDoiQua/AnhKhongDoiQua.jpg', Null, N'Anh này, đẹp trai này, đại gia này, nhà giàu tiền tiêu thả ga, xây riêng hồ bơi để nuôi cá...', '2013', '03:18')
insert into Song values (N'Anh Nhà Ở Đâu Thế', N'pack://siteoforigin:,,,/Resource/Songs/AnhNhaODauThe/AnhNhaODauThe.mp3', N'AMEE', N'pack://siteoforigin:,,,/Resource/Songs/AnhNhaODauThe/DreAMEE.jpg', Null, N'Anh và tôi thật ra gặp nhau và quen nhau cũng đã được mấy năm...', '2019', '03:37')
insert into Song values (N'Ánh Trăng Tình Ái', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.mp3', N'Dương Edward', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.jpg', Null, null, '2021', '04:04')
insert into Song values (N'Bài Này Chill Phết', N'pack://siteoforigin:,,,/Resource/Songs/BaiNayChillPhet/BaiNayChillPhet.mp3', N'Đen Vâu, Min', N'pack://siteoforigin:,,,/Resource/Songs/BaiNayChillPhet/BaiNayChillPhet.jpg', Null, N'I just wanna chill with you tonight, And all the sorrow left behind uh-way...', '2019', '04:33')
insert into Song values (N'Bao Tiền Một Mớ Bình Yên', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.mp3', N'14 Casper - Bon Nghiêm', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.jpg', Null, null, '2020', '05:00')
insert into Song values (N'Bất Bình Thường', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.mp3', N'WHEE!, Dư Quốc Vương', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.jpg', Null, null, '2020', '03:28')
insert into Song values (N'Bên Trên Tầng Lầu', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.mp3', N'Tăng Duy Tân', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.jpg', Null, null, '2022', '03:10')
insert into Song values (N'Big City Boi', N'pack://siteoforigin:,,,/Resource/Songs/BigCityBoi/BigCityBoi.mp3', N'Binz x Touliver', N'pack://siteoforigin:,,,/Resource/Songs/BigCityBoi/BigCityBoi.jpg', Null, N'Em on top, không phải Trending, không phải Youtube, không phải trên Zing...', '2020', '03:43')
insert into Song values (N'Bước Qua Mùa Cô Đơn', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.mp3', N'Vũ.', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.jpg', Null, null, '2020', '04:38')
insert into Song values (N'Buông Đôi Tay Nhau Ra', N'pack://siteoforigin:,,,/Resource/Songs/BuongDoiTayNhauRa/BuongDoiTayNhauRa.mp3', N'Sơn Tùng M-TP', N'pack://siteoforigin:,,,/Resource/Songs/BuongDoiTayNhauRa/BuongDoiTayNhauRa.jpg', Null, N'Cứ quên anh vậy đi, nhạt nhòa sương tan ái ân mây trôi cũng những môi hôn chìm sâu...', '2015', '04:49')
insert into Song values (N'Buồn Thì Cứ Khóc Đi', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.mp3', N'Lynk Lee', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.jpg', Null, null, '2019', '03:40')
insert into Song values (N'Cảm Nắng', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.mp3', N'Suni Hạ Linh', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.jpg', Null, null, '2017', '03:48')
insert into Song values (N'Cảm Ơn Và Xin Lỗi', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.mp3', N'Chillies', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.jpg', Null, null, '2019', '05:16')
insert into Song values (N'Cây Đàn Sinh Viên', N'pack://siteoforigin:,,,/Resource/Songs/CayDanSinhVien/CayDanSinhVien.mp3', N'Mỹ Tâm', N'pack://siteoforigin:,,,/Resource/Songs/CayDanSinhVien/CayDanSinhVien.png', Null, N'Đời sinh viên có cây đàn ghita, đàn ngân lên chúng ta cùng hòa ca...', '2018', '04:56')
insert into Song values (N'Chiều Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/ChieuXuan-Remix/ChieuXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/ChieuXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Có một chiều, chiều xuân như thế, Nắng ngập tràn hồn em ngất ngây...' , '2022', '03:23')
insert into Song values (N'Chờ Anh Nhé (feat.Hoàng Rob)', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe(feat.HoangRob).mp3', N'Hoàng Dũng, Hoang Rob', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe.jpg', N'Tình Ca Hoàng Dũng', null, '2018', '05:22')
insert into Song values (N'Chúng Ta Không Thuộc Về Nhau', N'pack://siteoforigin:,,,/Resource/Songs/ChungTaKhongThuocVeNhau/ChungTaKhongThuocVeNhau.mp3', N'Sơn Tùng M-TP', N'pack://siteoforigin:,,,/Resource/Songs/ChungTaKhongThuocVeNhau/ChungTaKhongThuocVeNhau.jpg', Null, N'Niềm tin đã mất, giọt nước mắt cuốn kí ức anh chìm sâu...', '2016', '04:02')
insert into Song values (N'Chuyện Nhà Bé Thôi, Con Đừng Về', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoi,ConDungVe.mp3', N'Kai Đinh, MIN', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoiConDungVe.jpg', Null, null, '2021', '04:36')
insert into Song values (N'Chuyện Rằng', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.mp3', N'Thịnh Suy', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.jpg', Null, null, '2020', '04:32')
insert into Song values (N'Có Chơi Có Chịu', N'pack://siteoforigin:,,,/Resource/Songs/CoChoiCoChiu/CoChoiCoChiu.mp3', N'KARIK x ONLY C', N'pack://siteoforigin:,,,/Resource/Songs/CoChoiCoChiu/CoChoiCoChiu.jpg', Null, N'Có khóc có cười! Tình yêu anh vẫn real thế thôi...', '2022', '04:46')
insert into Song values (N'Có Điều Gì, Sao Không Nói Cùng Anh_(Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion).mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh.jpg', Null, null, '2021', '04:17')
insert into Song values (N'Có Một Người Sẽ Đến', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.mp3', N'Vy Vy', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.jpg', Null, null, '2020', '04:40')
insert into Song values (N'Con Bướm Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/ConBuomXuan-Remix/ConBuomXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/ConBuomXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Com bướm xinh, con bướm xinh con bướm đa tình, Đùa vui với lũ hoa bao hoa mai lan đang hòa mình...' , '2022', '03:25')
insert into Song values (N'Có Người', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.mp3', N'Vu Cat Tuong', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.jpg', Null, null, '2019', '04:00')
insert into Song values (N'Dấu Mưa', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.jpg', Null, null, '2013', '04:20')
insert into Song values (N'Để Dành', N'pack://siteoforigin:,,,/Resource/Songs/DeDanh/DeDanh.mp3', N'Thái Trinh', N'pack://siteoforigin:,,,/Resource/Songs/DeDanh/TrinhAcoustic.jpg', Null, N'Một chút hương thơm còn lại, Một ánh mắt quen để lại...', '2022', '04:53')
insert into Song values (N'Đi Để Trở Về', N'pack://siteoforigin:,,,/Resource/Songs/DiDeTroVe/DiDeTroVe.mp3', N'SOOBIN HOÀNG SƠN', N'pack://siteoforigin:,,,/Resource/Songs/DiDeTroVe/DiDeTroVe.jpg', Null, N'Tôi đang ở một nơi rất xa, nơi không có khói bụi thành phố, ở một nơi đẹp như mơ...', '2017', '03:50')
insert into Song values (N'Điệp Khúc Mùa Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/DiepKhucMuaXuan-Remix/DiepKhucMuaXuan-Remix.mp3', N'Trúc Uyên', N'pack://siteoforigin:,,,/Resource/Songs/DiepKhucMuaXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Nắng chiếu lung linh muôn hoa vàng, Chở tia nắng về trong ánh mùa sang...' , '2022', '03:13')
insert into Song values (N'Đi Qua Mùa Hạ', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.mp3', N'Thái Đinh', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.jpg', Null, null, '2018', '04:43')
insert into Song values (N'Dịu Dàng Sắc Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/DiuDangSacXuan-Remix/DiuDangSacXuan-Remix.mp3', N'Trúc Uyên', N'pack://siteoforigin:,,,/Resource/Songs/DiuDangSacXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Nắng xuân ấm thêm môi hồng, Gió xuân đến bên em ngồi...' , '2022', '02:51')
insert into Song values (N'Đời Lạ Lắm À Nghen', N'pack://siteoforigin:,,,/Resource/Songs/DoiLaLamANghen/DoiLaLamANghen.mp3', N'Dế Choắt', N'pack://siteoforigin:,,,/Resource/Songs/DoiLaLamANghen/DoiLaLamANghen.jpg', Null, N'Đời! Đời này vui à nghen, đời lạ lắm à nghen...', '2018', '03:08')
insert into Song values (N'Đôi Lời', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.jpg', N'Tình Ca Hoàng Dũng', null, '2018', '03:52')
insert into Song values (N'Đón Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/DonXuan-Remix/DonXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/DonXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Xuân..đã đến rồi, gieo rắc ngàn hồn hoa xuống đời...' , '2022', '05:02')
insert into Song values (N'Đưa Nhau Đi Trốn', N'pack://siteoforigin:,,,/Resource/Songs/DuaNhauDiTron/DuaNhauDiTron.mp3', N'Đen Vâu, Linh Cáo', N'pack://siteoforigin:,,,/Resource/Songs/DuaNhauDiTron/DuaNhauDiTron.jpg', NULL, N'Bố em hút rất nhiều thuốc, Mẹ em khóc mắt lệ nhòa...', '2015', '04:00')
insert into Song values (N'Dù Cho Mai Về Sau (Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/DuChoMaiVeSau_AcousticVersion.mp3', N'buitruonglinh', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/ChoDuMaiVeSau.jpg', null, null, '2020', '03:33')
insert into Song values (N'Gác Lại Âu Lo (feat.MiuLe)', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo(feat.MiuLe).mp3', N'Da LAB, Miu Lê', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo.jpg', null, null, '2020', '04:42')
insert into Song values (N'Hai Triệu Năm', N'pack://siteoforigin:,,,/Resource/Songs/HaiTrieuNam/HaiTrieuNam.mp3', N'Đen Vâu, Biên', N'pack://siteoforigin:,,,/Resource/Songs/HaiTrieuNam/HaiTrieuNam.jpg', NULL, N'Xung quanh anh toàn là nước, Cơ thể anh đang bị ướt, Mênh mông toàn là nước...', '2019', '03:37')
insert into Song values (N'Hoa Cỏ Mùa Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/HoaCoMuaXuan-Remix/HoaCoMuaXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/HoaCoMuaXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Này là cỏ non rất mêm, Này là mùa xuân rất hiền...' , '2022', '02:45')
insert into Song values (N'Hương Mùa Hè', N'pack://siteoforigin:,,,/Resource/Songs/HuongMuaHe/HuongMuaHe.mp3', N'Suni Hạ Linh, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/HuongMuaHe/HuongMuaHeEP.02.jpg', N'Hương Mùa Hè EP.02', N'Bánh xe đạp lăn trong chiều, lăn theo chiều nắng tắt...', '2022', '04:30')
insert into Song values (N'Khi Cô Đơn Em Nhớ Đến Ai', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.mp3', N'GREY D, Suni Hạ Linh, Orange, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.jpg', N'Hương Mùa Hè EP.01', null, '2022', '04:29')
insert into Song values (N'Khi Người Mình Yêu Khóc', N'pack://siteoforigin:,,,/Resource/Songs/KhiNguoiMinhYeuKhoc/KhiNguoiMinhYeuKhoc.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/KhiNguoiMinhYeuKhoc/KhiNguoiMinhYeuKhoc.jpg', NULL, N'Nước mắt em đang rơi trên những ngón tay, nước mắt em mang nỗi nhớ nỗi đắng cay...', '2016', '04:48')
insert into Song values (N'Khu Tao Sống', N'pack://siteoforigin:,,,/Resource/Songs/KhuTaoSong/KhuTaoSong.mp3', N'Wowy, Karik', N'pack://siteoforigin:,,,/Resource/Songs/KhuTaoSong/KhuTaoSong.jpg', NULL, N'Xe, tốt và pháo là những thứ mà em tao xăm mình...', '2012', '04:04')
insert into Song values (N'Lắng Nghe Mùa Xuân Về - Remix', N'pack://siteoforigin:,,,/Resource/Songs/LangNgheMuaXuanVe-Remix/LangNgheMuaXuanVe-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/LangNgheMuaXuanVe-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Giọt mưa nào rơi thật êm, Trên phố phường, Mùi hương nào thơm thật thơm...' , '2022', '03:12')
insert into Song values (N'Lời Ru Ngọt Ngào', N'pack://siteoforigin:,,,/Resource/Songs/LoiRuNgotNgao/LoiRuNgotNgao.mp3', N'Anh Khang', N'pack://siteoforigin:,,,/Resource/Songs/LoiRuNgotNgao/NhungBaiHatBatHuCuaAnhKhang(Vol2).jpg', NULL, N'Từng đêm, tiếng ru ngọt ngào bên nôi, Mong một ngày cho con nụ cười trên môi...', '2014', '04:56')
insert into Song values (N'Luật Rừng', N'pack://siteoforigin:,,,/Resource/Songs/LuatRung/LuatRung.mp3', N'Binz, Rhymastic, 16 Typh, Gonzo, Tinle', N'pack://siteoforigin:,,,/Resource/Songs/LuatRung/LuatRung.jpg', NULL, N'We take the city, Now we be lonely on top, No turning back, All we can do is keep balling...', '2022', '03:25')
insert into Song values (N'Một Năm Mới Bình An - Remix', N'pack://siteoforigin:,,,/Resource/Songs/MotNamMoiBinhAn-Remix/MotNamMoiBinhAn-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/MotNamMoiBinhAn-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Xuân mang tình yêu muôn nhà, Mang lời ca chan hòa, Yêu thương hạnh phúc sum vầy...' , '2022', '03:44')
insert into Song values (N'Một Ngày Mùa Đông', N'pack://siteoforigin:,,,/Resource/Songs/MotNgayMuaDong/MotNgayMuaDong.mp3', N'Thái Trinh', N'pack://siteoforigin:,,,/Resource/Songs/MotNgayMuaDong/TrinhAcoustic.jpg', N'Trinh Acoustic', N'Rồi một ngày trời không biết xanh, Rồi một ngày hàng cây vắng tanh...', '2020', '05:06')
insert into Song values (N'Mùa Thu Cho Em', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.jpg', null, null, '2017', '04:31')
insert into Song values (N'Mười Năm', N'pack://siteoforigin:,,,/Resource/Songs/MuoiNam/MuoiNam.mp3', N'Đen Vâu, Ngọc Linh', N'pack://siteoforigin:,,,/Resource/Songs/MuoiNam/MuoiNam.jpg', null, N'Có người đến, có người đi và có người ở lại, Có lúc khôn và có lần nhỡ dại...', '2019', '04:06')
insert into Song values (N'Nắng Có Còn Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/NangCoConXuan-Remix/NangCoConXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/NangCoConXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Mùa xuân ơi! Ta nghe mùa xuân hát bên kia trời, Từ núi xanh ngời, Đâu đây tiếng đàn cầm buông lả lơi...' , '2022', '03:59')
insert into Song values (N'Nàng Thơ', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.jpg', null, null, '2020', '04:14')
insert into Song values (N'Nàng Thơ... Trời Giấu Trời Mang Đi', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.mp3', N'AMEE, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.jpg', N'dreAMEE', null, '2020', '04:28')
insert into Song values (N'Não Cá Vàng', N'pack://siteoforigin:,,,/Resource/Songs/NaoCaVang/NaoCaVang.mp3', N'Only C, Lou Hoàng', N'pack://siteoforigin:,,,/Resource/Songs/NaoCaVang/NaoCaVang.jpg', null, N'Chợt nhìn quanh bỗng chẳng thấy em kề cạnh, Chạy thật nhanh tránh cơn gió đêm về lạnh...', '2017', '04:35')
insert into Song values (N'Nếu Mai Gặp Lại (feat.Vũ Đặng Quốc Việt)', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai(feat.VuDangQuocViet).mp3', N'Nguyen Ha, Vũ Đặng Quốc Việt', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai.jpg', null, null, '2020', '05:16')
insert into Song values (N'Ngày Xưa Em Đến', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.mp3', N'Anh Khang', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.jpg', N'Những Bài Hát Bất Hủ Thập Niên 8x 9x Của Anh Khang (Vol.2)', null, '2021', '04:18')
insert into Song values (N'Người Khác', N'pack://siteoforigin:,,,/Resource/Songs/NguoiKhac/NguoiKhac.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/NguoiKhac/NguoiKhac.jpg', null, N'Anh đã chờ em rất lâu, bao thu đông đi qua những xuân hạ tiếp nối...', '2018', '03:47')
insert into Song values (N'Nơi Này Có Anh', N'pack://siteoforigin:,,,/Resource/Songs/NoiNayCoAnh/NoiNayCoAnh.mp3', N'Sơn Tùng M-TP', N'pack://siteoforigin:,,,/Resource/Songs/NoiNayCoAnh/NoiNayCoAnh.jpg', null, N'Em là ai từ đâu bước đến nơi đây dịu dàng chân phương...', '2017', '04:38')
insert into Song values (N'OK', N'pack://siteoforigin:,,,/Resource/Songs/OK/OK.mp3', N'Binz', N'pack://siteoforigin:,,,/Resource/Songs/OK/OK.jpg', null, N'Hôm qua em hứa hẹn trăm đường...', '2020', '02:34')
insert into Song values (N'Phía Sau Một Cô Gái', N'pack://siteoforigin:,,,/Resource/Songs/PhiaSauMotCoGai/PhiaSauMotCoGai.mp3', N'SooBin Hoàng Sơn', N'pack://siteoforigin:,,,/Resource/Songs/PhiaSauMotCoGai/PhiaSauMotCoGai.jpg', null, N'Nhiều khi anh mong được một lần nói ra hết tất cả...', '2016', '04:32')
insert into Song values (N'Phố Không Em', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.mp3', N'Thái Đinh', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.jpg', null, null, '2016', '04:46')
insert into Song values (N'Phút Ban Đầu', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.mp3', N'Vũ.', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.jpg', null, null, '2013', '04:03')
insert into Song values (N'Quan Trọng Là Thần Thái', N'pack://siteoforigin:,,,/Resource/Songs/QuanTrongLaThanThai/QuanTrongLaThanThai.mp3', N'Only C x Karik', N'pack://siteoforigin:,,,/Resource/Songs/QuanTrongLaThanThai/QuanTrongLaThanThai.jpg', null, N'Quan trọng phải là thần thái, Quan trọng khi là con gái, bao giờ yêu thì luôn đúng...', '2018', '03:54')
insert into Song values (N'Sắc Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/SacXuan-Remix/SacXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/SacXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Dịu dàng mùa xuân đến trong nắng chan hòa, Lòng khẽ cất lời ca...' , '2022', '03:37')
insert into Song values (N'Sài Gòn Buồn Quá Em Ơi', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonBuonQuaEmOi/SaiGonBuonQuaEmOi.mp3', N'Dế Choắt, Jason', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonBuonQuaEmOi/SaiGonBuonQuaEmOi.jpg', null, N'Sài Gòn buồn quá em ơi, em ơi, em ơi...', '2019', '05:18')
insert into Song values (N'Sài Gòn Lâu Phai', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonLauPhai/SaiGonLauPhai.mp3', N'Dế Choắt', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonLauPhai/SaiGonLauPhai.jpg', null, N'Và anh lại viết cho Sài Gòn ngày buồn tháng nhớ năm thương...', '2021', '04:00')
insert into Song values (N'Simple Love', N'pack://siteoforigin:,,,/Resource/Songs/SimpleLove/SimpleLove.mp3', N'Grey D, Orange', N'pack://siteoforigin:,,,/Resource/Songs/SimpleLove/HuongMuaHeEP.02.jpg', N'Hương Mùa Hè EP.02', N'Đưa chân dạo quanh nơi khắp phố xá bụi bay vào mắt...', '2022', '03:30')
insert into Song values (N'So Far', N'pack://siteoforigin:,,,/Resource/Songs/SoFar/SoFar.mp3', N'Binz Da Poet', N'pack://siteoforigin:,,,/Resource/Songs/SoFar/SoFar.jpg', null, N'Bạn em thấy, tối hôm đó anh bước bên ai, Cả hai đều say, anh mang túi xách cô ấy trên vai...', '2018', '03:30')
insert into Song values (N'Suýt Nữa Thì', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.mp3', N'Andiez', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.jpg', null, null, '2018', '04:46')
insert into Song values (N'Thích Em Hơi Nhiều', N'pack://siteoforigin:,,,/Resource/Songs/ThichEmHoiNhieu/ThichEmHoiNhieu.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/ThichEmHoiNhieu/HuongMuaHeEP.01.jpg', N'Hương Mùa Hè EP.01', N'Biết là mình thích nhau, còn chuyện xa hơn thôi thì tính sau...', '2022', '03:25')
insert into Song values (N'Thì Thầm Mùa Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/ThiThamMuaXuan-Remix/ThiThamMuaXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/ThiThamMuaXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Từng chồi non xanh mơn man, Từng hạt mưa long lanh rơi mùa xuân, và trong ánh mắt lấp lánh...' , '2022', '03:18')
insert into Song values (N'Tình Em Là Đại Dương', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.mp3', N'Hoàng Dũng, GREY D', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.jpg', N'Hương Mùa Hè EP.02', null, '2022', '03:46')
insert into Song values (N'Trời Sáng Rồi (Theme Song From "Trời Sáng Rồi, Ta Ngủ Đi Thôi")', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemeSongFrom_TroiSangRoi,TaNguDiThoi)/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemeSongFrom_TroiSangRoi,TaNguDiThoi)/TroiSangRoi.jpg', null, null, '2019', '04:12')
insert into Song values (N'Từ Đó', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.jpg', null , null, '2020', '03:01')
insert into Song values (N'Ước Một Ngày (7 Deep Cuts Session)', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay(7DeepCutsSession).mp3', N'Phùng Khánh Linh', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay.jpg', null , null, '2020', '04:04')
insert into Song values (N'Vẫn Nhớ', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.mp3', N'Ha Nhi', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.jpg', null , null, '2020', '04:04')
insert into Song values (N'Vào Hạ', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.mp3', N'Suni Hạ Linh', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.jpg', N'Hương Mùa Hè EP.01' , null, '2022', '03:16')
insert into Song values (N'Vinh Quang Đang Chờ Ta', N'pack://siteoforigin:,,,/Resource/Songs/VinhQuangDangChoTa/VinhQuangDangChoTa.mp3', N'Touliver, Rhymastic, Soobin Hoàng Sơn', N'pack://siteoforigin:,,,/Resource/Songs/VinhQuangDangChoTa/VinhQuangDangChoTa.jpg', null , N'Ngày mai ta đâu hay phút giây bộn bề phía trước, Ngày mai ta đâu hay có ai phía xa con đường...', '2017', '04:19')
insert into Song values (N'Với Anh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.mp3', N'Thai Trinh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.jpg', N'Trinh Acoustic', null, '2020', '06:06')
insert into Song values (N'Vợ Người Ta', N'pack://siteoforigin:,,,/Resource/Songs/VoNguoiTa/VoNguoiTa.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/VoNguoiTa/VoNguoiTa.jpg', null , N'Tấm thiệp mời trên bàn, thời gian địa điểm rõ ràng...', '2015', '03:21')
insert into Song values (N'Xin Lỗi', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.jpg', null, null, '2019', '04:04')
insert into Song values (N'Xuân, Hạ, Thu, Đông, Rồi Lại Xuân', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.mp3', N'AMEE', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.jpg', N'dreAMEE', null, '2020', '04:54')
insert into Song values (N'Xuân Yêu Thương - Remix', N'pack://siteoforigin:,,,/Resource/Songs/XuanYeuThuong-Remix/XuanYeuThuong-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/XuanYeuThuong-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Xuân đã đến bên em, Dáng xuân tuyệt vời, Xuân đã đến bên người, Xin người hãy cùng em yêu xuân...' , '2022', '03:09')
insert into Song values (N'Yêu 5', N'pack://siteoforigin:,,,/Resource/Songs/Yeu5/Yeu5.mp3', N'Rhymastic', N'pack://siteoforigin:,,,/Resource/Songs/Yeu5/Yeu5.jpg', null , N'Xin những bối rối này cứ thế lên ngôi, xin con tim rẽ lối tìm giây phút nghẹn lời...', '2017', '05:27')
insert into Song values (N'Yếu Đuối', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.jpg', N'Tình Ca Hoàng Dũng', null, '2018', '05:23')
insert into Song values (N'Yêu Thương Ngày Đó', N'pack://siteoforigin:,,,/Resource/Songs/YeuThuongNgayDo/YeuThuongNgayDo.mp3', N'Soobin Hoàng Sơn', N'pack://siteoforigin:,,,/Resource/Songs/YeuThuongNgayDo/YeuThuongNgayDo.jpg', null , N'Một mình lang thang trên con phố vắng, nhớ bao yêu thương ngày mình bên nhau...', '2018', '05:23')

insert into Album values (N'Tình Ca Hoàng Dũng', null , N'pack://siteoforigin:,,,/Resource/Album/TinhCaHoangDung/TinhCaHoangDung.jpg', N'orange')
insert into Album values (N'Hương Mùa Hè EP.01', null , N'pack://siteoforigin:,,,/Resource/Album/HuongMuaHeEP.01/HuongMuaHeEP.01.jpg', N'gray')
insert into Album values (N'Trinh Acoustic', null , N'pack://siteoforigin:,,,/Resource/Album/TrinhAcoustic/TrinhAcoustic.jpg', N'blue')
insert into Album values (N'Những Bài Hát Bất Hủ Thập Niên 8x 9x Của Anh Khang (Vol.2)', null , N'pack://siteoforigin:,,,/Resource/Album/NhungBaiHatBatHuCuaAnhKhang(Vol2)/NhungBaiHatBatHuCuaAnhKhang(Vol2).jpg', N'dark blue')
insert into Album values (N'Hương Mùa Hè EP.02', null , N'pack://siteoforigin:,,,/Resource/Album/HuongMuaHeEP.02/HuongMuaHeEP.02.jpg', N'light gray') --5
insert into Album values (N'DreAMEE', null, N'pack://siteoforigin:,,,/Resource/Album/DreAMEE/DreAMEE.jpg', N'light pink') --6
insert into Album values (N'Tuyển Tập Nhạc Xuân Remix 2023', null, N'pack://siteoforigin:,,,/Resource/Album/TuyenTapNhacXuanRemix2023/TuyenTapNhacXuanRemix2023.jpg', N'red') --7
insert into Album values (N'Nhạc Của Binz', null, N'pack://siteoforigin:,,,/Resource/Album/Binz/Binz.jpg', N'pink')
insert into Album values (N'Karik KR01', null, N'pack://siteoforigin:,,,/Resource/Album/Karik1/Karik.jpg', N'dark red') -- 9
insert into Album values (N'Tình Ca Mới Của Only C', null, N'pack://siteoforigin:,,,/Resource/Album/OnlyC3/OnlyC.jpg', N'brown') --10
insert into Album values (N'Những Ca Khúc Hay Nhất Của Phan Mạnh Quỳnh', null, N'pack://siteoforigin:,,,/Resource/Album/PhanManhQuynh/PhanManhQuynh.jpg', N'light gray') --11
insert into Album values (N'Show Của Đen', null, N'pack://siteoforigin:,,,/Resource/Album/ShowCuaDen/ShowCuaDen.jpg', N'light yellow') --12
insert into Album values (N'Soobin Songs', null, N'pack://siteoforigin:,,,/Resource/Album/SoobinHoangSon/SoobinHoangSon.jpg', N'red') --13
insert into Album values (N'Chúc Xuân', null, N'pack://siteoforigin:,,,/Resource/Album/ChucXuan/ChucXuan.jpg', N'light red') --14
insert into Album values (N'Cuộc Đời', null, N'pack://siteoforigin:,,,/Resource/Album/CuocDoi/CuocDoi.jpg', N'light green') --15
insert into Album values (N'Đỉnh Cao Remix', null, N'pack://siteoforigin:,,,/Resource/Album/DinhCaoRemix/DinhCaoRemix.jpg', N'light violet') --16
insert into Album values (N'Dòng Thời Gian', null, N'pack://siteoforigin:,,,/Resource/Album/DongThoiGian/DongThoiGian.jpg', N'white')--17
insert into Album values (N'Em Và Nhạc', null, N'pack://siteoforigin:,,,/Resource/Album/EmVaNhac/EmVaNhac.jpg', N'light pink') --18
insert into Album values (N'Album Của Karik', null, N'pack://siteoforigin:,,,/Resource/Album/KarikAndFriends/KarikAndFriends.jpg', N'dark yellow') --19
insert into Album values (N'Love Songs', null, N'pack://siteoforigin:,,,/Resource/Album/LoveSongs/LoveSongs.jpg', N'purple') -- 20
insert into Album values (N'Nhạc Trẻ', null, N'pack://siteoforigin:,,,/Resource/Album/NhacTre/NhacTre.jpg', N'light blue') --21
insert into Album values (N'Nhạc Xuân Remix', null, N'pack://siteoforigin:,,,/Resource/Album/NhacXuanRemix/NhacXuanRemix.jpg', N'light red')--22
insert into Album values (N'Rap Of Love', null, N'pack://siteoforigin:,,,/Resource/Album/RapOfLove/RapOfLove.jpg', N'dark pink') -- 23
insert into Album values (N'Rap Việt', null, N'pack://siteoforigin:,,,/Resource/Album/RapViet/RapViet.jpg', N'light black') --24
insert into Album values (N'Sky 1', null, N'pack://siteoforigin:,,,/Resource/Album/Sky/Sky.jpg', N'dark blue') --25
insert into Album values (N'Songs Of Life', null, N'pack://siteoforigin:,,,/Resource/Album/SongsOfLife/SongsOfLife.jpg', N'orange') --26
insert into Album values (N'Thời Xuân Xanh', null, N'pack://siteoforigin:,,,/Resource/Album/ChucXuan/ChucXuan.jpg', N'light green') --27
insert into Album values (N'Tình Ca', null, N'pack://siteoforigin:,,,/Resource/Album/TinhCa/TinhCa.jpg', N'dark violet') --28
insert into Album values (N'Tình Yêu Ngày Đó', null, N'pack://siteoforigin:,,,/Resource/Album/TinhYeuNgayDo/TinhYeuNgayDo.jpg', N'dark gray') --29
insert into Album values (N'Việt Rap', null, N'pack://siteoforigin:,,,/Resource/Album/VietRap/VietRap.jpg', N'purple violet') --30



update Song set Descriptions = N'Một đêm trăng sáng, chúng mình hai đứa...' where ID = 4
update Song set Descriptions = N'Mười giờ, văn phòng vẫn sáng đèn, Lại một hôm làm thâu suốt đêm...' where ID = 6
update Song set Descriptions = N'Mỗi sáng chủ nhật trời không có mây bay, Gió chẳng rì rào mà cây vẫn lung lay...' where ID = 7
update Song set Descriptions = N'Em ơi đừng khóc bóng tối trước mắt sẽ bắt em đi, Em ơi đừng lo, em ơi đừng cho tương lai vụt tắt...' where ID = 8
update Song set Descriptions = N'Chào cơn mưa, Làm sao cứ kéo ta quay lại...' where ID = 10
update Song set Descriptions = N'Em có buồn nếu anh để lại cây viết, Dòng thư cuối sau bức màn...' where ID = 12
update Song set Descriptions = N'Chờ bao lâu mà anh chẳng nói điều gì...' where ID = 13
update Song set Descriptions = N'Đôi tim ngân nhiều câu xót xa, Hai ta mong chờ đêm thứ tha...' where ID = 14
update Song set Descriptions = N'Ở lại em nhé, ngày mai anh sẽ về, Anh chỉ mang nỗi nhớ em thêm xa...' where ID = 17
update Song set Descriptions = N'Nhà tôi bốc khói trắng ngút lên ban trưa mùa hè, mẹ tôi nói chuyện nhà bé thôi con đừng về...' where ID = 19
update Song set Descriptions = N'Lal lal lal hah... Khi đêm ùa vào ôm chặt em...' where ID = 20
update Song set Descriptions = N'Có điều gì sao không nói cùng anh, Đừng tập quen cách sống quẩn quanh...' where ID = 22
update Song set Descriptions = N'Có những thước phim một thời tuổi trẻ, Những thanh âm dài cười vui một vài...' where ID = 23
update Song set Descriptions = N'Chiều nay có người hẹn anh với nụ cười tươi, Chiều nay có người dạy anh cách làm mặt vui...' where ID = 25
update Song set Descriptions = N'Một cơn mưa đi qua, Để lại những ký ức anh và em...' where ID = 26
update Song set Descriptions = N'Mùa hạ đang trôi qua và em cũng đi xa, về đâu tia nắng mong manh lướt qua thờ ơ...' where ID = 30
update Song set Descriptions = N'Từ một phút tình cờ anh biết rằng mình mong nhớ, và từ một phút tình cờ anh thấy nhẹ nhàng bất ngờ...' where ID = 33
update Song set Descriptions = N'Bầu trời đêm không mây không sao, Trăng treo trên cao khi lòng anh vân nhớ nhung em nhiều...' where ID = 36
update Song set Descriptions = N'Anh đi lạc trong sóng gió cuộc đời, Nào biết đâu sớm mai liệu bình yên có tới...' where ID = 37
update Song set Descriptions = N'Từng hạt mưa long lanh xôn xao, Để mộng mơ trong em bay cao...' where ID = 41
update Song set Descriptions = N'Anh có nghe mùa thua mưa giăng lá đổ, Anh có nghe nai vàng hát khúc yêu đương...' where ID = 49
update Song set Descriptions = N'Em, ngày em đánh rơi nụ cười vào anh, có nghĩ sau này em sẽ chờ...' where ID = 52
update Song set Descriptions = N'Anh, ngày anh đánh rời nụ cười vào em, có nghĩ sau ngày anh sẽ chờ và vô tư cho đi hết những ngây thơ...' where ID = 53
update Song set Descriptions = N'Gió chiều mang bao mộng mơ của tôi theo chân người, Tiếng cười vỡ tan thành sương...' where ID = 55
update Song set Descriptions = N'Ngày xưa em đến như một cơn gió, Rồi trao tình yêu với ngàn lời hứa...' where ID = 56
update Song set Descriptions = N'Thành phố không có em, Ngày trôi qua chẳng êm đềm...' where ID = 61
update Song set Descriptions = N'Có ô cửa sổ nhỏ, lay hồn ai qua đây, Có giấc mơ là lạ, chạm vào trong ký ức...' where ID = 62
update Song set Descriptions = N'Suýt nữa thì, Anh có thể nói muôn vàn lời muốn nói...' where ID = 69
update Song set Descriptions = N'Đại dương mênh môn ơi, Hỡi em ở đâu, trời xanh bao la ơi có thấy bóng em...' where ID = 72
update Song set Descriptions = N'Những hoàng hôn ánh nắng vỡ ra trong ngày mưa, Góp nhặt chi để mọi thứ trôi đi hết kỷ niệm...' where ID = 73
update Song set Descriptions = N'Và hồn tôi từ đó là khúc ca vang trong ngần...' where ID = 74
update Song set Descriptions = N'Anh đi xa mãi nơi nào, Cho em mong ngóng đợi chờ...' where ID = 75
update Song set Descriptions = N'Từng chiều buồn lang thang bước trên con đường, Lặng nhìn mùa thu đưa lá rơi bên thềm...' where ID = 76
update Song set Descriptions = N'Trời nhẹ dần lên cao hồn tôi dường như bóng chim, Vờn đôi cánh mềm lặng lẽ kiếm chốn nao bình yên...' where ID = 77
update Song set Descriptions = N'Ngày tôi yêu ngu ngơ, Những cánh chim bay lang thang...' where ID = 79
update Song set Descriptions = N'Xin lỗi cơn mơ vừa qua, Xin lỗi cơn đau vừa xa lạ, Xin lỗi nỗi vui còn vướng lại...' where ID = 81
update Song set Descriptions = N'Gửi anh người yêu ở nơi xa chẳng gặp, Chẳng biết phải bao giờ anh mới ghé thăm...' where ID = 82
update Song set Descriptions = N'Yêu và xa xà quên tựa những xa xôi ngày ấy, kỉ niệm nơi đây thấy buồn biết mấy...' where ID = 85



insert into Users values ('Admin','Admin',null, 'manh@123A')
insert into Playlist values('Likesong','','',1, 0)
insert into Playlist values('Recently Search','','',1,0)

insert into AlbumAndSongRelation values (1,17)
insert into AlbumAndSongRelation values (1, 33)
insert into AlbumAndSongRelation values (1, 85)
insert into AlbumAndSongRelation values (1, 52)
insert into AlbumAndSongRelation values (2, 41)
insert into AlbumAndSongRelation values (2, 70)
insert into AlbumAndSongRelation values (2, 77)
insert into AlbumAndSongRelation values (3, 48)
insert into AlbumAndSongRelation values (3, 79)
insert into AlbumAndSongRelation values (3, 27)
insert into AlbumAndSongRelation values (4, 56)
insert into AlbumAndSongRelation values (4, 45)
insert into AlbumAndSongRelation values (4, 52)
insert into AlbumAndSongRelation values (5, 40)
insert into AlbumAndSongRelation values (5, 67)
insert into AlbumAndSongRelation values (5, 72)
insert into AlbumAndSongRelation values (6, 52)
insert into AlbumAndSongRelation values (6, 53)
insert into AlbumAndSongRelation values (6, 82)
insert into AlbumAndSongRelation values (6, 3)
insert into AlbumAndSongRelation values (7, 16)
insert into AlbumAndSongRelation values (7, 24)
insert into AlbumAndSongRelation values (7, 29)
insert into AlbumAndSongRelation values (7, 31)
insert into AlbumAndSongRelation values (7, 34)
insert into AlbumAndSongRelation values (7, 39)
insert into AlbumAndSongRelation values (7, 44)
insert into AlbumAndSongRelation values (7, 47)
insert into AlbumAndSongRelation values (7, 51)
insert into AlbumAndSongRelation values (7, 64)
insert into AlbumAndSongRelation values (7, 71)
insert into AlbumAndSongRelation values (7, 83)
insert into AlbumAndSongRelation values (8, 9)
insert into AlbumAndSongRelation values (8, 46)
insert into AlbumAndSongRelation values (8, 59)
insert into AlbumAndSongRelation values (8, 68)
insert into AlbumAndSongRelation values (9, 2)
insert into AlbumAndSongRelation values (9, 21)
insert into AlbumAndSongRelation values (9, 43)
insert into AlbumAndSongRelation values (9, 63)
insert into AlbumAndSongRelation values (10, 2)
insert into AlbumAndSongRelation values (10, 21)
insert into AlbumAndSongRelation values (10, 54)
insert into AlbumAndSongRelation values (10, 63)
insert into AlbumAndSongRelation values (11, 1)
insert into AlbumAndSongRelation values (11, 42)
insert into AlbumAndSongRelation values (11, 57)
insert into AlbumAndSongRelation values (11, 80)
insert into AlbumAndSongRelation values (12, 5)
insert into AlbumAndSongRelation values (12, 35)
insert into AlbumAndSongRelation values (12, 38)
insert into AlbumAndSongRelation values (12, 50)
insert into AlbumAndSongRelation values (13, 28)
insert into AlbumAndSongRelation values (13, 60)
insert into AlbumAndSongRelation values (13, 78)
insert into AlbumAndSongRelation values (13, 86)
insert into AlbumAndSongRelation values (14, 24)
insert into AlbumAndSongRelation values (14, 31)
insert into AlbumAndSongRelation values (14, 39)
insert into AlbumAndSongRelation values (14, 47)
insert into AlbumAndSongRelation values (14, 51)
insert into AlbumAndSongRelation values (15, 6)
insert into AlbumAndSongRelation values (15, 14)
insert into AlbumAndSongRelation values (15, 28)
insert into AlbumAndSongRelation values (15, 32)
insert into AlbumAndSongRelation values (15, 43)
insert into AlbumAndSongRelation values (15, 50)
insert into AlbumAndSongRelation values (15, 78)
insert into AlbumAndSongRelation values (16, 83)
insert into AlbumAndSongRelation values (16, 71)
insert into AlbumAndSongRelation values (16, 64)
insert into AlbumAndSongRelation values (17, 1)
insert into AlbumAndSongRelation values (17, 10)
insert into AlbumAndSongRelation values (17, 30)
insert into AlbumAndSongRelation values (17, 40)
insert into AlbumAndSongRelation values (17, 47)
insert into AlbumAndSongRelation values (17, 50)
insert into AlbumAndSongRelation values (17, 56)
insert into AlbumAndSongRelation values (17, 62)
insert into AlbumAndSongRelation values (17, 74)
insert into AlbumAndSongRelation values (17, 77)
insert into AlbumAndSongRelation values (17, 82)
insert into AlbumAndSongRelation values (17, 86)
insert into AlbumAndSongRelation values (18, 2)
insert into AlbumAndSongRelation values (18, 17)
insert into AlbumAndSongRelation values (18, 35)
insert into AlbumAndSongRelation values (18, 41)
insert into AlbumAndSongRelation values (18, 52)
insert into AlbumAndSongRelation values (19, 2)
insert into AlbumAndSongRelation values (19, 7)
insert into AlbumAndSongRelation values (19, 21)
insert into AlbumAndSongRelation values (19, 43)
insert into AlbumAndSongRelation values (19, 46)
insert into AlbumAndSongRelation values (20, 4)
insert into AlbumAndSongRelation values (20, 37)
insert into AlbumAndSongRelation values (20, 41)
insert into AlbumAndSongRelation values (20, 49)
insert into AlbumAndSongRelation values (20, 59)
insert into AlbumAndSongRelation values (21, 8)
insert into AlbumAndSongRelation values (21, 13)
insert into AlbumAndSongRelation values (21, 21)
insert into AlbumAndSongRelation values (21, 35)
insert into AlbumAndSongRelation values (21, 42)
insert into AlbumAndSongRelation values (21, 58)
insert into AlbumAndSongRelation values (22, 47)
insert into AlbumAndSongRelation values (22, 51)
insert into AlbumAndSongRelation values (22, 64)
insert into AlbumAndSongRelation values (22, 71)
insert into AlbumAndSongRelation values (23, 84)
insert into AlbumAndSongRelation values (23, 68)
insert into AlbumAndSongRelation values (23, 65)
insert into AlbumAndSongRelation values (23, 66)
insert into AlbumAndSongRelation values (23, 67)
insert into AlbumAndSongRelation values (24, 9)
insert into AlbumAndSongRelation values (24, 11)
insert into AlbumAndSongRelation values (24, 38)
insert into AlbumAndSongRelation values (24, 46)
insert into AlbumAndSongRelation values (24, 32)
insert into AlbumAndSongRelation values (25, 11)
insert into AlbumAndSongRelation values (25, 18)
insert into AlbumAndSongRelation values (25, 58)
insert into AlbumAndSongRelation values (26, 20)
insert into AlbumAndSongRelation values (26, 19)
insert into AlbumAndSongRelation values (26, 28)
insert into AlbumAndSongRelation values (26, 32)
insert into AlbumAndSongRelation values (26, 50)
insert into AlbumAndSongRelation values (26, 66)
insert into AlbumAndSongRelation values (27, 1)
insert into AlbumAndSongRelation values (27, 15)
insert into AlbumAndSongRelation values (27, 30)
insert into AlbumAndSongRelation values (27, 40)
insert into AlbumAndSongRelation values (27, 50)
insert into AlbumAndSongRelation values (27, 62)
insert into AlbumAndSongRelation values (28, 5)
insert into AlbumAndSongRelation values (28, 12)
insert into AlbumAndSongRelation values (28, 23)
insert into AlbumAndSongRelation values (28, 35)
insert into AlbumAndSongRelation values (28, 57)
insert into AlbumAndSongRelation values (28, 72)
insert into AlbumAndSongRelation values (29, 86)
insert into AlbumAndSongRelation values (29, 80)
insert into AlbumAndSongRelation values (29, 68)
insert into AlbumAndSongRelation values (29, 62)
insert into AlbumAndSongRelation values (29, 36)
insert into AlbumAndSongRelation values (30, 2)
insert into AlbumAndSongRelation values (30, 5)
insert into AlbumAndSongRelation values (30, 9)
insert into AlbumAndSongRelation values (30, 11)
insert into AlbumAndSongRelation values (30, 21)
insert into AlbumAndSongRelation values (30, 35)
insert into AlbumAndSongRelation values (30, 43)
insert into AlbumAndSongRelation values (30, 46)
insert into AlbumAndSongRelation values (30, 50)
insert into AlbumAndSongRelation values (30, 54)
insert into AlbumAndSongRelation values (30, 58)
insert into AlbumAndSongRelation values (30, 59)
insert into AlbumAndSongRelation values (30, 63)
insert into AlbumAndSongRelation values (30, 65)
insert into AlbumAndSongRelation values (30, 66)
insert into AlbumAndSongRelation values (30, 68)
insert into AlbumAndSongRelation values (30, 78)
insert into AlbumAndSongRelation values (30, 84)
select *
from Users

select *
from playlist
select *
from song
select *
from album




























