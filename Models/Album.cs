using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;
using Spotify.Utilities;
namespace Spotify.Models
{
    public class Album : BaseViewModel
    {
        private string _name;
        private string _namesinger;
        private string _type;
        private string _description;
        private string _postTime;
        private string _image;
        public ObservableCollection<Song> SongsOfAlbum = new ObservableCollection<Song>();
        public Album myProperty   // CS0053  
        {
            get
            {
                return new Album();
            }
            set
            {
            }
        }

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
        public string Description
        {
            get
            {
                return _description;
            }
            set
            {
                if (_description != value)
                {
                    _description = value;
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



    }

}
