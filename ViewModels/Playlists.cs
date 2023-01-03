using Spotify.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.ViewModels
{
    public class Playlists
    {
        public static ObservableCollection<Playlist> AllPlaylist = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.Where(a=>a.UserID==1).ToList());
        public static void InitUri()
        {
            for (int i = 0; i < AllPlaylist.Count; i++)
            {
                Playlist playlist = AllPlaylist[i];
                Playlist.InitUri(ref playlist);
            }
        }
        public static Playlist LikedSongsPlayplist = DataProvider.Ins.DB.Playlists.Where(a => a.PlaylistType == 0 && a.UserID == 1).FirstOrDefault();
        public static Playlist RecentSearchPlaylist = DataProvider.Ins.DB.Playlists.Where(a => a.PlaylistType == 1 && a.UserID == 1).FirstOrDefault();
    }
}
