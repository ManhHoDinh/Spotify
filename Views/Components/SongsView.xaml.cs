using System.Windows.Controls;
using Spotify.ViewModels.Pages;



namespace Spotify.Views.Components
{
    /// <summary>
    /// Interaction logic for SongsView.xaml
    /// </summary>
    public partial class SongsView : UserControl
    {
        public SongsView()
        {
            InitializeComponent();
        }

        private void ListViewSong_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LikedSongsVM a = new LikedSongsVM();
            a.LoadListSong();
        }
    }
}
