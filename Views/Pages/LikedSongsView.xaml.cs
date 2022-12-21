using Spotify.ViewModels.Pages;
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
    /// Interaction logic for LikedSongsView.xaml
    /// </summary>
    public partial class LikedSongsView : UserControl
    {

        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {
            base.OnPropertyChanged(e);
            if (e.Property == IsPlayProperty)
            {
                if (IsPlay == true)
                {
                    ImageBrush ImgBrush = new ImageBrush();
                    ImgBrush.ImageSource = Pause;
                    PlayPauseGreen.Background = ImgBrush;
                }
                else
                {
                    ImageBrush ImgBrush = new ImageBrush();
                    ImgBrush.ImageSource = Play;
                    PlayPauseGreen.Background = ImgBrush;      
                }
                // what is the code that would go here?
            }
        }
        public bool IsPlay
        {
            get { return (bool)GetValue(IsPlayProperty); }
            set { SetValue(IsPlayProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsPlay.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsPlayProperty =
            DependencyProperty.Register("IsPlay", typeof(bool), typeof(LikedSongsView), new PropertyMetadata(false));


        public LikedSongsView()
        {
            InitializeComponent();
            Binding binding = new Binding("IsPlay");
            binding.Source = SongBottom.Ins;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(LikeSong, IsPlayProperty, binding);
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
