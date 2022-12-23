using System.CodeDom;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Security.Cryptography;
using System.Windows;
using System.Windows.Automation.Peers;
using System.Windows.Controls;
using System.Windows.Data;
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
    public partial class SongsView : UserControl
    {
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {
            base.OnPropertyChanged(e);
            if (e.Property == IsPlayProperty)
            {
                if (ListViewSong.SelectedItem != null)
                {
                   
                    ImageBrush img = new ImageBrush();
                    var template = ListViewSong.ItemContainerGenerator.ContainerFromIndex(ListViewSong.SelectedIndex) as ListViewItem;
                    Button btn = template.Template.FindName("PlayPauseBtn", template) as Button;
                    Image image = template.Template.FindName("img", template) as Image;
                    TextBlock tb = template.Template.FindName("Id", template) as TextBlock ;

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
        public SongsView()
        {
            InitializeComponent();
            Ins = new SongsView();
            Binding binding = new Binding("IsPlay");
            binding.Source = SongBottom.Ins;
            binding.Mode = BindingMode.TwoWay;
            ObservableCollection<Song> songs = new ObservableCollection<Song>();
            songs.Add(Songs.CamNang);
            songs.Add(Songs.BenTrenTangLau);
            songs.Add(Songs.DauMua);
            SongItemsCollection = new CollectionViewSource { Source = songs };
            BindingOperations.SetBinding(songview, IsPlayProperty, binding);
           
            //if(LikedSongsView.SelectedItem != null)
            //{
            //    Binding bd = new Binding("IsPlay");
            //    binding.Source = vm.SelectedItem;
            //    binding.Mode = BindingMode.TwoWay;
            //    BindingOperations.SetBinding(songview, IsPlayProperty, binding);
            //}
        }
        private CollectionViewSource SongItemsCollection;
        public ICollectionView SongSourceCollection => SongItemsCollection.View;

        public static SongsView Ins;
        public ObservableCollection<Song> songs;

        // Using a DependencyProperty as the backing store for Songs.  This enables animation, styling, binding, etc...
        

        public bool IsPlay
        {
            get { return (bool)GetValue(IsPlayProperty); }
            set { SetValue(IsPlayProperty, value); }
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
            Button HeartBtn = sender as Button;
            int index = int.Parse(HeartBtn.Tag.ToString());

            LikedSongsVM.listSong.RemoveAt(index-1);

        }

        private void NameSong_Click(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;
            ListViewItem curItem = ((ListViewItem)ListViewSong.ContainerFromElement((Button)sender));
            curItem.IsSelected = true;
            ViewPage.Ins.CurrentView = new SongView();
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
                if(template.IsSelected == false)
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
                SongBottom.Ins.IsPlay = true;
                img.ImageSource = (ImageSource)Application.Current.Resources["Pausexs"];
            }
           (sender as Button).Background = img;
        }

        private void ListViewSong_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            for (int i = 0; i < ListViewSong.Items.Count; i++)
            {
                var template = ListViewSong.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
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
                    if (i != ListViewSong.SelectedIndex)
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
