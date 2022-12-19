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
       private void LikedSongs(object obj) => CurrentView = new LikedSongsVM();
        private void Search(object obj) => CurrentView = new SearchVM();
        private void YourLibrary(object obj) => CurrentView = new YourLibraryVM();
        private void CreatePlaylist(object obj)
        {
            int count = ListPlaylist.Ins.CountPlaylist;
            CurrentView = new CreatePlaylistVM();
            ListPlaylist.Ins.List.Add(new Playlist { NamePlaylist = "My playlist #" + count.ToString(), DescriptionPlaylist = "" });
            ListPlaylist.Ins.SelectedItem = ListPlaylist.Ins.List[count - 1];
            ListPlaylist.Ins.CountPlaylist++;
        }
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
