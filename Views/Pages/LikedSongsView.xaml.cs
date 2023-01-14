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
    /// Interaction logic for LikedSongsView.xaml
    /// </summary>
    public partial class LikedSongsView : UserControl
    {
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {

            base.OnPropertyChanged(e);
            if (e.Property == IsEmptyProperty)
            {
                if(IsEmpty == true)
                {
                    HaveSong.Visibility = Visibility.Hidden;
                    NotHaveSong.Visibility = Visibility.Visible;

                }
                else
                {
                    HaveSong.Visibility = Visibility.Visible;
                    NotHaveSong.Visibility = Visibility.Hidden;

                }



            }

        }

        public LikedSongsView()
        {
            InitializeComponent();
            SongBottom.Ins.ListSong = ListLikeSongs.ItemSource;
            Binding binding = new Binding("IsEmpty");
            binding.Source = SongBottom.Ins;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(this, IsEmptyProperty,binding);

        }


        public bool IsEmpty
        {
            get { return (bool)GetValue(IsEmptyProperty); }
            set { SetValue(IsEmptyProperty, value); 
               
            }
        }

        // Using a DependencyProperty as the backing store for IsEmpty.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsEmptyProperty =
            DependencyProperty.Register("IsEmpty", typeof(bool), typeof(LikedSongsView), new PropertyMetadata(false));



        void TranslatePage(object obj)
        {
            if (ViewPage.Ins.CurrentView.GetType().Name != obj.GetType().Name)
            {
                int currentId = ViewPage.Ins.CurrentIndexView;
                int count = ViewPage.Ins.ListPage.Count;

                if (currentId + 1 < count)
                {
                    for (int i = currentId + 1; i < count; i++)
                    {
                        ViewPage.Ins.ListPage.RemoveAt(currentId + 1);
                    }

                    if (ListPlaylist.Ins.CurrentIdPlaylist != -1)
                    {
                        if (ListPlaylist.Ins.CurrentIdPlaylist == ListPlaylist.Ins.ListSelectedItem.Count - 1)
                        {
                            for (int i = ListPlaylist.Ins.CurrentIdPlaylist; i < ListPlaylist.Ins.ListSelectedItem.Count; i++)
                            {
                                ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist);
                            }
                        }

                        else
                        {
                            int countPlaylist = ListPlaylist.Ins.ListSelectedItem.Count;
                            for (int i = ListPlaylist.Ins.CurrentIdPlaylist + 1; i < countPlaylist; i++)
                            {

                                ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist + 1);
                            }

                        }
                    }


                }
                ViewPage.Ins.CurrentView = obj;
                ViewPage.Ins.ListPage.Add(ViewPage.Ins.CurrentView);
                ViewPage.Ins.CurrentIndexView++;
                ViewPage.Ins.IsDisableBack = false;
                ListPlaylist.Ins.SelectedItem = null;


            }
        }
        private void Find_Click(object sender, RoutedEventArgs e)
        {
            ViewPage.Ins.IsSearchView = true;
            TranslatePage(new SearchVM());
            ViewPage.Ins.ViewPageSelected = "SearchVM";
        }

        private void LikeSong_Loaded(object sender, RoutedEventArgs e)
        {
            if (ListLikeSongs.ItemSource.Count == 0)
            {
                HaveSong.Visibility = Visibility.Hidden;
                NotHaveSong.Visibility = Visibility.Visible;
            }
            else
            {
                HaveSong.Visibility = Visibility.Visible;
                NotHaveSong.Visibility = Visibility.Hidden;
            }
        }
    }
}
