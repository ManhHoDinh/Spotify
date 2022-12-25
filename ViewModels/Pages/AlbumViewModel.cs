using Spotify.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Spotify.Utilities;
namespace Spotify.ViewModels.Pages
{
    internal class AlbumViewModel : BaseViewModel
    {
       
        public ICommand ClickCommand { get; set; }
        private Album _SelectedItem;
        public Album SelectedItem { get => _SelectedItem; set { _SelectedItem = value; OnPropertyChanged(); if (SelectedItem != null) { AlbumName = SelectedItem.AlbumName; AlbumDescription = SelectedItem.Descriptions; IsAlbumItemVisible = true; IsAlbumListVisible = false; } } }
        private string _AlbumName;
        public string AlbumName { get => _AlbumName; set { _AlbumName = value; OnPropertyChanged(); } }
        private string _AlbumDescription;
        public string AlbumDescription { get => _AlbumDescription; set { _AlbumDescription = value; OnPropertyChanged(); } }
        private bool _IsAlbumItemVisible;
        public bool IsAlbumItemVisible { get => _IsAlbumItemVisible; set { _IsAlbumItemVisible = value; OnPropertyChanged(); } }
        private bool _IsAlbumListVisible;
        public bool IsAlbumListVisible { get => _IsAlbumListVisible; set { _IsAlbumListVisible = value; OnPropertyChanged(); } }
        public AlbumViewModel()
        {
            IsAlbumListVisible = true;
           
            ClickCommand = new RelayCommand<object>((p) =>
            {
                return true;
            }, (p) =>
            {
                MessageBox.Show("success");
            }
            );
        }
    }
}
