using Spotify.Views.Components;
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
    /// Interaction logic for AlbumView.xaml
    /// </summary>
    public partial class AlbumView : UserControl
    {
        public AlbumView()
        {
            InitializeComponent();
        }
        ImageSource Play = (ImageSource)Application.Current.Resources["PlayFill"];
        ImageSource Pause = (ImageSource)Application.Current.Resources["PauseFill"];
        private void PlayPauseGreen_Click(object sender, RoutedEventArgs e)
        {
            ImageBrush ImgBrush = new ImageBrush();
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
            PlayPauseGreen.Background = ImgBrush;
        }

    }
}
