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
       
        private void Home(object obj) => CurrentView = new HomeVM();
        private void CreatePlaylist(object obj) => CurrentView = new CreatePlaylistVM();
        private void LikedSongs(object obj) => CurrentView = new LikedSongsVM();
        private void Search(object obj) => CurrentView = new SearchVM();
        private void YourLibrary(object obj) => CurrentView = new YourLibraryVM();
        public NavigationVM()
        {
            HomeCommand = new RelayCommand(Home);
            CreatePlaylistCommand = new RelayCommand(CreatePlaylist);
            LikedSongsCommand = new RelayCommand(LikedSongs);
            SearchCommand = new RelayCommand(Search);
            YourLibraryCommand = new RelayCommand(YourLibrary);

            // Startup Page
            CurrentView = new HomeVM();
        }
    }
}
