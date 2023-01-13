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

    public AlbumView()
    {
      InitializeComponent();
            Random r = new Random();
            Color RandomColor = Color.FromRgb((byte)r.Next(1, 255), (byte)r.Next(1, 255), (byte)r.Next(1, 233));
            string hex = RandomColor.R.ToString("X2") + RandomColor.G.ToString("X2") + RandomColor.B.ToString("X2");
            color = "#" + hex;

            //HomeVM vm = this.DataContext as HomeVM;

            Binding binding = new Binding("SelectedSong");
            binding.Source = Album;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(SongBottom.Ins, SongBottom.SelectedSongProperty, binding);
    }
        public string color
        {
            get { return (string)GetValue(colorProperty); }
            set { SetValue(colorProperty, value); }
        }

        // Using a DependencyProperty as the backing store for color.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty colorProperty =
            DependencyProperty.Register("color", typeof(string), typeof(AlbumView), new PropertyMetadata("red"));
        ImageSource Play = (ImageSource)Application.Current.Resources["PlayFill"];
    ImageSource Pause = (ImageSource)Application.Current.Resources["PauseFill"];
    //private void PlayPauseGreen_Click(object sender, RoutedEventArgs e)
    //{
    //    ImageBrush ImgBrush = new ImageBrush();
    //    if (SongBottom.Ins.SelectedSong == null || SongBottom.Ins.CountId == -1)
    //    {
    //        SongBottom.Ins.SelectedSong = SongBottom.Ins.ListSong[0];
    //        SongBottom.Ins.IsPlay = true;
    //        ImgBrush.ImageSource = Pause;
    //    }
    //    else
    //    {
    //        if (SongBottom.Ins.IsPlay == true)
    //        {
    //            ImgBrush.ImageSource = Play;
    //            SongBottom.Ins.IsPlay = false;
    //        }
    //        else
    //        {
    //            ImgBrush.ImageSource = Pause;
    //            SongBottom.Ins.IsPlay = true;

    //        }
    //    }
    //    PlayPauseGreen.Background = ImgBrush;
    //}

    private void UserControl_Loaded(object sender, RoutedEventArgs e)
    {
      

      Album.ApplyTemplate();
      if (SongBottom.Ins.CountId >= 0)
      {
        if(SongBottom.Ins.IsPlay == false)
                {
                    Album.SelectedSong = SongBottom.Ins.ListSong[SongBottom.Ins.CountId];
                    SongBottom.Ins.IsPlay = false;
                }
                else Album.SelectedSong = SongBottom.Ins.ListSong[SongBottom.Ins.CountId];

            }
      var ListSong = Album.Template.FindName("PART_Header", Album) as ListView;
      var listFavor = DataProvider.Ins.DB.Playlists.Where(p => p.PlaylistType == 0 && p.UserID == Properties.Settings.Default.CurrentUserID).Select(a => a.Songs).FirstOrDefault();
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
