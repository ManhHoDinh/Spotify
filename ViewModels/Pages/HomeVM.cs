using Spotify.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Spotify.Utilities;
using System.Windows.Media;
using System.Windows.Documents;
using Spotify.Views.Components;
using System.Windows.Data;
using Spotify.Views.Pages;

namespace Spotify.ViewModels.Pages
{

    internal class HomeVM : BaseViewModel
    {
        private ObservableCollection<Album> _TopMix;
        public ObservableCollection<Album> TopMix { get; set; }
        private ObservableCollection<Album> _MadeForYou;
        public ObservableCollection<Album> MadeForYou { get; set; }
        private ObservableCollection<Album> _Recently;
        public ObservableCollection<Album> Recently { get; set; }
        private ObservableCollection<Album> _JumBack;
        public ObservableCollection<Album> JumBack { get; set; }
        private ObservableCollection<Album> _RecommendPlaylists;
        public ObservableCollection<Album> RecommendPlaylists { get; set; }
        public ICommand ClickCommand { get; set; }
        private Album _SelectedItem;
        public Album SelectedItem { get => _SelectedItem; 
            set { _SelectedItem = value; 
                OnPropertyChanged(); 
                if (SelectedItem != null) 
                { AlbumName = SelectedItem.AlbumName; 
                  AlbumDescription = SelectedItem.Descriptions;
                  SongsOfAlbum = SelectedItem.SongsOfAlbum;
                  IsAlbumItemVisible = true; 
                  IsAlbumListVisible = false;
                  ViewPage.Ins.CurrentView = new AlbumView();

                }
            }
        }
        private Song _SelectedSongItem;
        public Song SelectedSongItem
        {
            get => _SelectedSongItem;
            set
            {
                _SelectedSongItem = value;
                OnPropertyChanged();
                if (SelectedSongItem != null)
                {
                    SongBottom.Ins.SongName = SelectedSongItem.SongName;
                    SongBottom.Ins.SingerName = SelectedSongItem.SingerName;
                    SongBottom.Ins.LinkSong = SelectedSongItem.SongLinkUri;
                    SongBottom.Ins.ImageSong = SelectedSongItem.SongImageUri;
                    SongBottom.Ins.IsPlay = true;
                }
            }
        }

        private string _AlbumName;
        public string AlbumName { get => _AlbumName; set { _AlbumName = value; OnPropertyChanged(); } }
        private ObservableCollection<Song> _songsOfAlbum = new ObservableCollection<Song>();
        public ObservableCollection<Song> SongsOfAlbum { get => _songsOfAlbum; set { _songsOfAlbum = value; OnPropertyChanged(); } }

        private string _AlbumDescription;
        public string AlbumDescription { get => _AlbumDescription; set { _AlbumDescription = value; OnPropertyChanged(); } }
        private bool _IsAlbumItemVisible;
        public bool IsAlbumItemVisible { get => _IsAlbumItemVisible; set { _IsAlbumItemVisible = value; OnPropertyChanged(); } }
        private bool _IsAlbumListVisible;
        public bool IsAlbumListVisible { get => _IsAlbumListVisible; set { _IsAlbumListVisible = value; OnPropertyChanged(); } }
        public HomeVM()
        {
            IsAlbumListVisible = true;
            RecommendPlaylists = new ObservableCollection<Album>();
            RecommendPlaylists.Add(new Album { AlbumName = "chill", Descriptions = "chillllll"}); ;
            RecommendPlaylists.Add(new Album { AlbumName = "Bên trên tâng lầu", Descriptions = "Tăng Duy Tân" });
            RecommendPlaylists.Add(new Album { AlbumName = "Say nắng", Descriptions = "Suni Hạ Linh" });
            RecommendPlaylists.Add(new Album { AlbumName = "Có chắc yêu là đây", Descriptions = "Sơn Tùng MTP" });
            RecommendPlaylists.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            RecommendPlaylists.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            TopMix = new ObservableCollection<Album>();
            TopMix.Add(new Album { AlbumName = "chill", Descriptions = "chillllll",
                SongsOfAlbum = new ObservableCollection<Song>() { 
                    Songs.DauMua, Songs.CamNang, Songs.BenTrenTangLau
                } });
            TopMix.Add(new Album { AlbumName = "Bên trên tâng lầu", Descriptions = "Tăng Duy Tân" });
            TopMix.Add(new Album { AlbumName = "Say nắng", Descriptions = "Suni Hạ Linh" });
            TopMix.Add(new Album { AlbumName = "Có chắc yêu là đây", Descriptions = "Sơn Tùng MTP" });
            TopMix.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            TopMix.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            MadeForYou = new ObservableCollection<Album>();
            MadeForYou.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            MadeForYou.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            MadeForYou.Add(new Album { AlbumName = "chill", Descriptions= "chillllll" });
            MadeForYou.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            MadeForYou.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            MadeForYou.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            JumBack = new ObservableCollection<Album>();
            ObservableCollection<Song> list = Songs.AllSong;
            list.Add(Songs.CamNang);
            list.Add(Songs.BenTrenTangLau);
            list.Add(Songs.DauMua);
           
            JumBack.Add(new Album { AlbumName = "chill", Descriptions = "chillllll", SongsOfAlbum = list});
            JumBack.Add(new Album { AlbumName = "chill", Descriptions = "chillllll", SongsOfAlbum = list });
            JumBack.Add(new Album { AlbumName = "chill", Descriptions = "chillllll", SongsOfAlbum = list });
            JumBack.Add(new Album { AlbumName = "chill", Descriptions = "chillllll}", SongsOfAlbum = list });
            JumBack.Add(new Album { AlbumName = "chill", Descriptions = "chillllll", SongsOfAlbum = list });
            JumBack.Add(new Album { AlbumName = "chill", Descriptions = "chillllll", SongsOfAlbum = list });
            Recently = new ObservableCollection<Album>();
            Recently.Add(new Album { AlbumName = "chill", Descriptions = "chillllll"  });
            Recently.Add(new Album { AlbumName = "chill", Descriptions= "chillllll" });
            Recently.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            Recently.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            Recently.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            Recently.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });

            ClickCommand = new RelayCommand<object>((p) =>
            {
                MessageBox.Show("success");
                return true;
            }, (p) =>
            {
                MessageBox.Show("success");
            }
            );
        }
    }
}
