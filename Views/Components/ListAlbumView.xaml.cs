using Spotify.Models;
using Spotify.ViewModels.Pages;
using Spotify.Views.Pages;
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
        private int id;
        public static bool IsClick;
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {
            base.OnPropertyChanged(e);
            if (e.Property == IsPlayProperty)
            {
                if (GetTemplateChild("PART_Header") != null)
                {

                    listview = GetTemplateChild("PART_Header") as ListView;
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
                    // what is the code that would go here?
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
            
            
            ImageBrush ImgBrush = new ImageBrush();
            if (SongBottom.Ins.SelectedSong == null || id != int.Parse((sender as Button).Tag.ToString()) - 1)
            {
                id = int.Parse((sender as Button).Tag.ToString()) - 1;
                listview = GetTemplateChild("PART_Header") as ListView;
                 for (int i = 0; i < ItemsSource.Count; i++)
                {
                    var template = listview.ItemContainerGenerator.ContainerFromIndex(i) as ListViewItem;
                    var btn = template.Template.FindName("PlayPauseGreen", template) as Button;
                    if(int.Parse(btn.Tag.ToString()) != id + 1)
                    {
                        ImageBrush im = new ImageBrush();
                        im.ImageSource = Play;
                        btn.Background = im;
                    }
                }
                HomeVM vm = this.DataContext as HomeVM;
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
            (sender as Button).Background = ImgBrush;
            
        }


    }
}
