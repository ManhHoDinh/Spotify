﻿using Spotify.ViewModels.Pages;
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
    }
}
