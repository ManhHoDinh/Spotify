using Spotify.Models;
using Spotify.Utilities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.ViewModels
{
    public class Playlists:BaseViewModel
    {
        Playlists()
        {
            LikedSongsPlayplist = DataProvider.Ins.DB.Playlists.Where(a => a.PlaylistType == 0 && a.UserID == 1).FirstOrDefault();
            RecentSearchPlaylist = DataProvider.Ins.DB.Playlists.Where(a => a.PlaylistType == 1 && a.UserID == 1).FirstOrDefault();
        }
        public static ObservableCollection<Playlist> AllPlaylists = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.ToList());
        public static void InitUri()
        {
            for (int i = 0; i < AllPlaylists.Count; i++)
            {
                Playlist playlist = AllPlaylists[i];
                Playlist.InitUri(ref playlist);
            }
        }
        public static Playlists Ins=new Playlists();
        private Playlist _likeSongPlayplist;
        public Playlist LikedSongsPlayplist
        {
            set { _likeSongPlayplist = value; OnPropertyChanged(); }
            get { return _likeSongPlayplist; }
        }
        private Playlist _recentSearchPlaylist;
        public Playlist RecentSearchPlaylist
        {
            set { _recentSearchPlaylist = value; OnPropertyChanged(); }
            get { return _recentSearchPlaylist; }
        }
    }
}
