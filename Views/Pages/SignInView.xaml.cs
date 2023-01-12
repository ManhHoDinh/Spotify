using Spotify.Models;
using Spotify.ViewModels;
using Spotify.ViewModels.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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
    /// Interaction logic for SignInView.xaml
    /// </summary>
    public partial class SignInView : UserControl
    {
        public SignInView()
        {
            InitializeComponent();
        }

        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            User user = DataProvider.Ins.DB.Users.FirstOrDefault(x => (x.Email == Email.Text) && x.Password == Password.Password);
            if (user != null)
            {
                LoginStatus.Current.User = user;
                //if(LoginStatus.Current.User.UserImageSource==null)
                //    User.InitUri(ref user);
                Properties.Settings.Default.CurrentUserID = user.UserID;
                LoginStatus.Current.ResetAllView();
                LoginStatus.Current.IsMainView = true;
                LoginStatus.Current.NeedLogin = false;
                LoginStatus.Current.HaveUser = true;
                Properties.Settings.Default.Save();
            }
            else
                AnnouceLoginError.Visibility = Visibility.Visible;
        }
        private void SignUpBtn_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsSignUp = true;
        }

        private void ForgotPassword_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsForgotPassword = true;
        }
    }
}
