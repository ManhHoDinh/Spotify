using Spotify.Models;
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
    /// Interaction logic for SongView.xaml
    /// </summary>
    public class SongSelect : DependencyObject
    {
        public string SongName
        {
            get { return (string)GetValue(SongNameProperty); }
            set { SetValue(SongNameProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SongName.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SongNameProperty =
            DependencyProperty.Register("SongName", typeof(string), typeof(SongView), new PropertyMetadata(string.Empty));
        public string SingerName
        {
            get { return (string)GetValue(SingerNameProperty); }
            set { SetValue(SingerNameProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SongName.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SingerNameProperty =
            DependencyProperty.Register("SingerName", typeof(string), typeof(SongView), new PropertyMetadata(string.Empty));
        public Uri LinkSong
        {
            get { return (Uri)GetValue(LinkSongProperty); }
            set { SetValue(LinkSongProperty, value); }
        }
        public static readonly DependencyProperty LinkSongProperty =
          DependencyProperty.Register("LinkSong", typeof(Uri), typeof(SongView), new PropertyMetadata(null));
        public Uri ImageSong
        {
            get { return (Uri)GetValue(ImageSongProperty); }
            set { SetValue(ImageSongProperty, value); }
        }
        public static readonly DependencyProperty ImageSongProperty =
           DependencyProperty.Register("ImageSong", typeof(Uri), typeof(SongView), new PropertyMetadata(null));
        public static SongSelect Ins { get; private set; }
        static SongSelect()
        {
            Ins = new SongSelect();

        }
    }
    public partial class SongView : UserControl
    {
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {

            base.OnPropertyChanged(e);
            if (e.Property == IsPlayProperty)
            {

               
                            if (IsPlay == true)
                            {
                                ImageBrush ImgBrush = new ImageBrush();
                                ImgBrush.ImageSource = PauseGreen;
                                PlayPauseGreen.Background = ImgBrush;
                            }
                            else
                            {
                                
                                ImageBrush ImgBrush = new ImageBrush();
                                ImgBrush.ImageSource = PlayGreen;
                                PlayPauseGreen.Background = ImgBrush;
                            }
                           
                        }
                

        }
        public SongView()
        {

            InitializeComponent();
            Random r = new Random();
            Color RandomColor = Color.FromRgb((byte)r.Next(1, 255), (byte)r.Next(1, 255), (byte)r.Next(1, 233));
            string hex = RandomColor.R.ToString("X2") + RandomColor.G.ToString("X2") + RandomColor.B.ToString("X2");
            color = "#" + hex;
            Binding binding = new Binding("IsPlay");
            binding.Source = SongBottom.Ins;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(song, IsPlayProperty, binding);
            
        }


        public bool IsPlay
        {
            get { return (bool)GetValue(IsPlayProperty); }
            set { SetValue(IsPlayProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsPlay.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsPlayProperty =
            DependencyProperty.Register("IsPlay", typeof(bool), typeof(SongView), new PropertyMetadata(false));

         ImageSource PlayGreen = (ImageSource)Application.Current.Resources["PlayFill"];
         ImageSource PauseGreen = (ImageSource)Application.Current.Resources["PauseFill"];


        public Song SelectedSong

        {
            get { return (Song)GetValue(SelectedSongProperty); }
            set { SetValue(SelectedSongProperty, value); }
        }

        // Using a DependencyProperty as the backing store for NameSong.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedSongProperty =
            DependencyProperty.Register("SelectedSong", typeof(Song), typeof(SongView), new PropertyMetadata(null));


        public string color
        {
            get { return (string)GetValue(colorProperty); }
            set { SetValue(colorProperty, value); }
        }

        // Using a DependencyProperty as the backing store for color.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty colorProperty =
            DependencyProperty.Register("color", typeof(string), typeof(SongView), new PropertyMetadata("red"));
        public bool isFavor
        {
            get { return (bool)GetValue(isFavorProperty); }
            set { SetValue(isFavorProperty, value); }
        }
        // Using a DependencyProperty as the backing store for IsFavor.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty isFavorProperty =
            DependencyProperty.Register("isFavor", typeof(bool), typeof(SongView), new PropertyMetadata(true));
        private void PlayPauseGreen_Click(object sender, RoutedEventArgs e)
        {
            if(SongBottom.Ins.SelectedSong == null || SongBottom.Ins.SelectedSong.SongName != SongNameTb.Text)
            {
                
                SongBottom.Ins.SelectedSong = SongBottom.Ins.SongSource.Where(s => s.SongName == SongNameTb.Text).FirstOrDefault();
                ImageBrush img = new ImageBrush();
                img.ImageSource = PauseGreen;
                PlayPauseGreen.Background = img;
            }
            else
            {
                if (SongBottom.Ins.IsPlay == true)
                {

                    SongBottom.Ins.IsPlay = false;
                }
                else
                {

                    SongBottom.Ins.IsPlay = true;
                }
            }
               

        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button HeartBtn = sender as Button;

            if (isFavor)
            {
                ImageSource Heart = (ImageSource)Application.Current.Resources["HeartButton"];
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = Heart;
                HeartBtn.Background = ImgBrush;
                isFavor = false;
                

            }
            else
            {
                ImageSource HeartFill = (ImageSource)Application.Current.Resources["HeartFillButton"];
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = HeartFill;
                HeartBtn.Background = ImgBrush;
                isFavor = true;
                

            }


        }

        private void song_Loaded(object sender, RoutedEventArgs e)
        {
           if(SongBottom.Ins.SelectedSong != null)
            {
                if (SongBottom.Ins.SelectedSong.SongName != SongNameTb.Text)
                {
                    ImageBrush img = new ImageBrush();
                    img.ImageSource = PlayGreen;
                    PlayPauseGreen.Background = img;
                }
            }
           

        }
    }
}
