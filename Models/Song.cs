using Spotify.Utilities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.Models
{
    public class Song:BaseViewModel
    {
        private string _id;
        private string _name;
        private string _namesinger;
        private string _albumName;
        private string _type;
        private string _decription;
        private string _postTime;
        private string _image;
        private string _durationSong;

        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                if (_name != value)
                {
                    _name = value;
                    OnPropertyChanged();
                }
            }
        }
        public string NameSinger
        {
            get
            {
                return _namesinger;
            }
            set
            {
                if (_namesinger != value)
                {
                    _namesinger = value;
                    OnPropertyChanged();
                }
            }
        }

        public string AlbumName
        {
            get
            {
                return _albumName;
            }
            set
            {
                if (_albumName != value)
                {
                    _albumName = value;
                    OnPropertyChanged();
                }
            }
        }


        public string Type
        {
            get
            {
                return _type;
            }
            set
            {
                if (_type != value)
                {
                    _type = value;
                    OnPropertyChanged();
                }
            }
        }
        public string Deciption
        {
            get
            {
                return _decription;
            }
            set
            {
                if (_decription != value)
                {
                    _decription = value;
                    OnPropertyChanged();
                }
            }
        }
        public string PostTime
        {
            get
            {
                return _postTime;
            }
            set
            {
                if (_postTime != value)
                {
                    _postTime = value;
                    OnPropertyChanged();
                }
            }
        }
        public string Image
        {
            get
            {
                return _image;
            }
            set
            {
                if (_image != value)
                {
                    _image = value;
                    OnPropertyChanged();
                }
            }
        }
        public string ID
        {
            get
            {
                return _id;
            }
            set
            {
                if (_id != value)
                {
                    _id = value;
                    OnPropertyChanged();
                }
            }
        }
       public string DurationSong
        {
            get
            {
                return _durationSong;
            }
            set
            {
                if (_durationSong != value)
                {
                    _durationSong = value;
                    OnPropertyChanged();
                }
            }
        }

    }
}
