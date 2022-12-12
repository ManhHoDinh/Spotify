using Spotify.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.ViewModels.Pages
{
    class LikedSongsVM
    {
        public ObservableCollection<Song>? listSong
        {
            get;
            set;
        }
        public void LoadListSong()
        {
            ObservableCollection<Song> list = new ObservableCollection<Song>();
            list.Add(new Song { ID = "1", Name = "chúng ta không thuộc về nhau",NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = "2", Name = "chúng ta không về nhau",NameSinger = "Sơn ùng", DurationSong = "3:25" });
            list.Add(new Song { ID = "3", Name = "chúng ta không thuộc nhau",NameSinger = "ơn Tùng", DurationSong = "3:231" });
            list.Add(new Song { ID = "1", Name = "chúng ta không thuộc về nhau",NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = "2", Name = "chúng ta không về nhau",NameSinger = "Sơn ùng", DurationSong = "3:25" });
            list.Add(new Song { ID = "3", Name = "chúng ta không thuộc nhau",NameSinger = "ơn Tùng", DurationSong = "3:231" });
            list.Add(new Song { ID = "1", Name = "chúng ta không thuộc về nhau",NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = "2", Name = "chúng ta không về nhau",NameSinger = "Sơn Tùng", DurationSong = "3:25" });
            list.Add(new Song { ID = "3", Name = "chúng ta không thuộc nhau",NameSinger = "ơn Tùng", DurationSong = "3:231" });
            list.Add(new Song { ID = "1", Name = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            list.Add(new Song { ID = "2", Name = "chúng ta không về nhau", NameSinger = "Sơn ùng", DurationSong = "3:25" });
            list.Add(new Song { ID = "3", Name = "chúng ta không thuộc nhau", NameSinger = "Sơn Tùng", DurationSong = "3:231" });
            listSong = list;
        }
    }
}
