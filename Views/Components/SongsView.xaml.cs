using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using Spotify.ViewModels.Pages;
using Spotify.Views.Pages;

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
        public bool IsFavor
        {
            get { return (bool)GetValue(IsFavorProperty); }
            set { SetValue(IsFavorProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsFavor.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsFavorProperty =
            DependencyProperty.Register("IsFavor", typeof(bool), typeof(SongsView), new PropertyMetadata(true));
        private void Favor_Click(object sender, RoutedEventArgs e)
        {
            Button HeartBtn = sender as Button;
            int index = int.Parse(HeartBtn.Tag.ToString());

            LikedSongsVM.listSong.RemoveAt(index-1);

        }

        private void NameSong_Click(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;
            ListViewItem curItem = ((ListViewItem)ListViewSong.ContainerFromElement((Button)sender));
            curItem.IsSelected = true;
            ViewPage.Ins.CurrentView = new SongView();
        }
    }
}
