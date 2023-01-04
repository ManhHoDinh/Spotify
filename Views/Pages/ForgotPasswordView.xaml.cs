using Spotify.ViewModels;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
    /// Interaction logic for ForgotPasswordForm.xaml
    /// </summary>
    public partial class ForgotPasswordView : UserControl
    {
        public ForgotPasswordView()
        {
            InitializeComponent();
        }


        private void Spotify_Support_Click(object sender, RoutedEventArgs e)
        {
            string url = "https://support.spotify.com/vn-vi/";
            Process.Start(new ProcessStartInfo("cmd", $"/c start {url}") { CreateNoWindow = true });
        }

        private void SendBtn_Click(object sender, RoutedEventArgs e)
        {
            if (UserNameOrEmail.Text == "")
                Error.Visibility = Visibility.Visible;
            else
            {
                LoginStatus.Current.IsForgotPassword = false;
                LoginStatus.Current.IsAfterSendForgotPasswordEmail = true;
            }
        }
    }
}

