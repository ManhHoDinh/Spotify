using Spotify.Models;
using Spotify.ViewModels;
using Spotify.ViewModels.Pages;
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
    /// Interaction logic for Search.xaml
    /// </summary>
    public partial class Search : UserControl
    {

        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {
            base.OnPropertyChanged(e);
            //if (e.Property == IsPlayProperty)
            //{
            //    if (IsPlay == true)
            //    {
            //        ImageBrush ImgBrush = new ImageBrush();
            //        ImgBrush.ImageSource = Pause;
            //        PlayPauseGreen.Background = ImgBrush;
            //    }
            //    else
            //    {
            //        ImageBrush ImgBrush = new ImageBrush();
            //        ImgBrush.ImageSource = Play;
            //        PlayPauseGreen.Background = ImgBrush;
            //    }
            //    // what is the code that would go here?
            //}
        }
        public Search()
        {
            InitializeComponent();

            //PreparingSearch.Visibility = Visibility.Visible;
            //BeginingSearch.Visibility = Visibility.Hidden;
        
        }

        private void CloseBtn_Click(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;
            int index = int.Parse(btn.Tag.ToString());
            Song song = DataProvider.Ins.DB.Songs.Where(a => a.ID == index).First();
            Playlists.Ins.RecentSearchPlaylist.SongsOfPlaylist.Remove(song);
            Playlists.Ins.RecentSearchPlaylist.Songs.Remove(song);
            DataProvider.Ins.DB.SaveChanges();
        }
    }
       
    
}

