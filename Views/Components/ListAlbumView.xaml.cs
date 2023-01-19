using Spotify.Models;
using Spotify.ViewModels.Pages;
using Spotify.Views.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Automation.Peers;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Documents.DocumentStructures;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Spotify.Views.Components
{
    /// <summary>
    /// Interaction logic for ListAlbumView.xaml
    /// </summary>
        [TemplatePart(Name = "PART_Header", Type = typeof(ListView))]
    
   
    public partial class ListAlbumView : UserControl
    {
        private ListView listview;
        public static int id;
        public static ObservableCollection<Album> PreItemSource;
        public static string PreType = "";
        public static bool IsClick;
        public static int temp = 0;
        public static string type = "";
        public static object obj;
        public static RoutedEventArgs ev;
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {
            base.OnPropertyChanged(e);
            if (e.Property == IsPlayProperty)
            {
               
                if (GetTemplateChild("PART_Header") != null)
                {
                    HomeVM vm = this.DataContext as HomeVM;
                    if(RecommendAlbum.type == "Recommend")
                    {
                        listview = GetTemplateChild("PART_Header") as ListView;
                        for(int i = 0; i < listview.Items.Count; i++)
                        {
                            var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                            Button PlayPauseGreen = template.Template.FindName("PlayPauseGreen", template) as Button;
                            ImageBrush ImgBrush = new ImageBrush();
                            ImgBrush.ImageSource = Play;
                            PlayPauseGreen.Background = ImgBrush;
                        }
                    }
                    else
                    {
                        if (type == "TopMix")
                        {
                            listview = GetTemplateChild("PART_Header") as ListView;
                            //if (PreId >= 0)
                            //{
                            if (ItemsSource == vm.TopMix)
                            {

                                var template = listview.ItemContainerGenerator.ContainerFromIndex(id) as ListViewItem;
                                Button PlayPauseGreen = template.Template.FindName("PlayPauseGreen", template) as Button;
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
                                // PreId = -1;
                            }
                            else
                            {

                                for (int i = 0; i < ItemsSource.Count; i++)
                                {
                                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                                    var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                                    ImageBrush img = new ImageBrush();
                                    img.ImageSource = Play;
                                    btn.Background = img;

                                }
                            }

                        }

                        if (type == "Popular")
                        {
                            listview = GetTemplateChild("PART_Header") as ListView;
                            //if (PreId >= 0)
                            //{
                            if (ItemsSource == vm.Popular)
                            {

                                var template = listview.ItemContainerGenerator.ContainerFromIndex(id) as ListViewItem;
                                Button PlayPauseGreen = template.Template.FindName("PlayPauseGreen", template) as Button;
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
                                // PreId = -1;
                            }
                            else
                            {

                                for (int i = 0; i < ItemsSource.Count; i++)
                                {
                                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                                    var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                                    ImageBrush img = new ImageBrush();
                                    img.ImageSource = Play;
                                    btn.Background = img;

                                }
                            }

                        }
                        if (type == "MadeForYou")
                        {
                            listview = GetTemplateChild("PART_Header") as ListView;
                            //if (PreId >= 0)
                            //{
                            if (ItemsSource == vm.MadeForYou)
                            {

                                var template = listview.ItemContainerGenerator.ContainerFromIndex(id) as ListViewItem;
                                Button PlayPauseGreen = template.Template.FindName("PlayPauseGreen", template) as Button;
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
                                // PreId = -1;
                            }
                            else
                            {

                                for (int i = 0; i < ItemsSource.Count; i++)
                                {
                                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                                    var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                                    ImageBrush img = new ImageBrush();
                                    img.ImageSource = Play;
                                    btn.Background = img;

                                }
                            }

                        }
                        if (type == "Trending")
                        {
                            listview = GetTemplateChild("PART_Header") as ListView;
                            //if (PreId >= 0)
                            //{
                            if (ItemsSource == vm.Trending)
                            {

                                var template = listview.ItemContainerGenerator.ContainerFromIndex(id) as ListViewItem;
                                Button PlayPauseGreen = template.Template.FindName("PlayPauseGreen", template) as Button;
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
                                // PreId = -1;
                            }
                            else
                            {

                                for (int i = 0; i < ItemsSource.Count; i++)
                                {
                                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                                    var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                                    ImageBrush img = new ImageBrush();
                                    img.ImageSource = Play;
                                    btn.Background = img;

                                }
                            }

                        }
                        if (type == "Mood")
                        {
                            listview = GetTemplateChild("PART_Header") as ListView;
                            //if (PreId >= 0)
                            //{
                            if (ItemsSource == vm.Mood)
                            {

                                var template = listview.ItemContainerGenerator.ContainerFromIndex(id) as ListViewItem;
                                Button PlayPauseGreen = template.Template.FindName("PlayPauseGreen", template) as Button;
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
                                // PreId = -1;
                            }
                            else
                            {

                                for (int i = 0; i < ItemsSource.Count; i++)
                                {
                                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                                    var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                                    ImageBrush img = new ImageBrush();
                                    img.ImageSource = Play;
                                    btn.Background = img;

                                }
                            }

                        }

                    }
                   

                }

            }
        }
        public bool IsPlay
        {
            get { return (bool)GetValue(IsPlayProperty); }
            set { SetValue(IsPlayProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsPlay.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsPlayProperty =
            DependencyProperty.Register("IsPlay", typeof(bool), typeof(ListAlbumView), new PropertyMetadata(false));
        public ListAlbumView()
        {
            InitializeComponent();
            Binding binding = new Binding("IsPlay");
            binding.Source = SongBottom.Ins;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(listAlbum, IsPlayProperty, binding);
        }


        public Album SelectedItem
        {
            get { return (Album)GetValue(SelectedItemProperty); }
            set { SetValue(SelectedItemProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SelectedItem.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedItemProperty =
            DependencyProperty.Register("SelectedItem", typeof(Album), typeof(ListAlbumView), new PropertyMetadata(null));


        public int SelectedId
        {
            get { return (int)GetValue(SelectedIdProperty); }
            set { SetValue(SelectedIdProperty, value); }
        }

        // Using a DependencyProperty as the backing store for SelectedId.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty SelectedIdProperty =
            DependencyProperty.Register("SelectedId", typeof(int), typeof(ListAlbumView), new PropertyMetadata(0));




        public ObservableCollection<Album> ItemsSource
        {
            get { return (ObservableCollection<Album>)GetValue(ItemsSourceProperty); }
            set { SetValue(ItemsSourceProperty, value); }
        }

        // Using a DependencyProperty as the backing store for MyProperty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ItemsSourceProperty =
            DependencyProperty.Register("ItemsSource", typeof(ObservableCollection<Album>), typeof(ListAlbumView), new PropertyMetadata(null));
        ImageSource Play = (ImageSource)Application.Current.Resources["PlayFill"];
        ImageSource Pause = (ImageSource)Application.Current.Resources["PauseFill"];
        private void PlayPauseGreen_Click(object sender, RoutedEventArgs e)
        {
            RecommendAlbum.id = -1;
            HomeVM vm = this.DataContext as HomeVM;
            int xx = int.Parse((sender as Button).Tag.ToString());

            if (xx <= 6)
            {
                type = "TopMix";
                ItemsSource = vm.TopMix;
            }
            if (xx >= 7 && xx <= 12)
            {
                type = "MadeForYou";

                ItemsSource = vm.MadeForYou;

            }
            if (xx >= 13 && xx <= 18)
            {

                type = "Popular";

                ItemsSource = vm.Popular;

            }
            if (xx >= 19 && xx <= 24)
            {
                type = "Mood";
                ItemsSource = vm.Mood;
              

            }
            if (xx > 25)
            {
                type = "Trending";
                ItemsSource = vm.Trending;
            }


            if (ItemsSource == vm.TopMix) temp = 0;
            if (ItemsSource == vm.MadeForYou) temp = 6;
            if (ItemsSource == vm.Popular) temp = 12;
            if (ItemsSource == vm.Mood) temp = 18;
            if (ItemsSource == vm.Trending) temp = 24;
            ImageBrush ImgBrush = new ImageBrush();
           
         
            if (SongBottom.Ins.SelectedSong == null || id != int.Parse((sender as Button).Tag.ToString()) - 1 - temp ||PreType != type)
            {
                if (AlbumView.type != "likesong" && AlbumView.type != "playlist")
                {
                    Binding binh = new Binding("SelectedSongItem");
                    binh.Source = vm;
                    binh.Mode = BindingMode.TwoWay;
                    BindingOperations.SetBinding(SongBottom.Ins, SongBottom.SelectedSongProperty, binh);
                }
                SongBottom.Ins.CountId = 0;


                SongBottom.Ins.IsPlay = false;
                id = int.Parse((sender as Button).Tag.ToString()) - 1 - temp;
               
                listview = GetTemplateChild("PART_Header") as ListView;
                for (int i = 0; i < ItemsSource.Count; i++)
                {

                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                    var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                    if (int.Parse(btn.Tag.ToString()) != id + 1)
                    {
                        ImageBrush im = new ImageBrush();
                        im.ImageSource = Play;
                        btn.Background = im;
                    }
                }
                
                int IdAlbum = int.Parse((sender as Button).Tag.ToString());
                var AlbumPlay = DataProvider.Ins.DB.Albums.Where(a => a.ID == IdAlbum).FirstOrDefault();
                IsClick = true;
                SongBottom.Ins.ListSong = ItemsSource[id].SongsOfAlbum;
                SongBottom.Ins.SelectedSong = SongBottom.Ins.ListSong[0];
                SongBottom.Ins.IsPlay = true;
                ImgBrush.ImageSource = Pause;


            }
            else
            {

                
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
            }
            (sender as Button).Background = ImgBrush;
            //PreItemSource = ItemsSource;
            PreType = type;
                       
           
        }

        private void listAlbum_Loaded(object sender, RoutedEventArgs e)
        {   
            obj = sender;
            ev = e;
            listview = GetTemplateChild("PART_Header") as ListView;
            
            if (type == "TopMix" || type == "Popular" || type=="Trending" || type == "Mood" || type == "Made for you")
            {
               

                for (int i = 0; i < ItemsSource.Count; i++)
                {
                    if (ItemsSource[i].SongsOfAlbum == SongBottom.Ins.ListSong && SongBottom.Ins.IsPlay == true)
                    {
                        var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                        var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                        ImageBrush img = new ImageBrush();
                        img.ImageSource = Pause;
                        btn.Background = img;
                    }
                    //for (int j = 0; j < ItemsSource[i].Songs.Count; j++)
                    //{
                    //    ObservableCollection<Song> a = new ObservableCollection<Song>(ItemsSource[i].Songs);
                    //    Song song = a[j];
                    //    if (SongBottom.Ins.SelectedSong != null)
                    //    {
                    //        if (SongBottom.Ins.SelectedSong.ID == song.ID && SongBottom.Ins.IsPlay == true)
                    //        {

                    //            var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                    //            var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                    //            ImageBrush img = new ImageBrush();
                    //            img.ImageSource = Pause;
                    //            btn.Background = img;
                    //        }
                    //    }

                    //}

                }

            }
        }
    }
}
