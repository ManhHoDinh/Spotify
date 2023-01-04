using Spotify.Models;
using Spotify.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Spotify.ViewModels
{
    public class LoginStatus : BaseViewModel
    {
        public static LoginStatus Current = new LoginStatus();
        //0: Main |1 : Login| 2 : Sign In| 3 : Forgot Password | 4 : After sent email
        private bool _isLogin { get; set; }
        public bool IsLogin { get { return _isLogin; } set { _isLogin = value; OnPropertyChanged(); } }

        private bool _isSignUp { get; set; }
        public bool IsSignUp { get { return _isSignUp; } set { _isSignUp = value; OnPropertyChanged(); } }

        private bool _isForgotPassword { get; set; }
        public bool IsForgotPassword { get { return _isForgotPassword; } set { _isForgotPassword = value; OnPropertyChanged(); } }

        private bool _isAfterSendForgotPasswordEmail { get; set; }
        public bool IsAfterSendForgotPasswordEmail { get { return _isAfterSendForgotPasswordEmail; } set { _isAfterSendForgotPasswordEmail = value; OnPropertyChanged(); } }

        private bool _needLoggedIn { get; set; }
        public bool NeedLogin { get { return _needLoggedIn; } set { _needLoggedIn = value; OnPropertyChanged(); } }

        private bool _haveUser { get; set; }
        public bool HaveUser { get { return _haveUser; } set { _haveUser = value; OnPropertyChanged(); } }

        private bool _isMainView { get; set; }
        public bool IsMainView { get { return _isMainView; } set { _isMainView = value; OnPropertyChanged(); } }

        private bool _isShowDiaologAccount { get; set; }
        public bool IsShowDiaologAccount { get { return _isShowDiaologAccount; } set { _isShowDiaologAccount = value; OnPropertyChanged(); } }

        private User _user { get; set; }
        public User User { get { return _user; } set { _user = value; OnPropertyChanged(); } }

        public void ResetAllView()
        {
            IsMainView = false;
            IsLogin = false;
            IsSignUp = false;
            IsForgotPassword = false;
            IsAfterSendForgotPasswordEmail = false;
        }

        public LoginStatus()
        {
            //Properties.Settings.Default.CurrentUserID = -1;
            //Properties.Settings.Default.Save();
            User = DataProvider.Ins.DB.Users.FirstOrDefault(x => x.UserID == Properties.Settings.Default.CurrentUserID);
            if (User != null)
            {
                NeedLogin = false;
                HaveUser = true;
            }
            else
            {
                NeedLogin = true;
                HaveUser = false;
            }
            IsMainView = true;
        }
    }
}
