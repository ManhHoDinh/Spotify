using Spotify.Models;
using Spotify.ViewModels.Pages;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
            DependencyProperty.Register("IsPlay", typeof(bool), typeof(AlbumView), new PropertyMetadata(false));
        public AlbumView()
        {
            InitializeComponent();
            HomeVM vm = this.DataContext as HomeVM;
           
            Binding binding = new Binding("SelectedSongItem");
            binding.Source = vm;
            binding.Mode = BindingMode.OneWayToSource;
            BindingOperations.SetBinding(SongBottom.Ins, SongBottom.SelectedSongProperty, binding);
            if (ListAlbumView.IsClick == true)
            {
                SongBottom.Ins.ListSong = Album.ItemSource;
                SongBottom.Ins.SelectedSong = Album.ItemSource[0];
                ListAlbumView.IsClick = false;
            }
            Binding bd = new Binding("IsPlay");
            bd.Source = SongBottom.Ins;
            bd.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(Albumview, IsPlayProperty, bd);

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

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {

            Album.ApplyTemplate();
            var ListSong = Album.Template.FindName("PART_Header", Album) as ListView;
            var listFavor = DataProvider.Ins.DB.Albums.Where(a => a.ID == 1).Select(a => a.Songs).FirstOrDefault();
            foreach (Song a in listFavor)
            {
                for (int j = 0; j < Album.ItemSource.Count; j++)
                {
                    if (a.ID == Album.ItemSource[j].ID)
                    {
                        var template = ListSong.ItemContainerGenerator.ContainerFromIndex(j) as ListViewItem;
                        Button btn = template.Template.FindName("favorBtn", template) as Button;
                        ImageBrush img = new ImageBrush();
                        img.ImageSource = (ImageSource)Application.Current.Resources["HeartFillButton"];
                        btn.Background = img;
                    }
                }
            }
        }
    }
}
