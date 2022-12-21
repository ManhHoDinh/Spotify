using Spotify.Utilities;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Spotify.Models
{
    public class Song : BaseViewModel
    {
        private int _id;
        public int ID
        {
            get => _id; set { _id = value; OnPropertyChanged(); }
        }
        private string _name;
        public string Name
        {
            get => _name; set { _name = value; OnPropertyChanged(); }
        }
        private string _namesinger;
        public string NameSinger
        {
            get => _namesinger; set { _namesinger = value; OnPropertyChanged(); }

        }
        private string _albumName;
        public string AlbumName
        {
            get => _albumName; set { _albumName = value; OnPropertyChanged(); }
        }
        private string _type;
        public string Type
        {
            get => _type; set { _type = value; OnPropertyChanged(); }
        }
        private string _decription;
        public string Decription
        {
            get => _decription; set { _decription = value; OnPropertyChanged(); }
        }
        private string _postTime;
        public string PostTime
        {
            get => _postTime; set { _postTime = value; OnPropertyChanged(); }
        }
        private Uri _image;
        public Uri Image
        {
            get => _image; set { _image = value; OnPropertyChanged(); }
        }
        private string _durationSong;
        public string DurationSong
        {
            get => _durationSong; set { _durationSong = value; OnPropertyChanged(); }
        }
        private Uri _LinkSong;
        public Uri LinkSong
        {
            get => _LinkSong; set { _LinkSong = value; OnPropertyChanged(); }
        }
        private bool _isPlay = false;
        public bool IsPlay
        {
            get => _isPlay; set { _isPlay = value; OnPropertyChanged(); }
        }

    }
}
