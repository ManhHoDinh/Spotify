using Spotify.Models;
using Spotify.ViewModels.Pages;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
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
    /// Interaction logic for Home.xaml
    /// </summary>
    
    public partial class Home : UserControl
    {
        
        public Home()
        {
          InitializeComponent();
            if(DateTime.Now.Hour >= 0 && DateTime.Now.Hour < 12)
            {
                timeText.Text = "Good Morning";
            }
            else if(DateTime.Now.Hour > 12 && DateTime.Now.Hour<18)
            {
                timeText.Text = "Good Afternoon";
            }
            else 
            {
                timeText.Text = "Good Evening";
            }
        }
        private void Favor_Click(object sender, RoutedEventArgs e)
        {
            
        }
        ImageSource Play = (ImageSource)Application.Current.Resources["PlayFill"];
        ImageSource Pause = (ImageSource)Application.Current.Resources["PauseFill"];
        private void PlayPauseGreen_Click(object sender, RoutedEventArgs e)
        {
            //id = int.Parse((sender as Button).Tag.ToString());
            ImageBrush ImgBrush = new ImageBrush();
            if (SongBottom.Ins.SelectedSong == null)
            {
                
                SongBottom.Ins.IsPlay = true;
                ImgBrush.ImageSource = Pause;
            }
            else
            {

                if (SongBottom.Ins.IsPlay == true)
                {
                    ImgBrush.ImageSource = Play;
                    SongBottom.Ins.IsPlay = false;
                }
                else
                {
                    ImgBrush.ImageSource = Pause;
                    SongBottom.Ins.IsPlay = true;

                }
            }

            //if (IsPlay == true)
            //{
            //    ImgBrush.ImageSource = Play;
            //    IsPlay = false;
            //}
            //else
            //{
            //    ImgBrush.ImageSource = Pause;
            //    IsPlay = true;
            //}
            (sender as Button).Background = ImgBrush;
            HomeVM vm = this.DataContext as HomeVM;
            int IdAlbum = int.Parse((sender as Button).Tag.ToString());
            var AlbumPlay = DataProvider.Ins.DB.Albums.Where(a => a.ID == IdAlbum).FirstOrDefault();
            vm.SelectedSongItem = AlbumPlay.SongsOfAlbum[0];
        }
        //private void PlayPauseGreen_Click(object sender, RoutedEventArgs e)
        //{
        //    HomeVM vm = this.DataContext as HomeVM;
        //    int IdAlbum = int.Parse((sender as Button).Tag.ToString());
        //    var AlbumPlay = DataProvider.Ins.DB.Albums.Where(a => a.ID == IdAlbum).FirstOrDefault();
        //    vm.SelectedSongItem = AlbumPlay.SongsOfAlbum[0];
        //}

    }
}
