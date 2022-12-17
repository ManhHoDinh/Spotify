using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Spotify.ViewModels.Pages;
using System.Transactions;
using System.Windows.Input;
using Spotify.Views.Pages;
using System.Windows.Controls;
using Spotify.Utilities;
namespace Spotify.ViewModels
{
    internal class NavigationVM:Utilities.BaseViewModel
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

        private void Home(object obj)
        {
            ViewPage.Ins.IsBackHome = true;
            ViewPage.Ins.CurrentView = new HomeVM();
        }
        private void CreatePlaylist(object obj) => ViewPage.Ins.CurrentView = new CreatePlaylist();
        private void LikedSongs(object obj) => ViewPage.Ins.CurrentView = new LikedSongsView();
        private void Search(object obj) => ViewPage.Ins.CurrentView = new Search();
        private void YourLibrary(object obj) => ViewPage.Ins.CurrentView = new YourLibrary();
        private void Album(object obj) => ViewPage.Ins.CurrentView = new AlbumView();
        public NavigationVM()
        {
            HomeCommand = new RelayCommand(Home);
            CreatePlaylistCommand = new RelayCommand(CreatePlaylist);
            LikedSongsCommand = new RelayCommand(LikedSongs);
            SearchCommand = new RelayCommand(Search);
            YourLibraryCommand = new RelayCommand(YourLibrary);
            AlbumCommand = new RelayCommand(Album);

            // Startup Page
            ViewPage.Ins.CurrentView = new Home();
        }
    }
}
