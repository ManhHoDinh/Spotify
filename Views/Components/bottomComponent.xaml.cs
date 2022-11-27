using Microsoft.Win32;
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
using System.Windows.Threading;

namespace Spotify.Views.Components
{
    /// <summary>
    /// Interaction logic for bottomComponent.xaml
    /// </summary>
    public partial class bottomComponent : UserControl
    {
        public bottomComponent()
        {
            InitializeComponent();
        }
        string fileName = "";
        MediaPlayer mediaPlayer = new MediaPlayer();
        public bool IsMute = false;
        public double PrevVolume;
        public string PrevVolumeIcon = "";
        public double PrevVolumeSlider;
        public bool IsPlay;
        public bool IsFavor = false;
        public bool IsDrag = false;
        public string isFavor
        {
            get { return (string)GetValue(isFavorProperty); }
            set { SetValue(isFavorProperty, value); }
        }
        // Using a DependencyProperty as the backing store for IsFavor.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty isFavorProperty =
            DependencyProperty.Register("isFavor", typeof(string), typeof(bottomComponent), new PropertyMetadata("true"));
        //button open the file mp3


        public string VolumeStyle
        {
            get { return (string)GetValue(VolumeStyleProperty); }
            set { SetValue(VolumeStyleProperty, value); }
        }

        // Using a DependencyProperty as the backing store for VolumeStyle.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty VolumeStyleProperty =
            DependencyProperty.Register("VolumeStyle", typeof(string), typeof(bottomComponent), new PropertyMetadata("Medium"));


        private void Btn_open(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Multiselect = false,
                DefaultExt = ".mp3"
            };
            bool? diablogOk = openFileDialog.ShowDialog();
            if (diablogOk == true)
            {
                fileName = openFileDialog.FileName;
                mediaPlayer.Open(new Uri(fileName));
                DispatcherTimer timer = new DispatcherTimer();
                timer.Interval = TimeSpan.FromSeconds(1);
                timer.Tick += timer_Tick;
                mediaPlayer.Play();
                timer.Start();
            }
        }
        // add second when the song is playing
        void timer_Tick(object sender, EventArgs e)
        {
            if (mediaPlayer.Source != null && mediaPlayer.NaturalDuration.HasTimeSpan && (!IsDrag))
            {
                slider.Maximum = mediaPlayer.NaturalDuration.TimeSpan.TotalSeconds;
                slider.Value = mediaPlayer.Position.TotalSeconds;
                playing.Content = mediaPlayer.Position.ToString(@"mm\:ss");
                Duration.Content = mediaPlayer.NaturalDuration.TimeSpan.ToString(@"mm\:ss");
            }
        }
        //button pause or play the song
        //private void btnPlayPause_Click(object sender, RoutedEventArgs e)
        //{

        //    if (IsPlay)
        //    {
        //        mediaPlayer.Pause();
        //        Icon = "Play";
        //        IsPlay = false;
        //    }
        //    else
        //    {
        //        mediaPlayer.Play();
        //        Icon = "Pause";
        //        IsPlay = true;
        //    }
        //}
        //set icon when play or pause
        //public string Icon
        //{
        //    get { return (string)GetValue(IconProperty); }
        //    set { SetValue(IconProperty, value); }
        //}

        //// Using a DependencyProperty as the backing store for IconProperty.  This enables animation, styling, binding, etc...
        //public static readonly DependencyProperty IconProperty =
        //    DependencyProperty.Register("Icon", typeof(string), typeof(bottomComponent), new PropertyMetadata("Pause"));
        //set volume icon when adjust the volume
        //public string VolumeIcon
        //{
        //    get { return (string)GetValue(VolumeIconProperty); }
        //    set { SetValue(VolumeIconProperty, value); }
        //}

        //// Using a DependencyProperty as the backing store for VolumnIcon.  This enables animation, styling, binding, etc...
        //public static readonly DependencyProperty VolumeIconProperty =
        //    DependencyProperty.Register("VolumeIcon", typeof(string), typeof(bottomComponent), new PropertyMetadata("VolumeDown"));

        //color when hover to button control 
        //public string Color
        //{
        //    get { return (string)GetValue(ColorProperty); }
        //    set { SetValue(ColorProperty, value); }
        //}

        //// Using a DependencyProperty as the backing store for ColorProperty.  This enables animation, styling, binding, etc...
        //public static readonly DependencyProperty ColorProperty =
        //    DependencyProperty.Register("Color", typeof(string), typeof(bottomComponent), new PropertyMetadata("#D9D9D9"));
        //change label of position mediaplayer when the song is playing
        private void slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            playing.Content = String.Format("{0}", mediaPlayer.Position.ToString(@"mm\:ss"));
        }
        // event when drag the thumb of slider
        private void slider_DragStarted(object sender, System.Windows.Controls.Primitives.DragStartedEventArgs e)
        {
            IsDrag = true;
        }
        // event when complete drag the thumg of slider
        private void slider_DragCompleted(object sender, System.Windows.Controls.Primitives.DragCompletedEventArgs e)
        {
            mediaPlayer.Position = TimeSpan.FromSeconds(slider.Value);
            IsDrag = false;
        }
        //change the volume icon when value of volume slider change
        private void volumeSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            mediaPlayer.Volume = (double)volumeSlider.Value;  
            if (volumeSlider.Value < 0.8 && volumeSlider.Value > 0.3)
            {
                ImageSource VolumnMedium =(ImageSource)Application.Current.Resources["VolumeMediumButton"];
                ImageBrush brush = new ImageBrush();
                brush.ImageSource = VolumnMedium;
                VolumeButton.Background = brush;
                VolumeStyle = "Medium";
            }
            if (volumeSlider.Value <=0.3)
            {
                ImageSource VolumnMin = (ImageSource)Application.Current.Resources["VolumeMinButton"];
                ImageBrush brush = new ImageBrush();
                brush.ImageSource = VolumnMin;
                VolumeButton.Background = brush;
                VolumeStyle = "Min";

            }
            if (volumeSlider.Value > 0.8)
            {
                ImageSource VolumnMax = (ImageSource)Application.Current.Resources["VolumeMaxButton"];
                ImageBrush brush = new ImageBrush();
                brush.ImageSource = VolumnMax;
                VolumeStyle = "Max";
                VolumeButton.Background = brush;
            }
        }
        private void MuteVolume_Click(object sender, RoutedEventArgs e)
        {
            if (IsMute == false)
            {
                //PrevVolumeIcon = VolumeIcon;
                //VolumeIcon = "VolumeOff";
                PrevVolumeSlider = volumeSlider.Value;
                volumeSlider.Value = 0;
                PrevVolume = mediaPlayer.Volume;
                mediaPlayer.Volume = 0;
                IsMute = true;
            }
            else
            {
                mediaPlayer.Volume = PrevVolume;
                //VolumeIcon = PrevVolumeIcon;
                volumeSlider.Value = PrevVolumeSlider;
                IsMute = false;
            }
        }

        private void PlayPause_Click(object sender, RoutedEventArgs e)
        {
            ImageSource Play = (ImageSource)Application.Current.Resources["PlayButton"];
            ImageSource Pause = (ImageSource)Application.Current.Resources["PauseButton"];
            var a = new ControlTemplate();
            Button PlayPauseBtn = sender as Button;
            if (IsPlay)
            {
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = Pause;
                PlayPauseBtn.Background = ImgBrush;
                IsPlay = false;
            }
            else
            {
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = Play;
                PlayPauseBtn.Background = ImgBrush;
                IsPlay = true;

            }
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Button HeartBtn = sender as Button;
            if (IsFavor)
            {
                ImageSource Heart = (ImageSource)Application.Current.Resources["HeartButton"];
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = Heart;
                HeartBtn.Background = ImgBrush;
                IsFavor = false;
                isFavor = "false";
            }
            else
            {
                ImageSource HeartFill = (ImageSource)Application.Current.Resources["HeartFillButton"];
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = HeartFill;
                HeartBtn.Background = ImgBrush;
                IsFavor = true;
                isFavor = "true";
            }
           

        }
    } 
}
