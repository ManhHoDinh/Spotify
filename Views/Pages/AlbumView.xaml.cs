using Spotify.Models;
using Spotify.ViewModels.Pages;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
  public class ListAlbum : DependencyObject
    {
        

        public int CurrentIdAlbum
        {
            get { return (int)GetValue(CurrentIdAlbumProperty); }
            set { SetValue(CurrentIdAlbumProperty, value); }
        }

        // Using a DependencyProperty as the backing store for CurrentIdAlbum.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CurrentIdAlbumProperty =
            DependencyProperty.Register("CurrentIdAlbum", typeof(int), typeof(ListAlbum), new PropertyMetadata(-1));

        public List<int> ListSelectedItem
        {
            get { return (List<int>)GetValue(ListSelectedItemProperty); }
            set { SetValue(ListSelectedItemProperty, value); }
        }


        public ObservableCollection<Album> List 
        {
            get { return (ObservableCollection<Album>)GetValue(ListProperty); }
            set { SetValue(ListProperty, value); }
        }

        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ListProperty =
            DependencyProperty.Register("List", typeof(ObservableCollection<Album>), typeof(ListAlbum), new PropertyMetadata(null));


        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ListSelectedItemProperty =
            DependencyProperty.Register("ListSelectedItem", typeof(List<int>), typeof(ListAlbum), new PropertyMetadata(new List<int> { }));


        public Album SelectedAlbum
        {
            get { return (Album)GetValue(SelectedAlbumProperty); }
            set { SetValue(SelectedAlbumProperty, value);
            }
        }
        // Using a DependencyProperty as the backing store for SelectedAlbum.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedAlbumProperty =
            DependencyProperty.Register("SelectedAlbum", typeof(Album), typeof(ListAlbum), new PropertyMetadata(null));


        public static ListAlbum Ins { get; private set; }
        static ListAlbum()
        {
            Ins = new ListAlbum();
           
        }
    }
  public partial class AlbumView : UserControl
  {
        public static string type = "";
        public static Binding binding;
    public AlbumView()
    {
      InitializeComponent();
            Random r = new Random();
            Color RandomColor = Color.FromRgb((byte)r.Next(1, 255), (byte)r.Next(1, 255), (byte)r.Next(1, 233));
            string hex = RandomColor.R.ToString("X2") + RandomColor.G.ToString("X2") + RandomColor.B.ToString("X2");
            color = "#" + hex;
            binding = new Binding("SelectedSong");
            binding.Source = Album;
            binding.Mode = BindingMode.TwoWay;
            if (type != "likesong" && type != "playlist")
            {
                BindingOperations.SetBinding(SongBottom.Ins, SongBottom.SelectedSongProperty, binding);
            }
          

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
   

    private void UserControl_Loaded(object sender, RoutedEventArgs e)
    {
            SongsView.CurrentType = "album";
           
                Album.ApplyTemplate();
            if (type == "album")
            {

                if (SongBottom.Ins.CountId >= 0)
                {
                    if (SongBottom.Ins.IsPlay == false)
                    {
                        Album.SelectedSong = SongBottom.Ins.ListSong[SongBottom.Ins.CountId];
                        SongBottom.Ins.IsPlay = false;
                    }
                    else
                    {
                        
                        Album.SelectedSong = SongBottom.Ins.ListSong[SongBottom.Ins.CountId];



                    }

                }
            }

            var ListSong = Album.Template.FindName("PART_Header", Album) as ListView;
            if (Properties.Settings.Default.CurrentUserID != -1)
            {
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
}
