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
        private ObservableCollection<Song> _listSong;
        public ObservableCollection<Song> listSong
        {
            get => _listSong;
            set { _listSong = value; OnPropertyChanged(); }
        }
        private string _Name = "Liked Songs";
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
                    LinkSong = new Uri(SelectedItem.SongLink);
                    Image = new Uri(SelectedItem.SongImage);
                    SongBottom.Ins.SongName = SelectedItem.SongName;
                    SongBottom.Ins.SingerName = SelectedItem.SingerName;
                    SongBottom.Ins.LinkSong = LinkSong;
                    SongBottom.Ins.ImageSong = Image;
                    SongBottom.Ins.IsPlay = true;
                    Properties.Settings.Default.CurrentSongID = SelectedItem.ID;
                    Properties.Settings.Default.Save();
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
        private int _userId;
        public int UserId { get => _userId; set { _userId = value; OnPropertyChanged(); } }
        public LikedSongsVM()
        {
           
            Binding binding = new Binding("SelectedItem");
            binding.Source = this;
            binding.Mode = BindingMode.OneWayToSource;
            BindingOperations.SetBinding(SongBottom.Ins, SongBottom.SelectedSongProperty, binding);
           
            
                //var songs = DataProvider.Ins.DB.Playlists.Where(a => a.PlaylistType == 0 && a.UserID == ViewPage.Ins.UserId).Select(a=>a.Songs).FirstOrDefault();
            
                //listSong = new ObservableCollection<Song>(songs);
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
