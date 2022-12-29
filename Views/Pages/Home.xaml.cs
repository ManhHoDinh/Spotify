using Spotify.Models;
using Spotify.ViewModels.Pages;
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
        }
        private void Favor_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void PlaySong_Click(object sender, RoutedEventArgs e)
        {
            HomeVM vm = this.DataContext as HomeVM;
            int IdAlbum = int.Parse((sender as Button).Tag.ToString());
            var AlbumPlay = DataProvider.Ins.DB.Albums.Where(a => a.ID == IdAlbum).FirstOrDefault();
            vm.SelectedSongItem = AlbumPlay.SongsOfAlbum[0];
        }

    }
}
