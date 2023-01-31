using Spotify.ViewModels.Pages;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for YourLibrary.xaml
    /// </summary>
    public partial class YourLibrary : UserControl
    {
        public YourLibrary()
        {
            InitializeComponent();
        }
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
                            for (int i = ListPlaylist.Ins.CurrentIdPlaylist - 1; i < ListPlaylist.Ins.ListSelectedItem.Count - 1 && i >= 0; i++)
                            {
                                ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist - 1);
                            }
                        }

                        else
                        {

                            int countPlaylist = ListPlaylist.Ins.ListSelectedItem.Count;
                            for (int i = ListPlaylist.Ins.CurrentIdPlaylist; i < countPlaylist - 1; i++)
                            {

                                ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist);
                            }

                        }
                    }
                    if (ListAlbum.Ins.CurrentIdAlbum != -1)
                    {
                        if (ListAlbum.Ins.CurrentIdAlbum == ListAlbum.Ins.ListSelectedItem.Count - 1)
                        {

                            for (int i = ListAlbum.Ins.CurrentIdAlbum - 1; i < ListAlbum.Ins.ListSelectedItem.Count - 1 && i >= 0; i++)
                            {
                                ListAlbum.Ins.ListSelectedItem.RemoveAt(ListAlbum.Ins.CurrentIdAlbum - 1);
                            }



                        }


                        else
                        {
                            int countAlbum = ListAlbum.Ins.ListSelectedItem.Count;
                            for (int i = ListAlbum.Ins.CurrentIdAlbum; i < countAlbum - 1; i++)
                            {

                                ListAlbum.Ins.ListSelectedItem.RemoveAt(ListAlbum.Ins.CurrentIdAlbum);
                            }

                        }
                    }

                }
                ViewPage.Ins.CurrentView = obj;
                ViewPage.Ins.ListPage.Add(ViewPage.Ins.CurrentView);
                ViewPage.Ins.CurrentIndexView++;
                ViewPage.Ins.ViewPageSelected = ViewPage.Ins.CurrentView.GetType().Name;
                ViewPage.Ins.IsDisableBack = false;
                ListPlaylist.Ins.SelectedItem = null;


            }
        }
        private void LikeSong_Click(object sender, RoutedEventArgs e)
        {
            ViewPage.Ins.IsSearchView = false;
            TranslatePage(new LikedSongsVM());
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
          
        }
    }
}
