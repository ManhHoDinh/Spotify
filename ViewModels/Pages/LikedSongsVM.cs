using Spotify.Models;
using Spotify.Utilities;
using Spotify.Views.Components;
using Spotify.Views.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;

namespace Spotify.ViewModels.Pages
{
    public class LikedSongsVM : BaseViewModel
    {
        private static ObservableCollection<Song> _listSong;
        public static ObservableCollection<Song> listSong
        {
            get => _listSong;
            set { _listSong = value; }
        }
        private string _Name;
        public string Name
        {
            get => _Name;
            set { _Name = value; OnPropertyChanged(); }
        }
        private string _NameSinger;
        public string NameSinger
        {
            get => _NameSinger;
            set { _NameSinger = value; OnPropertyChanged(); }
        }
        private bool _IsSelected;
        public bool IsSelected { get => _IsSelected; set { _IsSelected = value; OnPropertyChanged(); } }
        private Song _SelectedItem;
        public Song SelectedItem
        {
            get => _SelectedItem;
            set
            {
                _SelectedItem = value;
                OnPropertyChanged();
                if (SelectedItem != null)
                {
                    Name = SelectedItem.Name;
                    NameSinger = SelectedItem.NameSinger;
                    LinkSong = SelectedItem.LinkSong;
                    Image = SelectedItem.Image;
                    SongBottom.Ins.SongName = Name;
                    SongBottom.Ins.SingerName = NameSinger;
                    SongBottom.Ins.LinkSong = LinkSong;
                    SongBottom.Ins.ImageSong = Image;
                    SongBottom.Ins.IsPlay = true;
                }
            }
        }
        private int _SelectedIndex;
        public int SelectedIndex { get => _SelectedIndex; set { _SelectedIndex = value; OnPropertyChanged(); } }
        public ICommand AddCommand { get; set; }
        private Uri _LinkSong;
        public Uri LinkSong { get => _LinkSong; set { _LinkSong = value; OnPropertyChanged(); } }
        private Uri _Image;
        public Uri Image { get => _Image; set { _Image = value; OnPropertyChanged(); } }
        private bool _IsPlay = false;
        public bool IsPlay { get => _IsPlay; set { _IsPlay = value; OnPropertyChanged(); } }

        public LikedSongsVM()
        {
            
            listSong = new ObservableCollection<Song>();
            listSong.Add(Songs.CamNang);
            listSong.Add(Songs.BenTrenTangLau);
            listSong.Add(Songs.DauMua);

            //listSong.Add(new SongItemModel { Id = "3", NameSong = "chúng ta không thuộc nhau", NameSinger = "Sơn Tùng", DurationSong = "3:231" });
            //listSong.Add(new SongItemModel { Id = "4", NameSong = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            //listSong.Add(new SongItemModel { Id = "5", NameSong = "chúng ta không về nhau", NameSinger = "Sơn ùng", DurationSong = "3:25" });
            //listSong.Add(new SongItemModel { Id = "6", NameSong = "chúng ta không thuộc nhau", NameSinger = "ơn Tùng", DurationSong = "3:231" });
            //listSong.Add(new SongItemModel { Id = "7", NameSong = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            //listSong.Add(new SongItemModel { Id = "8", NameSong = "chúng ta không về nhau", NameSinger = "Sơn ùng", DurationSong = "3:25" });
            //listSong.Add(new SongItemModel { Id = "9", NameSong = "chúng ta không thuộc nhau", NameSinger = "ơn Tùng", DurationSong = "3:231" });
            //listSong.Add(new SongItemModel { Id = "10", NameSong = "chúng ta không thuộc về nhau", NameSinger = "Sơn Tùng", DurationSong = "3:23" });
            //listSong.Add(new SongItemModel { Id = "11", NameSong = "chúng ta không về nhau", NameSinger = "Sơn ùng", DurationSong = "3:25" });
            //listSong.Add(new SongItemModel { Id = "12", NameSong = "chúng ta không thuộc nhau", NameSinger = "ơn Tùng", DurationSong = "3:231" });

            AddCommand = new RelayCommand<object>((p) =>
            {
                if (string.IsNullOrEmpty(Name)) return false;
                return true;

            }, (p) =>
            {
                MessageBox.Show("đúng rồi");
            });
            NextCommand = new RelayCommand<object>((p) => true,
                (p) =>
                {
                    int index = SelectedItem.ID;
                    if (index <= listSong.Count)
                        SelectedItem = listSong[index];

                });
            PrevCommand = new RelayCommand<object>((p) => true,
                (p) =>
                {
                    int index = SelectedItem.ID - 2;
                    if (index >= 0)
                        SelectedItem = listSong[index];
                });
        }
        //media
        public ICommand NextCommand { get; set; }
        public ICommand PrevCommand { get; set; }


    }
}
