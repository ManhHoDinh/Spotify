using Spotify.Models;
using Spotify.Utilities;
using Spotify.Views.Components;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Data;

namespace Spotify.ViewModels.Pages
{
    public class OrdinalConverter : IValueConverter
    {
        public object Convert(object value, System.Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {

            ListViewItem lvi = value as ListViewItem;
            int ordinal = 0;

            if (lvi != null)
            {
                ListView lv = ItemsControl.ItemsControlFromItemContainer(lvi) as ListView;
                ordinal = lv.ItemContainerGenerator.IndexFromContainer(lvi) + 1;
            }

            return ordinal;

        }

        public object ConvertBack(object value, System.Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            // This converter does not provide conversion back from ordinal position to list view item
            throw new System.InvalidOperationException();
        }
    }
    internal class SearchVM:BaseViewModel
    {
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
                    SongBottom.Ins.SongName = SelectedSongItem.SongName;
                    SongBottom.Ins.SingerName = SelectedSongItem.SingerName;
                    SongBottom.Ins.LinkSong = new Uri(SelectedSongItem.SongLink);
                }
            }
        }
        public SearchVM()
        {
            ObservableCollection<Song> songs = new ObservableCollection<Song>();
            songs.Add(Songs.CamNang) ;
            songs.Add(Songs.BenTrenTangLau);
            songs.Add(Songs.DauMua);

            SongItemsCollection = new CollectionViewSource { Source = songs };
            SongItemsCollection.Filter += MenuItems_Filter;

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
            if (RemoveSign4VietnameseString(_item.SongName).ToUpper().Contains(RemoveSign4VietnameseString(FilterText).ToUpper()))
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
