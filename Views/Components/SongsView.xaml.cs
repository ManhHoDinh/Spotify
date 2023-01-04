using System.CodeDom;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
using System.Windows;
using System.Windows.Automation.Peers;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using Spotify.Models;
using Spotify.ViewModels;
using Spotify.ViewModels.Pages;
using Spotify.Views.Pages;

namespace Spotify.Views.Components
{
    /// <summary>
    /// Interaction logic for SongsView.xaml
    /// </summary>
    [TemplatePart(Name = "PART_Header", Type = typeof(ListView))]

    public partial class SongsView : UserControl
    {
        private ListView listview;
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {

            base.OnPropertyChanged(e);
            if (e.Property == IsPlayProperty)
            {
                if (GetTemplateChild("PART_Header") != null)
                {
                    listview = GetTemplateChild("PART_Header") as ListView;
                    if (listview.SelectedItem != null)
                    {
                        LikedSongsVM vm = this.DataContext as LikedSongsVM;
                        ImageBrush img = new ImageBrush();
                        var template = listview.ItemContainerGenerator.ContainerFromIndex(listview.SelectedIndex) as ListViewItem;
                        Button btn = template.Template.FindName("PlayPauseBtn", template) as Button;
                        Image image = template.Template.FindName("img", template) as Image;
                        TextBlock tb = template.Template.FindName("Id", template) as TextBlock;
                        if (IsPlay == true)
                        {
                            image.Visibility = Visibility.Visible;
                            tb.Visibility = Visibility.Hidden;
                            img.ImageSource = (ImageSource)Application.Current.Resources["Pausexs"];
                        }
                        else
                        {
                            image.Visibility = Visibility.Hidden;
                            tb.Visibility = Visibility.Visible;
                            img.ImageSource = (ImageSource)Application.Current.Resources["Playxs"];
                        }
                        btn.Background = img;
                    }
                }
            }
            
        }
        public SongsView()
        {
            InitializeComponent();
            Binding binding = new Binding("IsPlay");
            binding.Source = SongBottom.Ins;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(songview, IsPlayProperty, binding);

            
            //if(LikedSongsView.SelectedItem != null)
            //{
            //    Binding bd = new Binding("IsPlay");
            //    binding.Source = vm.SelectedItem;
            //    binding.Mode = BindingMode.TwoWay;
            //    BindingOperations.SetBinding(songview, IsPlayProperty, binding);
            //}


        }

        // Using a DependencyProperty as the backing store for Songs.  This enables animation, styling, binding, etc...

        public ImageSource FavorIcon
        {
            get { return (ImageSource)GetValue(FavorIconProperty); }
            set { SetValue(FavorIconProperty, value); }
        }

        // Using a DependencyProperty as the backing store for FavorIcon.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty FavorIconProperty =
            DependencyProperty.Register("FavorIcon", typeof(ImageSource), typeof(SongsView), new PropertyMetadata(null));


        public ObservableCollection<Song> ItemSource
        {
            get { return (ObservableCollection<Song>)GetValue(ItemSourceProperty); }
            set { SetValue(ItemSourceProperty, value); }
        }

        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ItemSourceProperty =
            DependencyProperty.Register("ItemSource", typeof(ObservableCollection<Song>), typeof(SongsView), new PropertyMetadata(null));
        public Song SelectedSong
        {
            get { return (Song)GetValue(SelectedSongProperty); }
            set { SetValue(SelectedSongProperty, value); }
       
        }

        // Using a DependencyProperty as the backing store for SelectedSong.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedSongProperty =
            DependencyProperty.Register("SelectedSong", typeof(Song), typeof(SongsView), new PropertyMetadata(null));






        public bool IsPlay
        {
            get { return (bool)GetValue(IsPlayProperty); }
            set { SetValue(IsPlayProperty, value);  }
            
        }
        public static readonly DependencyProperty IsPlayProperty =
            DependencyProperty.Register("IsPlay", typeof(bool), typeof(SongsView), new PropertyMetadata(false));

        public bool IsVisibleOption
        {
            get { return (bool)GetValue(IsVisibleOptionProperty); }
            set { SetValue(IsVisibleOptionProperty, value); }
        }
        // Using a DependencyProperty as the backing store for IsVisibleOption.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsVisibleOptionProperty =
            DependencyProperty.Register("IsVisibleOption", typeof(bool), typeof(SongsView), new PropertyMetadata(true));

        public bool IsFavor
        {
            get { return (bool)GetValue(IsFavorProperty); }
            set { SetValue(IsFavorProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsFavor.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsFavorProperty =
            DependencyProperty.Register("IsFavor", typeof(bool), typeof(SongsView), new PropertyMetadata(true));
        private void Favor_Click(object sender, RoutedEventArgs e)
        {
            var BackGroundBtn = (sender as Button).Background as ImageBrush;
            var listview = GetTemplateChild("PART_Header") as ListView;
            Button btn = sender as Button;
            int index = int.Parse(btn.Tag.ToString());
            Grid gr = btn.Parent as Grid;
            int id = int.Parse(gr.Tag.ToString());
            ImageBrush img = new ImageBrush();
            var song = DataProvider.Ins.DB.Songs.Where(s => s.ID == index).FirstOrDefault();
            var playlist = Playlists.LikedSongsPlayplist;
            if (FavorIcon == (ImageSource)Application.Current.Resources["HeartFillButton"])
            {
                img.ImageSource = (ImageSource)Application.Current.Resources["HeartButton"];
                btn.Background = img;
                playlist.SongsOfPlaylist.Remove(song);
                playlist.Songs.Remove(song);
                for (int i = 0; i < listview.Items.Count; i++)
                {
                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                    TextBlock tb = new TextBlock();
                    if (template != null)
                    {
                        tb = template.Template.FindName("Id", template) as TextBlock;
                        tb.Text = (i + 1).ToString();
                    }
                }
            }
            else
            {
                var list = playlist.Songs;
                bool IsExistedPlaylist = false;
                foreach (Song s in list)
                {
                    if (s.ID == song.ID) {IsExistedPlaylist = true; break;}
                }
                if(!IsExistedPlaylist)
                {
                    img.ImageSource = (ImageSource)Application.Current.Resources["HeartFillButton"];
                    btn.Background = img;
                    playlist.Songs.Add(song);
                    playlist.SongsOfPlaylist.Add(song);
                }
            }
            DataProvider.Ins.DB.SaveChanges();
        }
        void TranslatePage(object obj)
        {
            if (ViewPage.Ins.CurrentView.GetType().Name != obj.GetType().Name)
            {
                int currentId = ViewPage.Ins.CurrentIndexView;
                int count = ViewPage.Ins.ListPage.Count;

                if (currentId < count)
                {
                    for (int i = currentId + 1; i < count; i++)
                    {
                        ViewPage.Ins.ListPage.RemoveAt(1);
                    }
                }
                SongView a = new SongView();
                a.SelectedSong = SelectedSong;
                ViewPage.Ins.CurrentView = a;
                ViewPage.Ins.ListPage.Add(ViewPage.Ins.CurrentView);
                ViewPage.Ins.CurrentIndexView++;
                ViewPage.Ins.IsDisableBack = false;
            }
        }
        private void NameSong_Click(object sender, RoutedEventArgs e)
        {
            var listview = GetTemplateChild("PART_Header") as ListView;
            Button btn = sender as Button;
            ListViewItem curItem = ((ListViewItem)listview.ContainerFromElement((Button)sender));
            curItem.IsSelected = true;
            TranslatePage(new SongView());
        }
        ImageSource Play = (ImageSource)Application.Current.Resources["Playxs"];
        ImageSource Pause = (ImageSource)Application.Current.Resources["Pausexs"];
        private void PlayPauseSongBtn_Click(object sender, RoutedEventArgs e)
        {
            ImageBrush img = new ImageBrush();
            Button btn = sender as Button;
            ListViewItem template = btn.TemplatedParent as ListViewItem;

            if (SongBottom.Ins.IsPlay == true)
            {
                if (template.IsSelected == false)
                {
                    template.IsSelected = true;
                    img.ImageSource = (ImageSource)Application.Current.Resources["Pausexs"];

                }
                else
                {
                    img.ImageSource = (ImageSource)Application.Current.Resources["Playxs"];
                    SongBottom.Ins.IsPlay = false;
                }

            }
            else
            {
                template.IsSelected = true;
                SongBottom.Ins.IsPlay = true;
                img.ImageSource = (ImageSource)Application.Current.Resources["Pausexs"];
            }
           (sender as Button).Background = img;
        }

        private void ListViewSong_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            SongBottom.Ins.ListSong = ItemSource;
            
            var listview = GetTemplateChild("PART_Header") as ListView;
            SongBottom.Ins.CountId = listview.SelectedIndex;
            for (int i = 0; i < listview.Items.Count; i++)
            {
                var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                ImageBrush img = new ImageBrush();
                Button btn = new Button();
                Image image = new Image();
                TextBlock tb = new TextBlock();
                if (template != null)
                {
                    img = new ImageBrush();
                    btn = template.Template.FindName("PlayPauseBtn", template) as Button;
                    image = template.Template.FindName("img", template) as Image;
                    tb = template.Template.FindName("Id", template) as TextBlock;
                    if (i != listview.SelectedIndex)
                    {
                        img.ImageSource = Play;
                        btn.Background = img;
                        image.Visibility = Visibility.Hidden;
                        tb.Visibility = Visibility.Visible;
                    }
                    else
                    {
                        img.ImageSource = Pause;
                        btn.Background = img;
                        image.Visibility = Visibility.Visible;
                        tb.Visibility = Visibility.Hidden;
                    }
                }
            }
        }
    }
}
