using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Spotify.Models;
using Spotify.Utilities;
using Spotify.Views.Components;

namespace Spotify.ViewModels
{
    class Songs
    {
        public static Song BenTrenTangLau = new Song { SongName = "Bên trên tầng lầu", SingerName = "Tăng Duy Tân", SongDuration = "3:22", SongLinkUri = new Uri("pack://siteoforigin:,,,/Resource/Songs/BenTrenTangLau/BenTrenTangLau.mp3"), SongImageUri = new Uri("pack://siteoforigin:,,,/Resource/Images/BenTrenTangLauImg.jfif", UriKind.RelativeOrAbsolute), AlbumName="Bên Trên Lầu Xanh" };
        public static Song CamNang = new Song { SongName = "Cảm nắng", SingerName = "Suni Hạ Linh ft Rtee", SongDuration = "3:48", SongLinkUri = new Uri("pack://siteoforigin:,,,/Resource/Songs/CamNang/CamNang.mp3"), SongImageUri = new Uri("pack://siteoforigin:,,,/Resource/Images/CamNangImg.jpg", UriKind.RelativeOrAbsolute), AlbumName = "Cảm Nắng" };
        public static Song DauMua = new Song { SongName = "Dấu mưa", SingerName = "Trung Quân Idol", SongDuration = "4:20", SongLinkUri = new Uri("pack://siteoforigin:,,,/Resource/Songs/DauMua/DauMua.mp3"), SongImageUri = new Uri("pack://siteoforigin:,,,/Resource/Images/DauMua.jpg", UriKind.RelativeOrAbsolute), AlbumName = "Ahihi" };
        public static ObservableCollection<Song> AllSong = new ObservableCollection<Song>(DataProvider.Ins.DB.Songs.ToList());
        public static void InitUri()
        {
            for (int i = 0; i < AllSong.Count; i++)
            {
                Song song = AllSong[i];
                Song.InitUri(ref song);
            }
        }
    }
}
