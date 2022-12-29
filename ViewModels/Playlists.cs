using Spotify.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.ViewModels
{
    internal class Playlists
    {
        public static ObservableCollection<Playlist> AllPlaylists = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.ToList());
        public static void InitUri()
        {
            for (int i = 0; i < AllPlaylists.Count; i++)
            {
                Playlist playlist = AllPlaylists[i];
                Playlist.InitUri(ref playlist);
            }
        }
    }
}
