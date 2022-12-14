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
        public ObservableCollection<Album> TopMix { get; set; }
        public ObservableCollection<Album> MadeForYou { get; set; }
        public ObservableCollection<Album> Mood { get; set; }
        public ObservableCollection<Album> Popular { get; set; }
        public ObservableCollection<Album> RecommendPlaylists { get; set; }
        public ObservableCollection<Album> Trending { get; set; }
        public ICommand ClickCommand { get; set; }
        void TranslatePage(object obj)
        {
            if (ViewPage.Ins.CurrentView.GetType().Name != obj.GetType().Name)
            {
                int currentId = ViewPage.Ins.CurrentIndexView;
                int count = ViewPage.Ins.ListPage.Count;

                if (currentId < count)
                {
                    for (int i = currentId + 1; i < count; i++)
                    {
                        ViewPage.Ins.ListPage.RemoveAt(1);
                    }
                }
       // MessageBox.Show(SongBottom.Ins.CountId.ToString());
                ViewPage.Ins.CurrentView = obj;
                ViewPage.Ins.ListPage.Add(ViewPage.Ins.CurrentView);
                ViewPage.Ins.CurrentIndexView++;
                ViewPage.Ins.IsDisableBack = false;
            }
        }
        private Album _SelectedItem;
        public Album SelectedItem { get => _SelectedItem; 
            set { _SelectedItem = value; 
                OnPropertyChanged(); 
                if (SelectedItem != null) 
                { 
                  AlbumName = SelectedItem.AlbumName; 
                  AlbumDescription = SelectedItem.Descriptions;
                  SongsOfAlbum = SelectedItem.SongsOfAlbum;
                  AlbumImage = SelectedItem.AlbumImageUri;
                  IsAlbumItemVisible = true; 
                  IsAlbumListVisible = false;
                  TranslatePage(new AlbumView());
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

        private Uri _AlbumImage;
        public Uri AlbumImage { get => _AlbumImage; set { _AlbumImage = value; OnPropertyChanged(); } }
        public HomeVM()
        {
           
            IsAlbumListVisible = true;
            RecommendPlaylists = new ObservableCollection<Album>();
            for(int i = 0; i< 6; i++)
            {
                RecommendPlaylists.Add(Albums.AllAlbums[i]);
            }
            //RecommendPlaylists.Add(new Album { AlbumName = "chill", Descriptions = "chillllll"}); ;
            //RecommendPlaylists.Add(new Album { AlbumName = "B??n tr??n t??ng l???u", Descriptions = "T??ng Duy T??n" });
            //RecommendPlaylists.Add(new Album { AlbumName = "Say n???ng", Descriptions = "Suni H??? Linh" });
            //RecommendPlaylists.Add(new Album { AlbumName = "C?? ch???c y??u l?? ????y", Descriptions = "S??n T??ng MTP" });
            //RecommendPlaylists.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            //RecommendPlaylists.Add(new Album { AlbumName = "chill", Descriptions = "chillllll" });
            TopMix = new ObservableCollection<Album>();
            Popular = new ObservableCollection<Album>();
            MadeForYou = new ObservableCollection<Album>();
            Mood = new ObservableCollection<Album>();
            Trending = new ObservableCollection<Album>();
            for (int i = 0; i < Albums.AllAlbums.Count; i++)
            {
                if(i < 6)
                {
                    TopMix.Add(Albums.AllAlbums[i]);
                }
                else if(i < 12)
                {
                    MadeForYou.Add(Albums.AllAlbums[i]);
                }
                else if(i < 18)
                {
                    Popular.Add(Albums.AllAlbums[i]);
                }
                else if (i < 24)
                {
                    Mood.Add(Albums.AllAlbums[i]); 
                }
                else
                {
                    Trending.Add(Albums.AllAlbums[i]);
                }

            }
            
           
            

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
