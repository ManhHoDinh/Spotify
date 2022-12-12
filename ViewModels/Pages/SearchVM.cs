using Spotify.Models;
using Spotify.Utilities;
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
        public SearchVM()
        {
            ObservableCollection<Song>Songs= new ObservableCollection<Song>
            {
                new Song{Name="Có Chàng trai viết lên cây", NameSinger="Phan Mạnh Quỳnh", AlbumName="Ablum A",DurationSong="3:33"},
                new Song{Name="Mong Manh Tinh Ve", NameSinger="Mỹ Tâm", AlbumName="Ablum C",DurationSong="3:33"},
                new Song{Name="Mang Tiền Về cho Mẹ", NameSinger="Đen Vâu, Nguyên Thảo", AlbumName="Ablum B",DurationSong="3:33"},
                new Song{Name="B", NameSinger="Đen Vâu, Nguyên Thảo", AlbumName="Ablum D",DurationSong="3:33" },
                new Song{Name="A", NameSinger="Đen Vâu, Nguyên Thảo", AlbumName="Ablum P",DurationSong="3:33" }
            };

            SongItemsCollection = new CollectionViewSource { Source = Songs };
            SongItemsCollection.Filter += MenuItems_Filter;

        }

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
