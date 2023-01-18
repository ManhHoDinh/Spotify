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

insert into Song values (N'Ai Cũng Có Ngày Xưa', N'pack://siteoforigin:,,,/Resource/Songs/AiCungCoNgayXua/AiCungCoNgayXua.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/AiCungCoNgayXua/AiCungCoNgayXua.jpg', Null, N'Dòng tin đăng quê hương tôi nay đang bão
Gió lớn cuốn mấy mái ngói bay
Nước cũng sắp cao ngang đầu
Chiều nay ai mang thêm bao nhiêu lo lắng
Chẳng biết sẽ có chỗ trú thân
Hay thức trắng với cơn mưa dài
Vội nhớ đến những ký ức đã quá xa
Lúc ấy bé lắm có biết đâu
Thích bão giông ngập lũ
Để cha bắt cá ngay trong sân nhà mình
Con vui quên đi gió mùa về ôi bao năm rồi
Giờ tự nhiên khóc huh
Ai cũng có tuổi thơ
Ai cũng có ngày xưa
Ngày xanh trôi nhanh hơn khi xưa ta nghĩ
Lúc ấy chỉ muốn mau lớn lên
Để không ai gọi trẻ con
Rồi khi bao bon chen ưu tư cuộc sống
Ta mơ trở về ít phút thôi
Tiếc những tháng năm êm đềm
Lại nhớ đến những lúc mới biết trước sau
Mấy đứa cuối xóm chơi rất thân
Mà mỗi đứa nay một nơi
Chẳng biết nghĩ đến những khi ta cười đùa
Có thấy rất vui hay chạnh lòng vì chỉ còn dĩ vãng
Ngồi buồn tôi hát hah
Tôi cũng có tuổi thơ
Tôi cũng có ngày xưa
Ngày đó trong đêm khuya hanh khô nóng bức
Bà ngồi quạt hoài đứa cháu thơ
Gió đưa tôi vào giấc ngủ
Ngày đó mái tóc xanh đôi chân đi vững
Ánh mắt vẫn sáng tay dắt tôi rồi không muốn rời
Thời gian trôi qua những đứa bé lớn lên
Nhưng ai ngăn mái tóc phai màu
Ốm đau rồi đi mãi
Phải chăng ai yêu thương bên ta một thời
Cũng sẽ sang bên kia bầu trời rồi tìm nơi đâu huh
Ngồi buồn tôi nhớ hoh
Ai cũng có tuổi thơ
Ai cũng có ngày xưa
Ai cũng nhớ tuổi thơ
Ai cũng nhớ ngày xưa', '2017', '04:12')
insert into Song values (N'Anh Không Đòi Quà', N'pack://siteoforigin:,,,/Resource/Songs/AnhKhongDoiQua/AnhKhongDoiQua.mp3', N'Only C, Karik', N'pack://siteoforigin:,,,/Resource/Songs/AnhKhongDoiQua/AnhKhongDoiQua.jpg', Null, N'Only C, boy bánh bèo
Karik, boy nhà nghèo, yo
Anh này, đẹp trai này, đại gia này
Nhà giàu tiền tiêu thả ga
Xây riêng hồ bơi để nuôi cá
Còn anh thì nghèo khó, tiền chẳng có
Nhà nghèo thì mẹ đâu có cho
Xây riêng công viên để nuôi chó
Anh kia khi yêu em thì mua cho những món đắt tiền
Luôn luôn tặng em rồi sai khiến (khiến em luôn đau đầu)
Còn anh đây khi yêu em là, trao cho em con tim chung tình
Em ơi hãy lắng nghe anh này
Yêu anh đi em, anh không đòi quà (la la la la la la)
Chia tay anh không đòi lại quà (la la la la la la)
Anh yêu anh không đòi quà (la la la la la la)
Yêu em anh không đòi lại quà
Thằng kia, ra đường là đại gia
Về nhà, sung sướng làm đại ca
Quen em, tiền bạc xài thả ga
Nhưng chia tay lại tới nhà đòi lại quà
Anh không như thế, không nhiều tiền
Đồ anh xài mua ở chợ Kim Biên
Nhưng cam kết nhà có xe đạp riêng
Lỡ chia tay anh sẽ không làm phiền
Anh biết anh không được đẹp nhưng anh không vô duyên
Tài chém gió anh có nhưng mà anh không thuộc dạng bị điên
Trừ quà cáp được tính bằng hiện kim
Còn lại anh hứa gì là anh sẽ tặng liền
Boy nhà nghèo là boy nhà nghèo
Không ai thích vì chê quà bèo
Boy nhà nghèo là boy nhà nghèo
Vì boy nghèo nên không ai theo
Yêu anh đi em, anh không đòi quà (la la la la la la)
Chia tay anh không đòi lại quà (la la la la la la)
Anh yêu anh không đòi quà (la la la la la la)
Yêu em anh không đòi lại quà
Khi yêu nhau anh quan trọng lời nói
Đã nói lúc trước khi yêu ai
Sẽ không hai lời dối trá (oh baby baby)
Bao năm trôi qua và tình yêu anh trao cho em không phôi pha
Em hãy lắng nghe anh mà
Yêu anh đi em, anh không đòi quà (la la la la la la)
Chia tay anh không đòi lại quà (la la la la la la)
Anh yêu anh không đòi quà (la la la la la la)
Yêu em anh không đòi lại quà
Yêu anh đi em, anh không đòi quà
Anh không, không đòi lại đâu
Chia tay anh không đòi lại quà
Anh tặng quà, anh không đòi lại đâu
Anh yêu anh không đòi quà
Anh hứa là anh không đòi lại đâu
Yêu em anh không đòi lại quà
Khi anh giàu anh sẽ đòi lại sau', '2013', '03:18')
insert into Song values (N'Anh Nhà Ở Đâu Thế', N'pack://siteoforigin:,,,/Resource/Songs/AnhNhaODauThe/AnhNhaODauThe.mp3', N'AMEE', N'pack://siteoforigin:,,,/Resource/Songs/AnhNhaODauThe/DreAMEE.jpg', Null, N'Anh và tôi thật ra gặp nhau và quen nhau cũng đã được mấy năm
Mà chẳng có chi hơn lời hỏi thăm
Rằng giờ này đã ăn sáng chưa?
Ở bên đấy nắng hay mưa?
Anh và tôi thật ra, uhm-hm, mải mê nhìn lén nhau
Và không một ai nói nên câu, uhm-mm
Rằng người ơi, tôi đang nhớ anh
Và anh có nhớ tôi không?
Tôi từ lâu đã thích anh rồi
Chỉ mong hai ta thành đôi
Anh nhà ở đâu thế?
Cứ tới lui trong tim tôi chẳng nhớ đường về, ah
Cứ khiến cho tôi ngày đêm phải khóc rồi cười vì nhớ một người
Khiến trái tim tôi lâu nay tương tư về anh đấy
Chỉ muốn anh có thể nghe được hết tâm tư này
Nhưng lại sợ anh từ chối
Muốn nói rồi lại thôi
Nên anh và tôi vẫn thế
Hey anh nhà ở đâu thế
Ngay từ giây đầu tiên là tôi đã biết anh thích tôi rồi
Mà tôi vờ như chẳng hay, chẳng quan tâm anh đến nửa lời
Con trai gì mà kì ghê, con trai thời này ngộ ghê
Thích người ta mà chẳng dám nói, cứ vậy thôi bước chung một đường
Anh ơi, anh nhà ở đâu tôi ở nhà kế bên
Mà sao lâu nay lâu nay lâu nay ta vẫn chưa hỏi thăm bao giờ, bao giờ
Thật là chẳng hay anh nay đã có người yêu chưa?
Vì tôi từ lâu đã thích anh rồi
Chỉ mong hai ta thành đôi
Anh nhà ở đâu thế?
Cứ tới lui trong tim tôi chẳng nhớ đường về
Cứ khiến cho tôi ngày đêm phải khóc rồi cười vì nhớ một người
Khiến trái tim tôi lâu nay tương tư về anh đấy
Chỉ muốn anh có thể nghe được hết tâm tư này
Nhưng lại sợ anh từ chối
Muốn nói rồi lại thôi
Nên anh và tôi vẫn thế
Ấp úng mấy câu thương nhau nhưng không nói gì
Nên anh và tôi vẫn thế
Vẫn chẳng thể đi bên nhau cùng chung lối về
Thật buồn ghê
Nên anh và tôi vẫn thế
Hey anh nhà ở đâu thế', '2019', '03:37')
insert into Song values (N'Ánh Trăng Tình Ái', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.mp3', N'Dương Edward', N'pack://siteoforigin:,,,/Resource/Songs/AnhTrangTinhAi/AnhTrangTinhAi.jpg', Null,N'Một đêm trăng sáng
Chúng mình hai đứa
Hẹn thề sẽ mãi bên nhau
Ánh trăng vàng vì nàng
Gió thay lời dịu dàng
Tha thiết yêu tình yêu chứa chan
Từng lời anh nói sao trời đưa lối
Bờ môi quấn quýt không rời
Trái tim chợt bồi hồi
Hứa yêu người trọn đời
Không dối gian mình anh mãi thôi
Hãy đưa anh vào giấc mộng
Dìu anh vào thiên đường tình ái
Giấc mơ như một đoá hồng
Ngày tương tư đêm đêm nhớ mong
Từng lời anh nói sao trời đưa lối
Bờ môi quấn quýt không rời
Trái tim chợt bồi hồi
Hứa yêu người trọn đời
Không dối gian mình anh mãi thôi
Hãy đưa anh vào giấc mộng
Dìu anh vào thiên đường tình ái
Giấc mơ như một đoá hồng
Ngày tương tư đêm đêm nhớ mong oh
Hãy đưa anh vào giấc mộng
Dìu anh vào thiên đường tình ái
Giấc mơ như một đoá hồng
Ngày tương tư đêm đêm nhớ mong
Một đêm trăng sáng
Chúng mình hai đứa
Hẹn thề sẽ mãi bên nhau
Ánh trăng vàng vì nàng
Gió thay lời dịu dàng
Tha thiết yêu tình yêu chứa chan
Ánh trăng vàng vì nàng
Gió thay lời dịu dàng
Tha thiết yêu tình yêu chứa chan
Trái tim chợt bồi hồi
Hứa yêu người trọn đời
Không dối gian mình anh mà thôi', '2021', '04:04')
insert into Song values (N'Bài Này Chill Phết', N'pack://siteoforigin:,,,/Resource/Songs/BaiNayChillPhet/BaiNayChillPhet.mp3', N'Đen Vâu, Min', N'pack://siteoforigin:,,,/Resource/Songs/BaiNayChillPhet/BaiNayChillPhet.jpg', Null, N'I just wanna chill with you tonight
And all the sorrow left behind uh-way
Sometimes I feel lost in the crowd
Life is full of ups and downs
But its alright, I feel peaceful inside
Ay, ya
Em dạo này ổn không? Còn đi làm ở công ty cũ?
Còn đi sớm về hôm nhưng mà đồng lương vẫn không khi đủ? (ay)
Đồng nghiệp của em thế nào, trong thang máy có chào với nhau?
Có nói qua nói lại và những cuộc họp có đào bới nhau?
Sếp của em thế nào? Dễ tính hay thường gắt gỏng?
Anh ta có thương nhân viên hay thường buông lời sắc mỏng? (ah)
Em còn thiếu ngủ trong những lần phải chạy deadline
Em quên ăn quên uống, quên cả việc chải lại tóc tai (ay)
Những đôi giày cao gót chắc còn làm đau em
Và tiền bao nhiêu cho đủ, ai biết ngày sau em
Mắt em còn mỏi không? Tám tiếng nhìn màn hình
Những tối đi về đơn độc em thấy lòng mình lặng thinh
Và đừng để đời chỉ là những chuỗi ngày được chấm công (thats right)
Miệng cười như nắng hạ nhưng trong lòng thì chớm đông (yo)
Nếu mà mệt quá giữa thành phố sống chồng lên nhau
Cùng lắm thì mình về quê, mình nuôi cá và trồng thêm rau (ha-ha)
Trời thả vạt nắng khiến đám tóc em hoe vàng
Chiều nay đi giữa thành phố em bỗng thấy sao mơ màng
Tìm cho mình một không gian, bật bài nhạc làm em chill
Tâm hồn em phiêu dạt theo áng mây bên trời
Trời thả vạt nắng khiến đám tóc em hoe vàng
Chiều nay đi giữa thành phố em bỗng thấy sao mơ màng
Tìm cho mình một không gian, bật bài nhạc làm em chill
Tâm hồn em phiêu dạt theo áng mây bên trời
Anh dạo này cũng bận nhiều và cũng có thêm nhiều đêm diễn
Âm nhạc mở lối cuộc đời anh như là ngọn hải đăng ở trên biển
Anh được gặp những người nổi tiếng trước giờ chỉ thấy trên tivi
Gặp HHen Niê hoa hậu, gặp cả Sơn Tùng M-TP, ya
Đi hát vui lắm em vì đồng âm của anh họ rất tuyệt (yeah)
Bọn anh hát cùng nhau khiến cho thanh xuân này như bất diệt
Anh thấy mình không cô đơn, không áp lực nào buộc chân anh
Nhiều khi anh lên sân khấu mà dưới khán giả họ thuộc hơn anh
Anh cũng có những hợp đồng, những điều khoản mà anh phải dần quen
Anh cũng cần tiền, những dự án họ nói họ cần Đen (yeah)
Và những con số nặng tới mức đủ sức làm choáng mình
Nhưng em yên tâm anh bán chất xám chứ chưa từng bán mình (ha-ha)
Nhưng cũng có lúc mọi thứ không như là những gì ta muốn
Thế giới này vận hành theo cái cách luôn ghì ta xuống, oh
Nhưng mà mộng mơ anh nhiều như niêu cơm của Thạch Sanh (yeah)
Ai muốn lấy cứ lấy-ya, không thể nào mà sạch banh
Trời thả vạt nắng khiến đám tóc em hoe vàng
Chiều nay đi giữa thành phố em bỗng thấy sao mơ màng
Tìm cho mình một không gian, bật bài nhạc làm em chill
Tâm hồn em phiêu dạt theo áng mây bên trời
Trời thả vạt nắng khiến đám tóc em hoe vàng
Chiều nay đi giữa thành phố em bỗng thấy sao mơ màng
Tìm cho mình một không gian, bật bài nhạc làm em chill
Tâm hồn em phiêu dạt theo áng mây bên trời
Mình sướng hơn những người giàu nhỉ (ay)
Vầng trán mình chưa hề nhàu nhĩ (ay)
Dù chênh vênh như là cầu khỉ (ay)
Đời sóng gió mình là tàu thuỷ (ay)
Vì một ngày còn sống
Là một ngày đắm say (một ngày đắm say)
Ngày đẹp trời nhất
Là ngày mình còn nắm tay (ngày còn nắm tay)
Mình sẽ không ngã
Vì mình ngã họ hả hê (ay)
Biển người cũng là biển
Cho tụi mình tắm thoả thuê
Và chúng ta sẽ không
Là một ai trông giống họ (một ai trông giống họ)
Sẽ không rỗng tuếch
Như một cái chai trong đống lọ (chai trong đống lọ)
Sáng chúng ta làm vì tờ bạc nhiều màu trong ví
Đêm về ta chill, riêng mình một bầu không khí
Vì tim ta còn trẻ dù thân xác ta sẽ già
Nhưng mà ta không ủ rũ như là mấy con sẻ già (yeah)
Chúng ta có những chiều vàng, dắt tay nhau lên đồi xa
Nắng khoác lên mình lớp áo, nheo mắt lại nhìn trời hoa
Và những đêm đen huyền dịu cho tiếng lòng thêm dõng dạc
Ta thấy nhau bằng tâm hồn và không cần nhìn bằng võng mạc (yes)
Ta sẽ cố để có được những thứ mà ta chờ mong
Dưới ngọn đồi, căn nhà nhỏ, nhìn ra bờ sông (nhìn ra bờ sông)
Vì anh chưa từng mơ ngày nào đó mình trở thành siêu sao (siêu sao)
Từ ngày thơ bé anh đã muốn trở thành chưởng môn phái Tiêu Dao
Em ơi vui cười lên vì đời này ai không âu lo
(I just wanna chill with you tonight)
Nếu băn khoăn ngày mai mệt nhoài hệt như con sâu đo
Em đi ra ngoài kia tìm về vài chai Strongbow-oh
Đêm nay em cần chill, việc này để cho Đen Vâu lo
Trời thả vạt nắng khiến đám tóc em hoe vàng
(Việc này để cho Đen Vâu lo)
Chiều nay đi giữa thành phố em bỗng thấy sao mơ màng
Tìm cho mình một không gian, bật bài nhạc làm em chill
Tâm hồn em phiêu dạt theo áng mây bên trời
Phiêu dạt theo áng mây bên trời
Bài hát này đã có quảng cáo
Không có tiền thì làm nhạc làm sao?', '2019', '04:33')
insert into Song values (N'Bao Tiền Một Mớ Bình Yên', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.mp3', N'14 Casper - Bon Nghiêm', N'pack://siteoforigin:,,,/Resource/Songs/BaoTienMotMoBinhYen/BaoTienMotMoBinhYen.jpg', Null, N'Mười giờ, văn phòng vẫn sáng đèn
Lại một hôm làm thâu suốt đêm
Bàn chân đau mỏi nhức, tựa lưng em chợp mắt
Dặn lòng, "Vì cuộc sống êm đẹp"
Hạnh phúc không đâu cách xa mà ta cứ đi tìm
Vậy xin em một lần tự yêu thương lấy mình
Một ngày em được mấy bữa cơm?
Đợt này công việc có tốt hơn?
Còn ai hay gièm pha?
Còn ai luôn rầy la mà xót xa, oà lên khóc vô vọng?
Cành lá đông qua sẽ rơi
Khổ đau sẽ vơi, nỗi buồn sẽ qua
Mưa tạnh, mây tan, trời quang
Xin đừng buông xuôi dễ dàng
Dù có lắm phút chốc em lạc lối
Hãy cho mình hồn nhiên một chút thôi
Mặc cho những âu lo ghìm chặt đôi vai
Mặc cho tiếng thở dài đập vào hư không
Dù có những lúc chỉ muốn gục ngã
Má em hồng, cười lên để thấy ta
Thật may mắn khi em như một bông hoa
Mọc lên giữa nơi sa mạc cằn cỗi
Chỉ cần vậy thôi
Mua gì em còn phải đắn đo
Cho mình, em đừng nên lắng lo
Dù ai có gièm pha
Đừng quan tâm vài ba lời nói xa mà vấp ngã, yếu lòng
Chẳng ai thu phí ước mơ
Thì hãy cứ mơ từng giây phút, giờ
Em là mây cho, trời ban
Xin đừng buông xuôi dễ dàng
Dù có lắm phút chốc em lạc lối
Hãy cho mình hồn nhiên một chút thôi
Mặc cho những âu lo ghìm chặt đôi vai
Mặc cho tiếng thở dài đập vào hư không
Dù có những lúc chỉ muốn gục ngã
Má em hồng, cười lên để thấy ta
Thật may mắn khi em như một bông hoa
Mọc lên giữa nơi sa mạc cằn cỗi
Chỉ cần vậy thôi
Đã có ngày tháng năm kia vụn vỡ
Nhưng hãy nhớ
"Tỉnh giấc mơ ngày mai rồi sẽ tốt hơn"
Chẳng còn những lúc buốt giá
Dày vò tâm can yếu đuối ngày qua
Cần bao nhiêu lâu để em tìm kiếm?
Cần bao nhiêu tiền đổi một mớ bình yên?
Chẳng ai bán, ai mua, ai mần, ai mang
Bình yên chứa chan nơi trong lòng nhân gian
Dù có những lúc chỉ muốn gục ngã
Má em hồng, cười lên để thấy ta
Thật may mắn khi em như một bông hoa
Mọc lên giữa nơi sa mạc cằn cỗi
Chỉ cần vậy thôi', '2020', '05:00')
insert into Song values (N'Bất Bình Thường', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.mp3', N'WHEE!, Dư Quốc Vương', N'pack://siteoforigin:,,,/Resource/Songs/BatBinhThuong/BatBinhThuong.jpg', Null, N'Mỗi sáng chủ nhật trời không có mây bay
Gió chẳng rì rào mà cây vẫn lung lay
Lén ngắt thử một nhành hoa nắm trong tay
Liệu anh còn đang say
Thấy bất bình thường, tự dưng muốn yêu thương
Quá bất bình thường, vì ai nên vấn vương
Buổi sáng chủ nhật, trời không có mây bay
Trời không có mây bay
Và trong mơ anh hái bông hoa anh cài lên tóc em
Rồi nắm đôi tay của em
Nhạc vang lên theo trái tim anh từng nhịp bước đến bên em
Chợt anh như kẻ ngốc say sưa nụ cười trên mắt em
Người nói những câu dịu êm
Chẳng một ai đánh thuế giấc mơ nên sợ chi cứ thế mơ mộng
Thế giới một người chẳng ai biết khi yêu
Ước muốn nhiều điều rồi tự vui biết bao nhiêu
Nhớ đến nụ cười làm tim mãi ngất ngây
Mà sao tìm không thấy (tìm hoài không thấy)
Thấy bất bình thường tự dưng quá nhớ thương
Rất bất bình thường chẳng may mang vấn vương
Mỗi sáng chủ nhật trời không có mây bay
Trời không có mây bay
Và trong mơ anh hái bông hoa anh cài lên tóc em
Rồi nắm đôi tay của em
Nhạc vang lên theo trái tim anh từng nhịp bước đến bên em
Chợt anh như kẻ ngốc say sưa nụ cười trên mắt em
Người nói những câu dịu êm
Chăng một ai đánh thuế giấc mơ nên sợ chi cứ thế mơ mộng.', '2020', '03:28')
insert into Song values (N'Bên Trên Tầng Lầu', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.mp3', N'Tăng Duy Tân', N'pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.jpg', Null, N'Em ơi đừng khóc bóng tối trước mắt sẽ bắt em đi
Em ơi đừng lo, em ơi đừng cho tương lai vụt tắt
Sâu trong màu mắt có chút tiếc nuối phút cuối chỉ vì
Em đâu hề sai, em đâu thể mãi để trái tim đau
Không còn tương lai, em cũng chẳng còn thương ai
Sau bao niềm đau em mong rằng con tim em dừng lại
Nỗi nhớ này lâu phai, nhốt em trong một lâu đài
Lâu đài của những cơn đau bất tận
Vì sao em phải khóc?
Có đáng để buồn đâu?
Tình yêu như cơn lốc
Thoáng phút chốc lướt qua thật mau
Vì sao em phải khóc?
Có đáng để buồn đâu?
Rượu kề môi em nốc
Thoáng phút chốc đã vơi u sầu
Vì sao em phải khóc
Vì sao em phải khóc
Buông bàn tay để chấm hết
Tất cả thứ làm em buồn
Bao gồm cả cuộc đời của em
Em à cho dù có khóc
Cũng sẽ đến ngày phải quên
Thiên đường vẫn chờ ngày em đến
Không còn tương lai, em cũng chẳng còn thương ai
Sau bao niềm đau em mong rằng con tim em dừng lại
Nỗi nhớ này lâu phai, nhốt em trong một lâu đài
Lâu đài của những cơn đau bất tận
Vì sao em phải khóc?
Có đáng để buồn đâu?
Tình yêu như cơn lốc
Thoáng phút chốc lướt qua thật mau
Vì sao em phải khóc?
Có đáng để buồn đâu?
Rượu kề môi em nốc
Thoáng phút chốc đã vơi u sầu
Vì sao em phải khóc
Vì sao em phải khóc', '2022', '03:10')
insert into Song values (N'Big City Boi', N'pack://siteoforigin:,,,/Resource/Songs/BigCityBoi/BigCityBoi.mp3', N'Binz x Touliver', N'pack://siteoforigin:,,,/Resource/Songs/BigCityBoi/BigCityBoi.jpg', Null, N'Em on top, không phải trending
Không phải YouTube, không phải trên Zing
Anh on top, em ở trên anh
Beat Touliver drop người ta gọi tên anh
Big city
Big city boi
Big city
Big city boi
Big city
Big city-Spacespeakers in da house make some mother fucker noise ay
Thả tim đầy story em (thả)
Nhắn tin đầy trong DM (slide)
Có phiền thì sorry em (sorry)
Đón, 10 giờ pm? (ten)
Yea em thích coi sea game (dô)
Hợp âm anh thích là Cm (đô)
Xe em thích BM
Việc anh thích là see em
Trói em bằng cà vạt (trói)
Penhouse trên Đà Lạt (đồi)
Nếu mà ngoan em sẽ bị thương (đôi)
Nếu mà hư em sẽ được phạt
K-r-a-z-y about u
Hay là mang thêm friend đi không sao đâu
Yea anh không thường say yes
Với em không thể say no
Nhìn anh lúc nào cũng fresh
Make them haters say wow
Big city
Big city boi
Big city
Big city boi
Big city
Big city-Spacespeakers in da house make some mother fucker noise
Shall we up all night, what u gonna do
Ngay sát DJ, what u gonna do
Them bottles keep coming, what u gonna do
Thành phố này không ngủ, tell me what u gonna do, ay
Từ lầu cao cho tới cuối ngõ
Mang chất đường phố về tận lối nhỏ
Đáy quần vẫn dưới gối oh
Rap game này anh đại diện không thể chối bỏ
Nhạc đơn giản, không phải cầu kì
Đừng hỏi anh tình yêu màu gì (không biết)
Mấy thằng ghét anh muốn spotlight
Sorry anh là cầu chì
Không lòng vòng anh như Hải Phòng (gang gang)
Thích anh rồi phải không? (gia)
Không cần vội em như Hà Nội (trưởng)
Cần thêm thời gian em mới trải lòng
Cần em như anh Cần Thơ (Cần Thơ)
Thật ra anh chỉ muốn em gần hơn (gần chút)
Thật ra anh chỉ muốn ta tương tác
Anh còn chưa ngủ, em nói ngừng mơ
Không chịu ngủ anh như Sài Gòn (Sài Gòn)
Party với bạn all night long (all night)
Nếu mà đó là, đó là thứ em muốn (tell me)
Anh có thể làm cho em, cho em hài lòng
Nghiện thuốc có thể Lào Cai (cai)
Nhưng nghiện em không thể nào cai (không cần)
Trai hư anh không phải diễn
Nhưng trai tốt anh phải vào vai
Big city
Big city boi
Big city
Big city boi
Big city
Big city-Spacespeakers in da house make some mother fucker noise
Shall we up all night, what u gonna do
Ngay sát DJ, what u gonna do
Them bottles keep coming, what u gonna do
Thành phố này không ngủ, tell me what u gonna do, ay
Big city
Big city boi
Big city
Big city boi
Big city
Big city-Spacespeakers in da house make some mother fucker noise
Shall we up all night, what u gonna do
Ngay sát DJ, what u gonna do
Them bottles keep coming, what u gonna do
Thành phố này không ngủ, tell me what u gonna do, ay', '2020', '03:43')
insert into Song values (N'Bước Qua Mùa Cô Đơn', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.mp3', N'Vũ.', N'pack://siteoforigin:,,,/Resource/Songs/BuocQuaMuaCoDon/BuocQuaMuaCoDon.jpg', Null, N'Chào cơn mưa
Làm sao cứ kéo ta quay lại
Những rung động con tim
Lần đầu hai ta gặp gỡ
Chào hàng cây
Làm sao cố níu tay nhau lại
Để thấy nồng nàn
Đang về trên đôi mắt em
Chợt nhìn đôi bàn tay em run nắm lấy bờ vai, rất lâu
Cuối thu với anh là ngày khiến hai hàng mi rối bời
Vì ngày ấy gặp nhau không ai dám nói một câu, chào nhau
Cứ đắm đuối
Cứ thế hát bài hát chia xa
Mùa thu rơi vào em, vào trong giấc mơ hôm qua
Mùa thu ôm mình em, chạy xa vòng tay vội vã
Lời em nói ngày xưa đâu đây
Vẫn âm thầm chìm vào trong mây
Đến bao giờ, dặn lòng anh không mong nhớ
Mùa thu rơi vào em, vào trong chiếc hôn ngây thơ
Mùa thu không cần anh, vì em giờ đây còn mãi hững hờ
Ngày mai kia nếu có phút giây vô tình thấy nhau sẽ nói câu gì...
Hay ta chỉ nhìn
Lặng lẽ
Đi qua
Chào cơn mưa
Làm sao cứ kéo ta quay lại
Những rung động con tim
Lần đầu hai ta gặp gỡ
Chào hàng cây
Làm sao cố níu tay nhau lại
Để thấy nồng nàn
Đang về trên đôi mắt em
Chợt nhìn đôi bàn tay em run nắm lấy bờ vai, rất lâu
Cuối thu, với anh là ngày khiến hai hàng mi rối bời
Vì ngày ấy gặp nhau không ai dám nói một câu, chào nhau
Cứ đắm đuối chẳng thể chia xa
Mùa thu rơi vào em, vào trong giấc mơ hôm qua
Mùa thu ôm mình em, chạy xa vòng tay vội vã
Lời em nói ngày xưa đâu đây
Vẫn âm thầm chìm vào trong mây
Đến bao giờ, dặn lòng anh không mong nhớ
Mùa thu rơi vào em, vào trong chiếc hôn ngây thơ
Mùa thu không cần anh, vì em giờ đây còn mãi hững hờ
Ngày mai kia nếu có phút giây vô tình thấy nhau sẽ nói câu gì...
Hay ta chỉ nhìn
Lặng lẽ...
Đi qua', '2020', '04:38')
insert into Song values (N'Buông Đôi Tay Nhau Ra', N'pack://siteoforigin:,,,/Resource/Songs/BuongDoiTayNhauRa/BuongDoiTayNhauRa.mp3', N'Sơn Tùng M-TP', N'pack://siteoforigin:,,,/Resource/Songs/BuongDoiTayNhauRa/BuongDoiTayNhauRa.jpg', Null, N'Cứ quên anh vậy đi
Nhạt nhoà sương tan ái ân mây trôi buồn
Những môi hôn chìm sâu
Còn đâu nụ cười thơ ngây đó
Cứ xa anh vậy đi
Đường mòn xưa kia dẫn lối đôi chân lẻ loi
Anh lẻ loi
Mưa rơi nhẹ rơi
Mưa đừng mang hoàng hôn xua tan bóng em
Chua cay nào hay
Thương là đau màn đêm chia hai giấc mơ
Giọt nước mắt vô tâm thờ ơ
Ngàn câu ca sao nghe hững hờ
Em lặng im
Anh lặng im
Sương gió bủa vây
Uh-uh-uh-uh-uh-uh-uh (buông đôi tay nhau ra, buông đôi tay chia xa)
Uh-uh-uh-uh-uh-uh-uh (buông đôi tay nhau ra, buông đôi tay chia xa)
Uh-uh-uh-uh-uh-uh-uh (hờn ghen xin cất trong tim này)
Uh-uh-uh-uh-uh-uh-uh (vì ai, vì ai)
Ngày tháng êm ấm vụt mất
Ai đó mang em đi rồi, giấu chôn những hoài mong
Ở phía trước mong em bình yên phía sau những vụn vỡ
Cơn gió quay lưng rồi ngoái thương những chờ mong
Có cơn gió lạnh lùng vội vàng thờ ơ xa chốn đây
Có ai đó ngập ngừng thả trôi yêu thương vào hư vô
Mưa rơi nhẹ rơi
Mưa đừng mang hoàng hôn xua tan bóng em
Chua cay nào hay
Thương là đau màn đêm chia hai giấc mơ
Giọt nước mắt vô tâm thờ ơ
Ngàn câu ca sao nghe hững hờ
Em lặng im
Anh lặng im
Sương gió bủa vây
Uh-uh-uh-uh-uh-uh-uh (buông đôi tay nhau ra, buông đôi tay chia xa)
Uh-uh-uh-uh-uh-uh-uh (buông đôi tay nhau ra, buông đôi tay chia xa)
Uh-uh-uh-uh-uh-uh-uh (hờn ghen xin cất trong tim này)
Uh-uh-uh-uh-uh-uh-uh (vì ai, vì ai)
Ngày tháng êm ấm vụt mất
Ai đó mang em đi rồi, giấu chôn những hoài mong
Ở phía trước mong em bình yên phía sau những vụn vỡ
Cơn gió quay lưng rồi ngoái thương những chờ mong
Uh-uh-uh-uh-uh-uh-uh (có lẽ)
Uh-uh-uh-uh-uh-uh-uh (anh sẽ quên đi tất cả)
Uh-uh-uh-uh-uh-uh-uh (phía trước đang chờ em)
Uh-uh-uh-uh-uh-uh-uh (chúc em hạnh phúc)
Uh-uh-uh-uh-uh-uh-uh (buông đôi tay nhau ra, buông đôi tay chia xa)
Uh-uh-uh-uh-uh-uh-uh (buông đôi tay nhau ra, buông đôi tay chia xa)
Uh-uh-uh-uh-uh-uh-uh (hờn ghen xin cất trong tim này)
Uh-uh-uh-uh-uh-uh-uh (vì ai, vì ai)
Sơn tùng M-TP
Buông đôi tay ra
Buông đôi tay ra
Buông đôi tay ra
Buông đôi tay nhau ra
Buông đôi tay ra
Buông đôi tay ra
Buông đôi tay ra
Buông đôi tay nhau ra
Ở phía trước mong em bình yên, bình yên', '2015', '04:49')
insert into Song values (N'Buồn Thì Cứ Khóc Đi', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.mp3', N'Lynk Lee', N'pack://siteoforigin:,,,/Resource/Songs/BuonThiCuKhocDi/BuonThiCuKhocDi.jpg', Null, N'Em có buồn
Nếu anh để lại cây viết
Dòng thư cuối sau bức màn
Nghe tiếng đàn
Cất lên trong không gian thật yên lặng
Khiến anh ngỡ ngàng
Chợt dòng chữ ấy đã phai nhanh vì mắt ướt nhoè
Sợ em không thấy rõ
Anh để lại yêu thương gói trong khúc nhạc
Anh viết tặng nhưng em đã quên
Là gió thì gió cứ bay về trời, chỉ cần đến nơi
Bình yên nhẹ nhàng cùng với những áng mây bay xa xôi
Tình yêu mà chỉ có nói bằng lời, nói yêu suốt đời
Sẽ chẳng thể nào tồn tại mãi mãi
Mình quen rồi đấy ừ thì cứ khóc đi
Mình quen rồi đấy ừ thì cứ khóc đi
Sáng hôm sau
Ta sẽ không gặp lại nhau nữa
Hàng cây bên hiên vẫn đứng
Trông theo bóng người nơi phương xa
Liệu rằng em vui hơn?
Liệu rằng em có còn tâm trí nhớ đến anh
Một lời em nói như thể là em không thấy xót xa ah
Anh cũng vẫn biết những sự thật liên quan đến chúng ta mà
Quan tâm một người hơn anh
Yêu thương một người hơn anh
Một lần đau hơn là trăm lần khóc
Là gió thì gió cứ bay về trời, chỉ cần đến nơi
Bình yên nhẹ nhàng cùng với những áng mây bay xa xôi
Tình yêu mà chỉ có nói bằng lời, nói yêu suốt đời
Sẽ chẳng thể nào tồn tại mãi mãi
Được khóc thì cứ khóc cho một lần hết nước mắt đi
Để rồi ngày mai tỉnh giấc không vấn vương một điều gì
Tự nhiên lại cứ đớn đau dằn vặt khác nào trói mình
Vì đâu phải khổ như thế mãi mãi
Là gió thì gió cứ bay về trời, chỉ cần đến nơi
Bình yên nhẹ nhàng cùng với những áng mây bay xa xôi
Tình yêu mà chỉ có nói bằng lời, nói yêu suốt đời
Sẽ chẳng thể nào tồn tại mãi mãi
Mình quen rồi đấy ừ thì cứ khóc đi
Mình quen rồi đấy ừ thì cứ khóc đi
Mình quen rồi đấy ừ thì cứ khóc đi
Mình quen rồi đấy ừ thì cứ khóc đi
Khóc đi', '2019', '03:40')
insert into Song values (N'Cảm Nắng', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.mp3', N'Suni Hạ Linh', N'pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.jpg', Null, N'Chờ bao lâu mà anh
Chẳng nói điều gì
Để em ngồi nơi đây
Nhìn bóng đêm vây
Buồn cay khóe mắt
Trời mưa rơi còn em
Thì vẫn thế thôi
Lòng cứ bâng khuâng
Đợi tiếng yêu thương thành lời
Ước một ngày người sẽ ở đây
Sánh đôi cùng nhau
Trao nụ hôn đắm say
Sợ anh không biết tình em
Nhỡ đâu anh quá hững hờ
Để em chờ mong
Cùng với trái tim vụn vỡ
I''m falling in love
I''m falling in love with you
Vì con tim em đã trót
Yêu anh quá nhiều
I''m falling in love
I''m falling in love with you
Vì nỗi nhớ anh dâng đầy
Giờ em biết phải như thế nào đây
Hah falling in love
Hah falling in love with you
Khi em gặp anh
Thấy trái đất đang xanh
Hóa ra màu hồng
Cùng bao nhiêu yêu thương
Giữ trong lòng
Rồi vu vơ ngẩn ngơ
Chẳng biết anh có nghĩ
Đến em thật nhiều
Mà lạnh lùng
Cho em buồn bao nhiêu
I''m falling in love
I''m falling in love with you
Vì con tim em đã trót
Yêu anh quá nhiều
I''m falling in love
I''m falling in love with you
Vì nỗi nhớ anh dâng đầy
Giờ em biết phải như thế nào đây
Nếu anh nói bị cảm bởi nắng
Trên nụ cười em thì sao
Thêm vào đó là giọng em thì thào
Khi anh khoác cho em chiếc áo lên vai
Wow anh nghe được lời cảm ơn
Ngọt ngào bên tai
Nhưng mà ba giờ hơn rồi em
Đêm còn đang quá ngắn
Mà cô đơn thì như dài thêm
Tim anh với lý trí đong đa đong đưa
Chẳng biết câu chuyện
Duyên vô định trong ta xong chưa
I''m falling in love (falling in love)
I''m falling in love with you (falling in love)
Vì con tim em đã trót yêu anh quá nhiều
(Trót yêu anh quá nhiều)
Im falling in love (falling in love)
Im falling in love with you
Vì nỗi nhớ anh dâng đầy
I''m falling in love
I''m falling in love with you (falling in love)
Vì con tim em đã trót yêu anh quá nhiều (falling in love)
I''m falling in love
I''m falling in love with you
Vì nỗi nhớ anh dâng đầy
I''m falling in love', '2017', '03:48')
insert into Song values (N'Cảm Ơn Và Xin Lỗi', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.mp3', N'Chillies', N'pack://siteoforigin:,,,/Resource/Songs/CamOnVaXinLoi/CamOnVaXinLoi.jpg', Null, N'Đôi tim ngân nhiều câu xót xa
Hai ta mong chờ đêm thứ tha
Theo chân ta hàng vạn những nghĩ suy mang về đây
Để được thấy người vẫn nhớ tôi một ngày
Đêm mang em về trong giấc mơ
Tôi hát lên trăm lời vu vơ
Vẫn những khuôn mặt cười dù biết sẽ không hề vui
Dù hôm nay dẫu đúng sai vẫn yêu hơn ngày mai
Xin lỗi người vì những điều chưa nói ra thành câu
Xin lỗi người vì bao ngày qua đã trôi về đâu
Mất bao lâu để ta tạm quên u sầu để tim này vơi cơn đau
Và nhứng ký ức mệt nhoài chợt tan vào sớm mai
Cảm ơn người vì luôn cạnh bên sẻ chia buồn vui
Cảm ơn người vì đôi bàn tay không đành buông xuôi
Nước mắt nào rồi cũng sẽ trôi rất nhanh về nơi ấm êm vô cùng
Ta xin để lại nụ hôn một lần với ai
Đêm mang em về trong giấc mơ
Tôi hát lên trăm lời vu vơ
Vẫn nhưng khuôn mặt cười dù biết sẽ không hề vui
Dù hôm nay dẫu đúng sai vẫn yêu hơn ngày mai
Xin lỗi người vì nhưng điều chưa nói ra thành câu
Xin lỗi người vì bao ngày qua đã trôi về đâu
Mất bao lâu để ta tạm quên u sầu để tim này vơi cơn đau
Và những ký ức mệt nhoài chợt tan vào sớm mai
Cảm ơn người vì luôn cạnh bên sẽ chia buồn vui
Cảm ơn người vì đôi bàn tay không đành buông xuôi
Nước mắt nào rồi cũng sẽ trôi rất nhanh về nơi ấm êm vô cùng
Ta xin để lại nụ hôn một lần với ai
Xin lỗi người vì những điều chưa nói ra thành câu
Xin lỗi người vì bao ngày qua đã trôi về đâu
Mất bao lâu để ta tạm quên u sầu để tim này vơi cơn đau
Và những ký ức mệt nhoài chợt tan vào sớm mai
Cảm ơn người vì luôn cạnh bên sẽ chia buồn vui
Cảm ơn người vì đôi bàn tay không đành buông xuôi
Nước mắt nào rồi cũng sẽ trôi rất nhanh về nơi ấm êm vô cùng
Ta xin để lại nụ hôn một lần với ai
Ta xin để lại nụ hôn một lần với ai
', '2019', '05:16')
insert into Song values (N'Cây Đàn Sinh Viên', N'pack://siteoforigin:,,,/Resource/Songs/CayDanSinhVien/CayDanSinhVien.mp3', N'Mỹ Tâm', N'pack://siteoforigin:,,,/Resource/Songs/CayDanSinhVien/CayDanSinhVien.png', Null, N'Đời sinh viên có cây đàn ghi ta
Đàn ngân lên chúng ta cùng hòa ca
Có anh bạn xa nhà
Có cô bạn nhớ cha
Cất vang cùng lời ca
Đời sinh viên quý cây đàn ghi ta
Nhờ ghi ta mới quen nàng mời ca
Buông tiếng đàn tang tình tang tính
Hát lên bài nhớ thương
Thương mến tình đồng hương
Đời sinh viên sống trong tình bạn thân
Khi anh thấy buồn tôi nâng phím đàn
Tính tang tình tình tang
Cùng dắt nhau qua những ngày gian khó
Cùng dắt nhau qua quãng đời sinh viên
Rồi mai đây bước danh lợi phồn hoa
Khi nghe tiếng đàn ta nhớ năm nào
Thức suốt đêm dài những ngày thi đến
Giờ nhớ nhau nhớ nhau thật nhiều
Giờ nhớ nhau ta ôm đàn ghi ta
Đời sinh viên có cây đàn ghi ta
Đàn ngân lên chúng ta cùng hòa ca
Có anh bạn xa nhà
Có cô bạn nhớ cha
Cất vang cùng lời ca
Đời sinh viên quý cây đàn ghi ta
Nhờ ghi ta mới quen nàng mời ca
Buông tiếng đàn tang tình tang tính
Hát lên bài nhớ thương
Thương mến tình đồng hương
Đời sinh viên sống trong tình bạn thân
Khi anh thấy buồn tôi nâng phím đàn
Tính tang tình tình tang
Cùng dắt nhau qua những ngày gian khó
Cùng dắt nhau qua quãng đời sinh viên
Rồi mai đây bước danh lợi phồn hoa
Khi nghe tiếng đàn ta nhớ năm nào
Thức suốt đêm dài những ngày thi đến
Giờ nhớ nhau nhớ nhau thật nhiều
Giờ nhớ nhau ta ôm đàn ghi ta
Giờ nhớ nhau ta ôm đàn ghi ta
Giờ nhớ nhau ta ôm đàn ghi ta', '2018', '04:56')
insert into Song values (N'Chiều Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/ChieuXuan-Remix/ChieuXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/ChieuXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Có một chiều, chiều xuân như thế
Nắng ngập tràn hồn em ngất ngây
Mùa xuân, tình xuân
Có bao giờ chân trời xanh thế
Như mắt em lần đầu gặp anh
Má em hồng hoa đào tươi thắm
Như tình yêu, như mùa xuân đến
Mỗi khi xuân về làm hồng môi em
Nắng xuân rơi đầy chiều vàng rực rỡ
Đến bên em ngồi, thì thầm khẽ hát
Câu tình yêu ơi chiều xuân
Mỗi khi xuân về làm hồng môi em
Nắng xuân rơi đầy chiều vàng rực rỡ
Đến bên em ngồi, thì thầm khẽ hát
Câu tình yêu ơi chiều xuân
Có một chiều, chiều xuân như thế
Nắng ngập tràn hồn em ngất ngây
Mùa xuân, tình xuân
Có bao giờ chân trời xanh thế
Như mắt em lần đầu gặp anh
Má em hồng hoa đào tươi thắm
Như tình yêu, như mùa xuân đến
Mỗi khi xuân về làm hồng môi em
Nắng xuân rơi đầy chiều vàng rực rỡ
Đến bên em ngồi, thì thầm khẽ hát
Câu tình yêu ơi chiều xuân
Mỗi khi xuân về làm hồng môi em
Nắng xuân rơi đầy chiều vàng rực rỡ
Đến bên em ngồi, thì thầm khẽ hát
Câu tình yêu ơi chiều xuân
... ơi ơi ơi... chiều xuân' , '2022', '03:23')
insert into Song values (N'Chờ Anh Nhé (feat.Hoàng Rob)', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe(feat.HoangRob).mp3', N'Hoàng Dũng, Hoang Rob', N'pack://siteoforigin:,,,/Resource/Songs/ChoAnhNhe(feat.HoangRob)/ChoAnhNhe.jpg', N'Tình Ca Hoàng Dũng', N'Ở lại em nhé, ngày mai anh sẽ về
Anh chỉ mang nỗi nhớ em thêm xa
Mang đợi chờ, thêm dài ngắn
Anh chỉ thêm kỉ niệm là những chuyến đi
Rồi có lúc em sẽ khóc tựa vai gió
Tựa bóng mây ngập ngừng trôi
Vì anh biết vắng anh phố quen rất buồn
Vắng anh em vắng một bờ vai
Anh đâu muốn xa con phố ta đã yêu
Nơi ấy hẹn hò đôi ta chuyện trò
Nơi ấy đã từng đón đưa em từng chiều tới trường
Khi ấy em còn tóc xanh
Anh đâu muốn xa bóng dáng anh yêu thương
Đôi vai hao gầy mỏng manh tâm hồn
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về
Ở lại em nhé, ngày mai anh sẽ về
Anh chỉ mang nỗi nhớ em thêm xa
Mang đợi chờ, thêm dài ngắn
Anh chỉ thêm kỉ niệm là những chuyến đi
Rồi có lúc em sẽ khóc tựa vai gió
Tựa bóng mây ngập ngừng trôi
Vì anh biết vắng anh phố quen rất buồn
Vắng anh, em vắng một bờ vai
Anh đâu muốn xa con phố ta đã yêu
Nơi ấy hẹn hò đôi ta chuyện trò
Nơi ấy đã từng đón đưa em từng chiều tới trường
Khi ấy em còn tóc xanh
Anh đâu muốn xa bóng dáng anh yêu thương
Đôi vai hao gầy mỏng manh tâm hồn
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về
Anh đâu muốn xa con phố ta đã yêu
Nơi ấy hẹn hò đôi ta chuyện trò
Nơi ấy đã từng đón đưa em từng chiều tới trường
Khi ấy em còn tóc xanh
Anh đâu muốn xa bóng dáng anh yêu thương
Đôi vai hao gầy mỏng manh tâm hồn
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về
', '2018', '05:22')
insert into Song values (N'Chúng Ta Không Thuộc Về Nhau', N'pack://siteoforigin:,,,/Resource/Songs/ChungTaKhongThuocVeNhau/ChungTaKhongThuocVeNhau.mp3', N'Sơn Tùng M-TP', N'pack://siteoforigin:,,,/Resource/Songs/ChungTaKhongThuocVeNhau/ChungTaKhongThuocVeNhau.jpg', Null, N'Về, về, về nơi này
Chúng ta không thuộc về nhau
Chúng ta không thuộc về
Về, về, về nơi này
Niềm tin đã mất
Giọt nước mắt cuốn kí ức anh chìm sâu
Tình về nơi đâu
Cô đơn đôi chân lạc trôi giữa bầu trời
Màn đêm che dấu
Từng góc tối khuất lấp phía sau bờ môi
Tại vì anh thôi
Yêu say mê nên đôi khi quá dại khờ
Nhắm mắt ơ thờ anh không muốn lạc vào trong nỗi đau này
Phía trước bây giờ ai đang nắm chặt bàn tay của em vậy?
Mông lung như một trò đùa
Anh xin giơ tay rút lui thô#intro (do ai)
Trách ai bây giờ đây, hú-ú-ù-u-ù
Chúng ta không thuộc về nhau
Chúng ta không thuộc về nhau
Chúng ta không thuộc về nhau
Em hãy cứ đi bên người mà em cần
Trái tim không thuộc về nhau
Giấc mơ không là của nhau
Xóa câu ca buồn chiều mưa
Anh lỡ xóa luôn yêu thương ngày xưa rồi
Chúng ta không thuộc về nhau
Chúng ta không thuộc về (về, về, về nơi này)
Chúng ta không thuộc về nhau
Chúng ta không thuộc về (về, về, về nơi này)
Hey, từng đêm qua (từng đêm qua)
Cơn mưa bao vây chia rời đôi ta (rời đôi ta)
Em ngày hôm qua (ngày hôm qua)
Cuốn gió theo mây đi về nơi xa (về nơi xa)
Trời xanh rộng bao la, anh lê đôi chân mình
Bơ vơ lang thang có lẽ em đang yên vui bên nhân tình
Quên đi để anh nhớ, hơi men để anh mơ
Nơi đâu để anh giấu một nỗi buồn vào trong thơ
Nhắm mắt ơ thờ anh không muốn lạc vào trong nỗi đau này
Phía trước bây giờ ai đang nắm chặt bàn tay của em vậy?
Mông lung như một trò đùa
Anh xin giơ tay rút lui thôi (do ai)
Trách ai bây giờ đây, hú-ú-ù-u-ù
Chúng ta không thuộc về nhau
Chúng ta không thuộc về nhau
Chúng ta không thuộc về nhau
Em hãy cứ đi bên người mà em cần
Trái tim không thuộc về nhau
Giấc mơ không là của nhau
Xóa câu ca buồn chiều mưa
Anh lỡ xóa luôn yêu thương ngày xưa rồi
Chúng ta không thuộc về nhau
Chúng ta không thuộc về (về, về, về nơi này)
Chúng ta không thuộc về nhau
Chúng ta không thuộc về (về, về, về nơi này)
Chúng ta không thuộc về nhau
Không thuộc về nhau
Không thuộc về nhau, oh
Chúng ta không thuộc về nhau
Không thuộc về nhau
Không thuộc về nhau, ah-ha
Chúng ta không thuộc về nhau
Chúng ta không thuộc về nhau
Chúng ta không thuộc về nhau
Em hãy cứ đi bên người mà em cần
Trái tim không thuộc về nhau
Giấc mơ không là của nhau
Xoá câu ca buồn chiều mưa
Anh lỡ xoá luôn yêu thương ngày xưa rồi
Chúng ta không thuộc về nhau (goodbye forever oh)
Chúng ta không thuộc về nhau (oh)
Chúng ta không thuộc về nhau ah (goodbye forever oh)
Chúng ta không thuộc về nhau (goodbye forever oh)
Chúng ta không thuộc về nhau (oh)
Chúng ta không thuộc về nhau (goodbye forever oh)', '2016', '04:02')
insert into Song values (N'Chuyện Nhà Bé Thôi, Con Đừng Về', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoi,ConDungVe.mp3', N'Kai Đinh, MIN', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenNhaBeThoi,ConDungVe/ChuyenNhaBeThoiConDungVe.jpg', Null, N'Nhà tôi bốc khói trắng ngút lên ban trưa mùa hè
Mẹ tôi nói chuyện nhà bé thôi con đừng về
Bố đi làm xa mẹ làm việc không ngừng
Tôi không nói chỉ lặng lẽ đeo ba lô lên lưng
Em trai tôi nói đợi chút nha em về cùng
Tôi đi trước để lại chiếc tin đừng lo lung tung
Suốt đêm nằm khóc lo là mình vô dụng
Hai mươi mấy năm mình đã sống quá ung dung
Nhà là nơi ấm áp ngọt ngào mà ta đôi khi hay quên
Nhà là nơi xứng đáng được dành nhiều thời gian để yêu thêm
Từng ngày trôi ta luôn nguỵ biện rồi lơ là điều thương mến
Để rồi hôm nay khóc rất to khi khói trắng bốc lên (huh huh)
Huh huh
Tôi về đến nhà khi những ngôi sao vẫn còn sáng
Tìm trong mắt mẹ những âu lo mà mẹ đang mang
Bố đi làm xa mẹ sợ lo nên không nói gì
Tôi chỉ biết ngồi im lắng nghe không nói thêm chi
Nhà là nơi ấm áp ngọt ngào mà ta đôi khi hay quên
Nhà là nơi xứng đáng được dành nhiều thời gian để yêu thêm
Từng ngày trôi ta luôn nguỵ biện rồi lơ là điều thương mến
Để rồi hôm nay khóc rất to
Nhà là nơi có bố và mẹ nơi luôn có tình yêu thương
Nhà là nơi luôn dang tay chờ đợi dù ta có đi muôn phương
Từng ngày trôi ta luôn nguỵ biện rồi lơ là điều thương mến
Vậy mà chưa bao giờ chúng ta phải nghe một điều xót xa
Một điều như là chuyện nhà bé thôi con đừng về (huh huh)
Huh huh
', '2021', '04:36')
insert into Song values (N'Chuyện Rằng', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.mp3', N'Thịnh Suy', N'pack://siteoforigin:,,,/Resource/Songs/ChuyenRang/ChuyenRang.jpg', Null, N'Lal lal lal hah
Khi đêm ùa vào ôm chặt em
Oh I''m just a boy
Chẳng thể là quá muộn khi nói lời yêu một người
Chẳng thể là quá muộn khi ta hoài tiếc một đời
Những lời yêu sao quá khó khăn
Kìa những tháng năm dài ta đã cùng đi bên nhau
Nhìn đoá môi em cười cho ta một vết thương sâu
Những lời yêu sao quá khó khăn
Chuyện rằng huh huh huh huh mơ màng
Anh giam yêu dấu trong anh từng phút yên lặng
Là từng câu hát anh yêu em
Viết ra không tên
Khi đêm đen về
Chuyện rằng năm tháng cứ trôi chẳng thấy quay lại
Tại sao anh vẫn đau khi nhìn thấy em bên ai
Liệu rằng câu hát anh yêu em
Sẽ đến bên em khi đêm ùa vào ôm chặt em
Oh I''m just a boy
Tìm thấy nhau cả rồi nhưng trong lòng vẫn chơi vơi
Thả tiếng yêu không lời trôi theo ngọn gió muôn nơi
Những lời yêu sao quá khó khăn
Chuyện rằng huh huh huh huh mơ màng
Anh giam yêu dấu trong anh từng phút yên lặng
Là từng câu hát anh yêu em
Viết ra không tên
Khi đêm đen về
Chuyện rằng năm tháng cứ trôi chẳng thấy quay lại
Tại sao anh vẫn đau khi nhìn thấy em bên ai
Liệu rằng câu hát anh yêu em
Sẽ đến bên em
Khi đêm ùa vào ôm chặt em
Ngập ngừng lời yêu la la love
Có phải quá trễ để trao về em không la la love
Có phải tiếng khóc cô đơn vì em la la love
Đã đến lúc hát lên câu ca này
Ngập ngừng lời yêu la la love
Chẳng thể quá trễ để trao về em đâu la la love
Chẳng còn tiếng khóc cô đơn vì em la la love
Đã đến lúc hát lên câu ca này
Chuyện rằng huh huh huh huh mơ màng
Anh trao yêu dấu trong anh từng phút yên bình
Để từng câu hát anh yêu em
Sẽ đến bên em
Khi đêm đen về
Chuyện rằng năm tháng cứ trôi chẳng thấy quay lại
Và chẳng hối tiếc khi có nhìn thấy em bên ai
Để từng câu hát anh yêu em
Sẽ đến bên em
Khi đêm ùa vào ôm chặt em
Oh I''m just a boy', '2020', '04:32')
insert into Song values (N'Có Chơi Có Chịu', N'pack://siteoforigin:,,,/Resource/Songs/CoChoiCoChiu/CoChoiCoChiu.mp3', N'KARIK x ONLY C', N'pack://siteoforigin:,,,/Resource/Songs/CoChoiCoChiu/CoChoiCoChiu.jpg', Null, N'Có khóc có cười, tình yêu anh vẫn real thế thôi
Nếu chán chê không nói nên lời, mời em đi tìm người khác chơi
Đâu gì là mãi mãi trên đời, cứ chill rồi sẽ tự đến nơi
Riêng con người anh như thế quen rồi
Cảm thấy không vui anh khuyên em cứ rời
Em hỡi, em hỡi
Em đừng dựng chuyện không có, quên đi một người như anh không khó
Nếu chuyện tụi mình nay đã không rõ
Cứ nhắm mắt, xem như xui, ta đi lui, em lại vui với ai
Vài ba hôm là thấy drama cho nhiều cũng đâu vào đấy
Mình thật sự chẳng cần nhau là mấy
Cứ nhắm mắt, xem như xui, ta đi lui, anh lại vui với ai
Chia tay là xong
Không nên đi theo style lòng vòng
Anh không thích dài dòng
Em bớt ồn ào đi được không?
Nên buông ngay và luôn
Nên buông ngay và luôn
Nên buông ngay và luôn
Chia tay thôi có gì đâu mà buồn
Thoáng nghe câu giả dối, câu chuyện em nói hơi xa vời
Em lừa, em dắt đôi ba lời
Thôi thôi em ơi, đường ai nấy bay
Còn đâu nết thơ ngây, em lạ lắm, câu chuyện em nói hơi xa vời
Em lừa, em dắt đôi ba lời
Thôi ta chia tay, đường ai nấy bay
Giờ đây, giờ thì còn lại ai? (Ai?)
Ai?
Đừng làm lệ phải phai (phai)
Ai?
Giờ còn lại ai? (Ai?)
Ai?
Đừng làm lệ phải phai (phai)
Ai?
Có yêu là có dại
Bớt miệng, bớt miệng
Chia tay bớt bóc phốt để đời nhau được bớt chuyện
Bớt điên, bớt phiền, bớt phiền
Drama ít ít thôi đừng bắt anh phải bớt hiền
Rớt liền
Hey! Hết yêu là anh đi
Dăm ba cái cuộc tình không có cửa làm anh suy
Xời, cứ xem như cuộc dạo chơi
Tạm ứng chút tuổi trẻ, hai đứa đưa nhau vào đời
Dĩ vãng vốn dĩ đã dơ dáy, dễ gì mà giấu diếm, đừng bắt anh bẻ lái
Nhắm nhắm thấy khó lòng vui trở lại, đã trái lại còn sai, chờ gì chưa rẽ phải? (Quay xe)
Chia tay là xong
Không nên đi theo style lòng vòng
Anh không thích dài dòng
Em bớt ồn ào đi được không?
Nên buông ngay và luôn
Nên buông ngay và luôn
Nên buông ngay và luôn
Chia tay thôi có gì đâu mà buồn
Thoáng nghe câu giả dối, câu chuyện em nói hơi xa vời
Em lừa, em dắt đôi ba lời
Thôi thôi em ơi, đường ai nấy bay
Còn đâu nết thơ ngây, em lạ lắm, câu chuyện em nói hơi xa vời
Em lừa, em dắt đôi ba lời
Thôi ta chia tay, đường ai nấy bay
Giờ đây, giờ thì còn lại ai? (Còn lại ai?)
Ai?
Đừng làm lệ phải phai (lệ phải phai)
Ai?
Giờ còn lại ai? (Ai? Còn lại ai)
Ai?
Đừng làm lệ phải phai (ai? Lệ phải phai)
Ai?
Có yêu là có dại
Bye bye, không mong nỗi nhớ không tới
Bye, không thương nước mắt không rơi
Bye bye, hết yêu là hết trông đợi
Buông thôi em ơi!
Bye bye, yêu mà toxic đủ kiểu
Bye, mình làm gì có tương lai
Bye bye, có chơi thì có sức chịu
Chốt hạ luôn
Có yêu là có dại
I í í i', '2022', '04:46')
insert into Song values (N'Có Điều Gì, Sao Không Nói Cùng Anh_(Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion).mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/CoDieuGi,SaoKhongNoiCungAnh_(AcousticVersion)/CoDieuGi,SaoKhongNoiCungAnh.jpg', Null, N'Có điều gì sao không nói cùng anh
Đừng tập quen cách sống quẩn quanh
Chỉ làm tình yêu thêm khoảng cách
Nếu chẳng thể đi chung một chuyến xe
Thì xin hãy cho anh dừng lại
Bỏ đằng sau cả khoảng trời ngây dại
Còn hơn ở cạnh nhau mà lòng thắt đau
Còn hơn trao về nhau là nỗi buồn rầu
Tình yêu giờ đây hình như đã hết nhiệm màu
Nhìn vào đôi mắt của nhau, đừng lừa dối nhau
Miền kí ức đậm sâu, giờ đã bạc màu
Đành kết thúc cho vơi đi nỗi buồn về sau!
Hãy quên nhau đi, mình đã cho nhau được gì
Chỉ là những phút đi bên cạnh nhau, như người ngủ mê
Hãy quên nhau đi, dù cố yêu thêm được gì
Tình yêu đôi ta phải cần lí trí, đừng hoài nghi theo nhịp đập con tim
Hãy quên nhau đi...!
Còn đâu những lời hứa, hẹn hò dưới mưa
Nơi con phố lưa thưa, khi nắng cuối mùa
Làm sao để xóa đi những thói quen của ngày xưa
Nhìn vào đôi mắt của nhau, đừng lừa dối nhau
Miền kí ức đậm sâu, giờ đã bạc màu
Đành kết thúc cho vơi đi nỗi buồn về sau
Hãy quên nhau đi, mình đã cho nhau được gì
Chỉ là những phút đi bên cạnh nhau, như người ngủ mê
Hãy quên nhau đi, dù cố yêu thêm được gì
Tình yêu đôi ta phải cần lí trí, đừng hoài nghi theo nhịp đập con tim
Hãy quên nhau đi, mình đã cho nhau được gì
Chỉ là những phút đi bên cạnh nhau, như người ngủ mê
Hãy quên nhau đi, dù cố yêu thêm được gì
Tình yêu đôi ta phải cần lí trí, đừng hoài nghi theo nhịp đập con tim
Hãy quên nhau đi...!', '2021', '04:17')
insert into Song values (N'Có Một Người Sẽ Đến', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.mp3', N'Vy Vy', N'pack://siteoforigin:,,,/Resource/Songs/CoMotNguoiSeDen/CoMotNguoiSeDen.jpg', Null, N'Có những thước phim một thời tuổi trẻ
Những thanh âm dài cười vui một vài
Nhìn lại tàn phai những sớm đông sang
Quẩn quanh lời yêu đến trong muộn màng
Có những thước phim một thời tuổi trẻ
Phút giây nhìn nhau thấu tâm can qua những ngày cô đơn
Chẳng thể cất lời vì biết mai này đổi dời
Gửi ta ngày hôm qua xanh thắm bầu trời lời ca riêng dành cho nhau
Nhắc nhau miền an yên tháng năm êm đềm ở đó
Gửi ta ngày hôm nay dẫu xác xơ nhiều
Vẫn tin tình yêu có trên đời
Có một người sẽ đến trong một ngày bất ngờ
Có những thước phim một thời tuổi trẻ
Những thanh âm dài cười vui một vài
Nhìn lại tàn phai những sớm đông sang
Quẩn quanh lời yêu đến trong muộn màng
Có những thước phim một thời tuổi trẻ
Phút giây nhìn nhau thấu tâm can qua những ngày cô đơn
Chẳng thể cất lời vì biết mai này đổi dời
Gửi ta ngày hôm qua xanh thắm bầu trời lời ca riêng dành cho nhau
Nhắc nhau miền an yên tháng năm êm đềm ở đó
Gửi ta ngày hôm nay dẫu xác xơ nhiều
Vẫn tin tình yêu có trên đời
Có một người sẽ đến trong một ngày bất ngờ
Gửi ta ngày hôm qua xanh thắm bầu trời lời ca riêng dành cho nhau
Nhắc nhau miền an yên tháng năm êm đềm ở đó
Gửi ta ngày hôm nay dẫu xác xơ nhiều
Vẫn tin tình yêu có trên đời
Có một người sẽ đến trong một ngày bất ngờ
Có một người sẽ đến trong một ngày bất ngờ', '2020', '04:40')
insert into Song values (N'Con Bướm Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/ConBuomXuan-Remix/ConBuomXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/ConBuomXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Con bướm xinh con bướm xinh con bướm đa tình
Đùa vui với lũ hoa bao hoa mai lan đang hòa mình
Con én bay con én bay con én la đà
Tựa bầy tiên nữ trong cung nhạc tình cha cha cha
Xuân ngất ngây xuân ngất ngây xuân có hương hoa
Nàng xuân đến với bao nhiêu say mê yêu đương đậm đà
Tia nắng mai tia nắng mai tia nắng chan hòa
Bầy lộc non biếc xanh trên cành thành cha cha cha
Gió phất phơ rơi nhẹ làm rơi cánh hồng đào
Ríu rít chim non chuyền cành cây đó ồn ào
Nàng ngồi hong tóc bên hiên nhà
Chàng nhìn mây trắng bay xa mờ
Tuyệt vời trong bức tranh xuân nhạc tình cha cha cha
Em ước mơ em ước mơ em ước mơ không
Tuổi xuân má thắm đôi môi em xinh duyên như nụ hồng
Em ước mơ em ước mơ em ước mơ gì
Một trời xuân có chim ca vang mừng em vu quy
Con bướm xinh con bướm xinh con bướm đa tình
Đùa vui với lũ hoa bao hoa mai lan đang hòa mình
Con én bay con én bay con én la đà
Tựa bầy tiên nữ trong cung nhạc tình cha cha cha
Xuân ngất ngây xuân ngất ngây xuân có hương hoa
Nàng xuân đến với bao nhiêu say mê yêu đương đậm đà
Tia nắng mai tia nắng mai tia nắng chan hòa
Bầy lộc non biếc xanh trên cành thành cha cha cha
Gió phất phơ ru nhẹ làm rơi cánh hồng đào
Ríu rít chim non chuyền cành cây đó ồn ào
Nàng ngồi hong tóc bên hiên nhà
Chàng nhìn mây trắng bay xa mờ
Tuyệt vời trong bức tranh xuân nhạc tình cha cha cha
Em ước mơ em ước mơ em ước mơ không
Tuổi xuân má thắm đôi môi em xinh duyên như nụ hồng
Em ước mơ em ước mơ em ước mơ gì
Một trời xuân có chim ca vang mừng em vu quy
Gió phất phơ rơi nhẹ làm rơi cánh hồng đào
Ríu rít chim non chuyền cành cây đó ồn ào
Nàng ngồi hong tóc bên hiên nhà
Chàng nhìn mây trắng bay xa mờ
Tuyệt vời trong bức tranh xuân nhạc tình cha cha cha
Em ước mơ em ước mơ em ước mơ không
Tuổi xuân má thắm đôi môi em xinh duyên như nụ hồng
Em ước mơ em ước mơ em ước mơ gì
Một trời xuân có chim ca vang mừng em vu quy
Nàng ngồi hong tóc bên hiên nhà
Chàng nhìn mây trắng bay xa mờ
Tuyệt vời trong bức tranh xuân nhạc tình cha cha cha
' , '2022', '03:25')
insert into Song values (N'Có Người', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.mp3', N'Vu Cat Tuong', N'pack://siteoforigin:,,,/Resource/Songs/CoNguoi/CoNguoi.jpg', Null, N'Chiều nay có người
Hẹn anh với nụ cười tươi
Chiều nay có người
Dạy anh cách làm mặt vui
Dường như anh cũng đã quen rồi
Ngày và đêm chỉ công việc thôi
Người chợt đến như ánh mặt trời
Xoa dịu đi vết thương
Có người nói anh xấu thế nào
Khi nhìn anh ăn lúc chưa no
Có người nói anh khó thế nào
Khi nhìn gương mặt anh đắn đo
Có người nói anh ấm thế nào
Khi ùa đến cuộn trong cánh tay anh
Có người cho anh biết thế nào
Là dành một đời để yêu một người
Giờ một mình một trời nơi xa
Buồn vì để lại đôi ta
Vẫn cẩn thận để dành tất cả
Niềm vui niềm thương dù anh phải đi xa
Từng hạt mưa như xé mây trời
Ngồi lặng im nén lòng tả tơi
Chiều nay không còn những mong đợi
Anh chỉ thấy rối bời
Có người quen lại với một mình
Cô độc giữa thành phố lung linh
Có người xem lại những khung hình
Ngỡ mình trong hạnh phúc trắng tinh
Có người đã quên anh xấu thế nào
Khi bình yên ngủ lúc bên nhau
Có người đã quên hết kỷ niệm
Để lại một người với tiếng mưa đêm
Không một ai thêm nữa
Sẽ không thể yêu thêm nữa
Khi tất cả tan vào vầng trăng sáng
Hạnh phúc giờ biến thành những ngổn ngang
Có người nói anh xấu thế nào
Khi nhìn anh ăn lúc chưa no
Có người nói anh khó thế nào
Khi nhìn gương mặt anh đắn đo
Có người nói anh ấm thế nào
Khi ùa đến cuộn trong cánh tay anh
Có người đã quên hết kỷ niệm
Để lại một người với tiếng mưa đêm', '2019', '04:00')
insert into Song values (N'Dấu Mưa', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.mp3', N'Trung Quân', N'pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.jpg', Null, N'Một cơn mưa đi qua
Để lại những ký ức anh và em
Tìm em trong cơn mưa
Anh thẩn thờ lần theo những dấu vết đánh rơi
Tưởng như rất gần mà ngờ đâu đã rất xa
Vụt mất theo cơn mưa ngày qua
Tưởng như rất lạ mà ngỡ đâu sao quá quen
Là lúc em ngang đời ta
Chiều cuối con đường mình nhìn ngắm hoàng hôn
Ẩn sâu trong tiếng tí tách rơi
Chờ mãi nơi này một cảm giác quá lạ thường
Cảm giác cho anh nhận ra
I love you I love you so
Khoảnh khắc cho anh nhận ra
I love you I love you so
Khoảnh khắc cho anh gần em
Một cơn mưa đi qua để lại
Những ký ức anh và em
Tìm em trong cơn mưa anh thẩn thờ
Lần theo những dấu vết đánh rơi
Tưởng như rất gần mà ngờ đâu đã rất xa (đã rất xa)
Vụt mất theo cơn mưa ngày qua
Tưởng như rất lạ mà ngờ đâu sao quá quen (quá quen)
Là lúc em ngang đời ta
Chiều cuối con đường mình nhìn ngắm hoàng hôn
Ẩn sâu trong tiếng tí tách rơi
Chờ mãi nơi này một cảm giác quá lạ thường
Cảm giác cho anh nhận ra
I love you I love you so (I love you love you)
Khoảnh khắc cho anh nhận ra
I love you I love you so (I love you love you)
Khoảnh khắc cho anh gần em
Chiều cuối con đường mình nhìn ngắm hoàng hôn
Ẩn sâu trong tiếng tí tách rơi
Chờ mãi nơi này một cảm giác quá lạ thường (chờ mãi)
Cảm giác cho anh nhận ra
I love you (I love you) I love you so (I love you so)
Khoảnh khắc cho anh nhận ra
I love you (I love you) I love you so (I love you so)
Khoảnh khắc cho anh gần em', '2013', '04:20')
insert into Song values (N'Để Dành', N'pack://siteoforigin:,,,/Resource/Songs/DeDanh/DeDanh.mp3', N'Thái Trinh', N'pack://siteoforigin:,,,/Resource/Songs/DeDanh/TrinhAcoustic.jpg', Null, N'Một chút hương thơm còn lại
Một ánh mắt quen để lại
Một lối đi trên con hè nhỏ
Và mưa nắng hai mùa vẫn qua
Một tiếng rao đêm ngần ngại
Một chiếc môi hôn vụng dại
Và bước chân trên con hè nhỏ
Cùng tiếng gió qua cửa trú đông
Những ước mong đã đưa chúng ta xa hai bờ
Đã mang hết đi những điều thân thuộc
Chỉ còn ước mơ để dành ở đây
Và anh vẫn luôn mong tìm lại
Vòng tay ấm khi mùa đông bắc về
Những đêm nằm nghe run run gió ùa
Và anh sẽ mãi luôn kể lại
Nụ hôn khẽ khi mùa xuân bắt đầu
Những gì đã qua anh sẽ để dành suốt đời
Và anh vẫn luôn mong tìm lại
Vòng tay ấm khi mùa đông bắc về
Những đêm nằm nghe run run gió ùa
Và anh sẽ mãi luôn kể lại
Nụ hôn khẽ khi mùa xuân bắt đầu
Những gì đã qua anh sẽ để dành suốt đời
Một chút hương thơm còn lại
Một ánh mắt quen để lại
Một lối đi trên con hè nhỏ
Và mưa nắng hai mùa vẫn qua
Một tiếng rao đêm ngần ngại
Một chiếc môi hôn vụng dại
Và bước chân trên con hè nhỏ
Cùng tiếng gió qua cửa trú đông
Những ước mong đã đưa chúng ta xa hai bờ
Đã mang hết đi những điều thân thuộc
Chỉ còn ước mơ để dành ở đây
Và anh vẫn luôn mong tìm lại
Vòng tay ấm khi mùa đông bắc về
Những đêm nằm nghe run run gió ùa
Và anh sẽ mãi luôn kể lại
Nụ hôn khẽ khi mùa xuân bắt đầu
Những gì đã qua anh sẽ để dành suốt đời
Những gì đã qua anh sẽ để dành suốt đời
', '2022', '04:53')
insert into Song values (N'Đi Để Trở Về', N'pack://siteoforigin:,,,/Resource/Songs/DiDeTroVe/DiDeTroVe.mp3', N'SOOBIN HOÀNG SƠN', N'pack://siteoforigin:,,,/Resource/Songs/DiDeTroVe/DiDeTroVe.jpg', Null, N'Tôi đang ở một nơi rất xa
Nơi không có khói bụi thành phố
Ở một nơi đẹp như mơ
Trên cao êm êm mây trắng bay
Lặng nhìn biển rộng sóng vỗ-ô
Cuộc đời tôi là những chuyến đi dài
Vượt suối thác, vượt núi dốc, dù chênh vênh, có xá gì
Có biết bao thứ tươi đẹp vẫn cứ ở đó đang chờ tôi
Người xung quanh ở nơi đây thật dễ mến, dẫu mới gặp
Ánh mắt lấp lánh hiền hoà chào tôi, chào người bạn mới
Từng chặng đường dài mà ta qua
Giờ ngồi một mình lại thấy nhớ
Ngày ngày mặt trời rạng ngời vươn cao lên từ trên mái nhà
Từng chặng đường dài mà ta qua
Đều để lại kỷ niệm quý giá
Để lại một điều rằng càng đi xa ta càng thêm nhớ nhà
Đi thật xa để trở về
Đi thật xa để trở về
Có một nơi để trở về đi, đi để trở về
Tôi đang ở một nơi rất xa
Nơi không có khói bụi thành phố
Ở một nơi đẹp như mơ
Trên cao êm êm mây trắng bay
Lặng nhìn biển rộng sóng vỗ
Cuộc đời tôi là những chuyến đi dài
Vượt suối thác, vượt núi dốc, dù chênh vênh, có xá gì
Có biết bao thứ tươi đẹp vẫn cứ ở đó đang chờ tôi
Người xung quanh ở nơi đây thật dễ mến, dẫu mới gặp
Ánh mắt lấp lánh hiền hoà chào tôi, chào người bạn mới
Từng chặng đường dài mà ta qua
Giờ ngồi một mình lại thấy nhớ
Ngày ngày mặt trời rạng ngời vươn cao lên từ trên mái nhà
Từng chặng đường dài mà ta qua
Đều để lại kỷ niệm quý giá
Để lại một điều rằng càng đi xa ta càng thêm nhớ nhà
Đi thật xa để trở về
Đi thật xa để trở về
Có một nơi để trở về đi, đi để trở về
Cuộc đời thật đẹp khi được đi
Muôn nơi xa xôi rộng lớn
Nhưng ta vẫn có nơi để trở về sau mỗi chuyến đi
Điều kỳ diệu là con người ta
Đi xa hơn để trưởng thành hơn
Không quên mang theo bên cạnh hành trang nỗi nhớ gia đình
Từng chặng đường dài mà ta qua
Giờ ngồi một mình lại thấy nhớ
Ngày ngày mặt trời rạng ngời vươn cao lên từ trên mái nhà
Từng chặng đường dài mà ta qua
Đều để lại kỷ niệm quý giá
Để lại một điều rằng càng đi xa ta càng thêm nhớ nhà
Đi thật xa để trở về
Đi thật xa để trở về
Có một nơi để trở về đi, đi để trở về', '2017', '03:50')
insert into Song values (N'Điệp Khúc Mùa Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/DiepKhucMuaXuan-Remix/DiepKhucMuaXuan-Remix.mp3', N'Trúc Uyên', N'pack://siteoforigin:,,,/Resource/Songs/DiepKhucMuaXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Nắng chiếu lung linh muôn hoa vàng
Chở tia nắng về trong ánh mùa sang
Gió mãi mơn man trên đoá môi hồng
Người em yêu tìm quên trong cuộc sống
Bướm vẫn tung tăng bay la đà
Mặt trời mây buồn nhẹ trôi thiết tha
Ánh mắt mơ trông nơi xa vời
Chờ mùa xuân đến đem nguồn vui
Rừng xuân ơi xin lặng gió heo may
Để chim muông quay về với muôn cây
Tình xuân ơi xin dệt mối yêu thương
Từ bao nhiêu năm tình sầu muôn hướng
Này gió hãy cuốn từng lá rơi
Và nắng hãy chiếu màu thắm tươi
Cùng những tiếng hát điệu nhạc dâng chơi vơi
Dìu hồn ta say trong biển khơi
Nắng chiếu lung linh muôn hoa vàng
Chở tia nắng về trong ánh mùa sang
Gió mãi mơn man trên đoá môi hồng
Người em yêu tìm quên trong cuộc sống
Bướm vẫn tung tăng bay la đà
Mặc trời mây buồn nhẹ trôi thiết tha
Ánh mắt mơ trông nơi xa vời
Chờ mùa xuân đến đem nguồn vui
La la la la la la la la
La la la la la la la
La la la la la la la la la la la
Nắng chiếu lung linh muôn hoa vàng
Chở tia nắng về trong ánh mùa sang
Gió mãi mơn man trên đoá môi hồng
Người em yêu tìm quên trong cuộc sống
Bướm vẫn tung tăng bay la đà
Mặc trời mây buồn nhẹ trôi thiết tha
Ánh mắt mơ trông nơi xa vời
Chờ mùa xuân đến đem nguồn vui
Rừng xuân ơi xin lặng gió heo may
Để chim muông quay về với muôn cây
Tình xuân ơi xin dệt mối yêu thương
Từ bao nhiêu năm tình sầu muôn hướng
Này gió hãy cuốn từng lá rơi
Và nắng hãy chiếu màu thắm tươi
Cùng những tiếng hát điệu nhạc dâng chơi vơi
Dìu hồn ta say trong biển khơi
La la la la la la la
La la la la la la la la
La la la la la la la la
La la la la la la la la
Bướm vẫn tung tăng bay la đà
Mặc trời mây buồn nhẹ trôi thiết tha
Ánh mắt mơ trông nơi xa vời
Chờ mùa xuân đến đem nguồn vui
Ánh mắt mơ trông nơi xa vời
Chờ mùa xuân đến đem nguồn vui
Ánh mắt mơ trông nơi xa vời
Chờ mùa xuân đến đem nguồn vui
La la la la la la la la
La la la la la la la
La la la la la la la la la la la' , '2022', '03:13')
insert into Song values (N'Đi Qua Mùa Hạ', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.mp3', N'Thái Đinh', N'pack://siteoforigin:,,,/Resource/Songs/DiQuaMuaHa/DiQuaMuaHa.jpg', Null, N'Mùa hạ đang trôi qua
Và em cũng đi xa
Về đâu tia nắng mong manh lướt qua thờ ơ
Để trái tim vụn vỡ
Mùa hạ đang phôi pha
Tình ta cũng phai nhòa
Còn đâu những giấc mơ ấm êm những ngày thơ
Để trái tim trở về
Chuyến xe đưa mình đến đâu
Lạc mất nhau nép trong tim một nỗi đau
Giấc mơ âm thầm đã lâu
Trôi theo ngày yêu dấu
Khép đôi mi buồn khắc sâu
Lặng phía sau những con đường ta hôm qua cứ phôi phai nhạt màu
Bàn chân cũng thôi bước giữa ngày buồn trôi rất mau
Sao em lại không nói sao anh lại không nói
Để mùa hạ chói chang muộn màng chiều lang thang
Sao bao tia nắng không chiếu trong lòng
Để nỗi buồn cứ lặng thầm nơi xa xăm
Sao em lại không nói sao ta lại không nói
Để mùa hạ trôi miên man qua từng đêm vắng
Làm sao cho mưa thôi rơi
Để mình ta đơn côi bước qua mùa hạ
Huh huh huh huh
Huh huh huh huh
Chuyến xe đưa mình đến đâu
Lạc mất nhau nép trong tim một nỗi đau (nỗi đau)
Giấc mơ âm thầm đã lâu
Trôi theo ngày yêu dấu (trôi theo ngày yêu dấu)
Khép đôi mi buồn khắc sâu
Lặng phía sau những con đường ta hôm qua cứ phôi phai nhạt màu
Bàn chân cũng thôi bước giữa ngày buồn trôi rất mau
Sao em lại không nói sao anh lại không nói
Để mùa hạ chói chang muộn màng chiều lang thang
Sao bao tia nắng không chiếu trong lòng
Để nỗi buồn cứ lặng thầm nơi xa xăm
Sao em lại không nói sao ta lại không nói
Để mùa hạ trôi miên man qua từng đêm vắng
Làm sao cho mưa thôi rơi
Để mình ta đơn côi bước qua mùa hạ
Sao em lại không nói sao ta lại không nói
Để mùa hạ trôi miên man qua từng đêm vắng
Làm sao cho mưa thôi rơi để mình ta thôi đơn côi
Bờ môi thôi run lên với bao niềm nhớ woh
Sao em lại không nói sao anh lại không nói
Để mùa hạ chói chang muộn màng chiều lang thang (chói chang)
Sao bao tia nắng không chiếu trong lòng
Để nỗi buồn cứ lặng thầm nơi xa xăm
Sao em lại không nói sao ta lại không nói
Để mùa hạ trôi miên man qua từng đêm vắng
Làm sao cho mưa thôi rơi
Để mình ta đơn côi bước qua mùa hạ
Làm sao cho mưa thôi rơi
Để mình ta đơn côi bước qua mùa hạ', '2018', '04:43')
insert into Song values (N'Dịu Dàng Sắc Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/DiuDangSacXuan-Remix/DiuDangSacXuan-Remix.mp3', N'Trúc Uyên', N'pack://siteoforigin:,,,/Resource/Songs/DiuDangSacXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Nắng xuân ấm thơm môi hồng
Gió xuân đến bên em ngồi
Cùng mùa xuân em hát câu tình ca
Ðoá cúc trắng bên hiên nhà
Ngỡ như dáng ai đang về
Ngọt ngào hương xuân thắm trên bờ môi
Nhịp nhàng đàn chim én bay ô kìa mùa về bao đắm say
Một mùa xuân bao thắm tươi quê hương với bao niềm vui
Rộn ràng đàn em bé thơ tưng bừng một mùa xuân mới sang
Dịu dàng bao hương sắc xuân hát cùng em khúc tình ca
Cánh mai thắm tươi xuân nồng
Ấm đôi má em thêm hồng
Cùng mùa xuân em đến giữa đời vui
Tiếng chim hót vui cho đời
Tiếng em hát thêm yêu người
Ðẹp mùa xuân đất nước trong lòng tôi
Nắng xuân ấm thơm môi hồng
Gió xuân đến bên em ngồi
Cùng mùa xuân em hát câu tình ca
Ðoá cúc trắng bên hiên nhà
Ngỡ như dáng ai đang về
Ngọt ngào hương xuân thắm trên bờ môi
Nhịp nhàng đàn chim én bay ô kìa mùa về bao đắm say
Một mùa xuân bao thắm tươi quê hương với bao niềm vui
Rộn ràng đàn em bé thơ tưng bừng một mùa xuân mới sang
Dịu dàng bao hương sắc xuân hát cùng em khúc tình ca
Cánh mai thắm tươi xuân nồng
Ấm đôi má em thêm hồng
Cùng mùa xuân em đến giữa đời vui
Tiếng chim hót vui cho đời
Tiếng em hát thêm yêu người
Ðẹp mùa xuân đất nước trong lòng tôi
Tiếng chim hót vui cho đời
Tiếng em hát thêm yêu người
Ðẹp mùa xuân đất nước trong lòng tôi' , '2022', '02:51')
insert into Song values (N'Đời Lạ Lắm À Nghen', N'pack://siteoforigin:,,,/Resource/Songs/DoiLaLamANghen/DoiLaLamANghen.mp3', N'Dế Choắt', N'pack://siteoforigin:,,,/Resource/Songs/DoiLaLamANghen/DoiLaLamANghen.jpg', Null, N'Đời lạ lắm à nghen (sao nà?)
Đừng bon chen rùm ben coi chừng ăn dép là đen
Đừng tùm lum từa lưa (wow)
Đừng lúc nắng rồi mưa (ò hó)
Đừng quan tâm thị phi đôi khi ta biết dư thừa
Tầm này là sống độc thân tư tưởng độc lập là sống tự do
Yêu làm gì để nhiều suy nghĩ yêu bản thân mình là phải tự lo
Sống ở đời mà quá tầm thường, chắc có lẽ không ai dòm ngó
Mà nếu muốn có bạn đời trung thành thì cần học cách nuôi một con chó
Khi có tiền đi đây đi đó, đi để thấy trái đất này to
Đi để thấy rằng mình bé nhỏ giữa cả tỉ người vứt hết phiền lo
Học đạo lí để học làm người chứ không phải là phán xét người ta
Có những điều mà mình chưa biết nếu không tiếp xúc một vài người lạ
Bạn là bạn, tui là tui, hổng chơi được thì bo xì bo
Hổng chơi được mà đi nói xấu, chắc cũng bởi vì bạn không bằng tui
Nói như vậy có nhiều đứa nhột, nhột thì nhột mình nhây thì nhây
Người thực tế là người sống thật, một là một mà hai là hai (dô nà)
Đời lạ lắm à nghen (sao nà?)
Đừng bon chen rùm ben coi chừng ăn dép là đen
Đừng tùm lum từa lưa
Đừng lúc nắng rồi mưa
Đừng quan tâm thị phi đôi khi ta biết dư thừa
Đời này vui à nghen
Đời lạ lắm à nghen
Đừng bon chen rùm ben coi chừng ăn dép là đen
Đừng tùm lum từa lưa
Đừng lúc nắng rồi mưa
Đừng quan tâm thị phi đôi khi ta biết dư thừa
Uống đi cho say quýnh bi cho bay tối nay đi overnight
Có cô em xinh dáng như minh tinh mấy anh tưng tưng lên ngay
Nếu như mai đây tui rap không hay như lời họ nói tui không quan tâm
Sống cho đam mê chứ không ganh đua ai hờn ai dỗi không quan tâm
Thích hát thích ca nên hay bị bà má la
Nhạc của tui vẫn đậm cái thói sự đời nè há ba
Thôi cứ vui lên đi buồn làm chi tui lâu la
Đen Vâu bảo, "Dối lòng sẽ bị quạ bắt diều hâu tha!"
Nghe tui rap là trúng tim
Mấy đứa triết lí thừa sống như l- mà nó diễn tuồng thì đúng phim
Cuộc đời này có là bao
Quan trọng mình sống làm sao
Nụ cười bằng mười thang thuốc bổ
Mấy thằng nổ nổ thì cứ trừ hao nó ra đi nào
Sống cho ngày mai (phải)
Sống cho riêng mình (đúng rồi)
Sống cho tự do nên phải sống cho thân tình
Sống cho niềm vui
Sống cho gia đình
Sống cho bình yên
Sống nhưng không quên mình
Đời này vui à nghen
Đời lạ lắm à nghen
Đừng bon chen rùm ben coi chừng ăn dép là đen
Đừng tùm lum từa lưa
Đừng lúc nắng rồi mưa
Đừng quan tâm thị phi đôi khi ta biết chữ
Đời này vui à nghen
Đời lạ lắm à nghen (ya)
Đừng bon chen rùm ben coi chừng ăn dép là đen (thế sao)
Đừng tùm lum từa lưa (sao nào)
Đừng lúc nắng rồi mưa (ya)
Đừng quan tâm thị phi đôi khi ta biết dư thừa', '2018', '03:08')
insert into Song values (N'Đôi Lời', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/DoiLoi/DoiLoi.jpg', N'Tình Ca Hoàng Dũng',N'Từ một phút tình cờ anh biết rằng mình mong nhớ
Và từ một phút tình cờ anh thấy nhẹ nhàng bất ngờ
Ta đã từng đi đến tận cùng thế giới tìm một ai đó
Cho đến phút giây ta vô tình biết bằng ta tìm thấy nhau
Chẳng cần quá vội vàng tìm kiếm nhiều điều xa xôi
Vì tình yêu đến nhẹ nhàng như chính nụ cười em rồi
Chẳng cần biết đường dài phía trước còn nhiều tăm tối
Anh sẽ hát lên bao câu tình ca vì yêu em thế thôi
Thật lòng anh muốn và rất muốn nhẹ nhàng giữ em cho riêng mình
Để nỗi nhớ vu vơ sẽ không còn là cơn mơ
Thật lòng anh muốn và luôn muốn là người nắm tay em suốt đời
Vì đã trót yêu thương có ai nào muốn xa rời
Vì đã trót yêu thương trái tim chẳng tiếc đôi lời
Uhm uhm uhm uhm
Này anh biết mà sẽ có lúc đường dài trống rỗng
Mịt mờ tháng ngày chẳng tha thiết điều gì trong lòng
Thì gần lại bên anh chút nữa vì ta chẳng có quá nhiều ngày để sống
Để cho mỗi phút giây ta gần nhau ngọt ngào những bão giông
Thật lòng anh muốn và rất muốn nhẹ nhàng giữ em cho riêng mình
Để nỗi nhớ vu vơ sẽ không còn là cơn mơ
Thật lòng anh muốn và luôn muốn là người nắm tay em suốt đời
Vì đã trót yêu thương có ai nào muốn xa rời
Vì đã trót yêu thương trái tim chẳng tiếc đôi lời
Thật lòng anh muốn và rất muốn nhẹ nhàng giữ em cho riêng mình
Để nỗi nhớ vu vơ sẽ không còn là cơn mơ hoh
Thật lòng anh muốn và luôn muốn là người nắm tay em suốt đời (oh)
Vì đã trót yêu thương có ai nào muốn xa rời (có ai nào muốn xa rời)
Vì đã trót yêu thương có ai nào muốn xa rời
Vì đã trót yêu thương trái tim chẳng tiếc đôi lời', '2018', '03:52')
insert into Song values (N'Đón Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/DonXuan-Remix/DonXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/DonXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Xuân đã đến rồi, gieo rắc ngàn hồn hoa xuống đời
Vui trong bình minh, muôn loài chim hót vang mọi nơi
Đẹp trong tiếng cười, cho kiếp người tình thương đắm đuối
Nắng xuân đem vui với đời
Kìa trong vạt nắng (kìa trong vạt nắng)
Mạch xuân tràn dâng (mạch xuân tràn dâng)
Khóm hoa nhẹ rung, môi cười thẹn thùng cùng bao nguồn sống
Bướm say duyên lành
Thắm tô trời xanh
Đàn chim tung cánh hót vui đón mừng mùa nắng tươi lan
Ta nghe gió về, đang thiết tha như muôn tiếng đàn
Xuân đem niềm vui, cho ngày xanh không hoen lời than
Sầu thương xóa mờ, tình yêu đời càng thêm chan chứa
Khát khao xuân tươi thái hòa.
Cùng đón chúa xuân
Đang giáng xuống trần
Thế gian lắng nghe tình xuân nồng
Kiếp hoa hết phai đời hương phấn
Nào ai hững hờ
Xuân vẫn ngóng chờ
Tới đây nắm tay cùng ca múa
Hát lên đón xuân của tuổi thơ
Xuân đã đến rồi, gieo rắc ngàn hồn hoa xuống đời
Vui trong bình minh, muôn loài chim hót vang mọi nơi
Đẹp trong tiếng cười, cho kiếp người tình thương đắm đuối
Khát khao xuân tươi thái hòa
Cùng đón chúa xuân
Đang giáng xuống trần
Thế gian lắng nghe tình xuân nồng
Kiếp hoa hết phai đời hương phấn
Nào ai hững hờ
Xuân vẫn ngóng chờ
Tới đây nắm tay cùng ca múa
Hát lên đón xuân của tuổi thơ
Xuân đã đến rồi, gieo rắc ngàn hồn hoa xuống đời
Vui trong bình minh, muôn loài chim hót vang mọi nơi
Đẹp trong tiếng cười, cho kiếp người tình thương đắm đuối
Khát khao xuân tươi thái hòa' , '2022', '05:02')
insert into Song values (N'Đưa Nhau Đi Trốn', N'pack://siteoforigin:,,,/Resource/Songs/DuaNhauDiTron/DuaNhauDiTron.mp3', N'Đen Vâu, Linh Cáo', N'pack://siteoforigin:,,,/Resource/Songs/DuaNhauDiTron/DuaNhauDiTron.jpg', NULL, N'Thật lòng em mơ, mơ cùng anh đi đến tận cùng
Tận cùng chân mây, vượt núi cao hay biển sâu
Biết mấy là yêu cho vừa, giết mấy thời gian cho vừa
Khi yêu ta mơ về nhau
Để thấy lắm lúc lòng mình nhẹ nhiều khi
Muốn ném hết tất cả để mà đi
Một lần được sống như những đứa nhóc không nhà
Sớm thức dậy ở một nơi xa
Bố em hút rất nhiều thuốc
Mẹ em khóc mắt lệ nhoà
Bố anh thì đi lại còn mẹ anh gọi điện thoại đến từng nhà
Nhiều ngày rồi mình không về, không liên lạc được gì cả
Chỉ vỏn vẹn lại mảnh giấy, "đừng lo, đêm nay con đi chơi xa"
Em ơi đi trốn với anh
Mình đi đến nơi có biển bạc núi xanh
Chạy con xe, anh chở em tròng trành
Mình phóng tầm mắt ngắm chân trời mới toanh
Mình ngủ một giấc mà không cần báo thức
Giờ này mọi khi anh đang trong ca trực
Em thì đang lo ngày mai giảng đường
Ôi những thứ chán chường không tẹo nào háo hức
Mình rời thành phố chật chội náo nức
Nơi mà cả việc thở cũng làm ta lao lực
Mơ những con đường xa làm anh thấy rạo rực
Muốn đưa em đi trốn đến tận cùng trái đất
Anh chẳng cần biết là ngày nắng đẹp rạng ngời
Hay gió về, hay bão táp mưa rơi
Ngày mình đi với nhau ấy là ngày đẹp trời
Thì theo anh đi trốn em ơi
Thật lòng em mơ, mơ cùng anh đi đến tận cùng
Tận cùng chân mây, vượt núi cao hay biển sâu
Biết mấy là yêu cho vừa, giết mấy thời gian cho vừa
Khi yêu ta mơ về nhau (ta mơ về nhau em ơi)
Để thấy lắm lúc lòng mình nhẹ nhiều khi (lòng mình nhẹ nhiều khi)
Muốn ném hết tất cả để mà đi
Một lần được sống như những đứa nhóc không nhà
Sớm thức dậy ở một nơi xa
Em ơi anh chẳng muốn sống đời vẻ vang
Đời lên voi xuống chó, danh vọng hoặc bẽ bàng
Chỉ muốn êm ả với nhau qua ngày tháng
Hè xối gàu nước mát, lửa hồng khi đông sang
Nhưng ta càng lớn càng không có sức phòng thủ
Đời cuốn xô ta cả khi ta trốn trong phòng ngủ
Âu lo theo về dù ta đã khoá ba lần cửa
Và trốn đi, trốn đi không đời giết ta lần nữa
Em ơi đi trốn với nhau
Kệ vòng xe đó đưa mình đi tới đâu
Kệ cho nắng cháy, cho bụi phủ vai gầy
Kệ cơm kệ áo, kệ no đủ mai này
Sau lưng là bụi, trước mặt đường chân trời
Mình kệ những luật lệ mà mình thường vâng lời
Đời nói mình vô trách nhiệm, có vẻ không oan
Và ừ thì một lần mình là trẻ không ngoan
Anh chưa từng lên kế hoạch cho cuộc đời anh
Sẽ là mây đen kéo đến hay trời ngời xanh
Nhưng nếu em muốn thấy chân trời mới toanh
Thì em ơi đi trốn với anh
Nhiều hơn bầu không khí (nhiều hơn bầu không khí)
Bớt đi những mệt nhoài (bớt đi những mệt nhoài)
Cuộc đời đâu được mấy (cuộc đời đâu được mấy)
Bình yên những sớm mai
Em ơi đi trốn với anh
Mình đi đến nơi có biển bạc núi xanh
Chạy con xe, anh chở em tròng trành
Mình phóng tầm mắt ngắm chân trời mới toanh
Và sẽ là những bình mình không có tiếng chuông báo thức
Và tất cả điều đó làm anh thấy háo hức yeah
Tất cả điều đó làm anh thấy háo hức, Linh lên
Thật lòng em mơ, mơ cùng anh đi đến tận cùng
Tận cùng chân mây, vượt núi cao hay biển sâu
Biết mấy là yêu cho vừa, giết mấy thời gian cho vừa
Khi yêu ta mơ về nhau
Để thấy lắm lúc lòng mình nhẹ nhiều khi (lòng mình nhẹ nhiều khi)
Muốn ném hết tất cả để mà đi (vứt hết tất cả để mà đi)
Một lần được sống như những đứa nhóc không nhà
Sớm thức dậy ở một nơi xa (một lần nữa, một lần nữa, một lần nữa, một lần nữa)
Thật lòng em mơ, mơ cùng anh đi đến tận cùng
Tận cùng chân mây, vượt núi cao hay biển sâu
Biết mấy là yêu cho vừa, giết mấy thời gian cho vừa
Khi yêu ta mơ về nhau
Để thấy lắm lúc lòng mình nhẹ nhiều khi (lòng mình nhẹ nhiều khi)
Muốn ném hết tất cả để mà đi (vứt hết tất cả để mà đi)
Một lần được sống như những đứa nhóc không nhà
Sớm thức dậy ở một nơi xa', '2015', '04:00')
insert into Song values (N'Dù Cho Mai Về Sau (Acoustic Version)', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/DuChoMaiVeSau_AcousticVersion.mp3', N'buitruonglinh', N'pack://siteoforigin:,,,/Resource/Songs/DuChoMaiVeSau_AcousticVersion/ChoDuMaiVeSau.jpg', null, N'Bầu trời đêm không mây không sao
Trăng treo trên cao khi lòng anh vẫn nhớ nhung em nhiều
Anh làm sao có thể ngừng suy nghĩ đến đôi môi em dù chỉ một giây
Mặc cho ta đi bên nhau bao lâu
Em đâu hay anh cần bao câu nói anh yêu em
Chỉ để em sẽ một lần nhìn thấy trái tim anh đang rung động biết bao
Dù lời nói có là gió bay
Anh vẫn mong sau này chúng ta trở thành của nhau
Mệt thì cứ ngoái lại phía sau anh vẫn luôn đây mà
Dù thời gian không chịu đứng yên
Để cho chính anh không còn ngẩn ngơ cũng thôi mơ mộng
Thì anh vẫn luôn dành những câu ca trong lòng anh cho người mãi thôi
Dù cho mai về sau
Mình không bên cạnh nhau
Làm tim anh quặn đau
Anh trông ngóng bao nhiêu lâu
Dù vương vấn u sầu
Mùa thu có phai màu
Anh vẫn muốn yêu em
Dù cho muôn trùng phương
Còn bao nhiêu lời thương
Dù mênh mông đại dương
Phai đi sắc hương mơ màng
Anh vẫn yêu mình em thôi đấy
Em ơi đừng để tình anh dở dang
Rất nhiều câu trả lời chỉ để em nhớ được điều này nữa thôi
Anh vẫn luôn muốn ở cạnh em bất kể dù cho nhiều ngày nữa trôi
Hồi đầu giả vờ ngơ ngẩn một mình dưới tán lá cây mà ngắm trời
Ai biết quen được mấy tháng mới phát hiện em cũng khá nhây và lắm lời
Em thì vẫn đáng yêu trừ những lúc dở chứng cáu gắt mắng đủ điều
Đáng yêu từ cái dáng điệu dựa vào anh mỗi khi trời tắt nắng buổi chiều
Biết là làm dược sĩ nên khó tính hay nhắc nhắn nhủ nhiều
Như là ôm quả bom nổ chậm vì anh mà yêu em thì phải chắc chắn đủ liều
Cho thời gian đưa lối
Anh không mong điều gì xa xôi
Yêu chỉ mình em thôi khiến anh thức thao cứ mỗi đêm về
Em lại xinh như thế
Sao mà không làm cho anh mê đắm như trong giấc mơ
Khi lắng nghe tiếng yêu bấy lâu anh mong chờ
Em nhẹ ngân câu hát
Theo điệu đàn anh feel
Ta đi bên cạnh nhau bao nhiêu thế nhưng vẫn luôn nhớ em hơn nhiều
Anh mong dù mai này có giận thì mình cũng đừng có cãi lời nhau
Khi người anh thương chỉ luôn có một
Dù cho mai về sau (dù cho mãi về sau)
Mình không bên cạnh nhau
Làm tim anh quặn đau
Anh trông ngóng bao nhiêu lâu
Dù vương vấn u sầu
Mùa thu có phai màu
Anh vẫn muốn yêu em
Dù cho muôn trùng phương
Còn bao nhiêu lời thương
Dù mênh mông đại dương
Phai đi sắc hương mơ màng
Anh vẫn yêu mình em thôi đấy
Em ơi đừng để tình anh dở dang
Dù lời nói có là gió bay
Dù ngày tháng có còn đổi thay
Thì anh vẫn mãi muốn nắm đôi bàn tay dắt theo những hy vọng đong đầy
Dù cho mai về sau
Mình không bên cạnh nhau
Làm tim anh quặn đau
Anh trông ngóng bao nhiêu lâu
Dù vương vấn u sầu
Mùa thu có phai màu
Anh vẫn muốn yêu em
Dù cho muôn trùng phương
Còn bao nhiêu lời thương
Dù mênh mông đại dương
Phai đi sắc hương mơ màng
Anh vẫn yêu mình em thôi đấy
Yêu em mà chẳng một lời thở than', '2020', '03:33')
insert into Song values (N'Gác Lại Âu Lo (feat.MiuLe)', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo(feat.MiuLe).mp3', N'Da LAB, Miu Lê', N'pack://siteoforigin:,,,/Resource/Songs/GacLaiAuLo(feat.MiuLe)/GacLaiAuLo.jpg', null, N'Anh đi lạc trong sóng gió cuộc đời
Nào biết đâu sớm mai liệu bình yên có tới
Âu lo chạy theo những ánh sao đêm
Ngày cứ trôi chớp mắt thành phố đã sáng đèn
Ta cứ lặng lẽ chạy thật mau
Yêu thương chẳng nói kịp thành câu
Biết đâu liệu mai còn thấy nhau
Thức giấc để anh còn được thấy
Ánh mắt của em nhẹ nhìn anh
Đôi tay này sẽ không xa rời
Tạm gác hết những âu lo lại, cùng anh bước trên con đường
Ta sẽ không quay đầu để rồi phải tiếc nuối những chuyện cũ đã qua
Giữ trái tim luôn yên bình và quên hết những ưu phiền vấn vương
Cuộc đời này được bao lần nói yêu
Anh biết nơi để quay về, em biết nơi phải đi
Anh biết chỗ trú chân dọc đường để tránh cơn mưa hạ đến mỗi chiều
Ta biết trao nhau ân cần, biết mỗi khi vui buồn có nhau
Thời gian để ta trưởng thành với nhau
Nhảy với anh đến khi đôi chân rã rời
Hát anh nghe những câu ca từ ngày xưa cũ
Thì thầm khẽ anh nghe em vẫn còn bao niềm mơ
Ôm lấy anh nghe mưa đầu mùa ghé chơi
Một giây không thấy nhau như một đời cô đơn quá
Trời mù mây bỗng nhiên ngát xanh khi em khẽ cười
Một ngày anh biết hết nguyên do của những yên vui trong đời
Là ngày duyên kiếp kia đưa ta gần lại với nhau
Tạm gác hết những âu lo lại, cùng anh bước trên con đường
Ta sẽ không quay đầu để rồi phải tiếc nuối những chuyện cũ đã qua
Giữ trái tim luôn yên bình và quên hết những ưu phiền vấn vương
Cuộc đời này được bao lần nói yêu
Anh biết nơi để quay về, em biết nơi phải đi
Anh biết chỗ trú chân dọc đường để tránh cơn mưa hạ đến mỗi chiều
Ta biết trao nhau ân cần, biết mỗi khi vui buồn có nhau
Thời gian để ta trưởng thành với nhau
Bờ vai anh rộng đủ để che chở cho em
Was a boy now a man cho em
Từng đi lạc ở trong thế giới điên rồ ngoài kia
Và tình yêu em trao anh ngày ấy đã mang anh về bên em
Yêu em như a fat kid loves cake
Nhắm mắt cảm nhận tình yêu tan dịu ngọt trên môi khi em hôn môi anh đây
Không có happy ending
Mỗi bình minh ta biết thêm trang mới nối dài câu chuyện mình
Như trong mơ nơi xa kia xanh biếc xanh biếc
Thiên đàng bên em nơi đây anh biết anh biết
Bóng đêm đã qua yên bình
Có thêm chúng ta nghe lòng đàn từng câu ca
Cuộc đời này chẳng hề hối tiếc những tháng năm ta đi cùng nhau
Anh biết em luôn ở đó nơi anh thuộc về
Tạm gác hết những âu lo lại, cùng anh bước trên con đường
Ta sẽ không quay đầu để rồi phải tiếc nuối những chuyện cũ đã qua
Giữ trái tim luôn yên bình và quên hết những ưu phiền vấn vương
Cuộc đời này được bao lần nói yêu
Anh biết nơi để quay về, em biết nơi phải đi
Anh biết chỗ trú chân dọc đường để tránh cơn mưa hạ đến mỗi chiều
Ta biết trao nhau ân cần, biết mỗi khi vui buồn có nhau
Thời gian để ta trưởng thành với nhau', '2020', '04:42')
insert into Song values (N'Hai Triệu Năm', N'pack://siteoforigin:,,,/Resource/Songs/HaiTrieuNam/HaiTrieuNam.mp3', N'Đen Vâu, Biên', N'pack://siteoforigin:,,,/Resource/Songs/HaiTrieuNam/HaiTrieuNam.jpg', NULL, N'Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm (yah)
Xung quanh anh toàn là nước, ay
Cơ thể anh đang bị ướt, ay
Mênh mông toàn là nước, ay
Êm ái như chưa từng trước đây
Trăm ngàn con sóng xô (sóng xô, yah)
Anh lao vào trong biển cả vì em làm anh nóng khô (nóng khô, yah)
Anh ngâm mình trong làn nước để mặn mòi từ da dẻ (mặn mòi từ da dẻ)
Ta cần tình yêu vì tình yêu làm cho ta trẻ (Đúng rồi, yah)
Anh cũng cần em nhưng không biết em sao?
Anh không care lắm và anh quyết đem trao (hah)
Cho em hết nắng cho em hết đêm sao (yeah)
Nhìn mặt anh đi, em nghĩ anh tiếc em sao?
(Anh không có tiếc em đâu, yo)
Trăm ngàn con sóng từ mọi nơi mà đổ về
Và đây là cách mà anh đi tìm kiếm sự vỗ về
Em có quá nhiều bí mật, anh thì không cần gặng hỏi
Em sâu như là đại dương, anh thì không hề lặn giỏi
(Anh thì không hề lặn giỏi, baby, yo)
Anh soi mình vào gương cho bõ công lau
Thấy mặt thấy người sao thấy rõ trong nhau
Ánh mắt nụ cười kia không rõ nông sâu
Ta rồi sẽ là ai, một câu hỏi nhỏ trong đầu
Ta chỉ là hòn đất hay chỉ là cỏ bông lau
(Như là mấy gã em mới bỏ không lâu
Hay chỉ là đầu thuốc kia cháy đỏ không lâu?)
Yêu em kiểu nông dân, yêu em kiểu quê mùa
Yêu từ vụ đông xuân, đến hè thu thay mùa
Nhưng em thì trơn trượt như là con cá chuối
Muốn níu em trong tay, Khá Bảnh cũng khá đuối (Khá Bảnh cũng khá đuối)
Em giống hệt như biển cả, em có nhiều bí mật
Anh làm rất nhiều thứ, để đồng tiền trong ví chật
Người ta không quý con ong, mà người ta chỉ quý mật
Em hỏi anh nhạc sao hay anh gọi nó là bí thuật, yo
Em hỏi anh nhạc sao hay anh gọi nó là bí thuật, yo
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Nước đã hình thành trong hàng triệu năm (triệu năm)
Cát đã hình thành trong hàng triệu năm (triệu năm)
Biển cả hình thành trong hàng triệu năm (triệu năm)
Sao em làm anh buồn sau hàng triệu năm? (triệu năm)
Gặp em từ thể đơn bào rồi tiến hoá (tiến hoá)
Xa em từ khi thềm lục địa đầy biến hoá (biến hoá)
Muốn được ôm em qua kỷ Ju-ra
Hoá thạch cùng nhau trên những phiến đá (phá đá cùng nhau)
Rồi loài người tìm thấy lửa, anh lại tìm thấy em (yah)
Anh tưởng rằng mọi thứ sẽ được bùng cháy lên (yah)
Muốn được cùng em trồng rau bên hồ cá (hồ cá)
Nhưng tim em lúc đó đang là thời kì đồ đá (eh)
Anh đã tin vào em như tin vào thuyết nhật tâm
Như Ga-li-lê người ta nói anh thật hâm
Có lẽ Đác-win biết biển cả sẽ khô hơn
Nhưng anh tin ông ta không biết chúng ta đang tiến hoá để cô đơn
(Tiến hoá để cô đơn)
Và có lẽ Đác-win biết biển cả sẽ khô hơn
Nhưng anh tin ông ta không biết chúng ta đang tiến hoá để cô đơn
(Tiến hoá để cô đơn, yah, eh)
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm
Anh cô đơn giữa tinh không này
Muôn con sóng cuốn xô vào đây
Em cô đơn giữa mênh mông người
Và ta cô đơn đã hai triệu năm', '2019', '03:37')
insert into Song values (N'Hoa Cỏ Mùa Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/HoaCoMuaXuan-Remix/HoaCoMuaXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/HoaCoMuaXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Này là cỏ non rất mềm
Này là mùa xuân rất hiền
Này là hoa rất thơm
Này là giọt sương trĩu nặng
Hạt ngọc trên lá cỏ
Trên bông tầm xuân trước hiên nhà
Vì em đã biết anh chiều qua
Người em vẫn thấy khi nằm mơ
Người vừa hiền khô (vừa) dễ thương
Lại vừa đẹp trai nhất vùng
Đến theo cùng hoa cỏ của mùa xuân
Và mùa xuân biết em
Biết em đã mang một mối tình
U ơ u ơ... Biết em! Biết em...
Thế nên cỏ hoa thật là dễ thương' , '2022', '02:45')
insert into Song values (N'Hương Mùa Hè', N'pack://siteoforigin:,,,/Resource/Songs/HuongMuaHe/HuongMuaHe.mp3', N'Suni Hạ Linh, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/HuongMuaHe/HuongMuaHeEP.02.jpg', N'Hương Mùa Hè EP.02', N'Bánh xe đạp lăn trong chiều
Lăn theo chiều nắng tắt
Lá me phủ lên mặt đường
Hương mùa hè đâu đây
Tóc anh màu nâu hơi đậm
Đạp xe ngược chiều ah
Tự nhiên tim lại bối rối ghê
Thế thôi mà bỗng chốc lại yêu khi mùa hè thơm hương
Tình yêu ấy đến nhanh ơi là nhanh
Mùa hạ ấy của em với anh
Chẳng cần nói chỉ nhìn trời xanh
Cảm xúc ấy ngân vang xung quanh
Sẽ luôn thầm nhớ đến lúc bên người
Mùa hạ rực sáng như cách em cười
Dù biết sẽ cách xa nhau
Vẫn cứ rong chơi mãi
Rất lâu thật lâu đến mãi sau này
Nhìn về lúc ấy vẫn thấy nhớ thương
Vì đã sống hết phút giây
Với trái tim nồng say
Cơn mưa hôm nay rơi nhẹ nhàng tí tách trên đường
Làm em nhớ về ngày tháng đó khi ta chung hướng
Sáng sớm thức giấc nghe nhịp yêu thoáng bay trong sương
Chỉ muốn nói với anh biết bao lời thương thương
Dịu dàng như vạt nắng vuốt nhẹ lên trên tóc mây này
Là cơn gió mát thơm khẽ lướt qua đôi bàn tay ấy
Ngọt ngào như nụ hôn trao vội khi lá bay
Lưu hương trái cây
Sẽ luôn thầm nhớ đến lúc bên người
Mùa hạ rực sáng như cách em cười
Dù biết sẽ cách xa nhau
Vẫn cứ rong chơi mãi
Rất lâu thật lâu đến mãi sau này
Nhìn về lúc ấy vẫn thấy nhớ thương
Vì đã sống hết phút giây
Với trái tim nồng say
Làm sao ta biết khoảnh khắc có nhau
Mùa hè ấy vương hoài đến mai sau
Chỉ cần mình mãi được cùng bên nhau
Chẳng cần gì nữa đâu
Sẽ luôn thầm nhớ đến lúc bên người (nhớ đến lúc bên người)
Mùa hạ rực sáng như cách em cười (và mùa hạ sáng như cách em cười)
Dù biết sẽ cách xa nhau
Vẫn cứ rong chơi mãi
Rất lâu thật lâu đến mãi sau này
Nhìn về lúc ấy vẫn thấy nhớ thương
Vì đã sống hết phút giây
Với trái tim nồng say
La-la-la-la-la-la-la-la-la
La-la-la-la-la-la-la-la
La-la-la-la-la-la-la-la
Với trái tim nồng say', '2022', '04:30')
insert into Song values (N'Khi Cô Đơn Em Nhớ Đến Ai', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.mp3', N'GREY D, Suni Hạ Linh, Orange, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/KhiCoDonEmNhoDenAi/KhiCoDonEmNhoDenAi.jpg', N'Hương Mùa Hè EP.01', N'Từng giọt mưa long lanh xôn xao,
Để mộng mơ trong em bay cao,
Em đâu biết tình này dạt dào.
Phố xá thênh thang dáng ai về mơ lúc vai kề,
Vẫn thấy miên man từng đêm những cơn mê.

Nhẹ nhàng ru trong đêm thâu,
Lung linh cơn mưa ngâu,
Mưa gieo mãi làm gì giọt sầu.
Hỡi trái tim cô đơn lạc loài hãy nở nụ cười
Để thấy quanh em tình yêu vẫn có đôi…

ĐK:
Đặt bàn tay lên khóe môi chiếc hôn vẫn xa vời,
Đêm vẫn lạnh lùng dù qua phố đông.
Người yêu ơi em biết không? Vẫn say đắm trong lòng,
Dù thời gian trôi xa tình vẫn trao người thiết tha.

Khi em thấy cô đơn lòng em nhớ ai,
Anh mong bước chân em về trong nắng mai,
Đừng mang bóng đêm vô tình về vây kín trong tâm hồn,
Hãy nghe trái tim hát lời yêu thương.', '2022', '04:29')
insert into Song values (N'Khi Người Mình Yêu Khóc', N'pack://siteoforigin:,,,/Resource/Songs/KhiNguoiMinhYeuKhoc/KhiNguoiMinhYeuKhoc.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/KhiNguoiMinhYeuKhoc/KhiNguoiMinhYeuKhoc.jpg', NULL, N'Nước mắt em đang rơi trên những ngón tay
Nước mắt em mang nỗi nhớ nỗi đắng cay
Khi những yêu thương em trao cho ai tan thành mây như hôm nay
Bối rối tôi đang bên em tai lắng nghe
Muốn giữ đôi vai đang run trong tái tê
Muốn nói quên anh ta đi em nhé sao phải mãi nặng nề
Tình yêu xưa đến nay là cơn lốc xoay
Dù ai cũng hay mà trong phút giây
Chấp nhận hết niềm vui dịu êm lẫn đọa đầy
Và nơi tôi có khi điều đang giấu đi
Chẳng hề khác chi giọt nước trên mi em rơi
Khi người mình yêu khóc
Nắng khắp lối nhưng mây giăng kín lòng
Mất người em say đắm hẳn là quá khổ tâm
Khi người mình yêu khóc
Tôi cũng đớn đau tôi cũng đớn đau
Bao ngày dài trông ngóng chỉ còn biết hy vọng
Có những cơn mưa ngăn ta không thấy nhau
Có nỗi ưu tư riêng thôi ai biết đâu
Dẫu trái tim anh luôn yêu thương em như là mối tình đầu
Muốn nắng theo đôi chân em trên bước đi
Muốn thấy ai yêu em như anh nghĩ suy
Những yếu đuối mong qua nhanh mỗi khi không hạnh phúc điều gì
Tình yêu xưa đến nay là cơn lốc xoay
Dù ai cũng hay mà trong phút giây
Chấp nhận hết niềm vui dịu êm lẫn đọa đầy
Và nơi tôi có khi điều đang giấu đi
Chẳng hề khác chi giọt nước trên mi em rơi
Khi người mình yêu khóc
Nắng khắp lối nhưng mây giăng kín lòng
Mất người em say đắm hẳn là quá khổ tâm
Khi người mình yêu khóc
Tôi cũng đớn đau tôi cũng đớn đau
Bao ngày dài trông ngóng chỉ còn biết hy vọng
Tình yêu xưa đến nay là cơn lốc xoay
Dù ai cũng hay mà trong phút giây
Chấp nhận hết niềm vui dịu êm lẫn đọa đầy
Và nơi tôi có khi điều đang giấu đi
Chẳng hề khác chi giọt nước trên mi em rơi
Khi người mình yêu khóc
Nắng khắp lối nhưng mây giăng kín lòng
Mất người em say đắm hẳn là quá khổ tâm
Khi người mình yêu khóc
Tôi cũng đớn đau tôi cũng đớn đau
Bao ngày dài trông ngóng chỉ còn biết hy vọng.', '2016', '04:48')
insert into Song values (N'Khu Tao Sống', N'pack://siteoforigin:,,,/Resource/Songs/KhuTaoSong/KhuTaoSong.mp3', N'Wowy, Karik', N'pack://siteoforigin:,,,/Resource/Songs/KhuTaoSong/KhuTaoSong.jpg', NULL, N'Eh
Wowy
Karik
SGMNOF
Yeah
We from the hood
Xe chốt và pháo là những thứ mà em tao xăm mình
Xe tốt quần áo là những mà tao bao năm rình
Phường khóm công an là nơi tao đang đăng hình
Hẻm 48, ngay từ xưa đã không là yên bình
Sáng ngày hôm qua cũng giống như sáng của ngày hôm nay
Việc tao làm cũng như mọi ngày
Thằng Karik đã thấy
Back to my hood
Tao làm việc của tao
Khi tất cả trở thành vấn đề tao để dao làm việc của tao
Tao không gây hấn nhưng hễ ai đụng là đập
Và hàng nguội nằm trong túi làm cho quần thụng và thấp
Anh em khi gặp tao cầm bia cụng bay nắp
Còn tụi mày khi gặp tao vào 48 tao chấp
Trong khu tao sống khi mày thích tao có cocaine
Đây SG hood đến gây sự, đưa mày vô hàng
Ghét tao không khôn ngoan, nhà mày không an toàn
Bia cùng với rượu, như Khanh Nhỏ anh em tao ngang hàng
Trong khu tao sống khi mày thích tao có cocaine
Đây SG hood đến gây sự, đưa mày vô hàng
Ghét tao không khôn ngoan, nhà mày không an toàn
Bia cùng với rượu, như Khanh Nhỏ anh em tao ngang hàng
Đây là Tân Bình hẻm 68, Bùi Thị Xuân
Là khu nuôi đĩ điếm, quán nhậu và đủ loại thành phần
Khu này theo đạo thiên chúa nên dân không có thờ đại ca
Nhưng nếu mày gây chuyện trong đây tao thách mày mò được đường ra
Bước ra ngoài hẻm phải biết nhìn trước nhìn sau
Vì đây là khu ăn nhậu nên thường có vật lạ bay vô đầu
Già, trẻ, lớn, bé khu này vai vế bằng nhau
Nhưng cứ mở miệng solococo thì coi chừng đầu đổ máu
Tao sống ở đây như là công dân lương thiện
Thỉnh thoảng thiếu nợ thì tao vẫn phải đi làm "công nhân lắp giếng"
Giống như bao khu khác
Khu này nói chuyện bằng tiền
Có danh, có tiếng, có quyền, có miếng nhưng không có tiền thì biến
Trong khu tao sống khi mày thích tao có cocaine
Đây SG hood đến gây sự, đưa mày vô hàng
Ghét tao không khôn ngoan, nhà mày không an toàn
Bia cùng với rượu, như Khanh Nhỏ anh em tao ngang hàng
Trong khu tao sống khi mày thích tao có cocaine
Đây SG hood đến gây sự, đưa mày vô hàng
Ghét tao không khôn ngoan, nhà mày không an toàn
Bia cùng với rượu, như Khanh Nhỏ anh em tao ngang hàng
"Eh"
"Eh what? Mother fucker"
"How about popo man"
"Popo like shit, mother fucker"
"So..."
"So what?"
"How about your hood man"
Like shit!
Nơi đây không có đèn và tao được dạy từ nhỏ là đi chơi không có hèn
Nếu như gặp được tao, mày bỏ chạy làm con chó
Nhưng làm sao để đứng lại khi bản lĩnh mày không có?
Nói cho tao nghe khu mày sống ra sao
Khi mày gặp mặt kẻ địch liệu mày có phóng ra dao?
Tụi mày sống có cho nhau, hay mày muốn chơi tao?
Cứ vào 48 cho mày biết tao sống ra sao, ow
Mày không như tao, tao không giống như mày
Anh em bị chém tao đứng lại còn mày lo bỏ chạy
Gặp ăn cướp tao rút dao còn mày van xin quỳ lạy
Nói chung tao là thằng liều mạng còn mày là thằng nhát cáy
Tao biết khi nói ra thì đéo có thằng nào tin
Vì trong mắt của tụi mày ngoài đời tao chỉ là thằng thư sinh
Đeo mắt kiếng, mặt ngoài hiền đặc biệt không biết kiếm chuyện
Vậy mày cứ thử đụng đi, coi ai té trước biết liền
Trong khu tao sống khi mày thích tao có cocaine
Đây SG hood đến gây sự, đưa mày vô hàng
Ghét tao không khôn ngoan, nhà mày không an toàn
Bia cùng với rượu, như Khanh Nhỏ anh em tao ngang hàng
Trong khu tao sống khi mày thích tao có cocaine
Đây SG hood đến gây sự, đưa mày vô hàng
Ghét tao không khôn ngoan, nhà mày không an toàn
Bia cùng với rượu, như Khanh Nhỏ anh em tao ngang hàng', '2012', '04:04')
insert into Song values (N'Lắng Nghe Mùa Xuân Về - Remix', N'pack://siteoforigin:,,,/Resource/Songs/LangNgheMuaXuanVe-Remix/LangNgheMuaXuanVe-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/LangNgheMuaXuanVe-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Giọt mưa nào rơi thật êm trên phố phường
Mùi hương nào thơm thật thơm trong gió thoảng
Và em đợi anh đợi anh như đã hẹn
Nghe trong mưa đêm mùa xuân lặng lẽ sang
Phải chăng nụ hoa mùa xuân đang hé nở
Phải chăng mầm non mùa xuân đang hé mở
Phải chăng tình yêu đầu tiên đang gõ cửa
Khi anh trông em ung dung bên thềm nhà
Kìa tiếng chim rộn hót xa vời
Cánh hoa đào bỗng như cười
Báo tin mùa xuân về
Kìa bóng đêm mùa cũ đâu rồi
Với anh chỉ thấy xanh ngời
Lá hoa của xuân tươi
Kìa anh tới
Giọt mưa nào rơi thật êm trên phố phường
Mùi hương nào thơm thật thơm trong gió thoảng
Và em đợi anh đợi anh như đã hẹn
Nghe trong mưa đêm mùa xuân lặng lẽ sang
Phải chăng mầm non mùa xuân đang hé nở
Phải chăng nụ hoa mùa xuân đang hé mở
Phải chăng tình yêu đầu tiên đang gõ cửa
Khi anh trông em ung dung bên thềm nhà
Và chúng ta lại đón giao thừa
Phút giây lặng lẽ mong chờ
Lắng nghe mùa xuân về
Để biết ta còn mãi trong đời
Phút mong chờ ấy tuyệt vời
Chứa chan niềm tin yêu
Kìa anh tới
Và chúng ta lại đón giao thừa
Phút giây lặng lẽ mong chờ
Lắng nghe mùa xuân về
Để biết ta còn mãi trong đời
Phút mong chờ ấy tuyệt vời
Chứa chan niềm tin yêu
Kìa anh tới mùa xuân về' , '2022', '03:12')
insert into Song values (N'Lời Ru Ngọt Ngào', N'pack://siteoforigin:,,,/Resource/Songs/LoiRuNgotNgao/LoiRuNgotNgao.mp3', N'Anh Khang', N'pack://siteoforigin:,,,/Resource/Songs/LoiRuNgotNgao/NhungBaiHatBatHuCuaAnhKhang(Vol2).jpg', NULL, N'Từng đêm tiếng ru ngọt ngào bên nôi
Mong một ngày cho con nụ cười trên môi
Lưng mẹ gầy thức trắng ru con
Vang từng ngày lời ru yêu thương oh
Rồi mai khi con tập dần những bước đi
Những giọt lệ trên mi
Vui thấy con cười buồn khi con đau
Lòng mẹ bao la tuyệt vời
Con sẽ không quên những ngày bình yên
Trong vòng tay mẹ ôm con vào lòng và nói những lời yêu thương
Và con sẽ nhớ lời nói dịu hiền lời ru ầu ơ
Ghi sâu trong tim hai tiếng nghe sao thân thương mẹ hiền
Rồi mai khi con tập dần những bước đi
Những giọt lệ trên mi
Vui thấy con cười buồn khi con đau
Lòng mẹ bao la tuyệt vời
Con sẽ không quên những ngày bình yên
Trong vòng tay mẹ ôm con vào lòng và nói những lời yêu thương
Và con sẽ nhớ lời nói dịu hiền lời ru ầu ơ
Ghi sâu trong tim hai tiếng nghe sao thân thương mẹ hiền
Con sẽ không quên những ngày bình yên
Trong vòng tay mẹ ôm con vào lòng và nói những lời yêu thương
Và con sẽ nhớ lời nói dịu hiền lời ru ầu ơ
Ghi sâu trong tim hai tiếng nghe sao thân thương mẹ hiền
Hai tiếng nghe sao thân thương mẹ hiền
Hai tiếng nghe sao thân thương mẹ hiền', '2014', '04:56')
insert into Song values (N'Luật Rừng', N'pack://siteoforigin:,,,/Resource/Songs/LuatRung/LuatRung.mp3', N'Binz, Rhymastic, 16 Typh, Gonzo, Tinle', N'pack://siteoforigin:,,,/Resource/Songs/LuatRung/LuatRung.jpg', NULL, N'We take the city now we be lonely on top (top)
No turning back all we can do is keep balling (balling)
Keep coming back for more
I know you like it raw
One shot hater bằng những cặp vần ngắn
Đừng giả nai kẻo lọt vào tầm ngắm
Move careful vì xung quanh anh toàn rắn bọn nó như là linh cẩu
Không săn chỉ toàn cắn
Không phân cao sang danh xưng nơi ta đứng
Tôn ti không mang đi lung tung không tương xứng (it''s your boy yeah)
Vậy nếu mày định nhoi thì đừng (young hustle TYP)
Chỗ này toàn chơi luật rừng
Chất từ bên trong chứ không cần phải tỏ ra
Mấy chuyện nhỏ thôi bỏ qua (cho qua)
Đơn giản và nho nhã
Mỗi khi on mic là fan lại có quà
Making music and dollar
Homie ngang vai phò tá
Mix thêm hoa quả cùng vodka rồi lại vác loa đi bộ trên phố xá
Thấy bọn anh đi lên tụi nó liền phản ứng
Khi những việc anh làm chỉ là truyền cảm hứng
Vẫn cứ chơi đẹp có ba miền làm chứng
Chưa bao giờ từng nghĩ đến việc tạm dừng
Make it rain mưa rơi lách tách
Got Goyard on my backpack
16 on da track
Space Gang got mah back yeah
Đường còn dài ta cứ chill mà đi có mục tiêu và trí nhạc vẫn real là vì
Viết lời thật không cần nhiều hoa mĩ giấy bút liệu mà ghi chứ còn kiêu ngạo gì
Món ăn ngon không thể thiếu gia vị vần câu giá trị bọn họ tiêu hóa kĩ
Những người từng ghét giờ lại mở hành trang xong trở thành fan như một điều lạ kì yeah
Không có gì lạ khi mà hit after hit yeah we get it
Đâm anh sau lưng rồi lại send anh demo kêu anh check it
No more game show không thể lươn trên TV anh không biết diễn
We only fuck with the real your acting is cute but we can’t see
Now Gonzo you got something to say
Flashback rewind
Năm năm trước đây ta còn rap phèn
Rap Việt Team Fly
Now Gonzo hoppin'' in the top 10
Khác biệt phi phàm
Ta đang làm mẫu của mấy thằng nhóc này
Get lit die tryin’
Chúng nó ngủ yên phòng ta còn sáng đèn (neva sleep)
Rượu mời ta sẽ không chịu uống
Bởi vì thứ ta bây giờ muốn là sự tỉnh táo trong mọi tình huống cho dù là xấu nhất (god damn)
Mấu chốt là không được giấu dốt
Cái mà mày gọi là tố chất lại vô tình khiến cho mày cố chấp (you know dat)
Phải bắt đầu ngay bây giờ đây là điểm xuất phát
Thay cho việc lắc đầu hay chây lười chơi bời theo kiểu mất xác
Những nơi nhiều sắc màu hay gây cười khiến mày không thể work hard
Kỷ luật và vốn kiến thức hơn người dung hợp swag và chất phác
Ta từng chửi bới chỉ trích mọi thứ ta thấy ở trên màn hình
Trước khi hướng mắt về phía không gian tự nhủ đó nên là mình
Cái cần to lên là trình không phải cái tôi trên chình ình
Và nếu chỉ ngồi quán net để mà chán ghét thì đừng nên phán xét người lên truyền hình
Spaceboiz that’s how we do
Make some noise on the move on the move
Spaceboiz let’s roll let’s move
Make some noise
Chỗ này chơi luật rừng
Spaceboiz that’s how we do
Make some noise on the move on the move
Spaceboiz let’s roll let’s move
Make some noise', '2022', '03:25')
insert into Song values (N'Một Năm Mới Bình An - Remix', N'pack://siteoforigin:,,,/Resource/Songs/MotNamMoiBinhAn-Remix/MotNamMoiBinhAn-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/MotNamMoiBinhAn-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Hoh huh hoh
Ah (hey)
Ah (hoh)
Ah (hey)
Ah
Xuân mang tình yêu muôn nhà
Mang lời ca chan hoà
Yêu thương hạnh phúc sum vầy
Tết năm nay nồng ấm đong đầy
Mưa rơi dịu êm gió mang hương về
Dập dìu trông cánh chim xa vời
Từng nhịp giây qua con tim sao bồi hồi (sao bồi hồi)
Xuân sang cành lá đâm chồi (chồi)
Bao buồn vui qua rồi (rồi)
Đưa con về với yên bình với gia đình nặng nghĩa ân tình
Cây mai đào khoe sắc hoa thêm màu
Nhẹ nhàng trong nắng xuân tươi hồng
Về nhà nhanh thôi ba mẹ đang ngóng trông
Bạn bè vui khoe áo mới xuân tới phơi phới
Những bao lì xì ngay ngắn may mắn tươi tắn
Bánh chưng thơm lừng ngất ngây xuân về ngập tràn lộc muôn nơi
Nắng ban mai hé môi cười dịu dàng xuân đến
Eh oh
Có chú chim non mừng vui hót sau nhà
Eh oh
Có tiếng em thơ mừng vui bóc bao quà
Eh oh
Có gió mang xuân mừng vui chúc ông bà (chúc ông bà)
Cười mãi thôi một năm mới bình an
Năm mới bình an
Ok
Về nhà với mẹ với ba
Quanh bếp hồng ấm áp vui hát ca
Nắng mai rộn ràng e ấp thướt tha
Pháo hoa báo hiệu một năm cũ đã qua
Năm mươi sắc chứa đựng bao hy vọng bình yên về muôn nhà
Tết đoàn viên sum vầy sẻ chia từng món quà
Rộn ràng mừng ngày xuân
Hòa nhịp cùng ngày xuân
Tường ngập cuộc đời ngập tràn nụ cười lộc đầy mừng ngày xuân
Xuân sang cành lá đâm chồi
Bao buồn vui qua rồi
Đưa con về với yên bình
Với gia đình nặng nghĩa ân tình
Cây mai đào khoe sắc hoa thêm màu
Nhẹ nhàng trong nắng xuân tươi hồng
Về nhà nhanh thôi ba mẹ đang ngóng trông
Đàn em thơ khoe áo mới xuân tới phơi phới
Những bao lì xì ngay ngắn may mắn tươi tắn
Bánh chưng thơm lừng ngất ngây
Xuân về ngập tràn lộc muôn nơi
Nắng ban mai hé môi cười dịu dàng xuân đến
Eh oh có chú chim non mừng vui hót sau nhà
Eh oh có tiếng em thơ mừng vui bóc bao quà
Eh oh có gió mang xuân mừng vui chúc ông bà (chúc ông bà)
Cười mãi thôi một năm mới bình an
Một năm mới bình an
Năm mới bình an oh
Nào cùng dang tay hoà vào mây mừng Tết nay mùa xuân tới
Nhẹ nhàng bay khắp chốn Tết sum vầy nụ cười mãi đong đầy
Mừng Tết năm nay rộn ràng pháo giao thừa
Mừng Tết sum vầy nụ cười mãi đong đầy nah
Eh oh có chú chim non mừng vui hót sau nhà
Eh oh có tiếng em thơ mừng vui bóc bao quà
Eh oh có gió mang xuân mừng vui chúc ông bà (chúc ông bà)
Cười mãi thôi một năm mới bình an' , '2022', '03:44')
insert into Song values (N'Một Ngày Mùa Đông', N'pack://siteoforigin:,,,/Resource/Songs/MotNgayMuaDong/MotNgayMuaDong.mp3', N'Thái Trinh', N'pack://siteoforigin:,,,/Resource/Songs/MotNgayMuaDong/TrinhAcoustic.jpg', N'Trinh Acoustic', N'Rồi một ngày trời không biếc xanh
Rồi một ngày hàng cây vắng tanh
Và cơn gió mang mùa đông tới
Cuốn bay theo nắm lá vàng rơi
Bờ cỏ này giọt sương đã tan
Bậc thềm này còn in dấu chân
Mùa đông tới em chờ anh mãi
Lá hoa thu sang nay đã úa tàn
Giờ đây em biết, em biết đã mất anh rồi đấy
Ngày mùa đông đến nghe vắng xa tiếng mưa phùn rơi
Lòng em đau đớn nhưng trái tim vẫn như thầm nói
Còn yêu mãi
Giờ đây em biết, em biết đã mất anh rồi đấy
Ngày mùa đông đến nghe vắng xa tiếng mưa phùn rơi
Lòng em đau đớn nhưng trái tim vẫn như thầm nói
Em mãi yêu anh
Rồi một ngày trời không biếc xanh
Rồi một ngày hàng cây vắng tanh
Và cơn gió mang mùa đông tới
Cuốn bay theo nắm lá vàng rơi
Bờ cỏ này giọt sương đã tan
Bậc thềm này còn in dấu chân
Mùa đông tới em chờ anh mãi
Lá hoa thu sang nay đã úa tàn
Giờ đây em biết, em biết đã mất anh rồi đấy
Ngày mùa đông đến nghe vắng xa tiếng mưa phùn rơi
Lòng em đau đớn nhưng trái tim vẫn như thầm nói
Còn yêu mãi
Giờ đây em biết, em biết đã mất anh rồi đấy
Ngày mùa đông đến nghe vắng xa tiếng mưa phùn rơi
Lòng em đau đớn nhưng trái tim vẫn như thầm nói
Em mãi yêu anh
Giờ đây em biết, em biết đã mất anh rồi đấy
Ngày mùa đông đến nghe vắng xa tiếng mưa phùn rơi
Lòng em đau đớn nhưng trái tim vẫn như thầm nói
Còn yêu mãi
Giờ đây em biết, em biết đã mất anh rồi đấy
Ngày mùa đông đến nghe vắng xa tiếng mưa phùn rơi
Lòng em đau đớn nhưng trái tim vẫn như thầm nói
Em mãi yêu anh', '2020', '05:06')
insert into Song values (N'Mùa Thu Cho Em', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/MuaThuChoEm/MuaThuChoEm.jpg', null, N'Anh có nghe mùa thu mưa giăng lá đổ
Anh có nghe nai vàng hát khúc yêu đương
Và anh có nghe khi mùa thu tới
Mang ái ân mang tình yêu tới
Anh có nghe nghe hồn thu nói mình yêu nhau nhé
Anh có hay mùa thu mưa bay gió nhẹ
Anh có hay thu về hết dấu cô liêu
Và anh có hay khi mùa thu tới
Bao trái tim vương màu xanh mới
Anh có hay hay mùa thu tới hồn em ngất ngây
Nắng úa dệt mi em và mây xanh thay tóc rối
Nhạt môi môi em thơm nồng
Tình yêu vương vương má hồng
Sẽ hát bài cho anh và ru anh yên giấc tối
Ngày mai khi mưa ngang lưng đồi
Chờ anh em nghe mùa thu tới
Anh có mơ mùa thu cho ai nức nở
Anh có mơ mơ mùa mắt ướt hoen mi
Và anh có mơ khi mùa thu tới
Hai chúng ta sẽ cùng chung lối
Anh với em mơ mùa thu ấy tình ta ngát hương
Anh có hay mùa thu mưa bay gió nhẹ
Anh có hay thu về hết dấu cô liêu
Và anh có hay khi mùa thu tới
Bao trái tim vương màu xanh mới
Anh có hay hay mùa thu tới hồn em ngất ngây
Nắng úa dệt mi em và mây xanh thay tóc rối
Nhạt môi môi em thơm nồng
Tình yêu vương vương má hồng
Sẽ hát bài cho anh và ru anh yên giấc tối
Ngày mai khi mưa ngang lưng đồi
Chờ anh em nghe mùa thu tới
Anh có mơ mùa thu cho ai nức nở
Anh có mơ mơ mùa mắt ướt hoen mi
Và anh có mơ khi mùa thu tới
Hai chúng ta sẽ cùng chung lối
Anh với em mơ mùa thu ấy tình ta ngát hương', '2017', '04:31')
insert into Song values (N'Mười Năm', N'pack://siteoforigin:,,,/Resource/Songs/MuoiNam/MuoiNam.mp3', N'Đen Vâu, Ngọc Linh', N'pack://siteoforigin:,,,/Resource/Songs/MuoiNam/MuoiNam.jpg', null, N'Ayy
It''s Den Vau
One more time Lon Xon
Dìa dia
Có người đến, có người đi và có người ở lại
Có lúc khôn và cũng có lần nhỡ dại
Có lúc tủi, có lúc vinh và có lúc thăng hoa
Có ngày cười, có ngày khóc và có ngày hoan ca
Đời cho ta quá nhiều thứ
Ta chưa cho đời được nhiều
Đến bây giờ vẫn chưa học được cách làm sao để lời được nhiều
Mười năm như một bức hoạ, cũng may là trời đỡ xám hơn
Thứ mà ta học được nhiều nhất là cách xin lỗi và lời cám ơn
Mặt trời là cái bếp lớn
Còn tia nắng là than hồng
Mỗi ngày mà ta thức dậy
Ta chỉ mong được an lòng
Hoàng hôn là dải lụa
Còn màn đêm là tấm chăn
Mỗi đêm ta ngồi ta viết, ta chỉ mong không bị cấm ngăn
Nhởn nhơ trên con đường vắng, tự nhủ mình không cần tăng ga
Lắng nghe cuộc đời như lá, lá rơi nghiêng như Trần Đăng Khoa
Lời ca là chất kích thích, cho cuộc đời thêm phần thăng hoa
Âm nhạc là cô gái đẹp, ta và nhạc bao lần trăng hoa
Cuộc đời này có được mấy lần mười năm?
Sống làm sao khi khó, còn được có những người thăm
Nhắm mắt và hồi tưởng, chẳng có đâu mà dài
Giống như LK ta vẫn tự hỏi nhiều khi Đen Vâu là ai
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần mười năm?
Tâm hồn của anh, anh không chắc nó hợp thời đại
Anh níu những cành cây khô và mong ngày sau lá rợp trời lại
Mọi thứ ngày càng phát triển, sao chúng ta càng bị bất an?
Anh sống giữa lòng thành phố, nhưng lại mơ về thị trấn hoang
Hoài niệm là thứ đồ chơi, ta càng lớn lại càng không chán
Gom từng chút, từng chút, từng chút như con dã tràng không cần công cáng
Nó là thứ tài sản vô giá, không ai mua và cũng không bán
Thấy lẻ loi như con chuồn chuồn, bay chơ vơ trên mặt sông thoáng
Con người cũng như con chim, sáng kiếm ăn chiều bay vào tổ
Con nào cũng như con nào, chẳng con sướng chẳng con nào khổ
Con người cũng như con chim, chiều về tổ sáng thì kiếm ăn
Ngày mải mê đi tìm cơm gạo, đêm co mình dưới một miếng chăn
Cuộc đời là nồi cá kho, muốn nó ngon phải kho nhiều lửa
Có quá nhiều thứ mưu cầu, ta chỉ cần được no nhiều bữa
Ta nhận của đời quá nhiều và ta cần phải cho nhiều nữa
Và chỉ mong trong những đêm đông, mẹ không còn phải ho nhiều nữa
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần mười năm
Tao đã từng đứng dưới cùng và đã từng việt vị
Tao đã nhận những lời khen và cả lời miệt thị
Và tao tin nó vẫn còn đó vẫn chưa hề triệt tiêu
Mười năm qua tao vẫn cố gắng làm nhạc người Việt chill
Mấy thằng ghét tao, tụi nó cũng đã bỏ cuộc
Tao vẫn là con đóm đóm, tụi nó cháy như bó đuốc
Tao lập loè cả cuộc đời, tụi nó đã tắt từ lâu
Thời gian là thứ diệt cỏ ghê hơn cả thuốc trừ sâu
Mười năm tao vẫn là tao vẫn không khác mấy
Từ nhạc ra ngoài đời thường vẫn thân xác ấy
Có người nói tao thay đổi
Không! là tao thích nghi
Bật cười trước những phán xét, người đời thích nghi
Tao sẽ vẫn rap tiếp cho bản thân tao trước
Khi mà tao còn thở, khi mà chân tao bước
Khi tao còn lo lắng cho những người ghét tao
Dõi theo thằng không bỏ cuộc, mệt mỏi biết bao
Bước vào cuộc chơi tao không có gì để mà mất cả
Cách mà tao kiếm tiền là niềm vui vượt lên trên tất cả
Con đường do tao chọn và tao cam tâm bước
Tao thà chìm dưới đại dương còn hơn bị tan trong nước
Đêm nay tao thức trắng nhìn bầu trời sao
Muốn được cười, muốn được khóc như ngày đầu đời tao
Có cánh hoa nào không tàn
Có giấc mơ nào không tan
Hát để tâm tư vén màn
Thả mình xuôi với mây ngàn
Lòng mình vẫn chưa ngăn nắp
Nhìn lại buồn vui tháng năm
Một đời này ta sẽ có mấy lần mười năm
', '2019', '04:06')
insert into Song values (N'Nắng Có Còn Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/NangCoConXuan-Remix/NangCoConXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/NangCoConXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Mùa xuân ơi
Ta nghe mùa xuân hát bên kia trời
Đồi núi xanh ngời
Đâu đây tiếng đàn cầm buông lả lơi
Đâu đây tiếng lòng tôi nghe tí tơi
Và em tôi lung linh giọt sương
Trắng trong vời vợi
Em biết yêu rồi
Em yêu những chiều ngồi nghe gió rơi
Em yêu tiếng đàn tôi yêu thế thôi
Như bao giọt sương còn vương mình trên lá
Như bao nụ hoa ngát xinh môi em cười
Như xuân chờ đông tình ta còn xa quá
Nên anh chờ em chẳng biết đến bao giờ
Đêm nay từng đàn chim trắng về
Xa em biết ngày xuân nắng
Có còn vương trên môi em
Mùa xuân ơi
Ta nghe mùa xuân hát bên kia trời
Đồi núi xanh ngời
Đâu đây tiếng đàn cầm buông lả lơi
Đâu đây tiếng lòng tôi nghe tí tơi
Và em tôi lung linh giọt sương
Trắng trong vời vợi
Em biết yêu rồi
Em yêu những chiều ngồi nghe gió rơi
Em yêu tiếng đàn tôi yêu thế thôi
Như bao giọt sương còn vương mình trên lá
Như bao nụ hoa ngát xinh môi em cười
Như xuân chờ đông tình ta còn xa quá
Nên anh chờ em chẳng biết đến bao giờ
Đêm nay từng đàn chim trắng về
Xa em biết ngày xuân nắng
Có còn vương trên môi em
Đêm nay từng đàn chim trắng về
Xa em biết ngày xuân nắng
Có còn vương trên môi em' , '2022', '03:59')
insert into Song values (N'Nàng Thơ', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/NangTho/NangTho.jpg', null, N'Em, ngày em đánh rơi nụ cười vào anh
Có nghĩ sau này em sẽ chờ
Và vô tư cho đi hết những ngây thơ
Anh, một người hát mãi những điều mong manh
Lang thang tìm niềm vui đã lỡ
Chẳng buồn dặn lòng quên hết những chơ vơ
Ta yêu nhau bằng nỗi nhớ chưa khô trên những bức thư
Ta đâu bao giờ có lỗi khi không nghe tim chối từ
Chỉ tiếc rằng
Em không là nàng thơ
Anh cũng không còn là nhạc sĩ mộng mơ
Tình này nhẹ như gió
Lại trĩu lên tim ta những vết hằn
Tiếng yêu này mỏng manh
Giờ tan vỡ, thôi cũng đành
Xếp riêng những ngày tháng hồn nhiên
Trả lại...
Mai, rồi em sẽ quên ngày mình khờ dại
Mong em kỷ niệm này cất lại
Mong em ngày buồn thôi ướt đẫm trên vai
Mai, ngày em sải bước bên đời thênh thang
Chỉ cần một điều em hãy nhớ
Có một người từng yêu em tha thiết vô bờ
Em không là nàng thơ
Anh cũng không còn là nhạc sĩ mộng mơ
Tình này nhẹ như gió
Lại trĩu lên tim ta những vết hằn
Tiếng yêu này mỏng manh
Giờ tan vỡ, thôi cũng đành
Xếp riêng những ngày tháng hồn nhiên
Trả hết cho em
Em không là nàng thơ
Anh cũng không còn là nhạc sĩ mộng mơ
Tình này nhẹ như gió
Lại trĩu lên tim ta những vết hằn
Tiếng yêu này mỏng manh
Giờ tan vỡ, thôi cũng đành
Xếp riêng những ngày tháng hồn nhiên
Trả hết cho em', '2020', '04:14')
insert into Song values (N'Nàng Thơ... Trời Giấu Trời Mang Đi', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.mp3', N'AMEE, Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/NangTho...TroiGiauTroiMangDi/NangTho...TroiGiauTroiMangDi.jpg', N'dreAMEE', N'Anh ngày anh đánh rơi nụ cười vào em
Có nghĩ sau này anh sẽ chờ
Và vô tư cho đi hết những ngây thơ
Em một người hát mãi những điều mong manh
Lang thang tìm niềm vui đã lỡ
Chẳng buồn dặn lòng quên hết những chơ vơ
Ta yêu nhau bằng nỗi nhớ chưa khô trên những bức thư
Ta đâu bao giờ có lỗi khi không nghe tim chối từ
Chỉ tiếc rằng
Em không là nàng thơ
Anh cũng không còn là nhạc sĩ mộng mơ
Tình này nhẹ như gió
Lại trĩu lên tim ta những vết hằn
Tiếng yêu này mỏng manh
Giờ tan vỡ thôi cũng đành
Xếp riêng những ngày tháng hồn nhiên
Trả lại
Sương mờ che khuất đồi
Đêm nào anh cũng ngồi
Lúc xa em anh thật sự chỉ nhớ mãi thôi
Tuy rằng mới bắt đầu
Tình yêu này như phép màu
Cứ cho là vì mình chỉ mới nói hẹn hò thôi
Nhưng vì em quá tuyệt
Nhìn đâu thì anh cũng duyệt
Cứ như đôi mình nợ nhau từ lâu quá nhiều
Đâu phải ai cũng hiểu
Rằng khi mình nhớ quá nhiều
Chẳng thể tập trung làm điều gì hết nữa
Xa là sẽ nhớ ngay
Xa là khoé mắt cay
Xa là chỉ thấy anh
Em cười đôi mắt lim dim
Xa là anh sẽ tìm
Sẽ nhìn em cho dù ngày hay đêm
Giá như ngay bây giờ được gặp nhau trước thềm
Thôi thì chỉ ướt mi
Do là nhớ quá đi
Chẳng hiểu sao trước kia
Ông trời lại giấu em đi
Thôi thì chẳng có gì
Do là anh yêu nhiều tại anh đó
Cứ coi như mây chẳng nhìn lời nói gió bay
Con đường đầy nắng hoa
Mà sao giờ anh đã xa
Em ngồi đây khóc to
Do trời lại lấy anh đi
Yêu là vì những gì
Sao phải buông khi chẳng thể rời xa
Gió mang cơn mưa về làm lòng ai não nề
Thôi thì chỉ ướt mi
Do là nhớ quá đi
Chẳng hiểu sao trước kia
Ông trời lại giấu anh đi
Thôi thì chẳng có gì
Do là em yêu nhiều tại em đó
Cứ coi như mây chẳng nhìn lời nói gió bay', '2020', '04:28')
insert into Song values (N'Não Cá Vàng', N'pack://siteoforigin:,,,/Resource/Songs/NaoCaVang/NaoCaVang.mp3', N'Only C, Lou Hoàng', N'pack://siteoforigin:,,,/Resource/Songs/NaoCaVang/NaoCaVang.jpg', null, N'Chợt nhìn quanh bỗng chẳng thấy em kề cạnh
Chạy thật nhanh tránh cơn gió đêm về lạnh
Ùa về đây nỗi cô đơn thường trực nơi tim mình
Kí ức mong manh còn lại trong anh
Là cảm xúc mỗi khi gió đêm về lạnh
Là hạnh phúc mỗi khi có em gần cạnh
Chợt nhận ra những yêu thương
Vừa là hôm qua mà
Những nỗi cô đơn lại là hôm nay
Sau này sẽ không thấy em đang ôm chặt bờ vai anh
Chẳng còn những lúc mình nắm tay bước đi
Chỉ còn những nỗi buồn vương trên mi
Giá như anh cố yêu em nhiều hơn nữa
Giá như anh đã không hững hờ lúc xưa
Chỉ vì anh quá tin là em sẽ mãi thuộc về anh
Vậy mà giờ đây hai đứa hai nơi
Hình bóng em giờ đã trôi xa về nơi đâu
Trái tim anh vẫn mong em sẽ quay về
Về đâu để thấy em người ơi
Giờ biết đi về đâu
Để một lần nữa được nhìn thấy nhau
Chỉ còn những nước mắt nhạt nhòa
Hòa vào cơn mơ vì anh nhớ em
Chợt tỉnh giấc giữa đêm thắt tim lại
Chợt nhận ra em đã đi thật xa
Đã có những bước chân em đi qua con phố này
Ấm áp lúc trước em đem đi xa xa chốn đây
Đã mùa đông vậy mà trong tim có hòn than đỏ lửa
Đừng tìm tới được không kí ức từng đêm vẫn còn đang gõ cửa
Muốn biến mất ngay nơi đây
Xung quanh anh nhìn đâu cũng là những thói quen
Nhớ những lúc tay trong tay
Con tim anh từng cơn ngày đêm càng nhói thêm
Mùa yêu nào ta đã từng diết da
Mùa nắng nào ta đã từng ở lại
Cái tên em là thứ anh viết ra
Trong lời ca kèm theo tiếng thở dài
Lí do nào em bỏ đi nhanh quá
Từng hàng cây nơi góc đường chẳng còn lại màu xanh lá
Để lại nơi đây là những thứ lạnh giá là bàn tay mà anh phải cách xa
Là kí ức mà anh phải tránh xa
Là những hình xăm vẫn còn đang dính da
Bởi vì tất cả thanh xuân của anh đó chính là
Là em vẫn còn trong những cơn say là em vẫn còn trong những nỗi nhớ
Là em vẫn còn tồn tại trong những giấc mơ mỗi khi đêm về
Anh không tài nào ngủ yên giấc
Ước gì não anh như cá vàng
Ngày mai tỉnh dậy sẽ quên hết
Tình yêu ấy từng quý hơn cả vàng
Nhưng bộ phim nào cũng phải có hồi kết em ơi
Giá như anh có yêu em nhiều hơn nữa
Giá như anh đã không hững hờ lúc xưa
Chỉ vì anh quá tin là em sẽ mãi thuộc về anh (oh)
Vậy mà giờ đây hai đứa hai nơi
Hình bóng em giờ đã trôi xa về nơi đâu
Trái tim anh vẫn mong em sẽ quay về
Về đâu để thấy em người ơi
Giờ biết đi về đâu để một lần nữa được nhìn thấy nhau (ooh)
Giá như anh cố yêu em nhiều hơn nữa (ah)
Giá như anh đã không hững hờ lúc xưa (baby baby)
Chỉ vì anh quá tin là em sẽ mãi thuộc về anh (ooh)
Vậy mà giờ đây hai đứa hai nơi
Hình bóng em giờ đã trôi xa về nơi đâu
Trái tim anh vẫn mong em sẽ quay về (hoh)
Về đâu để thấy em người ơi
Giờ biết đi về đâu để một lần nữa được nhìn thấy nhau (ohh)
Chỉ còn những nước mặt nhạt nhòa
Hòa vào cơn mơ vì anh nhớ em
Chợt tỉnh giấc giữa đêm thắt tim lại
Chợt nhận ra em đã đi thật xa
', '2017', '04:35')
insert into Song values (N'Nếu Mai Gặp Lại (feat.Vũ Đặng Quốc Việt)', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai(feat.VuDangQuocViet).mp3', N'Nguyen Ha, Vũ Đặng Quốc Việt', N'pack://siteoforigin:,,,/Resource/Songs/NeuMaiGapLai(feat.VuDangQuocViet)/NeuMaiGapLai.jpg', null, N'Gió chiều
Mang bao mộng mơ của tôi theo chân người
Tiếng cười
Vỡ tan thành sương rồi bay bốn phương
Hứa là
Sẽ luôn cùng nhau bên nhau cơ mà
Vỡ òa
Tiếng ai lặng thinh sao nghe xót xa?
Chờ một ngày anh sẽ tới
Sẽ tới mang em về đây ru say giấc nồng
Chờ ngày tình ta ươm nắng
Sưởi ấm hương xưa tàn phai ngày mai nếu gặp lại
Đừng vội nói câu chia ly tình ta dưới hiên nhà
Đừng vội bỏ quên yêu thương đậm sâu ngày nào
Vắng lặng
Tiếng ai gọi tôi bằng tên nghe thân thuộc
Vắng lặng
Tiếng ai tỉ tê à ơi mỗi đêm
Bước chậm
Bước qua tình ta mờ xa trong sương chiều
Thấy mình
Khóc như trẻ con thèm yêu xiết bao
Chờ một ngày anh sẽ tới
Sẽ tới mang em về đây ru say giấc nồng
Chờ ngày tình ta ươm nắng
Sưởi ấm hương xưa tàn phai ngày mai nếu gặp lại
Đừng vội nói câu chia ly tình ta dưới hiên nhà
Đừng vội bỏ quên yêu thương đậm sâu ngày nào
Đừng vội nói câu chia ly tình ta dưới hiên nhà
Đừng vội bỏ quên yêu thương đậm sâu...
Ngày nào', '2020', '05:16')
insert into Song values (N'Ngày Xưa Em Đến', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.mp3', N'Anh Khang', N'pack://siteoforigin:,,,/Resource/Songs/NgayXuaEmDen/NgayXuaEmDen.jpg', N'Những Bài Hát Bất Hủ Thập Niên 8x 9x Của Anh Khang (Vol.2)', N'Ngày xưa em đến như một cơn gió
Rồi trao tình yêu với ngàn lời hứa
Rằng ngày mai đôi ta gần nhau mãi sẽ không rời
Trong anh giờ phút ấy in hình bóng em
Rồi những năm tháng êm đềm hạnh phúc
Vụt qua thật nhanh không kịp tay với
Giờ chỉ còn yêu thương trong những giấc mơ xa vời
Và trong anh giờ đây chỉ còn nỗi nhớ
Không biết mai này đây
Khi bước trên đường quen
Liệu mình có gặp nhau như ngày xưa khi đông về
Nhẹ nhàng anh sẽ hát những bài hát viết tặng riêng em
Anh vẫn còn yêu em nhiều lắm người ơi
Năm tháng yêu thật lâu hình bóng em giờ đâu
Ngọt ngào vẫn đậm sâu mơ về em những đêm sầu
Dù chỉ là một thoáng nhớ về anh thôi người nhé
Tình này anh sẽ mãi trao về em như ngày xưa nhé em hoh
Ngày xưa em đến như một cơn gió
Rồi trao tình yêu với ngàn lời hứa
Rằng ngày mai đôi ta gần nhau mãi sẽ không rời
Trong anh giờ phút ấy in hình bóng em
Rồi những năm tháng êm đềm hạnh phúc
Vụt qua thật nhanh không kịp tay với
Giờ chỉ còn yêu thương trong những giấc mơ xa vời
Và trong anh giờ đây chỉ còn nỗi nhớ
Không biết mai này đây
Khi bước trên đường quen
Liệu mình có gặp nhau như ngày xưa khi đông về
Nhẹ nhàng anh sẽ hát những bài hát viết tặng riêng em
Anh vẫn còn yêu em nhiều lắm người ơi
Năm tháng yêu thật lâu hình bóng em giờ đâu
Ngọt ngào vẫn đậm sâu mơ về em những đêm sầu
Dù chỉ là một thoáng nhớ về anh thôi người nhé
Tình này anh sẽ mãi trao về em như ngày xưa nhé em
Không biết mai này đây khi bước trên đường quen
Liệu mình có gặp nhau như ngày xưa khi đông về
Nhẹ nhàng anh sẽ hát những bài hát viết tặng riêng em
Anh vẫn còn yêu em nhiều lắm người ơi
Năm tháng yêu thật lâu
Hình bóng em giờ đâu
Ngọt ngào vẫn đậm sâu mơ về em những đêm sầu (những đêm sầu)
Dù chỉ là một thoáng nhớ về anh thôi người nhé
Tình này anh sẽ mãi trao về em như ngày xưa nhé em hoh', '2021', '04:18')
insert into Song values (N'Người Khác', N'pack://siteoforigin:,,,/Resource/Songs/NguoiKhac/NguoiKhac.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/NguoiKhac/NguoiKhac.jpg', null, N'Anh đã chờ em rất lâu
Bao thu đông đi qua những xuân hạ tiếp nối
Nhiều mùa mưa tiếp nối
Anh giữ niềm riêng rất sâu
Có lẽ những góc tối quen một người hay nương nhờ.

Em tay trong tay một chàng lãng du
Từ vài lá thư, tình đẹp đáng mơ.
Hơn hai năm xa nhau em quen chàng trai phố hoa
Tưởng chừng thiết tha, cuối cùng bơ vơ

Không cam tâm anh nghĩ đến lúc
Để mình đến nơi bên em và lắng lo cho em
Nhưng ngay khi anh hy vọng nhất
Thì mọi thứ lại hóa tro tàn

[ĐK:]

Vì anh biết nay đã có thêm một người khác
đến sau đã chiếm lấy trái tim em rồi
Và mãi xa xôi
Vì anh biết nay đã có thêm một người khác
Không phải anh đã chiếm lấy trái tim em rồi
Để anh chơi vơi.

Em bay trên mây chẳng thèm ngoái sau
Mặc người dõi theo lòng buồn hắt hiu
Khi mưa rơi mây tan đi em lửng lơ chốn nao
Niềm đau xé cào chai dần tin yêu

Anh thương em nhưng bao nhiêu lâu
Càng chìm đắm vô sâu hơn càng thấy thêm cô đơn
Sau lưng em và anh níu giữ toàn là hão huyền yeah

Anh hy sinh nhưng không thể mãi là
Một người vô hình nơi phía sau em
Đáng lẽ ra anh nên nhắm mắt buông đi tất cả
Để bản thân mình thôi đớn đau thêm
Nhưng anh giang tay ôm nỗi nhớ
Chấp nhận muôn nỗi xót xa vì em.

Anh ở đây chờ em nơi này
Em tìm ái tình nơi chốn xa
Anh tự mơ về em mỗi ngày
Em lại mơ về ai đó khác.', '2018', '03:47')
insert into Song values (N'Nơi Này Có Anh', N'pack://siteoforigin:,,,/Resource/Songs/NoiNayCoAnh/NoiNayCoAnh.mp3', N'Sơn Tùng M-TP', N'pack://siteoforigin:,,,/Resource/Songs/NoiNayCoAnh/NoiNayCoAnh.jpg', null, N'Em là ai từ đâu bước đến nơi đây dịu dàng chân phương
Em là ai tựa như ánh nắng ban mai ngọt ngào trong sương
Ngắm em thật lâu
Con tim anh yếu mềm
Đắm say từ phút đó
Từng giây trôi yêu thêm
Bao ngày qua bình minh đánh thức xua tan bộn bề nơi anh
Bao ngày qua niềm thương nỗi nhớ bay theo bầu trời trong xanh
Liếc đôi hàng mi
Mong manh anh thẫn thờ
Muốn hôn nhẹ mái tóc
Bờ môi em anh mơ
Cầm tay anh dựa vai anh
Kề bên anh nơi này có anh
Gió mang câu tình ca
Ngàn ánh sao vụt qua nhẹ ôm lấy em
(Yêu em thương em con tim anh chân thành)
Cầm tay anh dựa vai anh
Kề bên anh nơi này có anh
Khép đôi mi thật lâu
Nguyện mãi bên cạnh nhau
Yêu say đắm như ngày đầu
Mùa xuân đến bình yên
Cho anh những giấc mơ
Hạ lưu giữ ngày mưa
Ngọt ngào nên thơ
Mùa thu lá vàng rơi
Đông sang anh nhớ em
Tình yêu bé nhỏ xin
Dành tặng riêng em
Còn đó tiếng nói ấy bên tai
Vấn vương bao ngày qua
Ánh mắt bối rối
Nhớ thương bao ngày qua
Yêu em anh thẫn thờ
Con tim bâng khuâng đâu có ngờ
Chẳng bao giờ phải mong chờ
Đợi ai trong chiều hoàng hôn mờ
Đắm chìm hòa vào vần thơ
Ngắm nhìn khờ dại mộng mơ
Đừng bước vội vàng rồi làm ngơ
Lạnh lùng đó làm bộ dạng thờ ơ
Nhìn anh đi em nha
Hướng nụ cười cho riêng anh nha
Đơn giản là yêu
Con tim anh lên tiếng thôi
Cầm tay anh dựa vai anh
Kề bên anh nơi này có anh
Gió mang câu tình ca
Ngàn ánh sao vụt qua nhẹ ôm lấy em
(Yêu em thương em con tim anh chân thành)
Cầm tay anh dựa vai anh
Kề bên anh nơi này có anh
Khép đôi mi thật lâu
Nguyện mãi bên cạnh nhau
Yêu say đắm như ngày đầu
Mùa xuân đến bình yên
Cho anh những giấc mơ
Hạ lưu giữ ngày mưa
Ngọt ngào nên thơ
Mùa thu lá vàng rơi
Đông sang anh nhớ em
Tình yêu bé nhỏ xin
Dành tặng riêng em
Oh nhớ thương em
Oh nhớ thương em lắm
Ah phía sau chân trời
Có ai băng qua lối về
Cùng em đi trên đoạn đường dài
Cầm tay anh dựa vai anh
Kề bên anh nơi này có anh
Gió mang câu tình ca
Ngàn ánh sao vụt qua nhẹ ôm lấy em
(Yêu em thương em con tim anh chân thành)
Cầm tay anh dựa vai anh
Kề bên anh nơi này có anh
Khép đôi mi thật lâu
Nguyện mãi bên cạnh nhau
Yêu say đắm như ngày đầu
Mùa xuân đến bình yên
Cho anh những giấc mơ
Hạ lưu giữ ngày mưa
Ngọt ngào nên thơ
Mùa thu lá vàng rơi
Đông sang anh nhớ em
Tình yêu bé nhỏ xin
Dành tặng riêng em', '2017', '04:38')
insert into Song values (N'OK', N'pack://siteoforigin:,,,/Resource/Songs/OK/OK.mp3', N'Binz', N'pack://siteoforigin:,,,/Resource/Songs/OK/OK.jpg', null, N'Hôm qua em hứa hẹn trăm đường
Hôm nay khi thôi say em nói em đùa
Hôm qua em vẫn rất dễ thương
Hôm nay câu chia tay em nói ngang ngược
Uhm, OK
Uhm, alright
Hôm qua là nắng gắt
Hôm nay là mưa giông
Không phải là thời tiết
Biết anh nói về ai không?
Quên nhau dễ
Để thành xa lạ không phải đếm từng ngày
Ồ thương nhau ghê! (Thương nhau ghê!)
Đậm sâu đối với em cũng chỉ đến chừng này
Lời hứa em dùng nhiều rồi
Sorry giờ không còn tác dụng (Sorry)
Anh có thể yêu bằng cả lý trí
Nhưng không thể bằng lòng tin nát vụn
Nơi đây...
Sương thì không rời lá
Gió thì hôn vào hoa
Hoa thì tô vào đá
Mây thì ôm trời xanh
Anh thì ôm guitar
Em thì chơi đùa anh
Oh-oh-oh, oh-oh-oh, ok
Oh-oh-oh, oh-oh-oh, alright
Oh-oh-oh, oh-oh-oh, ok
Oh-oh-oh, oh-oh-oh, alright
Hôm qua ta vẫn còn bình thường
Hôm nay ta xa, anh không nghĩ ra được
Hôm qua nồng cháy vẫn môi hôn
Hôm nay sao yêu đương anh thấy hoang đường?
Đó hôm qua em vui hôm nay lại sầu anh khó đoán
Vết thương gây xong em quay lưng vội vàng say "Bye" nhanh
Đầy đắng cay nhưng sao em vẫn mang ngọt ngào trong ánh mắt?
Đừng nghĩ anh không quan tâm em trêu đùa hoài con tim anh (Baby)
Oh-oh-oh, oh-oh-oh, OK
Oh-oh-oh, oh-oh-oh, alright
Oh-oh-oh, oh-oh-oh, OK
Oh-oh-oh, oh-oh-oh, alright', '2020', '02:34')
insert into Song values (N'Phía Sau Một Cô Gái', N'pack://siteoforigin:,,,/Resource/Songs/PhiaSauMotCoGai/PhiaSauMotCoGai.mp3', N'SooBin Hoàng Sơn', N'pack://siteoforigin:,,,/Resource/Songs/PhiaSauMotCoGai/PhiaSauMotCoGai.jpg', null, N'Nhiều khi anh mong
Được một lần nói ra
Hết tất cả thay vì
Ngồi lặng im nghe em
Kể về anh ta
Bằng đôi mắt lấp lánh
Đôi lúc em tránh
Ánh mắt của anh
Vì dường như lúc nào
Em cũng hiểu thấu lòng anh
Không thể ngắt lời
Càng không thể để
Giọt lệ nào được rơi
Nên anh lùi bước về sau
Để thấy em rõ hơn
Để có thể ngắm em
Từ xa âu yếm hơn
Cả nguồn sống
Bỗng chốc thu bé lại
Vừa bằng một cô gái
Hay anh vẫn sẽ
Lặng lẽ kế bên
Dù không nắm tay
Nhưng đường chung
Mãi mãi
Và từ ấy ánh mắt anh
Hồn nhiên đến lạ
Chẳng một ai có thể
Cản được trái tim
Khi đã lỡ yêu rồi
Đừng ai can ngăn tôi
Khuyên tôi buông xuôi
Vì yêu không có lỗi
Ai cũng ước muốn
Khao khát được yêu
Được chờ mong tới giờ
Ai nhắc đưa đón buổi chiều
Mỗi sáng thức dậy
Được ngắm một người
Nằm cạnh ngủ say
Nên anh lùi bước về sau
Để thấy em rõ hơn
Để có thể ngắm em
Từ xa âu yếm hơn
Cả nguồn sống
Bỗng chốc thu bé lại
Vừa bằng một cô gái
Hay anh vẫn sẽ
Lặng lẽ kế bên
Dù không nắm tay
Nhưng đường chung
Mãi mãi
Và từ ấy ánh mắt anh
Hồn nhiên đến lạ
Nên anh lùi bước về sau
Để thấy em rõ hơn
Để có thể ngắm em
Từ xa âu yếm hơn (ooh)
Cả nguồn sống (cả nguồn sống)
Bỗng chốc thu bé lại (bé lại)
Vừa bằng một cô gái oh
Hay anh vẫn sẽ lặng lẽ kế bên
Dù không nắm tay nhưng
Đường chung mãi mãi
Và từ ấy ánh mắt anh
Hồn nhiên đến lạ
Vì sao anh không thể
Gặp được em sớm hơn', '2016', '04:32')
insert into Song values (N'Phố Không Em', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.mp3', N'Thái Đinh', N'pack://siteoforigin:,,,/Resource/Songs/PhoKhongEm/PhoKhongEm.jpg', null, N'Thành phố không có em
Ngày trôi qua chẳng êm đềm
Dây đàn buông lơi chẳng còn cất lên
Nắng như hững hờ đường về chợt thờ ơ
Thành phố thiếu bóng em
Lòng bâng khuâng về phút giây đầu tiên
Phố xa vẫn thì thầm bên tai những khúc ca bình yên
Nhưng chẳng vơi nỗi niềm
Đôi bàn tay lạnh có nhớ về tôi
Gió lung lay cành hãy khẽ khàng thôi
Để em với giấc mộng hiền tạm quên đi hết mọi muộn phiền theo làn mây
Bao nhiêu bức hình của đôi chúng mình đã mòn hơi ấm bao ngày
Vắng em trời đất sao buồn tênh lòng chênh vênh
Này một đời thương còn tương còn tư
Này một hơi sương còn vương ngàn thu
Này hồn cỏ lá hãy ngân nga những lời hát ru
Hm để lòng tôi vơi đi chút nỗi niềm mơ về em từng đêm
Bớt đi vài giờ lòng thao thức em
Đôi bàn tay lạnh có nhớ về tôi (đêm ngày ta)
Gió lung lay cành hãy khẽ khàng thôi (đêm dài quá)
Để em với giấc mộng hiền tạm quên đi hết mọi muộn phiền theo làn mây uh oh
Bao nhiêu bức hình của đôi chúng mình đã mòn hơi ấm bao ngày
Vắng em trời đất sao buồn tênh lòng chênh vênh hoh
Này một đời thương còn tương còn tư
Này một hơi sương còn vương ngàn thu
Này hồn cỏ lá hãy ngân nga những lời hát ru
Để lòng tôi vơi đi chút nỗi niềm mơ về em từng đêm
Bớt đi vài giờ lòng thao thức em
Này một đời thương còn tương còn tư
Này một hơi sương còn vương ngàn thu
Này hồn cỏ lá hãy ngân nga những lời hát ru
Để lòng tôi vơi đi chút nỗi niềm mơ về em từng đêm
Bớt đi vài giờ lòng thao thức em
Thành phố không có em
Chiều lê thê rũ bên thềm
Tôi dạo qua từng con phố quen
Gom từng hơi thở nhặt từng lời ngây ngô
Thành phố thiếu bóng em
Đời lưa thưa cùng nỗi nhớ triền miên
Tôi ước em về qua đây cho giấc mơ ta cùng say
Cho tiếng lòng ta bay', '2016', '04:46')
insert into Song values (N'Phút Ban Đầu', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.mp3', N'Vũ.', N'pack://siteoforigin:,,,/Resource/Songs/PhutBanDau/PhutBanDau.jpg', null, N'Có ô cửa sổ nhỏ, lay hồn ai qua đây
Có giấc mơ là lạ, chạm vào trong ký ức
Dường như mây đang khóc
Mưa đang hát
Hát bài hát mùa yêu
Dường như mây đang đến
Mưa đi mất
Tôi xao xuyến
Em lưu luyến
Gần em tôi thấy bâng khuâng, bâng khuâng
Con tim này như chết lặng
Bóng dáng người như cơn gió lạ
Mang em về gần lại bên tôi
Dường như góc phố thênh thang, thênh thang
Sương đêm làm ướt tóc ai?
Đừng để nỗi nhớ miên man trong đêm thật dài
Hãy để khoảnh khắc tim tôi, tim em thật gần
Với nhau
Có cơn mưa đầu mùa, xa thật xa chốn ấy
Có cô em ngày nào, tóc ngắn ngang vai
Dường như mây đang khóc
Mưa đang hát
Hát bài hát mùa yêu
Dường như mây đang đến
Mưa đi mất
Tôi xao xuyến
Em lưu luyến
Gần em tôi thấy bâng khuâng, bâng khuâng
Con tim này như chết lặng
Bóng dáng người như cơn gió lạ
Mang em về gần lại bên tôi
Dường như góc phố thênh thang, thênh thang
Sương đêm làm ướt tóc ai?
Đừng để nỗi nhớ miên man trong đêm thật dài
Hãy để khoảnh khắc tim tôi, tim em thật gần, với nhau
Và tôi mong sớm mai đây khi em bên tôi, cùng say giấc nồng
Khẽ nhắc về mùa yêu thương đã qua
Khẽ tìm lại giây phút ban đầu, nhé em', '2013', '04:03')
insert into Song values (N'Quan Trọng Là Thần Thái', N'pack://siteoforigin:,,,/Resource/Songs/QuanTrongLaThanThai/QuanTrongLaThanThai.mp3', N'Only C x Karik', N'pack://siteoforigin:,,,/Resource/Songs/QuanTrongLaThanThai/QuanTrongLaThanThai.jpg', null, N'Quan trọng phải là thần thái
Quan trọng khi là con gái
Bao giờ yêu thì luôn đúng, chẳng bao giờ thấy sai
Quan trọng vẫn là thần thái
Khi mình yêu là con trai
Dẫu người ta gọi mình ái, cũng chẳng có gì để sai
Du-du-du-du-du-du-du-du-du-du
Du-du-du-du-du-du-du-du-du-du
Du-du-du-du-du-du-du-du-du-du
Du-du-du-du-du
Du-du-du-du-du
Quan trọng phải là thần thái
Quan trọng khi là con gái
Bao giờ yêu thì luôn đúng, chẳng bao giờ thấy sai
Quan trọng vẫn là thần thái
Khi mình yêu là con trai
Dẫu người ta gọi mình ái, cũng chẳng có gì để sai
Tốt hơn là mình biết thần thái nằm đâu
Tốt hơn là mình biết thần thái đậm sâu
Tốt hơn là mình biết thần thái nằm đâu
Biết thần thái nằm đâu
Biết thần thái như nào
Quan trọng!
Vẫn là cái thần thái
Quan trọng!
Vẫn là cái thần thái
Ai khen chê cứ mặc kệ
Mình cứ ngầu có gì phải ngần ngại
Vì mình đẹp chỗ nào tự mình biết
Mình xấu chỗ nào cũng mình biết
Cái gì của mình tự mình quyết để tâm làm gì mấy lời không cần thiết
Bởi cơ bản xã hội vốn thị phi
Bất kể là chuyện lớn hay là việc li ti
Mình làm gì đi nữa thì họ vẫn dị nghị
Thế nên kệ đi hơi đâu mà suy nghĩ
Quan trọng nhất không phải vẻ bề ngoài
Xấu, đẹp, chân ngắn hay chân dài
Mình đang chơi hay là đứng gần ai
Mà quan trọng là
Quan trọng phải là thần thái
Quan trọng khi là con gái
Bao giờ yêu thì luôn đúng, chẳng bao giờ thấy sai
Quan trọng vẫn là thần thái
Khi mình yêu là con trai
Dẫu người ta gọi mình ái, cũng chẳng có gì để sai
Tốt hơn là mình biết thần thái nằm đâu
Tốt hơn là mình biết thần thái đậm sâu
Tốt hơn là mình biết thần thái nằm đâu
Biết thần thái nằm đâu
Biết thần thái như nào
Biển người biển khẩu lung tung
Đúng hay sai miệng đời vẫn dậy sóng
Tốt nhất bản thân cứ ung dung
Để ra đường não bộ còn bay bổng
Nếu cong không thẳng thì đã sao? (đã sao?)
Lỡ thua không thắng thì đã sao? (đã sao?)
Đen đúa không trắng thì đã sao? (đã sao?)
Mình vẫn sống và đầu cứ ngẩng cao
Dù lên voi, hay xuống chó, nhà mình giàu hay không bằng chúng nó
Bước ra đường, vẫn phải tỉnh, dù cho có bao nhiều thằng đứng ngó
Vì quan trọng không phải vẻ bề ngoài, eh
Xấu, đẹp, chân ngắn hay chân dài, eh
Mình đang chơi hay là đứng gần ai
Mà quan trọng là, là, là
Quan trọng phải là thần thái
Quan trọng khi là con gái
Bao giờ yêu thì luôn đúng, chẳng bao giờ thấy sai
Quan trọng vẫn là thần thái
Khi mình yêu là con trai
Dẫu người ta gọi mình ái, cũng chẳng có gì để sai
Du-du-du-du-du-du-du-du-du-du (Chơi lên chơi lên)
Du-du-du-du-du-du-du-du-du-du (Chơi lên chơi lên)
Du-du-du-du-du-du-du-du-du-du
Du-du-du-du-du
Du-du-du-du-du
Ai không chơi anh em tui chơi
Dù lên voi, hay xuống chó, nhà mình giàu hay không bằng chúng nó
Bước ra đường, vẫn phải tỉnh, dù cho có bao nhiều thằng đứng ngó
Vì quan trọng không phải vẻ bề ngoài
Xấu, đẹp, chân ngắn hay chân dài
Mình đang chơi hay là đứng gần ai
Mà quan trọng là, là, là
Quan trọng phải là thần thái
Quan trọng phải là thần thái
Quan trọng vẫn là thần thái
(Ái-i-ai-í-ai)', '2018', '03:54')
insert into Song values (N'Sắc Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/SacXuan-Remix/SacXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/SacXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Nắng xuân đang rộn ràng chan hòa nơi nơi
Gió xuân reo nhịp nhàng cung đàn chơi vơi
Này xuân hãy cùng ta hân hoan thêm tuổi mới
Đời vui đắm say trong tình xuân đang nồng lên khơi.

Khắp xuân mai đào hồng khoe màu yên vui
Dáng xuân như nụ cười môi hồng em tươi
Nàng xuân trở về đây cho ta thêm nhựa sống
Tình xuân đưa ta lên cùng áng mây bay phiêu bồng

Chúa xuân về đây ngất ngây tình say
Xuân tô thắm tháng ngày.' , '2022', '03:37')
insert into Song values (N'Sài Gòn Buồn Quá Em Ơi', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonBuonQuaEmOi/SaiGonBuonQuaEmOi.mp3', N'Dế Choắt, Jason', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonBuonQuaEmOi/SaiGonBuonQuaEmOi.jpg', null, N'Ѕài Gòn buồn quá em ơi... em ơi... em giờ đang ở đâu?
Ѕài Gòn buồn quá em ơi... em ơi... lạc nhau xem như mất nhau!
Ɲgười vội bước còn người đang đứng sau
Ϲần một điều ước để vượt qua nỗi đau
Phút chốc Ѕài Gòn vẫn vui, sao anh mãi buồn?
Anh biết sài gòn có những đêm buồn thức trắng, lу cafe sữa vẫn còn vị ngọt nơi đầu môi
Anh biết là anh biết tất cả nơi mình anh từng làm sao có thể thaу đổi khi chẳng có người đi cùng đổi thaу
Tình đầu là tình vụn vỡ
Ɲgàу mà mình chưa từng gặp gỡ ngàу hôm qua
Ϲó nhiều chuуện buồn, ơ... trong từng nhịp thở
Ϲứ mãi cho đến một ngàу, ngàу bình thường vô tình gặp nhau
Thì mới biết tim đã rối bời chẳng phải em thì chẳng tìm được đâu
Tâm hồn anh thì già cỗi chứ đừng một lần rực rỗi
Mỗi khi thấу chân em dừng lại, xin một lần hỏi
Ɲắng chói chang khắp chiều tà hoàng hôn уên vị xong rồi lại đi
Ɛm là thuуền trưởng anh sẽ căng buồm chẳng ngại vì gió lau nhẹ bờ mi
Để cho anh một lần được nói, cho anh một lần được hỏi
Phải chăng anh là điểm tựa để em dựa mỗi ngàу mệt mõi?
Để cho anh một lần được nói, cho anh một lần được hỏi
Ɲếu một ngàу không gặp anh nữa, em có vội vàng đi tìm anh không?
Ѕài Gòn buồn quá em ơi... em ơi... em giờ đang ở đâu?
Ѕài Gòn buồn quá em ơi... em ơi... lạc nhau xem như mất nhau!
Ɲgười vội bước còn người đang đứng sau
Ϲần một điều ước để vượt qua nỗi đau
Phút chốc Ѕài Gòn vẫn vui, sao anh mãi buồn?
Ѕài gòn tháng năm sau anh không, không còn em nữa đâu
Giận rồi người cũng xa nhau, quên nhau, không còn nghĩ đến nhau
Ɲgàу buồn nhất là ngàу ta vỡ tan
Ɲgười ngồi khóc còn người đang trách ai?
Ɲgàу tháng ấу mình rời bỏ nhau trong đêm mưa buồn
Vì tình уêu đã lỡ một nhịp thì phải nhường lại cho người đến sau
Khi anh chỉ còn một nhịp, anh chỉ muốn thở hết những nỗi đau
Anh không tin vào định mệnh, anh tin vào ngàу mai
Ɲếu anh không thể làm được điều gì nữa thì chắc là anh sai
Và em nên nhớ tình anh không để đếm bằng những ngàу không em
Đó là tất cả những gì đọng lại sau nhưng đêm dài buồn không tên
Đến khi cảm xúc thấu được mình đã trãi qua quá nhiều lần tổn thương
Ϲhiếc gương ấу sẽ xóa được hình bóng ai đã khiến lòng mình vấn vương
Ɗù sai, dù đúng tất cả cũng không quan trọng
Vì người đi, người đến, người ở lại vì hiểu nhau
Thì ngàу em buồn nhất, anh sẽ đứng lại dù trời có mưa
Và anh muốn hỏi tất cả chuуện buồn em đã cất chưa em à
Ɓình уên là lúc anh cùng nhìn lại, nở một nụ cười cho dù đớn đau
Ɓình уên là lúc có người tồn tại, luôn nằm phía sau
Tình уêu đẹp nhất khi lòng thù hận em cần vứt đi
Tình уêu chỉ đến sau những mảnh vụn có kẻ ghép lại, lau nhẹ ướt mi
Ѕài Gòn buồn quá em ơi... em ơi... em giờ đang ở đâu?
Ѕài Gòn buồn quá em ơi... em ơi... lạc nhau xem như mất nhau!
Ɲgười vội bước còn người đang đứng sau
Ϲần một điều ước để vượt qua nỗi đau
Phút chốc Ѕài Gòn vẫn vui, sao anh mãi buồn?
Ѕài gòn tháng năm sau anh không, không còn em nữa đâu
Giận rồi người cũng xa nhau, quên nhau, không còn nghĩ đến nhau
Ɲgàу buồn nhất là ngàу ta vỡ tan
Ɲgười ngồi khóc còn người đang trách ai?
Ɲgàу tháng ấу mình rời bỏ nhau trong đêm mưa buồn', '2019', '05:18')
insert into Song values (N'Sài Gòn Lâu Phai', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonLauPhai/SaiGonLauPhai.mp3', N'Dế Choắt', N'pack://siteoforigin:,,,/Resource/Songs/SaiGonLauPhai/SaiGonLauPhai.jpg', null, N'Lời 1:

Và anh lại viết cho Ѕài Gòn
Ɲgàу buồn tháng nhớ năm thương
Ɗịch covid không một ai đón
Ѕao nỡ làm khó trăm đường

Anh gửi gắm cho em bài nhạc
Đôi lời tha thiết thân thương
Tại sao càng lớn ta lại càng thui thủi?
Thơ thẩn trong bốn chân tường

Ѕài Gòn mới đó gặp mặt
Ɲhưng giờ chẳng kịp thấу nhau

Ɓối rối cập rập
Ϲhẳng thể nén kìm nỗi đau
Ɲgười đành nhắm mắt, người vô hình
Ɲgười tiếc cho người ở lại
Ϲhim sẻ không thể lành lặn
Khi đã quá nhiều vết khâu

Ѕài Gòn đêm không còn đông đúc
Đèn vẫn sáng nhưng đường vắng hoe
Ɲgười đã thôi không còn chen chúc
Thức muộn nên mắt em đã caу xè
Ɛm chỉ sớm mong gặp lại mẹ
Ɗành cả chuỗi ngàу dài cho ba
Ϲảm xúc thật sự khó tả
Không thể nào dối lòng mà cho qua
Ɛm đã уêu Ѕài Gòn như thế
Một đứa trẻ không còn ngô nghê
Đời cho em nhiều lần vô thế
Mạnh mẽ đến mấу cũng cần vỗ về

Ɛm ơi thôi đừng ngủ trễ
Giữ sức khoẻ và đừng lắng lo
Thương cho Ѕài Gòn đã cũ
Ɲgười cũng cũ nên đành hoá tro.

Mel:

Ѕài Gòn buồn quá, chẳng còn vội vã
Để những nỗi xót xa va vào nhau
Ɲào, em ơi đốt đi buồn rầu
Ta tan trước cơn mưa ngâu

Ѕài Gòn buồn quá, chỉ còn mình ta
Với phố xá thênh thang bao ngàу qua
Mưa rơi tí tách trên ban công nhà
Gió đưa cơn mơ qua
Ɲgã nghiêng cùng mấу lời ca.

Ѕài Gòn buồn quá, chẳng còn vội vã
Để những nỗi xót xa va vào nhau
Ɲào, em ơi đốt đi buồn rầu
Ta tan trước cơn mưa ngâu

Ѕài Gòn buồn quá, chỉ còn mình ta
Với phố xá thênh thang bao ngàу qua
Mưa rơi tí tách trên ban công nhà
Gió đưa cơn mơ qua
Ɲgã nghiêng cùng mấу lời ca.

Lời 2:

Trên con xe mất phanh
Vui hơn khi có anh
Hai ta đi khắp nơi Ѕài Gòn
Về đêm trôi nhanh rất nhanh

Ɛm ơi mau nín đi
Và đưa taу lau khóe mi
Anh dang taу đón em vào lòng
Ϲùng nhau saу bуe cô vу

Thương cho Ѕài Gòn mất mát
Để đổi lấу một ngàу rất khác
Họ làm mọi cách để được hốt bạc
Ϲòn anh thì cháу trong từng nốt nhạc
Ϲon tim haу lý trí
Tồn đọng trong suу nghĩ
Tìm đâu ra tri kỷ đêm về thủ thỉ
Về những điều cũ kỹ
Và có những ngàу mất ngủ
Không được mùa thất thu
Với những gì ấp ủ
Một bài nhạc bất hủ
Trông hình dạng ủ rũ
Tóc tai rối bù xù
Ɓuồn không có hình thù
Túi không còn một xu
Hút một điếu Ѕài Gòn
Thả vào bầu không khí
Ɲgười đi tìm công lý
Ɲgười còn lắm tài còn
Ɲgười thì thích nâng lу
Xề xòa ngắm chiều tà
Ɲgười hạnh phúc về già
Kể những chuуện đã qua
Đệm bằng tiếng ghi ta
Ѕài Gòn nhớ cô ba
Ɛm ơi đừng sống vội
Ɓình tĩnh mà sống chill
Đời nàу có bao nhiêu
Ѕài Gòn khiến ta уêu

Và...

Ɓridge:

Ɲgưng lại vài giâу
Ɛm có nhìn thấу
Phía sau ổ cửa nàу, giọt nắng xuуên qua câу
Ɲgàу mai sẽ tốt hơn
Để tặng ta lời cảm ơn những ngàу qua

Và rồi mình cùng bước đi trên thành phố nàу
Xách ba lô và sum vầу
Ɲgọt ngào nào hơn taу nắm taу
Ɲơi ta sẽ đứng bên cạnh nhau lâu thật lâu
Giữa nơi thành phố haу rừng sâu.

Mel

Ѕài Gòn buồn quá, chẳng còn vội vã
Để những nỗi xót xa va vào nhau
Ɲào, em ơi đốt đi buồn rầu
Ta tan trước cơn mưa ngâu

Ѕài Gòn buồn quá, chỉ còn mình ta
Với phố xá thênh thang bao ngàу qua
Mưa rơi tí tách trên ban công nhà
Gió đưa cơn mơ qua
Ɲgã nghiêng cùng mấу lời ca.

Ѕài Gòn buồn quá em ơi, Ѕài Gòn buồn quá...', '2021', '04:00')
insert into Song values (N'Simple Love', N'pack://siteoforigin:,,,/Resource/Songs/SimpleLove/SimpleLove.mp3', N'Grey D, Orange', N'pack://siteoforigin:,,,/Resource/Songs/SimpleLove/HuongMuaHeEP.02.jpg', N'Hương Mùa Hè EP.02', N'Yeah í ye yeah ì ye í ye ì Ye-e-yah
Wao

Đưa chân dạo quanh nơi khắp phố xá bụi bay vào mắt, yah
Bụng reo đói mãi anh tấp vào shop mua ly mì gói, yah
Đập vào đôi mắt anh muốn chới với whoa oh my god, wao
Nàng tựa là ai xinh đến đắm đuối không may thì ngất

Đứng chết im tức khắc nàng nhẹ nhàng lướt qua
Tiếng sét ái tình đã đánh xem như duyên chúng ta
Tay buông cả ly mì xuống nhiều người nhìn quá đê
Anh không nói tiếng Hàn Quốc nhưng biết nói sharanghae

Lo đứng mộng mơ em đi đâu mất, yah
I''m fall in love, yah
Đôi chân chạy nhanh hết tất ngóc ngách to find you girl, yah
Em trôi thật mau giữa đám đông bon chen người qua, yah
Anh mãi chạy theo sau bóng em dẫu xa thật xa, yah

Lạc vào hình bóng nàng nét tinh tươm xinh ghê, yah
Em tựa tiên chốn nào ghé sang qua nơi anh vậy
Môi ngây ngô đỏ mềm khiến anh như tan ra, yah
Thôi thì đã lỡ mình trót yêu luôn em nha (Yah, yah, yah)

Simple love girl
Simple love girl
Simple love, simple love girl, oh simple love girl
Ôi trên đấy giáng xuống thần tiên đi vào trong giấc mơ
Baby girl, I''m gonna say "You''re the only one"

Simple love girl
Simple love girl
Simple love, simple love, oh simple love girl
Rolling with me on the way
You my candy girl
Saranghae, saranghae, simple love girl

Lạc vào đồng cỏ xanh
Thiên thần vai có cánh
Cây lá thì có cành
Em thì phải có anh

Thấy nụ cười em nhu mì
Anh như điện đứt cầu chì
Lóe lên một tia lửa
Tia lửa mém cầu kỳ

Thiên đường không còn nên nàng rơi vào nơi trần gian sao
Anh thì kiên cường, mong rằng gánh em bao phần gian lao
Em gì ơi, em có mong cuộc tình đơn giản
Nói ra điều cần nói, họ lại nghĩ là a đang giỡn
Bởi vì 1 phút 30 giây, nàng vút xa nơi đây (Ye)
Đang nơi đâu, đi tìm hoài khắp nơi bao lâu (Ye)
Thấy em đang ngồi trên ghế
Ah, đôi Mike tinh tế
Ah, ăn gì mà xinh thế
Khiến anh quên luôn con đường về

Lạc vào hình bóng nàng nét tinh tươm xinh ghê, yah
Em tựa tiên chốn nào ghé sang qua nơi anh vậy
Môi ngây ngô đỏ mềm khiến anh như tan ra, yah
Thôi thì đã lỡ mình trót yêu luôn em nha (Yah, yah, yah)

Simple love girl
Simple love girl
Simple love, simple love oh simple love girl
Ôi trên đấy giáng xuống thần tiên đi vào trong giấc mơ
Baby girl, I''m gonna say "You''re the only one"

Simple love girl
Simple love girl
Simple love, simple love, oh simple love girl
Rolling with me on the way
You my candy girl
Saranghae saranghae simple love girl

Thứ em thấy ở TV show
Chẳng có đâu, tình yêu nhiệm màu
Don''t believe what people show off
Yeah, they just wanna show off
Show off, show off, show off
Show off, show off
I just need a simple love, girl', '2022', '03:30')
insert into Song values (N'So Far', N'pack://siteoforigin:,,,/Resource/Songs/SoFar/SoFar.mp3', N'Binz Da Poet', N'pack://siteoforigin:,,,/Resource/Songs/SoFar/SoFar.jpg', null, N'Bạn em thấy, tối hôm đó anh bước bên ai (Hey)
Cả hai đều say, anh mang túi xách cô ấy trên vai (Gucci)
Em thấy những tin nhắn
Vẫn muốn tin anh
Không quan tâm em đúng sai

Một khi đã trao trái tim đó cho ai (Hey)
Yêu cuồng điên, ko biết cách dừng lại (Yah)
Đừng nghe trai tim nói
Đừng theo trái tim bước
Lại đưa em đến với những nỗi đau

Vì ta chưa hề đậm sâu no no no no
Ko thể bền lâu lâu lâu lâu không thể bền lâu
Đừng khóc ướt mi hết
Đừng ngốc đến như thế
Tình yêu anh không có đâu

Yêu thương sẽ mau phai– (Yêu thương sẽ mau phai)
Rồi em sẽ tìm ai– (Rồi em sẽ tìm ai)
Vay mượn bờ vai
Ko phải là anh
Anh phải say bye, yeah, bye bye

Ta chưa hề đậm sau no-no-no-no
Baby, no no no no
Ta chưa hề đậm sau no-no-no-no
Baby, no no no no

(Huh)
Đến với a có lẽ là điều tồi tệ nhất
Một ng con gái như em quá nhiều điều để mất
Không như anh, chỉ có, đôi câu thơ, em là
Thanh xuân, nước mắt, nỗi đau, mơ
Đâu thể cho trôi di như cơn gió
Baby em đừng trông mong chi nơi đó
Anh ko hề quan tâm
Bên anh càng thêm đau
Thêm vài ba câu
Cũng không gần nhau đâu

Vì ta chưa hề đậm sâu no no no
Không thể bền lâu lâu lâu lâu
Đừng khóc ướt mi hết
Đừng ngốc đến như thế
Tình yêu anh không có đâu

Yêu thương sẽ mau phai– (Yêu thương sẽ mau phai)
Rồi em sẽ tìm ai– (Em sẽ tìm ai)
Vay mượn bờ vai
Không phải là anh
Anh phải say bye, yeah, bye bye

Ta chưa hề đậm sâu oh no-no-no-no
Bayby, no no no no (Yêu anh không có đâu)
Ta chưa hề đậm sâu no-no-no-no (Yêu thương sẽ mau phai)
Bayby, No no no no (Rồi em sẽ tìm ai)

Vì nơi sâu trong anh, sâu nhất nhất trong anh
Nơi anh chẳng để ai đến
Có lúc em từng qua
Và em không như những cô gái đi ngang qua
Anh chẳng thể nào kể tên (chẳng thể nào kể tên)
Có phút anh nghi mình yêu em

Em cũng biết rồi mai, anh sẽ thuộc về người khác
Em là bài tình ca, nhưng anh không phải người hát
(Đừng khóc ướt mi hết)
(Đừng ngốc đến như thế)
(Tình yêu anh không có đâu)
Ok, em cứ ghép tên anh vào, niềm đau
Sorry baby, chưa hề đậm sâu

Ta chưa hề đậm sâu no oh
Baby, no oh
Ta chưa hề đậm sâu no oh
Baby, no oh
', '2018', '03:30')
insert into Song values (N'Suýt Nữa Thì', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.mp3', N'Andiez', N'pack://siteoforigin:,,,/Resource/Songs/SuytNuaThi/SuytNuaThi.jpg', null, N'Suýt nữa thì
Anh có thể nói muôn vàn lời muốn nói
Suýt nữa thì
Có thể đèo em qua từng hàng phố quen
Dòng lưu bút năm xưa viết vội
Hay còn nhớ nhau đến những ngày sau
Tình yêu đầu tiên anh giữ
Vẫn vẹn nguyên nơi con tim này
Anh còn nhớ
Mỗi lúc tan trường ngại ngùng theo em
Là con phố có hoa bay anh mãi theo sau
Khoảng cách ấy mà sao xa quá
Chẳng thể nào để tới bên em
Thời thanh xuân anh có là những nỗi niềm nuối tiếc
Lời chưa nói
Anh thả vào trong cơn gió nhắn với mây trời
Tình yêu đó
Chỉ riêng anh biết anh cũng chẳng mong hơn nhiều
Liệu rằng em còn ai đưa đón
Anh ơ thờ dõi theo em
Nếu có thể trở về hôm ấy
Anh sẽ chẳng để phí cơ hội
Từng vòng quay trên chiếc xe đạp anh đón đưa em ngang qua
Thời thanh xuân mà ta cùng nhau viết lên những giấc mơ đẹp
Một buổi chiều ngập tràn mảnh vỡ
Rơi ra từ hạnh phúc riêng anh
Suýt nữa thì người đã biết
Yêu thương một thời anh đã tương tư
Huh huh
Quả chò bay
Muốn nhắc anh rằng hãy đừng nuối tiếc (nuối tiếc)
Vậy mà sao chính anh vẫn cứ mãi hy vọng (vẫn cứ mãi hy vọng)
Để rồi trên đoạn đường phía trước
Ta vô tình nhìn thấy nhau
Liệu bây giờ anh sẽ nói
Những tình yêu cất giữ bấy lâu
Ai cũng phải
Gói cho mình khoảng trời ký ức (anh nhớ đến)
Ai cũng phải có trong tim một vài vết thương
Thời gian trôi chẳng chờ đợi ai
Em đã được người đón ai đưa
Tình yêu anh vẫn thế
Vẫn mãi chôn vùi nơi đây
Lời chưa nói
Anh thả vào trong cơn gió nhắn với mây trời (mây trời)
Tình yêu đó
Chỉ riêng anh biết anh cũng chẳng mong hơn nhiều
Liệu rằng em còn ai đưa đón
Anh ơ thờ dõi theo em (dõi theo em)
Nếu có thể trở về hôm ấy
Anh sẽ chẳng để phí cơ hội
Từng vòng quay trên chiếc xe đạp anh đón đưa em ngang qua
Thời thanh xuân mà ta cùng nhau viết lên những giấc mơ đẹp
Một buổi chiều ngập tràn mảnh vỡ
Rơi ra từ hạnh phúc riêng anh
Suýt nữa thì người đã biết
Yêu thương một thời anh đã tương tư
Huh
Suýt nữa thì người đã biết
Anh yêu em', '2018', '04:46')
insert into Song values (N'Thích Em Hơi Nhiều', N'pack://siteoforigin:,,,/Resource/Songs/ThichEmHoiNhieu/ThichEmHoiNhieu.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/ThichEmHoiNhieu/HuongMuaHeEP.01.jpg', N'Hương Mùa Hè EP.01', N'Biết là mình thích nhau
Còn chuyện xa hơn thôi để tính sau
Họ vờn nhau thôi không đúng đâu
Dân chơi thì chơi là phải trúng
Còn anh chỉ muốn chậm thôi không cần quá liều
Oh anh chưa muốn đâm đầu vậy đâu
Anh chưa thiết tha nghĩ tới chuyện sau này
Dù ba mẹ chờ mong, em biết không?
Họ muốn có cháu bồng
Chỉ cần ngồi với em chút thôi
Được không?
Nhìn vào đôi mắt em
Thấy sao một thế giới màu hồng
Dù môi đang cách nhau, cách nhau
Một chút
Nhưng mà vì anh chưa muốn phiêu, muốn phiêu
Dù thích em hơi nhiều
Alo
Baby anh đang đâu thế?
Anh ngồi sofa ở Tống Duy Tân
Ngay cạnh Puku ok
Với mấy đồng bọn nó rủ rê
Qua nhà thằng Minh Khai Không Thật
Cơ mà có hẹn với em anh bảo tối nay tao đi sinh nhật
Thế nhá
Nói thật anh đang bối rối khi nghĩ về ai
Công việc dang dở chắc anh phải chia ông Hiếu làm hai (Hiếu Thứ Hai)
Thích em hơi nhiều nên anh phải nghĩ sao nói vừa tai
Tại vì most of the time em ở trong tâm trí anh hết thời gian
Chỉ cần ngồi với em chút thôi
Được không?
Nhìn vào đôi mắt em
Thấy sao một thế giới màu hồng
Dù môi đang cách nhau, cách nhau
Một chút
Nhưng mà vì anh chưa muốn phiêu, muốn phiêu
Dù thích em hơi nhiều
Chỉ cần ngồi với em chút thôi
Được không?
Nhìn vào đôi mắt em
Thấy sao một thế giới màu hồng
Dù môi đang cách nhau, cách nhau
Một chút
Nhưng mà vì anh chưa muốn phiêu, muốn phiêu
Dù thích em hơi nhiều
Baby anh muốn thấy em trong tương lai gần
Baby anh muốn thấy em trong tương lai gần
', '2022', '03:25')
insert into Song values (N'Thì Thầm Mùa Xuân - Remix', N'pack://siteoforigin:,,,/Resource/Songs/ThiThamMuaXuan-Remix/ThiThamMuaXuan-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/ThiThamMuaXuan-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Từng chồi non xanh mơn man
Từng hạt mưa long lanh rơi mùa xuân
Và trong ánh mắt lấp lánh
Lời yêu thương, yêu thương ai ngập ngừng
Mùa xuân đã đến bên em
Và mùa xuân đã đến bên anh thì thầm
Làn gió khẽ vuốt tóc em
Và làn gió nói cùng em nhớ thương
Và em đã biết nói tiếng yêu đầu tiên
Và em đã biết thương nhớ, biết giận hờn
Mùa xuân đã đến bên em trao nụ hôn
Và mùa xuân đã trao cho em ánh mắt anh
Để rồi đắm say
Để rồi ngất ngây
Từng chồi non xanh mơn man
Từng hạt mưa long lanh rơi mùa xuân
Và trong ánh mắt lấp lánh
Lời yêu thương yêu thương ai ngập ngừng
Mùa xuân đã đến bên em và mùa xuân đã đến bên anh thì thầm
Làn gió khẽ vuốt tóc em và làn gió nói cùng em nhớ thương
Và em đã biết nói tiếng yêu đầu tiên
Và em đã biết thương nhớ, biết giận hờn
Mùa xuân đã đến bên em trao nụ hôn
Và mùa xuân đã trao cho em ánh mắt anh
Để rồi đắm say
Để rồi ngất ngây
Và em đã biết nói tiếng yêu đầu tiên
Và em đã biết thương nhớ, biết giận hờn
Mùa xuân đã đến bên em trao nụ hôn
Và mùa xuân đã trao cho em ánh mắt anh
Để rồi đắm say
Để rồi ngất ngây
Từng chồi non xanh mơn man
Từng hạt mưa long lanh rơi mùa xuân
Và trong ánh mắt lấp lánh
Lời yêu thương, yêu thương ai ngập ngừng
Mùa xuân đã đến bên em và mùa xuân đã đến bên anh thì thầm
Làn gió khẽ vuốt tóc em và làn gió nói cùng em nhớ thương
Và em đã biết nói tiếng yêu đầu tiên
Và em đã biết thương nhớ, biết giận hờn
Mùa xuân đã đến bên em trao nụ hôn
Và mùa xuân đã trao cho em ánh mắt anh
Để rồi đắm say
Để rồi ngất ngây
Để rồi đắm say
Để rồi ngất ngây
Để rồi đắm say
Để rồi ngất ngây
Để rồi đắm say' , '2022', '03:18')
insert into Song values (N'Tình Em Là Đại Dương', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.mp3', N'Hoàng Dũng, GREY D', N'pack://siteoforigin:,,,/Resource/Songs/TinhEmLaDaiDuong/TinhEmLaDaiDuong.jpg', N'Hương Mùa Hè EP.02', N'Từng con sóng xô ngoài khơi
Từng cánh chim bay thấp thoáng
Bước đi trong tiếng sóng
Gợi cho ta về những kỷ niệm
Ngày xưa mỗi khi hoàng hôn
Mình lại cùng ra nơi đây quấn quýt bên nhau
Cùng với sóng với gió ta đã hoà chung tiếng ca
Tình em lớn như đại dương (tình em lớn như đại dương)
Nồng ấm hiền hoà bao dung
Đã cho anh sức sống
Để đi tới tận cuối chân trời
Thời gian cứ trôi bình yên (thời gian cứ trôi bình yên)
Rồi một ngày khi dông bão ghé đến nơi đây
Để rồi em đã mãi bay đi theo cánh chim trời
Đại dương mênh mông ơi hỡi em ở đâu
Trời xanh bao la ơi có thấy bóng em
Nhờ cơn gió hãy nhắn giùm rằng
Trái tim ta vẫn yêu người (lòng vẫn yêu người)
Dù ngày mai dẫu thế giới có đổi thay
Tình em anh xin giữ mãi trong trái tim
Người ơi có còn nhớ
Nhớ đến nơi ta hẹn hò
Tình em lớn như đại dương (tình em lớn như đại dương)
Nồng ấm hiền hoà bao dung
Đã cho anh sức sống
Để đi tới tận cuối chân trời
Thời gian cứ trôi bình yên (thời gian cứ trôi bình yên)
Rồi một ngày khi dông bão ghé đến nơi đây
Để rồi em đã mãi bay đi theo cánh chim trời
Đại dương mênh mông ơi hỡi em ở đâu
Trời xanh bao la ơi có thấy bóng em
Nhờ cơn gió hãy nhắn giùm rằng
Trái tim ta vẫn yêu người (lòng vẫn yêu người)
Dù ngày mai dẫu thế giới có đổi thay
Tình em anh xin giữ mãi trong trái tim
Người ơi có còn nhớ
Nhớ đến nơi ta hẹn hò
Đại dương mênh mông ơi hỡi em ở đâu
Trời xanh bao la ơi có thấy bóng em
Nhờ cơn gió hãy nhắn giùm rằng
Trái tim ta vẫn yêu người
Dù ngày mai dẫu thế giới có đổi thay
Tình em anh xin giữ mãi trong trái tim
Người ơi có còn nhớ
Nhớ đến nơi ta hẹn hò', '2022', '03:46')
insert into Song values (N'Trời Sáng Rồi (Theme Song From "Trời Sáng Rồi, Ta Ngủ Đi Thôi")', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemeSongFrom_TroiSangRoi,TaNguDiThoi)/TroiSangRoi(ThemSongFrom_TroiSangRoi,TaNguDiThoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/TroiSangRoi(ThemeSongFrom_TroiSangRoi,TaNguDiThoi)/TroiSangRoi.jpg', null, N'Những hoàng hôn ánh nắng vỡ ra trong ngày mưa
Góp nhặt chi để mọi thứ trôi đi hết kỷ niệm
Đồng hồ tích tắc tích tắc
Cây đàn vỡ theo từng giây
Buông ra những giai điệu cô đơn
Không còn yêu có là lý lẽ để thuyết phục
Không còn thương có là cách gìn giữ những vấn vương
Phút chốc có khiến ta nhận ra
Phút chốc nhói buốt trong lời ca
Điều gì khiến cho tim ta loạn nhịp
Điều gì viển vông
Và nếu có thể được quay lại lúc đầu
Trong tháng chín vàng cây
Trong nắng sớm cạn mây
Nhìn theo hừng đông ngày tháng dài rộng
Nhìn thấy bình minh hồng
Vụn vỡ trong hư không
Nhận ra mỏng manh là để trưởng thành
Ngày xanh hãy cất dành
Trời sáng rồi tôi ơi
Không còn yêu có là lý lẽ để thuyết phục
Không còn thương có là cách gìn giữ những vấn vương
Phút chốc có khiến ta nhận ra
Phút chốc nhói buốt trong lời ca
Điều gì khiến cho tim ta loạn nhịp
Điều gì viển vông
Và nếu có thể được quay lại lúc đầu
Trong tháng chín vàng cây
Trong nắng sớm cạn mây
Nhìn theo hừng đông ngày tháng dài rộng
Nhìn thấy bình minh hồng
Vụn vỡ trong hư không
Nhận ra mỏng manh là để trưởng thành
Ngày xanh hãy cất dành
Nhìn theo hừng đông ngày tháng dài rộng
Nhìn thấy bình minh hồng
Vụn vỡ trong hư không
Nhận ra mỏng manh là để trưởng thành
Ngày xanh hãy cất dành
Trời sáng rồi tôi ơi', '2019', '04:12')
insert into Song values (N'Từ Đó', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.mp3', N'Trinh', N'pack://siteoforigin:,,,/Resource/Songs/TuDo/TuDo.jpg', null , N'Và hồn tôi từ đó là khúc ca vang trong ngần
Làm đôi môi rạng rỡ tình ban đầu
Hòa vào cây, vương vào nắng và giấc mơ tôi có nàng
Trong bài ca, ta bước thênh thang
Khi dừng chân, nhặt chiếc lá rơi trong gió chiều
Và hoàng hôn chợt đến làm tôi nhớ
Khi mùa xuân, nhành hoa tím em đưa tay cài
Nghe từ tim rung lên hân hoan
Và hồn tôi từ đó là khúc ca vang trong ngần
Làm đôi môi rạng rỡ tình ban đầu
Hòa vào cây, vương vào nắng và giấc mơ tôi có nàng
Trong bài ca, ta bước thênh thang
La-la, la-là-la, la-la là-la-là-la-là, la-lá-lá-là
La-là-la-la, là-la-la-la-la-la-lá
Thấy nhớ chiếc lá vừa rơi (Chiếc lá rơi)
Chiều nổi gió, (Đứng lại), có những mộng mơ
Ngậm nhành cỏ dại trên môi, tôi khác một ngày
(Từ hôm nay, tôi đã biết yêu em)
Nơi bình yên, niềm vui giữa tháng năm học trò
Cỏ đồng xanh, phượng thắm, đạp xe qua chợ vãn và
Em cùng tôi là muôn nốt âm thanh diệu kỳ
Bản tình ca sương mai chỉ ta lắng nghe
Và hồn tôi từ đó là khúc ca vang trong ngần (Khúc ca trong ngần)
Làm đôi môi rạng rỡ tình ban đầu (Ôi, tình ban đầu!)
Hòa vào cây, vương vào nắng và giấc mơ tôi có nàng
Trong bài ca, ta bước thênh thang
Vì tôi có em, hồn tôi từ đó...
Hòa vào cây, vương vào nắng và giấc mơ tôi có nàng
Trong bài ca, ta bước thênh thang
Vì tôi có em...
', '2020', '03:01')
insert into Song values (N'Ước Một Ngày (7 Deep Cuts Session)', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay(7DeepCutsSession).mp3', N'Phùng Khánh Linh', N'pack://siteoforigin:,,,/Resource/Songs/UocMotNgay(7DeepCutsSession)/UocMotNgay.jpg', null , N'Anh đi xa mãi nơi nào
Cho em mong ngóng đợi chờ
Bao nhiêu trìu mến ân cần
Bao nhiêu khát vọng bên anh
Mai đây anh có quay về
Xin anh, anh hãy như thường
Yêu em trìu mến ân cần
Như bao ước vọng trong em
Em ước một ngày có anh bên em
Đi giữa dòng người, tháng năm hối hả
Mong thời gian trôi qua hết tháng ngày
Ước lại cùng anh bước đi bên nhau thật lâu
Lại yên vui
Anh đi xa mãi nơi nào
Cho em mong ngóng đợi chờ
Bao nhiêu trìu mến ân cần
Bao nhiêu khát vọng bên anh
Mai đây anh có quay về
Xin anh, anh hãy như thường
Yêu em trìu mến ân cần
Như bao ước vọng trong em
Em ước một ngày có anh bên em
Đi giữa dòng người, tháng năm hối hả
Mong thời gian trôi qua hết tháng ngày
Ước lại cùng anh bước đi bên nhau thật lâu
Lại yên vui
Em ước một ngày có anh bên em
Đi giữa dòng người, tháng năm hối hả
Mong thời gian trôi qua hết tháng ngày
Ước lại cùng anh bước đi bên nhau thật lâu
Lại yên vui', '2020', '04:04')
insert into Song values (N'Vẫn Nhớ', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.mp3', N'Ha Nhi', N'pack://siteoforigin:,,,/Resource/Songs/VanNho/VanNho.jpg', null , N'Từng chiều buồn lang thang bước trên con đường
Lặng nhìn mùa thu đưa lá rơi bên thềm
Một mình thương nhớ ai, không gian như hoang vu
Một tình yêu giá băng, yêu đơn phương mình tôi
Nàng đẹp như ngôi sao sáng cao trên trời
Nụ cười xinh tươi sáng như hoa hướng dương
Lạnh lùng em bước qua, muôn hoa tươi trông theo
Còn lại anh ngất ngây trong cơn mơ mình anh
Một cuộc tình mà mình dành riêng cho em
Dù năm tháng trôi qua vẫn còn đây
Biết yêu em, thương em, mong em trong trái tim
Nhưng không thể nói lên, "Anh yêu em"
Hãy bước đi và đừng nghĩ suy
Dù cho em không cần anh nhưng anh vẫn cần em
Dù em ra đi thật xa, thật xa giấc mơ của anh
Anh thầm giữ trong con tim bóng dáng của em
Sẽ mãi mơ về em, hỡi em
Tình yêu trong mơ của anh, anh thầm mong một lần
Được ôm em trong vòng tay cùng nhau bước trên yêu thương
Cùng đắp xây mộng mơ
Mình sẽ mãi bên nhau
Nàng đẹp như ngôi sao sáng cao trên trời
Nụ cười xinh tươi sáng như hoa hướng dương
Lạnh lùng em bước qua, muôn hoa tươi trông theo
Còn lại anh ngất ngây trong cơn mơ mình anh
Một cuộc tình mà mình dành riêng cho em
Dù năm tháng trôi qua vẫn còn đây
Biết yêu em, thương em, mong em trong trái tim
Nhưng không thể nói lên, "Anh yêu em"
Hãy bước đi và đừng nghĩ suy
Dù cho em không cần anh nhưng anh vẫn cần em
Dù em ra đi thật xa, thật xa giấc mơ của anh
Anh thầm giữ trong con tim bóng dáng của em
Sẽ mãi mơ về em, hỡi em
Tình yêu trong mơ của anh, anh thầm mong một lần
Được ôm em trong vòng tay cùng nhau bước trên yêu thương
Cùng đắp xây mộng mơ
Mình sẽ mãi bên nhau
Oh-uh-oh-oh
Hãy bước đi và đừng nghĩ suy
Dù cho em không cần anh nhưng anh vẫn cần em
Dù em ra đi thật xa, thật xa giấc mơ của anh
Anh thầm giữ trong con tim bóng dáng của em
Sẽ mãi mơ về em, hỡi em
Tình yêu trong mơ của anh, anh thầm mong một lần
Được ôm em trong vòng tay cùng nhau bước trên yêu thương
Cùng đắp xây mộng mơ
Mình sẽ mãi bên nhau', '2020', '04:04')
insert into Song values (N'Vào Hạ', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.mp3', N'Suni Hạ Linh', N'pack://siteoforigin:,,,/Resource/Songs/VaoHa/VaoHa.jpg', N'Hương Mùa Hè EP.01' , N'Trời nhẹ dần lên cao
Hồn tôi dường như bóng chim
Vờn đôi cánh mềm lặng lẽ kiếm chốn nao bình yên
Và dòng sông xanh kia nằm yên như không muốn trôi
Phơi màu áo rêu vỗ về đánh giấc trưa nghỉ ngơi
Rì rào ngàn heo mây
Thở than qua muôn khóm cây
Chợt nghe hững hờ
Mùa hạ lướt thướt qua tầm tay
Kìa vầng mây lang thang
Tìm bạn đời không dối gian
Ðể cùng nhỏ to câu chuyện nắng mưa trần gian
Ta rong chơi phiêu lãng cuối trời
Ðời bọt bèo phù du kiếp người
Dù qua bao nhiêu đắng cay vẫn cười
Vì đời còn mùa hạ tươi vui
Và lòng còn nhiều điều muốn nói
Hãy thắp sáng tâm hồn
Cháy lên trong tim mỗi người
Những yêu thương trong cuộc đời
Mùa hạ ơi
Tình phơi phới
Bạn ơi, xin hãy vứt hết nỗi buồn
Xoá tan đi bao đêm trường
Bước ung dung trong cuộc đời
Hạ ơi
Trời nhẹ dần lên cao
Hồn tôi dường như bóng chim
Vờn đôi cánh mềm lặng lẽ kiếm chốn nao bình yên
Và dòng sông xanh kia nằm yên như không muốn trôi
Phơi màu áo rêu vỗ về đánh giấc trưa nghỉ ngơi
Rì rào ngàn heo mây
Thở than qua muôn khóm cây
Chợt nghe hững hờ
Mùa hạ lướt thướt qua tầm tay
Kìa vầng mây lang thang
Tìm bạn đời không dối gian
Ðể cùng nhỏ to câu chuyện nắng mưa trần gian
Ta rong chơi phiêu lãng cuối trời
Ðời bọt bèo phù du kiếp người
Dù qua bao nhiêu đắng cay vẫn cười
Vì đời còn mùa hạ tươi vui
Và lòng còn nhiều điều muốn nói
Hãy thắp sáng tâm hồn
Cháy lên trong tim mỗi người
Những yêu thương trong cuộc đời
Mùa hạ ơi
Tình phơi phới
Bạn ơi, xin hãy vứt hết nỗi buồn
Xoá tan đi bao đêm trường
Bước ung dung trong cuộc đời
Hạ ơi
Hãy thắp sáng tâm hồn
Cháy lên trong tim mỗi người
Những yêu thương trong cuộc đời
Mùa hạ ơi
Tình phơi phới
Bạn ơi, xin hãy vứt hết nỗi buồn
Xoá tan đi bao đêm trường
Bước ung dung trong cuộc đời
Hạ ơi
', '2022', '03:16')
insert into Song values (N'Vinh Quang Đang Chờ Ta', N'pack://siteoforigin:,,,/Resource/Songs/VinhQuangDangChoTa/VinhQuangDangChoTa.mp3', N'Touliver, Rhymastic, Soobin Hoàng Sơn', N'pack://siteoforigin:,,,/Resource/Songs/VinhQuangDangChoTa/VinhQuangDangChoTa.jpg', null , N'Ɲgàу mai ta đâu haу phút giâу bộn bề phía trước
Ɲgàу mai ta đâu haу có ai phía xa con đường
Gồng mình ta bước, thấm hết những nắng mưa
Vì ngàу mai ta mang theo khát khao bao năm đã chờ

Ɲgàу hôm naу ta đi có bao anh em sát cánh
Và ngàу hôm naу hiên ngang dù biết còn nhiều chông chênh
Ɓiết đâu tìm thấу một chút ánh sáng mong manh
Để naу mai ta đi chinh phục ước mơ chưa thành

Kề vai nhau cho ta vươn xa
Qua bão tố chông gai
Vẫn chân vững đoạn đường dài,
Ta miệt mài
Một đời cùng anh em xông pha
Ta chấp hết phong ba
Và vững tin với những đam mê chung một mái nhà
Vinh quang đang chờ ta...ì a...ì a à...
Vinh quang đang chờ ta...ì a...ì a...ê ề...
Vinh quang đang chờ ta...ì a...ì a à...
Vinh quang đang chờ ta...ì a...ì a...ê ề...

Mỗi chặng đường dài ta đếm được
Đều nuôi dưỡng trong ta sự kiên cường
Hôm naу mang theo niềm tin dẫn hướng
Để ngàу mai ta nghe thấу cả ngàn lời tán dương
Ta băng qua như một vị mãnh tướng
Vượt qua hết những уếu đuối tầm thường
Không để cho khó khăn cản bước
Mãi giữ vững trong ta một trái tim can trường
Vì biết ta có những người đồng đội cùng vào sinh ra tử
Mang ý chí sắt thép như cùng thuộc một dòng dõi những chiến binh xa xưa
Mỗi người thắp lên một tia sáng và cùng nuôi trong mình ngọn lửa
Thổi bùng lên một khát khao chiến thắng để quуết phân định hơn thua
Và đỉnh cao ta đang chinh phục sẽ chẳng còn quá xa xôi
Khi ta hiểu phía sau những giọt mồ hôi là tâm huуết cả vạn người
Ɗù cho bao nhiêu cám dỗ muốn kìm chân ta giăng ra khắp lối
Ϲứ vươn lên đầу kiêu hãnh để lịch sử lưu dấu tên ta ngàn đời
Ta dập tan bao định kiến, bác bỏ những hoài nghi
Đã bao năm ta khổ luуện để được rèn giũa một ý chí
Và khát vọng nàу sẽ là cánh cửa thần kỳ
Mở lối cho mọi con đường mà ta đi

Kề vai nhau cho ta vươn xa
Qua bão tố chông gai
Vẫn chân vững đoạn đường dài,
Ta miệt mài
Một đời cùng anh em xông pha
Ta chấp hết phong ba
Và vững tin với những đam mê chung một mái nhà
Vinh quang đang chờ ta...ì a...ì a à...
Vinh quang đang chờ ta...ì a...ì a...ê ề...
Vinh quang đang chờ ta...ì a...ì a...a à...
Vinh quang đang chờ ta...ì a...ì a...ê ề...', '2017', '04:19')
insert into Song values (N'Với Anh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.mp3', N'Thai Trinh', N'pack://siteoforigin:,,,/Resource/Songs/VoiAnh/VoiAnh.jpg', N'Trinh Acoustic', N'Ngày tôi yêu ngu ngơ những cánh chim bay lang thang
Trên từng sợi dây đàn
Người nghệ sỹ mơ màng nói tinh cầu vắng xa xôi
Và thế giới ấy, không có tôi
Tình yêu tôi trao anh quá mong manh như thiên nga
Bay lạc trong phím đàn
Nàng công chúa trong rừng xanh đã xa rồi
Nhận ra tôi không anh, hỡi tình nhân
Tình nhân hỡi
Đừng quên tôi chỉ là cô bé
Thèm muốn những vuốt ve
Những trái cây ngon
Nước mắt tuôn như trẻ con
Tình nhân hỡi
Sẻ chia cho tôi bao đêm vắng
Cùng những nỗi khát khao
Nỗi nhớ mong nhau
Nép dưới vai anh dài lâu
Người yêu tôi ngu ngơ như chú nai bơ vơ
Giữa bầy sói lang rừng
Và như thế tôi càng yêu, càng thương nhớ anh
Và anh yêu tôi như chính tình tôi
Tình yêu không ngôn ngoan như đoá hoa xanh thơ ngây
Bên vực sâu dối lừa
Người thiếu nữ yêu bằng chính xác thân mình
Không chỉ có mỗi trái tim nhỏ nhoi
Tình nhân hỡi
Đừng quên tôi chỉ là cô bé
Thèm muốn những vuốt ve
Những trái cây ngon
Nước mắt tuôn như trẻ con
Tình nhân hỡi
Sẻ chia cho tôi bao đêm vắng
Cùng những nỗi khát khao
Nỗi nhớ mong nhau
Nép dưới vai anh dài lâu
Người yêu tôi ngu ngơ như chú nai bơ vơ
Giữa bầy sói lang rừng
Và như thế tôi càng yêu, càng thương nhớ anh
Và anh yêu tôi như chính tình tôi
Tình yêu không ngôn ngoan như đoá hoa xanh thơ ngây
Bên vực sâu dối lừa
Người thiếu nữ yêu bằng chính xác thân mình
Không chỉ có mỗi trái tim nhỏ nhoi
Tình nhân hỡi
Đừng quên tôi chỉ là cô bé
Thèm muốn những vuốt ve
Những trái cây ngon
Nước mắt tuôn như trẻ con
Tình nhân hỡi
Sẻ chia cho tôi bao đêm vắng
Cùng những nỗi khát khao
Nỗi nhớ mong nhau
Nép dưới vai anh dài lâu
Người yêu tôi ngu ngơ như chú nai bơ vơ
Giữa bầy sói lang rừng
Và như thế tôi càng yêu, càng thương nhớ anh
Và anh yêu tôi như chính tình tôi
Tình yêu không ngôn ngoan như đoá hoa xanh thơ ngây
Bên vực sâu dối lừa
Người thiếu nữ yêu bằng chính xác thân mình
Không chỉ có mỗi trái tim nhỏ nhoi
Người thiếu nữ yêu bằng chính xác thân mình
Không chỉ có mỗi trái tim nhỏ nhoi', '2020', '06:06')
insert into Song values (N'Vợ Người Ta', N'pack://siteoforigin:,,,/Resource/Songs/VoNguoiTa/VoNguoiTa.mp3', N'Phan Mạnh Quỳnh', N'pack://siteoforigin:,,,/Resource/Songs/VoNguoiTa/VoNguoiTa.jpg', null , N'Oh ha oh
Tấm thiệp mời trên bàn
Thời gian địa điểm rõ ràng
Lại một đám mừng ở trong làng
Ɲgó tên bỗng dưng thấу hoang mang
Rồi ngàу cưới rộn ràng khắp vùng
Ai theo chân ai tới già trẻ đi cùng
Ɲhiều ngàу tháng giờ nàу tương phùng
Mà lòng caу caу caу
Giờ em đã là vợ người ta
Áo trắng cô dâu cầm hoa
Ɲhạc tung tóe thanh niên hòa ca
Vài ba đứa lên lắc lư theo
Ấу là thành đám cưới em với người ta
Anh biết do anh mà ra
Tình уêu ấу naу xa càng xa
Ɓuồn thaу là la lá
Ɓuồn thaу la lá la lá ố ô
Ɲghĩ nhiều chuуện trong đời
Anh thấу lòng càng rối bời
Liệu ngàу đó nhiệt tình ngỏ lời
Ϲhúng ta lấу nhau chứ em ơi
Đành bảo phó mặc ở duуên trời
Ɲhưng thâm tâm anh trách nàng tại sao vội
Một người bước, một người không đợi
Thì đành tìm ai ai ai
Giờ em đã là vợ người ta
Áo trắng cô dâu cầm hoa
Ɲhạc tung tóe thanh niên hòa ca
Vài ba đứa lên lắc lư theo
Ấу là thành đám cưới em với người ta
Anh biết do anh mà ra
Tình уêu ấу naу xa càng xa
Ɓuồn thaу là la là la la lá a á a à
Ɓuồn thaу là la lá a à á à hú hu hù hú hu hú hu
Giờ em đã là vợ người ta
Áo trắng cô dâu cầm hoa
Ɲhạc tung tóe thanh niên hòa ca
Vài ba đứa lên lắc lư theo
Ấу là thành đám cưới em với người ta
Anh biết do anh mà ra
Tình уêu ấу naу xa càng xa
Ɓuồn thaу la lá la là la
Mà giờ em đã là vợ người ta
Hãу sống vui hơn ngàу qua
Ɲhạc cũng tắt thanh niên rời bar
Ϲòn năm sáu tên đứng lơ ngơ
Ấу là tàn lễ cưới em theo người ta
Anh bước đi như hồn ma
Ɲgàу hôm ấу như kéo dài ra
Ɓuồn thaу là la lá
Ɓuồn thaу la lá la lá la là la la là
Em đã là vợ người ta vợ người ta hú hơ hu hơ', '2015', '03:21')
insert into Song values (N'Xin Lỗi', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.mp3', N'Nguyen Ha', N'pack://siteoforigin:,,,/Resource/Songs/XinLoi/XinLoi.jpg', null, N'Xin lỗi cơn mơ vừa qua
Xin lỗi cơn đau vừa xa lạ
Xin lỗi nỗi vui còn vướng lại
Nụ cười đôi khi đắng cay lòng này
Xin lỗi những đêm mùa đông
Thân nóng ấp trên bàn tay hiền lành
Xin lỗi quán quen phải cùng tôi
Tập quên một người
Có tình yêu vượt qua mùa đông
Gục chết sau đêm mùa xuân
Có người mang bình yên về nơi nào
Xa xôi chẳng bến bờ
Có người gieo vào nhau niềm tin
Tình ấm nóng không thể rời ra
Có người đi thật xa
Thật xa chẳng trở về
Xin lỗi cơn mơ vừa qua
Xin lỗi cơn đau vừa xa lạ
Xin lỗi nỗi vui còn vương lại
Nụ cười đôi khi đắng cay lòng này
Lời hát viết ra vì tôi
Vì biết nói ra lệ rơi
Xin lỗi đáng ra phải vui
Thế mà
Có tình yêu vượt qua mùa đông
Gục chết sau đêm mùa xuân
Có người mang bình yên về nơi nào
Xa xôi chẳng bến bờ
Có người gieo vào nhau niềm tin
Tình ấm nóng không thể rời ra
Có người đi thật xa
Thật xa chẳng trở về
Xin lỗi cơn mơ vừa qua
Xin lỗi cơn đau vừa xa lạ
Xin lỗi nỗi vui còn vương lại
Nụ cười đôi khi đắng cay lòng này
Lời hát viết ra vì tôi
Vì biết nói ra lệ rơi
Xin lỗi đáng ra phải vui
Thế mà
Lời hát viết ra vì tôi
Vì biết nói ra lệ rơi
Xin lỗi đáng ra phải vui
Thế mà', '2019', '04:04')
insert into Song values (N'Xuân, Hạ, Thu, Đông, Rồi Lại Xuân', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.mp3', N'AMEE', N'pack://siteoforigin:,,,/Resource/Songs/XuanHaThuDongRoiLaiXuan/XuanHaThuDongRoiLaiXuan.jpg', N'dreAMEE', N'Gửi anh người yêu ở nơi xa chẳng gặp
Chẳng biết phải bao giờ anh mới ghé thăm
Cứ thế đêm ngày trôi
Thấp thoáng mấy năm rồi
Chắc anh giờ đây quen cuộc sống mới
Đợi anh mà xuân hạ thu đông cũng tàn
Lại thêm mùa xuân, mùa xuân nữa đã sang
Ước muốn được gặp nhau, chẳng biết đến bao giờ
Để em cứ mãi một mình trong bao giấc mơ
Chẳng sợ phải đợi anh thật lâu
Điều em lo nhất
Chẳng biết bao lâu, bao lâu, bao lâu, sẽ kéo dài bao lâu
Giá như đây, chỉ là một giấc mộng
Thức dậy anh vẫn vòng tay ôm chặt
Chẳng có cách xa đâu
Chẳng sợ phải đợi anh thật lâu
Người em thương nhất
Chẳng biết bao lâu, bao lâu, bao lâu, thật ra là bao lâu
Đến khi chờ đợi là thói quen
Dù thời gian đáng ghét
Cũng chẳng nghĩa lý gì, làm yêu chỉ thêm yêu
Anh vẫn biết vì anh mà đôi ta thế này
Anh chỉ ước gì có thể mang em đến đây
Ước muốn được gặp nhau
Chắc sẽ sớm thôi mà
Để em sẽ không một mình trong bao giấc mơ
Chẳng sợ phải đợi anh thật lâu
Điều em lo nhất
Chẳng biết bao lâu, bao lâu, bao lâu, sẽ kéo dài bao lâu?
Giá như đây, chỉ là một giấc mộng
Thức dậy anh vẫn vòng tay ôm chặt
Chẳng có cách xa đâu
Chẳng sợ phải đợi anh thật lâu
Người em thương nhất
Chẳng biết bao lâu, bao lâu, bao lâu, thật ra là bao lâu
Đến khi chờ đợi là thói quen
Dù thời gian đáng ghét
Cũng chẳng nghĩa lý gì, làm yêu chỉ thêm yêu
Và giá như anh ở đây để thấy em đã cố gắng bao nhiêu
Và phải cố trở nên mạnh mẽ nhiều lúc dù nước mắt cứ rơi
Chẳng sợ phải đợi anh thật lâu
Người em thương nhất
Chẳng biết bao lâu, bao lâu, bao lâu, thật ra là bao lâu
Dù thời gian đáng ghét
Đợi anh mà xuân, hạ, thu, đông cũng tàn
Lại thêm mùa xuân, mùa xuân nữa đã sang', '2020', '04:54')
insert into Song values (N'Xuân Yêu Thương - Remix', N'pack://siteoforigin:,,,/Resource/Songs/XuanYeuThuong-Remix/XuanYeuThuong-Remix.mp3', N'Kim Ngân', N'pack://siteoforigin:,,,/Resource/Songs/XuanYeuThuong-Remix/TuyenTapNhacXuanRemix2023.jpg', N'Tuyển Tập Nhạc Xuân Remix 2023', N'Xuân đã đến bên em
Dáng xuân tuyệt vời
Xuân đã đến bên người
Xin người hãy cùng em yêu xuân
Mang hạnh phúc cho đời
Nhớ nhé em yêu
Mang say đắm cho đời
Khi về đừng quên nghe em
Còn nhớ phút giây gặp gỡ
Mùa xuân muôn hoa sắc hồng
Chiều xuống gió xuân nồng cháy
Người cho môi em ngỡ ngàng
Người đến cho tình anh chợt mới
Muôn hoa thổn thức
Xuân đã đến bên em
Dáng xuân tuyệt vời
Xuân đã đến bên người
Xin người hãy cùng em yêu xuân
Mang hạnh phúc cho đời
Nhớ nhé em yêu
Mang say đắm cho đời
Khi về đừng quên nghe em
Còn nhớ phút giây gặp gỡ
Mùa xuân muôn hoa sắc hồng
Chiều xuống gió xuân nồng cháy
Người cho môi em ngỡ ngàng
Người đến cho tình anh chợt mới
Muôn hoa thổn thức
Còn nhớ phút giây gặp gỡ
Mùa xuân muôn hoa sắc hồng
Chiều xuống gió xuân nồng cháy
Người cho môi em ngỡ ngàng
Người đến cho tình anh chợt mới
Muôn hoa thổn thức
Xuân đã đến bên em
Dáng xuân tuyệt vời
Xuân đã đến bên người
Xin người hãy cùng em yêu xuân
Mang hạnh phúc cho đời
Nhớ nhe em yêu
Mang say đắm cho đời
Khi về đừng quên nghe em
' , '2022', '03:09')
insert into Song values (N'Yêu 5', N'pack://siteoforigin:,,,/Resource/Songs/Yeu5/Yeu5.mp3', N'Rhymastic', N'pack://siteoforigin:,,,/Resource/Songs/Yeu5/Yeu5.jpg', null , N'Xin những bối rối
Này cứ thế lên ngôi
Xin con tim rẽ lối
Tìm giây phút nghẹn lời
Cho thêm chơi vơi
Để những ánh mắt đôi môi
Chạm nhau mang theo gọi mời uh-oh
Xin cho ta tan
Vào những đắm đuối miên man
Khi em ghé ngang
Đời chợt mang sắc hương thiên đàng
Và cho những ấm áp
Lại đến lấp kín nhân gian
Ngày ta yên vui cùng nàng uh-oh
Nhẹ nhàng âu yếm giữa chốn mơ
Cùng tìm kiếm bao ý thơ
Để đắm say trong tiếng nhạc du dương
Hồn sa theo bước ta ngẩn ngơ
Dù ngàn kiếp ta vẫn chờ
Chỉ cần có phút giây được trao yêu thương
Cause baby it''s always you ooh
It''s always you you
It''s always you ooh
It''s always you
It''s always you
Cause baby it''s always you ooh
It''s always you you
It''s always you ooh
It''s always you
It''s always you
Ta như đi qua hết
Bao nhiêu mê say trên đời
Như yêu thêm cả nghìn kiếp
Khi ta một giây bên người
Vì chỉ cẩn một ánh nhìn mà em trao
Là tuổi xuân của ta
Như hóa được thành chiêm bao
Với mỗi sáng thức giấc nghe em bên ta vui cười
Cho đêm ta ngây ngất
Ru tai êm qua đôi lời
Đầy ngọt ngào và trong veo
Cùng hòa làm trăng sao
Dìu dắt đôi tim bên nhau
Đi theo bao yêu thương dâng trào
Và ta xin đánh đổi một rừng tia nắng
Để lấy chút hơi ấm của em
Xin đổi đi hết tiền bạc danh tiếng
Những thứ hàng trăm người thèm
Bởi cả ngàn điều phù phiếm
Đâu bằng một thoáng môi mềm
Khi đời này sẽ mang đầy nuối tiếc
Nếu không có nàng ở bên
Nhìn em ta mới thêm yêu từng khoảnh khắc
Mang hết tương tư
Giấu vào theo từng bản nhạc
Để mai này tình nở
Như muôn hoa không tàn sắc
Lưu giữ mãi nơi này
Một câu chuyện ngàn năm
Nhẹ nhàng âu yếm giữ chôn mơ
Cùng tìm kiếm bao ý thơ
Để đắm say trong tiếng nhạc ru dương
Hồn sa theo bước ta ngẩn ngơ
Dù ngàn kiếp ta vẫn chờ
Chỉ cần có phút giây được trao yêu thương
Cause baby it''s always you ooh
It''s always you you
It''s always you ooh
It''s always you
It''s always you
Cause it''s always you and cause it''s always you', '2017', '05:27')
insert into Song values (N'Yếu Đuối', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.mp3', N'Hoàng Dũng', N'pack://siteoforigin:,,,/Resource/Songs/YeuDuoi/YeuDuoi.jpg', N'Tình Ca Hoàng Dũng', N'Yêu và xa và quên tựa những xa xôi ngày ấy
Kỉ niệm nơi đây thấy buồn biết mấy
Rồi mai tỉnh giấc liệu em
Còn cất anh trong tiềm thức?
Còn bật khóc vì những ngày như mơ, giờ tan vỡ
Vì đã có lúc trái tim anh từng yếu đuối
Tự cho phép mình không phải quên
Tự xem như mình vẫn gần bên
Và nếu lúc ấy thấy em vẫn còn nơi đây
Anh sẽ đến và ôm chặt em
Để thương nhớ chìm trong màn đêm không màu
Ngăn làm sao nỗi xót xa rơi trên mắt người
Quên làm sao tiếng ca chưa ngân hết lời
Đông còn chưa đến cớ sao môi anh vẫn run?
Anh còn chưa đến mà sao em đã đi?
Vì đã có lúc trái tim anh từng yếu đuối
Tự cho phép mình không phải quên
Tự xem như mình vẫn gần bên
Và nếu lúc ấy thấy em vẫn còn nơi đây
Anh sẽ đến và ôm chặt em
Để thương nhớ chìm trong màn đêm không màu
Biến nỗi nhớ trong anh thành tiếng hát
Xua tan đi cô đơn bấy lâu của ngày không em
Dù vẫn biết có cố gắng cũng chỉ là hư vô thế thôi
Anh vẫn không bao giờ tin rằng anh đã mất em
Vì đã có lúc trái tim anh từng yếu đuối (trái tim anh)
Tự cho phép mình không phải quên
Tự xem như mình vẫn gần bên (tự xem như mình vẫn gần bên)
Và nếu lúc ấy thấy em vẫn còn nơi đây
Anh sẽ đến và ôm chặt em
Để thương nhớ chìm trong màn đêm không màu
anh vẫn yêu em, anh vẫn yêu em
Và nếu lúc ấy thấy em vẫn còn nơi đây
Anh sẽ đến và ôm chặt em
Để thương nhớ chìm trong màn đêm không màu
Để thương nhớ chìm trong màn đêm không màu', '2018', '05:23')
insert into Song values (N'Yêu Thương Ngày Đó', N'pack://siteoforigin:,,,/Resource/Songs/YeuThuongNgayDo/YeuThuongNgayDo.mp3', N'Soobin Hoàng Sơn', N'pack://siteoforigin:,,,/Resource/Songs/YeuThuongNgayDo/YeuThuongNgayDo.jpg', null , N'Một mình lang thang trên con phố vắng
Nhớ bao yêu thương ngày mình bên nhau
Giờ mình anh nơi đây cô đơn lặng lẽ
Nơi phương xa em có hạnh phúc
Có thấy vui như anh từng khiến em nở
Nụ cười, bồi hồi con tim anh nhận ra
Khi em đưa đôi tay xa cách, là khi cơn mưa nặng hạt
Chỉ còn anh nơi đây, lặng nhìn theo bóng em rời xa
Tình yêu đôi khi không như ta ước muốn
Có mấy ai khi yêu trao hết trọn con tim
Một người ra đi, một người hoen mi với bao lưu luyến
Giờ còn lại đây bao nhiêu câu hứa
Có biết chăng em quên nhưng với anh vẫn là, là ngày hôm qua
Chỉ cần em quay về đây...
Liệu rằng nơi phương xa em thấy
Gió khẽ đưa thương yêu như muốn em quay về
Ngày mình chia tay, một mình anh nơi đây ấp ôm nỗi nhớ
Tìm về nơi yêu thương xa cách
Chỉ muốn mong em luôn mãi nơi này
Nguyện cầu cơn mưa kia, sẽ làm em quay về đây
Khi em đưa đôi tay xa cách, là khi cơn mưa nặng hạt
Chỉ còn anh nơi đây, lặng nhìn theo bóng em rời xa...
Tình yêu không như khi ta ước muốn
Có mấy ai khi yêu trao hết trọn con tim
Một người ra đi, một người hoen mi với bao lưu luyến
Giờ còn lại đây bao nhiêu câu hứa
Có biết chăng em quên nhưng với anh vẫn là, là ngày hôm qua
Chỉ cần em quay về đây...
Dòng người như đông hơn trên phố vắng
Có bước chân ai đang đi ngỡ em quay về
Đợi chờ nơi đây lặng nhìn nơi xa theo nỗi nhớ mong
Có biết bao yêu thương sẽ mãi nơi này
Bồi hồi trong tim, thật lòng đơn côi, giờ em đã mãi xa...
Tình yêu đôi khi không như ta ước muốn
Có mấy ai khi yêu trao hết trọn con tim
Một người ra đi, một người hoen mi với bao lưu luyến
Giờ còn lại đây bao nhiêu câu hứa
Có biết chăng em quên nhưng với anh vẫn là, là ngày hôm qua
Chỉ cần em quay về đây...
Là ngày hôm qua...
Chỉ cần em quay về đây...', '2018', '05:23')

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
update Song set Descriptions = N'Ở lại em nhé, ngày mai anh sẽ về
Anh chỉ mang nỗi nhớ em thêm xa
Mang đợi chờ, thêm dài ngắn
Anh chỉ thêm kỉ niệm là những chuyến đi
Rồi có lúc em sẽ khóc tựa vai gió
Tựa bóng mây ngập ngừng trôi
Vì anh biết vắng anh phố quen rất buồn
Vắng anh em vắng một bờ vai
Anh đâu muốn xa con phố ta đã yêu
Nơi ấy hẹn hò đôi ta chuyện trò
Nơi ấy đã từng đón đưa em từng chiều tới trường
Khi ấy em còn tóc xanh
Anh đâu muốn xa bóng dáng anh yêu thương
Đôi vai hao gầy mỏng manh tâm hồn
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về
Ở lại em nhé, ngày mai anh sẽ về
Anh chỉ mang nỗi nhớ em thêm xa
Mang đợi chờ, thêm dài ngắn
Anh chỉ thêm kỉ niệm là những chuyến đi
Rồi có lúc em sẽ khóc tựa vai gió
Tựa bóng mây ngập ngừng trôi
Vì anh biết vắng anh phố quen rất buồn
Vắng anh, em vắng một bờ vai
Anh đâu muốn xa con phố ta đã yêu
Nơi ấy hẹn hò đôi ta chuyện trò
Nơi ấy đã từng đón đưa em từng chiều tới trường
Khi ấy em còn tóc xanh
Anh đâu muốn xa bóng dáng anh yêu thương
Đôi vai hao gầy mỏng manh tâm hồn
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về
Anh đâu muốn xa con phố ta đã yêu
Nơi ấy hẹn hò đôi ta chuyện trò
Nơi ấy đã từng đón đưa em từng chiều tới trường
Khi ấy em còn tóc xanh
Anh đâu muốn xa bóng dáng anh yêu thương
Đôi vai hao gầy mỏng manh tâm hồn
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về
Anh hứa sẽ về với em như lời hứa anh từng
Xin em hãy chờ anh về' where ID = 17
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


delete playlist
delete PlaylistAndSongRelation
insert into Users values ('Admin','Admin',null, 'manh@123A')
insert into Playlist values('Likesong','','',1, 0)
insert into Playlist values('Recently Search','','',1,1)


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
alter table Users add Birthday nvarchar(max)
alter table Users alter column Birthday smalldatetime
alter table users add verification nvarchar(max) 