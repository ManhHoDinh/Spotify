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
            DependencyProperty.Register("CountPlaylist", typeof(int), typeof(ListPlaylist), new PropertyMetadata(1));
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
            Ins.List = new ObservableCollection<Playlist>();
            Ins.SelectedItem = new Playlist();

        }

    }
    public partial class CreatePlaylist : UserControl
    {
     public CreatePlaylist()
        {
            InitializeComponent();
            CreatePlaylistVM playlist = this.DataContext as CreatePlaylistVM;
            Binding binding = new Binding("SelectedPlaylist");
            binding.Source = playlist;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(ListPlaylist.Ins, ListPlaylist.SelectedItemProperty, binding);
        }
    }
}
