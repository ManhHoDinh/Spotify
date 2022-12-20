using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Spotify.Models;
using Spotify.Utilities;
using Spotify.Views.Components;

namespace Spotify.ViewModels
{
    class Songs
    {
        public static Song BenTrenTangLau = new Song { Name = "Bên trên tầng lầu", NameSinger = "Tăng Duy Tân",  DurationSong = "3:22", LinkSong = new Uri("pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau.mp3"), Image = new Uri("pack://siteoforigin:,,,/Resource/Images/BenTrenTangLauImg.jfif", UriKind.RelativeOrAbsolute), AlbumName="Bên Trên Lầu Xanh" };
        public static Song CamNang = new Song { Name = "Cảm nắng", NameSinger = "Suni Hạ Linh ft Rtee", DurationSong = "3:48", LinkSong = new Uri("pack://siteoforigin:,,,/Resource/Songs/CamNang.mp3"), Image = new Uri("pack://siteoforigin:,,,/Resource/Images/CamNangImg.jpg", UriKind.RelativeOrAbsolute), AlbumName = "Cảm Nắng" };
        public static Song DauMua = new Song {Name = "Dấu mưa", NameSinger = "Trung Quân Idol", DurationSong = "4:20", LinkSong = new Uri("pack://siteoforigin:,,,/Resource/Songs/DauMua.mp3"), Image = new Uri("pack://siteoforigin:,,,/Resource/Images/DauMua.jpg", UriKind.RelativeOrAbsolute), AlbumName = "Ahihi" };
    }
}
