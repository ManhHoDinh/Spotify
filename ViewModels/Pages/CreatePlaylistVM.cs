using Spotify.Models;
using Spotify.Utilities;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows;
using Spotify.Views.Pages;
using System.Windows.Data;
using System.ComponentModel;

namespace Spotify.ViewModels.Pages
{
    public class CreatePlaylistVM : BaseViewModel
    {

        public ICommand LoadCommand { get; set; }
        public ICommand CloseCommand { get; set; }
        public ICommand SaveCommand { get; set; }
        public ICommand OptionCommand { get; set; }
        public ICommand OpenFormDeleteCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand CancelCommand { get; set; }
        //public ICommand LoadImageCommand { get; set; }

        private string _namePlaylist = "Playlist";
        public string NamePlaylist { get => _namePlaylist; set { _namePlaylist = value; OnPropertyChanged(); } }
        private string _descriptionPlaylist = "";
        public string DescriptionPlaylist { get => _descriptionPlaylist; set { _descriptionPlaylist = value; OnPropertyChanged(); } }
        private bool _isVisibleOption = false;
        public bool IsVisibleOption { get => _isVisibleOption; set { _isVisibleOption = value; OnPropertyChanged(); } }
        private Playlist _SelectedPlaylist;
        public Playlist SelectedPlaylist { get => _SelectedPlaylist; set { _SelectedPlaylist = value; OnPropertyChanged(); if (SelectedPlaylist != null) { NamePlaylist = SelectedPlaylist.NamePlaylist; DescriptionPlaylist = SelectedPlaylist.DescriptionPlaylist; } } }
        //private BitmapImage _pathImage;
        //public BitmapImage PathImage { get => _pathImage; set { _pathImage = value; OnPropertyChanged(); } }
        public CreatePlaylistVM()
        {
            ObservableCollection<Song> songs = new ObservableCollection<Song>();
            songs.Add(Songs.CamNang);
            songs.Add(Songs.BenTrenTangLau);
            songs.Add(Songs.DauMua);

            SongItemsCollection = new CollectionViewSource { Source = songs };
            SongItemsCollection.Filter += MenuItems_Filter;
            LoadCommand = new RelayCommand<object>(
                (p) =>
                {
                    return true;
                }, (p) =>
                {
                    PlayListForm form = new PlayListForm();
                    Application.Current.MainWindow.Opacity = 0.3;
                    form.ShowDialog();
                    Application.Current.MainWindow.Opacity = 1;
                    IsVisibleOption = false;
                });
            CloseCommand = new RelayCommand<object>(
              (p) =>
              {
                  return true;
              }, (p) =>
              {

                  ((Window)p).Close();
              });
            SaveCommand = new RelayCommand<object>(
              (p) =>
              {
                  return true;
              }, (p) =>
              {
                  PlayListForm SaveForm = (PlayListForm)p;
                  NamePlaylist = SaveForm.NamePlaylist.Text;
                  DescriptionPlaylist = SaveForm.DescriptionPlaylist.Text;
                  SaveForm.Close();
                  SelectedPlaylist.NamePlaylist = NamePlaylist;
                  SelectedPlaylist.DescriptionPlaylist = DescriptionPlaylist;

              });
            OptionCommand = new RelayCommand<object>(
          (p) =>
          {
              return true;
          }, (p) =>
          {
              if (IsVisibleOption == false) IsVisibleOption = true;
              else IsVisibleOption = false;
          });
            OpenFormDeleteCommand = new RelayCommand<object>(
        (p) =>
        {
            return true;
        }, (p) =>
        {
            DeleteForm form = new DeleteForm();
            Application.Current.MainWindow.Opacity = 0.3;
            form.ShowDialog();
            Application.Current.MainWindow.Opacity = 1;
        });
            DeleteCommand = new RelayCommand<object>(
       (p) =>
       {
           return true;
       }, (p) =>
       {
           ListPlaylist.Ins.List.Remove(SelectedPlaylist);
           SelectedPlaylist = ListPlaylist.Ins.List[0];
           DeleteForm form = (DeleteForm)p;
           form.Close();
           IsVisibleOption = false;
       });
            CancelCommand = new RelayCommand<object>(
      (p) =>
      {
          return true;
      }, (p) =>
      {
          DeleteForm form = (DeleteForm)p;
          form.Close();
          IsVisibleOption = false;

      });

            //LoadImageCommand = new RelayCommand<object>(
            //  (p) =>
            //  {
            //      return true;
            //  }, (p) =>
            //  {
            //      PlayListForm form = new PlayListForm();
            //      OpenFileDialog filedialog = new OpenFileDialog();
            //      if (filedialog.ShowDialog() == true)
            //      {

            //          PathImage = new BitmapImage(new Uri(@filedialog.FileName,UriKind.Relative));
            //      }
            //      {

            //      }
            //  });
        }
        private CollectionViewSource SongItemsCollection;
        public ICollectionView SongSourceCollection => SongItemsCollection.View;

        private Song _SelectedSongItem;
        public Song SelectedSongItem
        {
            get => _SelectedSongItem;
            set
            {
                _SelectedSongItem = value;
                OnPropertyChanged();
                if (SelectedSongItem != null)
                {
                    SongBottom.Ins.SongName = SelectedSongItem.Name;
                    SongBottom.Ins.SingerName = SelectedSongItem.NameSinger;
                    SongBottom.Ins.LinkSong = SelectedSongItem.LinkSong;
                }
            }
        }
        
        public static string RemoveSign4VietnameseString(string str)
        {
            for (int i = 1; i < VietnameseSigns.Length; i++)
            {
                for (int j = 0; j < VietnameseSigns[i].Length; j++)
                    str = str.Replace(VietnameseSigns[i][j], VietnameseSigns[0][i - 1]);
            }
            return str;
        }
        private static readonly string[] VietnameseSigns = new string[]
        {

            "aAeEoOuUiIdDyY",

            "áàạảãâấầậẩẫăắằặẳẵ",

            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",

            "éèẹẻẽêếềệểễ",

            "ÉÈẸẺẼÊẾỀỆỂỄ",

            "óòọỏõôốồộổỗơớờợởỡ",

            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",

            "úùụủũưứừựửữ",

            "ÚÙỤỦŨƯỨỪỰỬỮ",

            "íìịỉĩ",

            "ÍÌỊỈĨ",

            "đ",

            "Đ",

            "ýỳỵỷỹ",

            "ÝỲỴỶỸ"
        };
        private string filterText;
        public string FilterText
        {
            get => filterText;
            set
            {
                filterText = value;
                SongItemsCollection.View.Refresh();
                OnPropertyChanged("FilterText");
            }
        }

        private void MenuItems_Filter(object sender, FilterEventArgs e)
        {
            if (string.IsNullOrEmpty(FilterText))
            {
                e.Accepted = true;
                return;
            }

            Song _item = e.Item as Song;
            if (RemoveSign4VietnameseString(_item.Name).ToUpper().Contains(RemoveSign4VietnameseString(FilterText).ToUpper()))
            {
                e.Accepted = true;
            }
            else
            {
                e.Accepted = false;
            }
        }
    }
}