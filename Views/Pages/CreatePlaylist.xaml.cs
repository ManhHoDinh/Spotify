using Microsoft.Win32;
using Spotify.Models;
using Spotify.ViewModels.Pages;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for CreatePlaylist.xaml
    /// </summary>
    public class ListPlaylist : DependencyObject
    {
        public string Image
        {
            get { return (string)GetValue(ImageProperty); }
            set { SetValue(ImageProperty, value); }
        }

        // Using a DependencyProperty as the backing store for Image.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ImageProperty =
            DependencyProperty.Register("Image", typeof(string), typeof(ListPlaylist), new PropertyMetadata(string.Empty));

        public string PlaylistName
        {
            get { return (string)GetValue(PlaylistNameProperty); }
            set { SetValue(PlaylistNameProperty, value); }
        }

        // Using a DependencyProperty as the backing store for PlaylistName.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty PlaylistNameProperty =
            DependencyProperty.Register("PlaylistName", typeof(string), typeof(ListPlaylist), new PropertyMetadata(string.Empty));
        public Playlist SelectedItem
        {
            get { return (Playlist)GetValue(SelectedItemProperty); }
            set
            {
                SetValue(SelectedItemProperty, value);
                if (SelectedItem != null)
                {
                    Ins.PlaylistName = SelectedItem.PlaylistName;
                    Ins.PlaylistDescription = SelectedItem.Descriptions;
                    Ins.ImagePlaylist = SelectedItem.PlaylistImageSource;
                    CreatePlaylist a = new CreatePlaylist();
                }
            }
        }
        // Using a DependencyProperty as the backing store for SelectedItem.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedItemProperty =
            DependencyProperty.Register("SelectedItem", typeof(Playlist), typeof(ListPlaylist), new PropertyMetadata(null));
        public string PlaylistDescription
        {
            get { return (string)GetValue(PlaylistDescriptionProperty); }
            set { SetValue(PlaylistDescriptionProperty, value); }
        }


        public ImageSource ImagePlaylist
        {
            get { return (ImageSource)GetValue(ImagePlaylistProperty); }
            set { SetValue(ImagePlaylistProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ImagePlaylist.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ImagePlaylistProperty =
            DependencyProperty.Register("ImagePlaylist", typeof(ImageSource), typeof(ListPlaylist), new PropertyMetadata(null));



        // Using a DependencyProperty as the backing store for PlaylistDescription.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty PlaylistDescriptionProperty =
            DependencyProperty.Register("PlaylistDescription", typeof(string), typeof(ListPlaylist), new PropertyMetadata(string.Empty));
        public int CountPlaylist
        {
            get { return (int)GetValue(CountPlaylistProperty); }
            set { SetValue(CountPlaylistProperty, value); }
        }

        // Using a DependencyProperty as the backing store for CountPlaylist.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CountPlaylistProperty =
            DependencyProperty.Register("CountPlaylist", typeof(int), typeof(ListPlaylist), new PropertyMetadata(DataProvider.Ins.DB.Playlists.Count() + 1));
        public ObservableCollection<Playlist> List
        {
            get { return (ObservableCollection<Playlist>)GetValue(ListProperty); }
            set { SetValue(ListProperty, value); }
        }

        // Using a DependencyProperty as the backing store for List.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ListProperty =
            DependencyProperty.Register("List", typeof(ObservableCollection<Playlist>), typeof(ListPlaylist), new PropertyMetadata(null));


        


        public static ListPlaylist Ins { get; private set; }
        static ListPlaylist()
        {
            Ins = new ListPlaylist();
            Ins.List = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.Where(p=>p.PlaylistType == 2).ToList());
            Ins.SelectedItem = new Playlist();

        }

    }
    public partial class CreatePlaylist : UserControl
    {
        public CreatePlaylist()
        {
            InitializeComponent();
            CreatePlaylistVM playlist = this.DataContext as CreatePlaylistVM;
            Binding bd = new Binding("SelectedSongItem");
            bd.Source = playlist;
            bd.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(SongBottom.Ins, SongBottom.SelectedSongProperty, bd);
            Binding binding = new Binding("SelectedPlaylist");
            binding.Source = playlist;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(ListPlaylist.Ins, ListPlaylist.SelectedItemProperty, binding);
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            PlayListForm form = new PlayListForm();
            Application.Current.MainWindow.Opacity = 0.3;
            form.Show();
            OpenFileDialog a = new OpenFileDialog();
            if (a.ShowDialog() == true)
            {
                form.img.Source = new BitmapImage(new Uri(a.FileName));
                ContentPresenter x = (form.btn.Template.FindName("content", form.btn) as ContentPresenter);
                Image imageInit = VisualTreeHelper.GetChild(x, 0) as Image;
                imageInit.Opacity = 0;
                img = form.img;
            }
            Application.Current.MainWindow.Opacity = 1;
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            CreatePlaylistVM vm = this.DataContext as CreatePlaylistVM;
            int songId = int.Parse((sender as Button).Tag.ToString());
            Song song = DataProvider.Ins.DB.Songs.Where(s => s.ID == songId).FirstOrDefault();
            var playlist = DataProvider.Ins.DB.Playlists.Where(p => p.ID == vm.SelectedPlaylist.ID).FirstOrDefault();
            if(playlist.Songs.Count == 0)
            {
                Random r = new Random();
                Color RandomColor = Color.FromRgb((byte)r.Next(1, 255), (byte)r.Next(1, 255), (byte)r.Next(1, 233));
                string hex = RandomColor.R.ToString("X2") + RandomColor.G.ToString("X2") + RandomColor.B.ToString("X2");
                color = "#" + hex;
            }
            playlist.Songs.Add(song);
            vm.SongsOfPlaylist.Add(song);
            DataProvider.Ins.DB.SaveChanges();
        }


        public string color
        {
            get { return (string)GetValue(colorProperty); }
            set { SetValue(colorProperty, value); }
        }

        // Using a DependencyProperty as the backing store for color.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty colorProperty =
            DependencyProperty.Register("color", typeof(string), typeof(CreatePlaylist), new PropertyMetadata("#545454"));



    }
}
