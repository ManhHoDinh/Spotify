using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Spotify.ViewModels.Pages;
using System.Windows.Input;
using Spotify.Views.Pages;
using System.Windows.Controls;
using Spotify.Utilities;
using System.Collections.ObjectModel;
using Spotify.Views.Components;
using Spotify.Models;
using System.Windows.Media;
using System.Windows;
using System.Management.Instrumentation;

namespace Spotify.ViewModels
{
    internal class NavigationVM : Utilities.BaseViewModel
    {
        private object _currentView;
        public object CurrentView
        {
            get { return _currentView; }
            set { _currentView = value; OnPropertyChanged(); }
        }
        public ICommand HomeCommand { get; set; }
        public ICommand CreatePlaylistCommand { get; set; }
        public ICommand LikedSongsCommand { get; set; }
        public ICommand SearchCommand { get; set; }
        public ICommand YourLibraryCommand { get; set; }
        public ICommand AlbumCommand { get; set; }
        public ICommand OpenFormDeleteCommand { get; set; }
        public ICommand LoadCommand { get; set; }
        private bool _isSearchView { get; set; }
        public bool IsSearchView { get { return _isSearchView; }
            set { _isSearchView = value; OnPropertyChanged(); } }
        public void ChangeViewStyle(string value, object obj)
        {
            StackPanel stack = obj as StackPanel;
            foreach (object p in stack.Children)
            {
                Button btn = p as Button;
                ControlTemplate ct = btn.Template;
                Image img = (Image)ct.FindName("image", btn);
                TextBlock tb = (TextBlock)ct.FindName("name", btn);
                if (btn.Name == value)
                {

                    tb.Foreground = Brushes.White;
                    if (btn.Name == "Home" || btn.Name == "Search" || btn.Name == "YourLibrary")
                    {
                        img.Source = (ImageSource)Application.Current.Resources[btn.Name + "FillIcon"];
                    }
                }
                else
                {
                    tb.Foreground = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(179, 179, 179));
                    if (btn.Name != "CreatePlaylist" && btn.Name != "LikeSongs")
                    {
                        img.Source = (ImageSource)Application.Current.Resources[btn.Name + "Icon"];

                    }

                }
            }
        }
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
                ViewPage.Ins.CurrentView = obj;
                ViewPage.Ins.ListPage.Add(ViewPage.Ins.CurrentView);
                ViewPage.Ins.CurrentIndexView++;
                ViewPage.Ins.IsDisableBack = false;
            }
        }
        private void Home(object obj)
        {
           
            ChangeViewStyle("Home", obj);
            TranslatePage(new HomeVM());


        }
        private void Search(object obj)
        {
            IsSearchView= true;
            ChangeViewStyle("Search", obj);
            TranslatePage(new SearchVM());
            MessageBox.Show(ListPlaylist.Ins.List[0].PlaylistImage);
            
        }
        private void YourLibrary(object obj)
        {
            ChangeViewStyle("YourLibrary", obj);
            TranslatePage(new YourLibraryVM());
        }
        private void CreatePlaylist(object obj)
        {
            if (ViewPage.Ins.CurrentView.GetType().Name != "CreatePlaylist")
            {
                ViewPage.Ins.ListPage.Add(new CreatePlaylist());
                ViewPage.Ins.CurrentIndexView++;
            }
   
            int count = ListPlaylist.Ins.CountPlaylist;
            Playlist playlist = new Playlist() { PlaylistName = "My playlist #" + count.ToString(), Descriptions = "", PlaylistImage = "pack://siteoforigin:,,,/Resource/Images/InitImage.png", UserID = 1 };
            Playlist.InitUri(ref playlist);
            //MessageBox.Show(playlist.PlaylistName);
            DataProvider.Ins.DB.Playlists.Add(playlist);
            DataProvider.Ins.DB.SaveChanges();
            ListPlaylist.Ins.List.Add(playlist);
            ViewPage.Ins.CurrentView = new CreatePlaylist();
            ListPlaylist.Ins.SelectedItem = ListPlaylist.Ins.List[count - 1];
            ListPlaylist.Ins.CountPlaylist++;

            ChangeViewStyle("CreatePlaylist", obj);
        }

        private void LikedSongs(object obj)
        {
            ChangeViewStyle("LikeSongs", obj);
            TranslatePage(new LikedSongsVM());

        }


        public NavigationVM()
        {
            HomeCommand = new RelayCommand(Home);
            CreatePlaylistCommand = new RelayCommand(CreatePlaylist);
            LikedSongsCommand = new RelayCommand(LikedSongs);
            SearchCommand = new RelayCommand(Search);
            YourLibraryCommand = new RelayCommand(YourLibrary);
            OpenFormDeleteCommand = new RelayCommand(

       (p) =>
       {
           DeleteForm form = new DeleteForm();
           Application.Current.MainWindow.Opacity = 0.3;
           form.ShowDialog();
           Application.Current.MainWindow.Opacity = 1;
       });
            LoadCommand = new RelayCommand(
                 (p) =>
                 {
                     PlayListForm form = new PlayListForm();
                     Application.Current.MainWindow.Opacity = 0.3;
                     form.ShowDialog();
                     Application.Current.MainWindow.Opacity = 1;
                     //  IsVisibleOption = false;
                 });

            // Startup Page
            ViewPage.Ins.CurrentView = new HomeVM();
            ViewPage.Ins.ListPage.Add(ViewPage.Ins.CurrentView);
        }
    }
}
