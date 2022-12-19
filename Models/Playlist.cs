using Spotify.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.Models
{
    public class Playlist:BaseViewModel
    {
        private string _NamePlaylist;
        public string NamePlaylist { get => _NamePlaylist; set { _NamePlaylist= value; OnPropertyChanged(); } }
        private string _DescriptionPlaylist;
        public string DescriptionPlaylist { get => _DescriptionPlaylist; set { _DescriptionPlaylist = value; OnPropertyChanged(); } }
    }
}
