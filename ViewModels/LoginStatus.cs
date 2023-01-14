using Spotify.Models;
using Spotify.Utilities;
using Spotify.ViewModels.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

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
        private bool _isPasswordUpdatedView { get; set; }
        public bool IsPasswordUpdatedView { get { return _isPasswordUpdatedView; } set { _isPasswordUpdatedView = value; OnPropertyChanged(); } }
        private bool _isChangePasswordView { get; set; }
        public bool IsChangePasswordView { get { return _isChangePasswordView; } set { _isChangePasswordView = value; OnPropertyChanged(); } }
        private bool _isEditPasswordView { get; set; }
        public bool IsEditPasswordView { get { return _isEditPasswordView; } set { _isEditPasswordView = value; OnPropertyChanged(); } }

        private bool _needLoggedIn { get; set; }
        public bool NeedLogin { get { return _needLoggedIn; } set { _needLoggedIn = value; OnPropertyChanged(); } }

        private bool _haveUser { get; set; }
        public bool HaveUser { get { return _haveUser; } set { _haveUser = value; OnPropertyChanged(); } }

        private bool _isMainView { get; set; }
        public bool IsMainView { get { return _isMainView; } set { _isMainView = value; OnPropertyChanged(); } }

        private bool _isShowDiaologAccount { get; set; }
        public bool IsShowDiaologAccount { get { return _isShowDiaologAccount; } set { _isShowDiaologAccount = value; OnPropertyChanged(); } }

        private Playlist _likedSongsPlayplist { get; set; }
        public Playlist LikedSongsPlayplist { get { return _likedSongsPlayplist; } set { _likedSongsPlayplist = value; OnPropertyChanged(); } }

        private Playlist _recentSearchPlaylist { get; set; }
        public Playlist RecentSearchPlaylist { get { return _recentSearchPlaylist; } set { _recentSearchPlaylist = value; OnPropertyChanged(); } }

        private User _user { get; set; }
        public User User { get {
                return _user; } 
            set
            {
                try {
                    _user = value;
                    OnPropertyChanged();
                    if (value != DataProvider.Ins.DB.Users.Where(x => x.UserID == -1).FirstOrDefault())
                    {
                        Day = value.Birthday.Value.Day.ToString();
                        Month = value.Birthday.Value.Month.ToString();
                        Year = value.Birthday.Value.Year.ToString();
                        RecentSearchPlaylist = value.Playlists.Where(x => x.PlaylistType == 1).FirstOrDefault();
                        Playlists.Ins.RecentSearchPlaylist = RecentSearchPlaylist;
                        Playlists.Ins.LikedSongsPlayplist = value.Playlists.Where(x => x.PlaylistType == 0).FirstOrDefault();
                        ViewPage.Ins.IsLoaded = true;
                    }
                    else
                    {
                        RecentSearchPlaylist = new Playlist();
                        Playlists.Ins.RecentSearchPlaylist = RecentSearchPlaylist;
                        Playlists.Ins.LikedSongsPlayplist = RecentSearchPlaylist;
                    }
                }
                catch { }
                } }
        private int _forgotPasswordUserID { get; set; }
        public int ForgotPasswordUserID { get { return _forgotPasswordUserID; } set { _forgotPasswordUserID = value; OnPropertyChanged(); } }
        private bool _isAccountView { get; set; }
        public bool IsAccountView { get { return _isAccountView; } set { _isAccountView = value; OnPropertyChanged(); } }
        private bool _isEditAccountView { get; set; }
        public bool IsEditAccountView { get { return _isEditAccountView; } set { _isEditAccountView = value; OnPropertyChanged(); } }
        private string _day { get; set; }
        public string Day { get { return _day; } set { _day = value; OnPropertyChanged(); } }
        private string _month { get; set; }
        public string Month { get { return _month; } set { _month = value; OnPropertyChanged(); } }

        private string _year { get; set; }
        public string Year { get { return _year; } set { _year = value; OnPropertyChanged(); } }

        public void ResetAllView()
        {
            IsMainView = false;
            IsLogin = false;
            IsSignUp = false;
            IsForgotPassword = false;
            IsAfterSendForgotPasswordEmail = false; 
            IsChangePasswordView = false;
            IsPasswordUpdatedView = false;
            IsAccountView= false;
            IsEditAccountView = false;
            IsEditPasswordView = false;
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
