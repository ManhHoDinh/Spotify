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
using System.Windows.Shapes;

namespace Spotify.Views.Pages
{
    /// <summary>
    /// Interaction logic for PlaylistError.xaml
    /// </summary>
    public partial class PlaylistError : Window
    {
        public PlaylistError()
        {
            InitializeComponent();
        }
        private void NotNowBtn_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void LogInBtn_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsLogin = true;
            this.Close();

        }
    }
}
