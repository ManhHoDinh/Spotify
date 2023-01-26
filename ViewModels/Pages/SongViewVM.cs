using Spotify.Models;
using Spotify.Utilities;
using Spotify.Views.Components;
using Spotify.Views.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Data;

namespace Spotify.ViewModels.Pages
{
    internal class SongViewVM:BaseViewModel
    {
        private string _songName;
        public string SongName { get => _songName; set { _songName = value; OnPropertyChanged(); } }
        private string _singerName;
        public string SingerName { get => _singerName; set { _singerName = value; OnPropertyChanged(); } }
        private Uri _imageSong;
        public Uri ImageSong { get => _imageSong; set { _imageSong = value; OnPropertyChanged(); } }
        private string _description;
        public string Description { get => _description; set { _description = value; OnPropertyChanged(); } }
        private Song _selectedSong;
        public Song SelectedSong { get => _selectedSong; set {
                _selectedSong = value;
                OnPropertyChanged();
                if(SelectedSong != null)
                {
                    SingerName = SelectedSong.SingerName;
                    SongName = SelectedSong.SongName;
                    ImageSong = SelectedSong.SongImageUri;
                }
               
            } }
        public SongViewVM()
        {

            //if (SongBottom.Ins.SelectedSong == null)
            //{

            //    SongName = SongSelect.Ins.SongName;
            //    SingerName = SongSelect.Ins.SingerName;
            //    ImageSong = SongSelect.Ins.ImageSong;
            //}
            //else
            //{
            string Name = SongSelect.Ins.SongName;
            string Singer = SongSelect.Ins.SingerName;
            Uri Image = SongSelect.Ins.ImageSong;
            string Description = SongSelect.Ins.Description;
            Binding SongNameBinding = new Binding("SongName");
                SongNameBinding.Source = this;
                SongNameBinding.Mode = BindingMode.OneWayToSource;
                BindingOperations.SetBinding(SongSelect.Ins, SongSelect.SongNameProperty, SongNameBinding);
                Binding SingerNameBinding = new Binding("SingerName");
                SingerNameBinding.Source = this;
                SingerNameBinding.Mode = BindingMode.OneWayToSource;
                BindingOperations.SetBinding(SongSelect.Ins, SongSelect.SingerNameProperty, SingerNameBinding);
                Binding ImageBinding = new Binding("ImageSong");
                ImageBinding.Source = this;
                ImageBinding.Mode = BindingMode.OneWayToSource;
                BindingOperations.SetBinding(SongSelect.Ins, SongSelect.ImageSongProperty, ImageBinding);
            Binding DesctiptionBinding = new Binding("Description");
            DesctiptionBinding.Source = this;
            DesctiptionBinding.Mode = BindingMode.OneWayToSource;
            BindingOperations.SetBinding(SongSelect.Ins, SongSelect.DescriptionProperty, DesctiptionBinding);
            SongSelect.Ins.SongName = Name;
            SongSelect.Ins.SingerName = Singer;
            SongSelect.Ins.ImageSong = Image;
            SongSelect.Ins.Description = Description;
            //  }





        }
    }
}
