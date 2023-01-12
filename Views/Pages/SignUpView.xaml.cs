using Spotify.Models;
using Spotify.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics;
using System.Globalization;
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
    /// Interaction logic for SignUpView.xaml
    /// </summary>
    public partial class SignUpView : UserControl
    {
        public SignUpView()
        {
            InitializeComponent();
        }
        private void Spotify_Term_Click(object sender, RoutedEventArgs e)
        {
            string url = "https://www.spotify.com/us/legal/end-user-agreement/";
            Process.Start(new ProcessStartInfo("cmd", $"/c start {url}") { CreateNoWindow = true });
        }
        private void Spotify_Private_policy_Click(object sender, RoutedEventArgs e)
        {
            string url = "https://www.spotify.com/us/legal/privacy-policy/";
            Process.Start(new ProcessStartInfo("cmd", $"/c start {url}") { CreateNoWindow = true });
        }
        private void SignUpBtn_Click(object sender, RoutedEventArgs e)
        {
            bool bug = false;
            User userEmail = DataProvider.Ins.DB.Users.FirstOrDefault(x=>x.Email==Email.Text);
            EmailErorr.Visibility = passwordErorr.Visibility = ConfirmEmailErorr.Visibility
                = profileSub.Visibility = BirthdayError.Visibility = Visibility.Hidden;
            var email = new EmailAddressAttribute();
            if (Email.Text == "")
            {
                EmailErorr.Visibility = Visibility.Visible;
                EmailErorr.Text = "You need to enter your email.";
                bug = true;
            }
            else if (!email.IsValid(Email.Text))
            {
                EmailErorr.Visibility = Visibility.Visible;
                EmailErorr.Text = "This email is invalid. Make sure it's written like example@email.com";
                bug = true;
            }
            else if (userEmail!=null)
            {
                EmailErorr.Visibility = Visibility.Visible;
                EmailErorr.Text = "This email is already connected to an account. Login in below!";
                bug = true;
            }
            if (ConfirmEmail.Text=="")
            {
                ConfirmEmailErorr.Visibility = Visibility.Visible;
                ConfirmEmailErorr.Text = "You need to confirm your email.";
                bug = true;
            }
            else if (ConfirmEmail.Text != Email.Text)
            {
                ConfirmEmailErorr.Visibility = Visibility.Visible;
                ConfirmEmailErorr.Text = "The email addresses don't match.";
                bug = true;
            }
            if(Password.Password=="")
            {
                passwordErorr.Visibility = Visibility.Visible;
                passwordErorr.Text = "You need to enter a password.";
                bug = true;
            }
            else if (Password.Password.Length<8)
            {
                passwordErorr.Visibility = Visibility.Visible;
                passwordErorr.Text = "Your password is too short.";
                bug = true;
            }
            if(profileName.Text=="")
            {
                profileSub.Visibility = Visibility.Visible;
                profileSub.Text = "Enter a name for your profile.";
                bug = true;
            }
            else
            {
                profileSub.Visibility = Visibility.Visible;
                profileSub.Text = "This appears on your profile.";
                profileSub.Foreground = new SolidColorBrush(Colors.Black);
            }
            string month= Month.Text, day= Day.Text, year= Year.Text;
            if (month.Length < 2)
                month = "0" + month;
            if (day.Length < 2)
                day = "0" + day;
            string dateString = month+"-"+day+"-"+year;

            DateTime dateTime; // 10/22/2015 12:00:00 AM
            CultureInfo provider = CultureInfo.InvariantCulture; 
            if (!DateTime.TryParseExact(dateString, "MM-dd-yyyy", provider, DateTimeStyles.None, out dateTime))
            {
                BirthdayError.Visibility= Visibility.Visible;
                bug = true;
            }
            if (!bug)
            {
                //dateTime = DateTime.ParseExact(dateString, "MM-dd-yyyy", provider);
                User user = new User { Email = Email.Text, Password = Password.Password, UserName = profileName.Text, Birthday = dateTime };
                DataProvider.Ins.DB.Users.Add(user);
                DataProvider.Ins.DB.Playlists.Add(new Playlist { 
                    PlaylistType=0, UserID=user.UserID,
                });
                DataProvider.Ins.DB.Playlists.Add(new Playlist
                {
                    PlaylistType = 1,
                    UserID = user.UserID,
                });
                LoginStatus.Current.User = user;
                LoginStatus.Current.ResetAllView();
                LoginStatus.Current.IsMainView = true;
                LoginStatus.Current.NeedLogin = false;
                LoginStatus.Current.HaveUser = true;
                DataProvider.Ins.DB.SaveChanges();
                Properties.Settings.Default.CurrentUserID = DataProvider.Ins.DB.Users.FirstOrDefault(x => x.Email == user.Email).UserID;
                Properties.Settings.Default.Save();
            }
        }
        
        private void SignInBtn_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsLogin = true;
        }
    }
}
