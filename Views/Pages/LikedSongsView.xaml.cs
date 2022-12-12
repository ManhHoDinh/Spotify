﻿using Spotify.ViewModels.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Spotify.Views.Pages
{
    /// <summary>
    /// Interaction logic for LikedSongsView.xaml
    /// </summary>
    public partial class LikedSongsView : UserControl
    {
        public LikedSongsView()
        {
            InitializeComponent();
        }
        private void Load_SongView(object sender, RoutedEventArgs e)
        {
            LikedSongsVM list = new LikedSongsVM();
            list.LoadListSong();
            ListSongItems.DataContext = list;
        }
    }
}