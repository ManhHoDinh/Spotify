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
using Spotify.ViewModels;
using Spotify.Models;
using Spotify.Views.Pages;
using Spotify.ViewModels.Pages;
using System.Security.Policy;
using System.Collections.ObjectModel;
using System.Reflection;
using System.Runtime.InteropServices;

namespace Spotify.Views.Components
{
    /// <summary>
    /// Interaction logic for bottomComponent.xaml
    /// </summary>
    public class SongBottom: DependencyObject
    {


        public ObservableCollection<Album> PreItemSource

        {
            get { return (ObservableCollection<Album>)GetValue(PreItemSourceProperty); }
            set { SetValue(PreItemSourceProperty, value); }
        }

        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty PreItemSourceProperty =
            DependencyProperty.Register("PreItemSource", typeof(ObservableCollection<Album>), typeof(SongBottom), new PropertyMetadata(null));


        public string SongName
        {
            get { return (string)GetValue(SongNameProperty); }
            set { SetValue(SongNameProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SongName.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SongNameProperty =
            DependencyProperty.Register("SongName", typeof(string), typeof(SongBottom), new PropertyMetadata(string.Empty));
        public string SingerName
        {
            get { return (string)GetValue(SingerNameProperty); }
            set { SetValue(SingerNameProperty, value); }
        }
        
        // Using a DependencyProperty as the backing store for SongName.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SingerNameProperty =
            DependencyProperty.Register("SingerName", typeof(string), typeof(SongBottom), new PropertyMetadata(string.Empty));
        public Uri LinkSong
        {
            get { return (Uri)GetValue(LinkSongProperty); }
            set { SetValue(LinkSongProperty, value); }
        }
        public Uri ImageSong
        {
            get { return (Uri)GetValue(ImageSongProperty); }
            set { SetValue(ImageSongProperty, value); }
        }


        public Song SelectedSong
        {
            get { return (Song)GetValue(SelectedSongProperty); }
            set { SetValue(SelectedSongProperty, value); }
            
        }

        // Using a DependencyProperty as the backing store for SelectedSong.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedSongProperty =
            DependencyProperty.Register("SelectedSong", typeof(Song), typeof(SongBottom), new PropertyMetadata(null));

        public int CountId
        {
            get { return (int)GetValue(CountIdProperty); }
            set { SetValue(CountIdProperty, value); }
        }

        public ObservableCollection<Song> SongSource
        {
            get { return (ObservableCollection<Song>)GetValue(SongSourceProperty); }
            set { SetValue(SongSourceProperty, value); }
        }

        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SongSourceProperty =
            DependencyProperty.Register("SongSource", typeof(ObservableCollection<Song>), typeof(SongBottom), new PropertyMetadata(null));

        // Using a DependencyProperty as the backing store for CountId.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CountIdProperty =
            DependencyProperty.Register("CountId", typeof(int), typeof(SongBottom), new PropertyMetadata(-1));


        public ObservableCollection<Song> ListSong
        {
            get { return (ObservableCollection<Song>)GetValue(ListSongProperty); }
            set { SetValue(ListSongProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ListSong.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ListSongProperty =
            DependencyProperty.Register("ListSong", typeof(ObservableCollection<Song>), typeof(SongBottom), new PropertyMetadata(null));



        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ImageSongProperty =
            DependencyProperty.Register("ImageSong", typeof(Uri), typeof(SongBottom), new PropertyMetadata(null));
        public bool IsPlay
        {
            get { return (bool)GetValue(IsPlayProperty); }
            set
            {
                SetValue(IsPlayProperty, value);


            }
        }

        // Using a DependencyProperty as the backing store for IsPlay.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsPlayProperty =
            DependencyProperty.Register("IsPlay", typeof(bool), typeof(SongBottom), new PropertyMetadata(false));

        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty LinkSongProperty =
            DependencyProperty.Register("LinkSong", typeof(Uri), typeof(SongBottom), new PropertyMetadata(null));
        public static SongBottom Ins { get; private set; }
        static SongBottom()
        {
            Ins = new SongBottom();
     
        }
    }
    public partial class bottomComponent : UserControl
    {
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {
            base.OnPropertyChanged(e);
            if (e.Property == IsPlayProperty)
            {
                if (IsPlay == true)
                {
                    mePlayer.Play();
                    mediaPlayerIsPlaying = true;
                    ImageBrush ImgBrush = new ImageBrush();
                    ImgBrush.ImageSource = Pause;
                    PlayPauseBtn.Background = ImgBrush;
                }
                else
                {
                    mePlayer.Pause();
                    ImageBrush ImgBrush = new ImageBrush();
                    ImgBrush.ImageSource = Play;
                    PlayPauseBtn.Background = ImgBrush;
                    mediaPlayerIsPlaying = false;   

                }
                // what is the code that would go here?
            }
        }
        public bottomComponent()
        {
            InitializeComponent();
            Binding binding = new Binding("IsPlay");
            binding.Source = SongBottom.Ins;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(BottomControl, IsPlayProperty, binding);

           
            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += timer_Tick;
            timer.Start();
        }
  
        public bool IsPlay
        {
            get { return (bool)GetValue(IsPlayProperty); }
            set
            {

                SetValue(IsPlayProperty, value);


            }
        }

        // Using a DependencyProperty as the backing store for IsPlay.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsPlayProperty =
            DependencyProperty.Register("IsPlay", typeof(bool), typeof(bottomComponent), new PropertyMetadata(false));
        private bool mediaPlayerIsPlaying = false;
        string fileName = "";
        MediaPlayer mediaPlayer = new MediaPlayer();
        public bool IsMute = false;
        public double PrevVolume;
        public string PrevVolumeIcon = "";
        public double PrevVolumeSlider;
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

        public bool IsShuffle
        {
            get { return (bool)GetValue(IsShuffleProperty); }
            set { SetValue(IsShuffleProperty, value); }
        }
        // Using a DependencyProperty as the backing store for IsFavor.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsShuffleProperty =
            DependencyProperty.Register("IsShuffle", typeof(bool), typeof(bottomComponent), new PropertyMetadata(false));


        public string RepeatState
        {
            get { return (string)GetValue(RepeatStateProperty); }
            set { SetValue(RepeatStateProperty, value); }
        }

        // Using a DependencyProperty as the backing store for RepeatState.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty RepeatStateProperty =
            DependencyProperty.Register("RepeatState", typeof(string), typeof(bottomComponent), new PropertyMetadata("None"));



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
        private void Pause_CanExecute(object sender, CanExecuteRoutedEventArgs e)
        {
            //e.CanExecute = mediaPlayerIsPlaying;
            e.CanExecute = (mePlayer != null) && (mePlayer.Source != null);

        }
        ImageSource Play = (ImageSource)Application.Current.Resources["PlayButton"];
        ImageSource Pause = (ImageSource)Application.Current.Resources["PauseButton"];
        private void Pause_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            if (mediaPlayerIsPlaying == false)
            {
                //mePlayer.Play();
                mediaPlayerIsPlaying = true;
                IsPlay = true;
            }
            else
            {
                IsPlay = false;
                mediaPlayerIsPlaying = false;

            }
            // mePlayer.Pause();
        }



        // add second when the song is playing
        void timer_Tick(object sender, EventArgs e)
        {
            if (mePlayer.Source != null && mePlayer.NaturalDuration.HasTimeSpan && (!IsDrag))
            {
                slider.Maximum = mePlayer.NaturalDuration.TimeSpan.TotalSeconds;
                slider.Value = mePlayer.Position.TotalSeconds;
                playing.Content = mePlayer.Position.ToString(@"mm\:ss");
                Duration.Content = mePlayer.NaturalDuration.TimeSpan.ToString(@"mm\:ss");
            }
        }

        private void slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            mePlayer.Position = TimeSpan.FromSeconds(slider.Value);
            playing.Content = String.Format("{0}", mePlayer.Position.ToString(@"mm\:ss"));
        }
        // event when drag the thumb of slider
        private void slider_DragStarted(object sender, System.Windows.Controls.Primitives.DragStartedEventArgs e)
        {
            IsDrag = true;
        }
        // event when complete drag the thumg of slider
        private void slider_DragCompleted(object sender, System.Windows.Controls.Primitives.DragCompletedEventArgs e)
        {
            mePlayer.Position = TimeSpan.FromSeconds(slider.Value);
            IsDrag = false;
        }
        //change the volume icon when value of volume slider change
        private void volumeSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            mePlayer.Volume = (double)volumeSlider.Value;
            if (volumeSlider.Value < 0.8 && volumeSlider.Value > 0.3)
            {
                ImageSource VolumnMedium = (ImageSource)Application.Current.Resources["VolumeMediumButton"];
                ImageBrush brush = new ImageBrush();
                brush.ImageSource = VolumnMedium;
                VolumeButton.Background = brush;
                VolumeStyle = "Medium";
            }
            if (volumeSlider.Value < 0.3)
            {
                ImageSource VolumnMin = (ImageSource)Application.Current.Resources["VolumeMinButton"];
                ImageBrush brush = new ImageBrush();
                brush.ImageSource = VolumnMin;
                VolumeButton.Background = brush;
                VolumeStyle = "Min";

            }
            if (volumeSlider.Value == 0)
            {
                ImageSource MuteImg = (ImageSource)Application.Current.Resources["MuteBtn"];
                ImageBrush brush = new ImageBrush();
                brush.ImageSource = MuteImg;
                VolumeButton.Background = brush;
                VolumeStyle = "Mute";

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
                //ImageSource VolumnMax = (ImageSource)Application.Current.Resources["MuteBtn"];
                //ImageBrush brush = new ImageBrush();
                //brush.ImageSource = VolumnMax;
                //VolumeButton.Background = brush;

                //PrevVolumeIcon = VolumeIcon;
                //VolumeIcon = "VolumeOff";
                PrevVolumeSlider = volumeSlider.Value;
                volumeSlider.Value = 0;
                PrevVolume = mediaPlayer.Volume;
                mePlayer.Volume = 0;
                IsMute = true;
            }
            else
            {
                mePlayer.Volume = PrevVolume;
                //VolumeIcon = PrevVolumeIcon;
                volumeSlider.Value = PrevVolumeSlider;
                IsMute = false;
            }
        }
        //private void Button_Click(object sender, RoutedEventArgs e)
        //{
        //    Button HeartBtn = sender as Button;
        //    //MessageBox.Show(SongBottom.Ins.SelectedSong.ID.ToString());
        //    var song = DataProvider.Ins.DB.Songs.Where(s => s.ID == SongBottom.Ins.SelectedSong.ID).FirstOrDefault();
        //    MessageBox.Show(song.SongName);
        //    var playlist = Playlists.LikedSongsPlayplist;
        //    if (IsFavor)
        //    {
        //        //var list = playlist.Songs;
        //        //foreach (Song s in list)
        //        //{
        //        //    if (s.ID == song.ID) { MessageBox.Show("haa"); break; }
        //        //}
        //        playlist.Songs.Remove(song);
        //        playlist.SongsOfPlaylist.Remove(song);
        //        ImageSource Heart = (ImageSource)Application.Current.Resources["HeartButton"];
        //        ImageBrush ImgBrush = new ImageBrush();
        //        ImgBrush.ImageSource = Heart;
        //        HeartBtn.Background = ImgBrush;
        //        IsFavor = false;
        //        isFavor = "false";

        //    }
        //    else
        //    {
        //        var list = playlist.Songs;
        //        bool IsExistedPlaylist = false;
        //        foreach (Song s in list)
        //        {
        //            if (s.ID == song.ID) { IsExistedPlaylist = true; break; }
        //        }
        //        if (!IsExistedPlaylist)
        //        {
        //            playlist.Songs.Add(song);
        //            playlist.SongsOfPlaylist.Add(song);
        //        }
        //        ImageSource HeartFill = (ImageSource)Application.Current.Resources["HeartFillButton"];
        //        ImageBrush ImgBrush = new ImageBrush();
        //        ImgBrush.ImageSource = HeartFill;
        //        HeartBtn.Background = ImgBrush;
        //        IsFavor = true;
        //        isFavor = "true";

        //    }
        //    DataProvider.Ins.DB.SaveChanges();


        //}

        private void mePlayer_MediaEnded(object sender, RoutedEventArgs e)
        {
           // LikedSongsVM a = this.DataContext as LikedSongsVM;
            //if (a != null)
            //{

                int id = 0;
                
                if (RepeatState == "RepeatOne")
                {
                    mePlayer.Position = TimeSpan.Zero;
                    playing.Content = mePlayer.Position.ToString(@"mm\:ss");
                }

                else
                {
                if (!IsShuffle)
                {

                    for (int i = 0; i < SongBottom.Ins.ListSong.Count; i++)
                    {
                        if (SongBottom.Ins.SongName == SongBottom.Ins.ListSong[i].SongName)
                        {
                            id = i + 1;
                        }
                    }
                    if (id < SongBottom.Ins.ListSong.Count)
                    {
                        SongBottom.Ins.SongName = SongBottom.Ins.ListSong[id].SongName;
                        SongBottom.Ins.SingerName = SongBottom.Ins.ListSong[id].SingerName;
                        SongBottom.Ins.LinkSong = SongBottom.Ins.ListSong[id].SongLinkUri;
                        SongBottom.Ins.ImageSong = SongBottom.Ins.ListSong[id].SongImageUri;
                        SongBottom.Ins.SelectedSong = SongBottom.Ins.ListSong[id];
                    }
                    else
                    {
                        if (RepeatState == "Active")
                        {
                            id = 0;
                            SongBottom.Ins.SongName = SongBottom.Ins.ListSong[0].SongName;
                            SongBottom.Ins.SingerName = SongBottom.Ins.ListSong[0].SingerName;
                            SongBottom.Ins.LinkSong = SongBottom.Ins.ListSong[0].SongLinkUri;
                            SongBottom.Ins.ImageSong = SongBottom.Ins.ListSong[0].SongImageUri;
                            SongBottom.Ins.SelectedSong = SongBottom.Ins.ListSong[0];
                        }
                        else SongBottom.Ins.IsPlay = false;
                    }
                }
                else
                {
                    int RandomValue = RandomNumber();
                    LoadSong(RandomValue);
                }
                //}
            }
        }
        int RandomNumber()
        {
            Random rdn = new Random();
            int x;
            do
            {
                x = rdn.Next(0, SongBottom.Ins.ListSong.Count);
            }
            while (SongBottom.Ins.SongName == SongBottom.Ins.ListSong[x].SongName);
            return x;

        }
        void LoadSong(int index)
        {
            SongBottom.Ins.SongName = SongBottom.Ins.ListSong[index].SongName;
            SongBottom.Ins.SingerName = SongBottom.Ins.ListSong[index].SingerName;
            SongBottom.Ins.LinkSong = SongBottom.Ins.ListSong[index].SongLinkUri;
            SongBottom.Ins.ImageSong = SongBottom.Ins.ListSong[index].SongImageUri;
            SongBottom.Ins.SelectedSong = SongBottom.Ins.ListSong[index];
        }
        private void ShuffleBtn_Click(object sender, RoutedEventArgs e)
        {

            if (IsShuffle)
            {
                ImageSource Heart = (ImageSource)Application.Current.Resources["ShuffleButton"];
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = Heart;
                ShuffleBtn.Background = ImgBrush;
                IsShuffle = false;

            }
            else
            {
                ImageSource HeartFill = (ImageSource)Application.Current.Resources["ShuffleActiveButton"];
                ImageBrush ImgBrush = new ImageBrush();
                ImgBrush.ImageSource = HeartFill;
                ShuffleBtn.Background = ImgBrush;

                IsShuffle = true;
            }
        }

        private void Repeat_Click(object sender, RoutedEventArgs e)
        {
            ImageBrush img = new ImageBrush();
            if (RepeatState == "None")
            {

                img.ImageSource = (ImageSource)Application.Current.Resources["RepeatBtn"];
                RepeatBtn.Background = img;
                RepeatState = "Active";
            }
            else if (RepeatState == "Active")
            {

                img.ImageSource = (ImageSource)Application.Current.Resources["RepeatOneBtn"];
                RepeatBtn.Background = img;
                RepeatState = "RepeatOne";
            }
            else if (RepeatState == "RepeatOne")
            {
                img.ImageSource = (ImageSource)Application.Current.Resources["RepeatButton"];
                RepeatBtn.Background = img;
                RepeatState = "None";
            }

        }

        private void Next_Click(object sender, RoutedEventArgs e)
        {
            if (!IsShuffle)
            {
                int id = 0;
                for (int i = 0; i < SongBottom.Ins.ListSong.Count; i++)
                {
                    if (SongBottom.Ins.SongName == SongBottom.Ins.ListSong[i].SongName)
                    {
                        id = i + 1;
                    }
                }
                if (id < SongBottom.Ins.ListSong.Count)
                {
                    LoadSong(id);
                }
            }
            else
            {
                int RandomValue = RandomNumber();
                LoadSong(RandomValue);
            }
            
        }
        
        private void Prev_Click(object sender, RoutedEventArgs e)
        {
            if (!IsShuffle)
            {
                int id = 0;

                for (int i = 0; i < SongBottom.Ins.ListSong.Count; i++)
                {
                    if (SongBottom.Ins.SongName == SongBottom.Ins.ListSong[i].SongName)
                    {
                        id = i - 1;
                    }
                }
                if (id >= 0)
                {
                    LoadSong(id);
                }
            }
            else
            {
                int RandomValue = RandomNumber();
                LoadSong(RandomValue);
            }

        }
    }
}
