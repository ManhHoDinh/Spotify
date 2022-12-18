﻿using System;
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
using System.Windows.Media;
using System.Windows;
using System.Drawing;


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
        public void ChangeViewStyle(string value, object obj)
        {
            StackPanel stack = obj as StackPanel;
            foreach(object p in stack.Children)
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
                    tb.Foreground = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(179,179,179));
                    if (btn.Name != "CreatePlaylist" && btn.Name != "LikeSongs")
                    {
                        img.Source = (ImageSource)Application.Current.Resources[btn.Name + "Icon"];
                        
                    }
                  
                }
            }
        }
        private void Home(object obj)
        {
            ViewPage.Ins.CurrentView = new HomeVM();

            ChangeViewStyle("Home", obj);

        }
        private void CreatePlaylist(object obj)
        {
            ViewPage.Ins.CurrentView = new CreatePlaylist();
            ChangeViewStyle("CreatePlaylist", obj);
        }
        private void LikedSongs(object obj)
        {
            ViewPage.Ins.CurrentView = new LikedSongsView();
            ChangeViewStyle("LikeSongs", obj);

        }
        private void Search(object obj)
        {
            ViewPage.Ins.CurrentView = new Search();
            ChangeViewStyle("Search", obj);

        }
        private void YourLibrary(object obj)
        {
            ViewPage.Ins.CurrentView = new YourLibrary();
            ChangeViewStyle("YourLibrary", obj);

        }
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
