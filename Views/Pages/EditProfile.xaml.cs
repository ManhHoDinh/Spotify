using Spotify.Models;
using Spotify.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using System.Net;
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
    /// Interaction logic for EditProfile.xaml
    /// </summary>
    public partial class EditProfile : UserControl
    {
        public EditProfile()
        {
            InitializeComponent();
            //if (Month.Text.Length < 2)
            //    Month.Text = "0" + Month.Text;
            //if (Day.Text.Length < 2)
            //    Day.Text = "0" + Day.Text;
            //if (LoginStatus.Current.User != null)
            //{
            //    Password.Password = LoginStatus.Current.User.Password;
            //    ConfirmPassword.Password = LoginStatus.Current.User.Password;
            //}
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try{
                bool bug = false;
                User userEmail = DataProvider.Ins.DB.Users.FirstOrDefault(x => x.Email == Email.Text);
                var email = new EmailAddressAttribute();
                if (Email.Text == "")
                {
                    Error.Visibility = Visibility.Visible;
                    Error.Text = "You need to enter your email.";
                    bug = true;
                }
                else if (!email.IsValid(Email.Text))
                {
                    Error.Visibility = Visibility.Visible;
                    Error.Text = "This email is invalid. Make sure it's written like example@email.com";
                    bug = true;
                }
                else if (userEmail != null && LoginStatus.Current.User.Email != Email.Text)
                {
                    Error.Visibility = Visibility.Visible;
                    Error.Text = "We're sorry, that email is taken.";
                    bug = true;
                }
                
                string month = Month.Text, day = Day.Text, year = Year.Text;
                if (month.Length < 2)
                    month = "0" + month;
                if (day.Length < 2)
                    day = "0" + day;
                string dateString = month + "-" + day + "-" + year;
                DateTime dateTime; // 10/22/2015 12:00:00 AM
                CultureInfo provider = CultureInfo.InvariantCulture;
                if (!DateTime.TryParseExact(dateString, "MM-dd-yyyy", provider, DateTimeStyles.None, out dateTime))
                {
                    Error.Visibility = Visibility.Visible;
                    Error.Text = "No exist the day!!!";
                    bug = true;
                }
                if (!bug)
                {
                    Error.Visibility = Visibility.Visible;
                    Error.Text = "Information updated";
                    Error.Background= (Brush)(new BrushConverter().ConvertFrom("#1ED760"));
                    User user = LoginStatus.Current.User;
                    LoginStatus.Current.User.Email = Email.Text;
                    LoginStatus.Current.User.Birthday = dateTime;
                    DataProvider.Ins.DB.SaveChanges();
                }
            }
            catch { }
        }

        private void Cancel_Click(object sender, RoutedEventArgs e)
        {
            Error.Visibility = Visibility.Hidden;
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsAccountView = true;
        }

        private void ChangePassword_Click(object sender, RoutedEventArgs e)
        {
            Error.Visibility = Visibility.Hidden;
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsEditPasswordView = true;
        }

        
    }
}
