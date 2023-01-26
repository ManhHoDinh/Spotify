using Spotify.Models;
using Spotify.Utilities;
using Spotify.Views.Components;
using Spotify.Views.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace Spotify.ViewModels.Pages
{
    public class OrdinalConverter : IValueConverter
    {
        public object Convert(object value, System.Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {

            ListViewItem lvi = value as ListViewItem;
            int ordinal = 0;

            if (lvi != null)
            {
                ListView lv = ItemsControl.ItemsControlFromItemContainer(lvi) as ListView;
                ordinal = lv.ItemContainerGenerator.IndexFromContainer(lvi) + 1;
            }

            return ordinal;

        }

        public object ConvertBack(object value, System.Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            // This converter does not provide conversion back from ordinal position to list view item
            throw new System.InvalidOperationException();
        }
    }
    internal class SearchVM:BaseViewModel
    {
        private ObservableCollection<Song> _SongSource = new ObservableCollection<Song>();
        public ObservableCollection<Song> SongSource { get => _SongSource; set { _SongSource = value; OnPropertyChanged(); } }

        private ObservableCollection<Song> _filteredCollection = new ObservableCollection<Song>();
        public ObservableCollection<Song> filteredCollection { get => _filteredCollection; set { _filteredCollection = value; OnPropertyChanged(); } }
        private ObservableCollection<Song> _recentSearch = new ObservableCollection<Song>();
        public ObservableCollection<Song>RecentSearch { get => _recentSearch; set { _recentSearch = value; OnPropertyChanged(); } }
        
        private bool _isSearch;
        public bool IsSearch { get => _isSearch; set { _isSearch= value; OnPropertyChanged(); } }
        public static SearchVM Ins=new SearchVM();
        private Song _SelectedSongItem;
        public Song SelectedSongItem
        {
            get => _SelectedSongItem;
            set
            {
                try {
                    _SelectedSongItem = value;
                    OnPropertyChanged();
                    if (SelectedSongItem != null)
                    {
                        ViewPage.Ins.IsSearchView = false;
                      
                        SongSelect.Ins.SongName = SelectedSongItem.SongName;
                        SongSelect.Ins.SingerName = SelectedSongItem.SingerName;
                        SongSelect.Ins.LinkSong = SelectedSongItem.SongLinkUri;
                        SongSelect.Ins.ImageSong = SelectedSongItem.SongImageUri;
                        SongSelect.Ins.Description = SelectedSongItem.Descriptions;
                        var song = DataProvider.Ins.DB.Songs.Where(s => s.ID == SelectedSongItem.ID).FirstOrDefault();
                        SongView a = new SongView();
                        TranslatePage(a);
                        a.SelectedSong = SelectedSongItem;
                        try {
                            foreach (Song s in Playlists.Ins.RecentSearchPlaylist.SongsOfPlaylist)
                                if (s.ID == SelectedSongItem.ID)
                                    return;
                        }
                        catch { }
                        Playlists.Ins.RecentSearchPlaylist.Songs.Add(song);
                        Playlists.Ins.RecentSearchPlaylist.SongsOfPlaylist.Add(song);
                        DataProvider.Ins.DB.SaveChanges();
                    } 
                }
            
                catch { }
            }
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
                    if (ListAlbum.Ins.CurrentIdAlbum != -1)
                    {
                        if (ListAlbum.Ins.CurrentIdAlbum == ListAlbum.Ins.ListSelectedItem.Count - 1)
                        {
                            for (int i = ListAlbum.Ins.CurrentIdAlbum; i < ListAlbum.Ins.ListSelectedItem.Count; i++)
                            {
                                ListAlbum.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist);
                            }
                        }


                        else
                        {
                            int countAlbum = ListAlbum.Ins.ListSelectedItem.Count;
                            for (int i = ListAlbum.Ins.CurrentIdAlbum + 1; i < countAlbum; i++)
                            {

                                ListAlbum.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.CurrentIdPlaylist + 1);
                            }

                        }
                    }
                }
                // MessageBox.Show(SongBottom.Ins.CountId.ToString());
                ViewPage.Ins.CurrentView = obj;
                ViewPage.Ins.ListPage.Add(ViewPage.Ins.CurrentView);
                ViewPage.Ins.CurrentIndexView++;
                ViewPage.Ins.IsDisableBack = false;
            }
        }
        public SearchVM()
        {
            SongSource = Songs.AllSong;
            filteredCollection = SongSource;
            IsSearch = false;
        }
    }
}
