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
                _SelectedSongItem = value;
                OnPropertyChanged();
                if (SelectedSongItem != null)
                {
                    SongBottom.Ins.SongName = SelectedSongItem.SongName;
                    SongBottom.Ins.SingerName = SelectedSongItem.SingerName;
                    SongBottom.Ins.LinkSong = SelectedSongItem.SongLinkUri;
                    SongBottom.Ins.ImageSong = SelectedSongItem.SongImageUri;
                    SongBottom.Ins.IsPlay = true;
                    ViewPage.Ins.CurrentView = new SongView();
                    ViewPage.Ins.CurrentIndexView++;
                    var song = DataProvider.Ins.DB.Songs.Where(s => s.ID == SelectedSongItem.ID).FirstOrDefault();
                    foreach (Song s in Playlists.RecentSearchPlaylist.Songs)
                        if (s.ID == SelectedSongItem.ID)
                            return;
                    Playlists.RecentSearchPlaylist.Songs.Add(song);
                    Playlists.RecentSearchPlaylist.SongsOfPlaylist.Add(song);
                   
                }
                //DataProvider.Ins.DB.Playlists.
            }
        }
        public SearchVM()
        {
            SongSource = Songs.AllSong;
            filteredCollection = SongSource;
            RecentSearch = Playlists.RecentSearchPlaylist.SongsOfPlaylist;
            IsSearch = false;
        }
    }
}
