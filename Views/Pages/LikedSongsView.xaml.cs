using Spotify.Models;
using Spotify.ViewModels.Pages;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
        public static int id = 0;
      
        public LikedSongsView()
        {
            InitializeComponent();
            SongBottom.Ins.ListSong = ListLikeSongs.ItemSource;
 
        }

        private void LikeSong_Loaded(object sender, RoutedEventArgs e)
        {
            LikedSongsVM vm = this.DataContext as LikedSongsVM;
            
            var songs = DataProvider.Ins.DB.Playlists.Where(a => a.PlaylistType == 0 && a.UserID == Properties.Settings.Default.CurrentUserID).Select(a => a.Songs).FirstOrDefault();
            if(id != ViewPage.Ins.UserId)
            {
                vm.listSong = new ObservableCollection<Song>(songs);
                id = ViewPage.Ins.UserId;
            }
            
            
        }
    }
}
