using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Spotify.Views.Components
{
    /// <summary>
    /// Interaction logic for UserControl1.xaml
    /// </summary>
    public partial class Header : UserControl
    {
        public static readonly DependencyProperty TextProperty = DependencyProperty.Register
            ("UserName", typeof(string), typeof(Header), new PropertyMetadata(null));
        private string _UserName;
        public string UserName
        {
            get
            {
                return (string)GetValue(TextProperty);
            }
            set
            {
                _UserName = value;
            }
        }
        public Header()
        {
            DataContext = this;
            InitializeComponent();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void SearchTextbox_TextChanged(object sender, TextChangedEventArgs e)
        {
            //if (SearchBox.Text != string.Empty)
            //{
            //    PreparingSearch.Visibility = Visibility.Hidden;
            //    BeginingSearch.Visibility = Visibility.Visible;
            //}
            //else
            //{
            //    PreparingSearch.Visibility = Visibility.Visible;
            //    BeginingSearch.Visibility = Visibility.Hidden;
            //}
        }
        private void NextButton_Click(object sender, RoutedEventArgs e)
        {

        }

    }
}
