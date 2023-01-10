using Spotify.ViewModels;
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

namespace Spotify.Views.Pages
{
    /// <summary>
    /// Interaction logic for InfoAccount.xaml
    /// </summary>
    public partial class InfoAccount : UserControl
    {
        public InfoAccount()
        {
            InitializeComponent();
            Birthday.ContentStringFormat = "dd/MM/yyyy";
        }

        private void Editbtn_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsEditAccountView= true;
        }

        private void Home_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsMainView = true;
        }
    }
}
