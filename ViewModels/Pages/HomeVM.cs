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
                { AlbumName = SelectedItem.Name; 
                  AlbumDescription = SelectedItem.Description; 
                  IsAlbumItemVisible = true; 
                  IsAlbumListVisible = false; 
                }
            }
        }
        private string _AlbumName;
        public string AlbumName { get => _AlbumName; set { _AlbumName = value; OnPropertyChanged(); } }
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
            RecommendPlaylists.Add(new Album { Name = "chill", Description = "chillllll"}); ;
            RecommendPlaylists.Add(new Album { Name = "Bên trên tâng lầu", Description = "Tăng Duy Tân" });
            RecommendPlaylists.Add(new Album { Name = "Say nắng", Description = "Suni Hạ Linh" });
            RecommendPlaylists.Add(new Album { Name = "Có chắc yêu là đây", Description = "Sơn Tùng MTP" });
            RecommendPlaylists.Add(new Album { Name = "chill", Description = "chillllll" });
            RecommendPlaylists.Add(new Album { Name = "chill", Description = "chillllll" });
            TopMix = new ObservableCollection<Album>();
            TopMix.Add(new Album { Name = "chill", Description = "chillllll" });
            TopMix.Add(new Album { Name = "Bên trên tâng lầu", Description = "Tăng Duy Tân" });
            TopMix.Add(new Album { Name = "Say nắng", Description = "Suni Hạ Linh" });
            TopMix.Add(new Album { Name = "Có chắc yêu là đây", Description = "Sơn Tùng MTP" });
            TopMix.Add(new Album { Name = "chill", Description = "chillllll" });
            TopMix.Add(new Album { Name = "chill", Description = "chillllll" });
            MadeForYou = new ObservableCollection<Album>();
            MadeForYou.Add(new Album { Name = "chill", Description = "chillllll" });
            MadeForYou.Add(new Album { Name = "chill", Description = "chillllll" });
            MadeForYou.Add(new Album { Name = "chill", Description = "chillllll" });
            MadeForYou.Add(new Album { Name = "chill", Description = "chillllll" });
            MadeForYou.Add(new Album { Name = "chill", Description = "chillllll" });
            MadeForYou.Add(new Album { Name = "chill", Description = "chillllll" });
            JumBack = new ObservableCollection<Album>();
            ObservableCollection<Song> list = new ObservableCollection<Song>();
            list.Add(new Song { ID = 1, Name = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = 2, Name = "chúng ta không về nhau", NameSinger = "Sơn ùng", DurationSong = "3:25" });
            list.Add(new Song { ID = 3, Name = "chúng ta không thuộc nhau", NameSinger = "ơn Tùng", DurationSong = "3:231" });
            list.Add(new Song { ID = 4, Name = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = 5, Name = "chúng ta không về nhau", NameSinger = "Sơn ùng", DurationSong = "3:25" });
            list.Add(new Song { ID = 6, Name = "chúng ta không thuộc nhau", NameSinger = "ơn Tùng", DurationSong = "3:231" });
            list.Add(new Song { ID = 7, Name = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = 8, Name = "chúng ta không về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:25" });
            list.Add(new Song { ID = 9 ,Name = "chúng ta không thuộc nhau", NameSinger = "ơn Tùng", DurationSong = "3:231" });
            list.Add(new Song { ID = 10, Name = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = 11, Name = "chúng ta không về nhau", NameSinger = "Sơn ùng", DurationSong = "3:25" });
            list.Add(new Song { ID = 12, Name = "chúng ta không thuộc nhau", NameSinger = "Sơn Tùng", DurationSong = "3:231" });
            JumBack.Add(new Album { Name = "chill", Description = "chillllll", songs=list});
            JumBack.Add(new Album { Name = "chill", Description = "chillllll", songs = list });
            JumBack.Add(new Album { Name = "chill", Description = "chillllll", songs = list });
            JumBack.Add(new Album { Name = "chill", Description = "chillllll}", songs = list });
            JumBack.Add(new Album { Name = "chill", Description = "chillllll", songs = list });
            JumBack.Add(new Album { Name = "chill", Description = "chillllll", songs = list });
            Recently = new ObservableCollection<Album>();
            Recently.Add(new Album { Name = "chill", Description = "chillllll"  });
            Recently.Add(new Album { Name = "chill", Description = "chillllll" });
            Recently.Add(new Album { Name = "chill", Description = "chillllll" });
            Recently.Add(new Album { Name = "chill", Description = "chillllll" });
            Recently.Add(new Album { Name = "chill", Description = "chillllll" });
            Recently.Add(new Album { Name = "chill", Description = "chillllll" });

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
