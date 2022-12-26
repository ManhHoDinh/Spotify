using Spotify.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.ViewModels.Pages
{
    class Albums
    {
        public static ObservableCollection<Album> AllAlbums = new ObservableCollection<Album>(DataProvider.Ins.DB.Albums.ToList());
        public static void InitUri()
        {
            for (int i = 0; i < AllAlbums.Count; i++)
            {
                Album album = AllAlbums[i];
                Album.InitUri(ref album);
            }
        }
    }
}
