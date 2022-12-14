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
    /// Interaction logic for AfterSendForgotEmailView.xaml
    /// </summary>
    public partial class AfterSendForgotPasswordEmailView : UserControl
    {
        public AfterSendForgotPasswordEmailView()
        {
            InitializeComponent();
        }
        private void HomeBtn_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.IsMainView = true;
            LoginStatus.Current.IsAfterSendForgotPasswordEmail = false;
        }
    }
}
