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
                
                
                if (ViewPage.Ins.IsClick == false)
                {
                   
                    int currentId = ViewPage.Ins.CurrentIndexView;
                    int count = ViewPage.Ins.ListPage.Count;
                    if (currentId + 1 < count)
                    {

                        for (int i = currentId + 1; i < count; i++)
                        {
                            ViewPage.Ins.ListPage.RemoveAt(currentId + 1);
                        }

                        if (ListPlaylist.Ins.CurrentIdPlaylist != -1)
                        {
                            if (ListPlaylist.Ins.CurrentIdPlaylist == ListPlaylist.Ins.ListSelectedItem.Count - 1)
                            {
                                for (int i = ListPlaylist.Ins.CurrentIdPlaylist; i < ListPlaylist.Ins.ListSelectedItem.Count; i++)
                                {
                                    ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist);
                                }
                            }

                            else
                            {
                                int countPlaylist = ListPlaylist.Ins.ListSelectedItem.Count;
                                for (int i = ListPlaylist.Ins.CurrentIdPlaylist + 1; i < countPlaylist; i++)
                                {

                                    ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist + 1);
                                }

                            }
                        }
                        if (ListAlbum.Ins.CurrentIdAlbum != -1)
                        {
                            if (ListAlbum.Ins.CurrentIdAlbum == ListAlbum.Ins.ListSelectedItem.Count - 1)
                            {
                                for (int i = ListAlbum.Ins.CurrentIdAlbum; i < ListAlbum.Ins.ListSelectedItem.Count; i++)
                                {
                                    ListAlbum.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist);
                                }
                            }


                            else
                            {
                                int countAlbum = ListAlbum.Ins.ListSelectedItem.Count;
                                for (int i = ListAlbum.Ins.CurrentIdAlbum + 1; i < countAlbum; i++)
                                {

                                    ListAlbum.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist + 1);
                                }

                            }
                        }

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
            set {
                try {
                    _SelectedItem = value;
                    OnPropertyChanged();
                    if (SelectedItem != null)
                    {
                        
                        Binding binding = new Binding("SelectedItem");
                        binding.Source = this;
                        binding.Mode = BindingMode.TwoWay;
                        BindingOperations.SetBinding(ListAlbum.Ins, ListAlbum.SelectedAlbumProperty, binding);
                        if(ViewPage.Ins.IsClick == false)
                        {
                            ListAlbum.Ins.ListSelectedItem.Add(SelectedItem.ID);
                            ListAlbum.Ins.CurrentIdAlbum++;
                        }
                        
                        AlbumName = SelectedItem.AlbumName;
                        AlbumDescription = SelectedItem.Descriptions;
                        SongsOfAlbum = SelectedItem.SongsOfAlbum;
                        AlbumImage = SelectedItem.AlbumImageUri;
                        IsAlbumItemVisible = true;
                        IsAlbumListVisible = false;
                        TranslatePage(new AlbumView());
                        
                    }
                }
                catch { }
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

                   // BindingOperations.SetBinding(SongBottom.Ins, SongBottom.SelectedSongProperty, AlbumView.binding);
                    AlbumView.type = "album";
                    SongBottom.Ins.SongName = SelectedSongItem.SongName;
                    SongBottom.Ins.SingerName = SelectedSongItem.SingerName;
                    SongBottom.Ins.LinkSong = SelectedSongItem.SongLinkUri;
                    SongBottom.Ins.ImageSong = SelectedSongItem.SongImageUri;
                    
                    SongBottom.Ins.IsPlay = true;
                    int xx = SelectedItem.ID;
                    
                    if (xx <= 6)
                    {
                       ListAlbumView.PreType = ListAlbumView.type = "TopMix";
                       ListAlbumView.id = xx - 1;
                    }
                    if (xx >= 7 && xx <= 12)
                    {
                        ListAlbumView.PreType = ListAlbumView.type = "MadeForYou";
                        ListAlbumView.id = xx - 7;

                        }
                        if (xx >= 13 && xx <= 18)
                        {

                            ListAlbumView.PreType = ListAlbumView.type = "Popular";
                            ListAlbumView.id = xx - 13;

                        }
                        if (xx >= 19 && xx <= 24)
                        {
                            ListAlbumView.PreType = ListAlbumView.type = "Mood";
                            ListAlbumView.id = xx - 19;

                        }
                        if (xx > 25)
                        {
                            ListAlbumView.PreType = ListAlbumView.type = "Trending";
                            ListAlbumView.id = xx - 25;

                        }
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
 
                RecommendPlaylists.Add(Albums.AllAlbums[10]);
                RecommendPlaylists.Add(Albums.AllAlbums[12]);
                RecommendPlaylists.Add(Albums.AllAlbums[24]);
                RecommendPlaylists.Add(Albums.AllAlbums[21]);
                RecommendPlaylists.Add(Albums.AllAlbums[11]);
                RecommendPlaylists.Add(Albums.AllAlbums[22]);

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
