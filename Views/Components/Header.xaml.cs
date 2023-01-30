﻿using Spotify.Models;
using Spotify.ViewModels;
using Spotify.ViewModels.Pages;
using Spotify.Views.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices;
using System.Security.Policy;
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
        public static readonly DependencyProperty UserNameProperty = DependencyProperty.Register
            ("UserName", typeof(string), typeof(Header), new PropertyMetadata(null));
        private string _UserName;
        public string UserName
        {
            get
            {
                return (string)GetValue(UserNameProperty);
            }
            set
            {
                _UserName = value;
            }
        }
        public static readonly DependencyProperty AvatarProperty = DependencyProperty.Register
           ("Avatar", typeof(ImageSource), typeof(Header), new PropertyMetadata(null));
        private ImageSource _avatar;
        public ImageSource Avatar
        {
            get
            {
                return (ImageSource)GetValue(AvatarProperty);
            }
            set
            {
                _avatar = value;
            }
        }

        private bool _isSearchView;
        public bool IsSearchView
        {
            get { return (bool)GetValue(IsSearchViewProperty); }
            set { _isSearchView = value; }
        }

        // Using a DependencyProperty as the backing store for IsSearchView.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsSearchViewProperty =
            DependencyProperty.Register("IsSearchView", typeof(bool), typeof(Header), new PropertyMetadata(null));


        public static readonly DependencyProperty IsLoggedInProperty = DependencyProperty.Register
                   ("IsLoggedIn", typeof(bool), typeof(Header), new PropertyMetadata(null));

        private bool _isLoggedIn;
        public bool IsLoggedIn
        {
            get
            {
                return (bool)GetValue(IsLoggedInProperty);
            }
            set
            {
                _isLoggedIn = value;
            }
        }

        public static readonly DependencyProperty HaveUserProperty = DependencyProperty.Register
           ("HaveUser", typeof(bool), typeof(Header), new PropertyMetadata(null));

        private bool _haveUser;
        public bool HaveUser
        {
            get
            {
                return (bool)GetValue(HaveUserProperty);
            }
            set
            {
                _haveUser = value;
            }
        }


        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {

            base.OnPropertyChanged(e);
            if (e.Property == IsDisableBackProperty)
            {
                if (IsDisableBack == true)
                {
                    IsDisableBack = true;
                }
                else IsDisableBack = false;
            }
            if (e.Property == IsSearchViewProperty)
            {
                if (IsSearchView == true)
                {
                    IsSearchView = true;
                }
                else IsSearchView = false;
            }
            if (e.Property == IsDisableNextProperty)
            {
                if (IsDisableNext == true)
                {
                    IsDisableNext = true;
                }
                else IsDisableNext = false;
            }
        }
        public Header()
        {
            InitializeComponent();
            Binding binding = new Binding("IsDisableBack");
            binding.Source = ViewPage.Ins;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(header, IsDisableBackProperty, binding);
            Binding bind = new Binding("IsDisableNext");
            bind.Source = ViewPage.Ins;
            bind.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(header, IsDisableNextProperty, bind);
            DataContext = this;
        }
        public bool IsDisableBack
        {
            get { return (bool)GetValue(IsDisableBackProperty); }
            set
            {
                SetValue(IsDisableBackProperty, value);
                Border bd = BackButton.Template.FindName("border", BackButton) as Border;
                if (IsDisableBack == true)
                {
                    BackButton.Cursor = Cursors.No;
                    SolidColorBrush color = (SolidColorBrush)new BrushConverter().ConvertFrom("#ffffff");
                    color.Opacity = 0.2;
                    bd.Background = color;
                    (bd.FindName("img") as Image).Source = (ImageSource)Application.Current.Resources["BackDisable"];
                }
                else
                {
                    BackButton.Cursor = Cursors.Hand;
                    bd.Background = Brushes.Black;
                    (bd.FindName("img") as Image).Source = (ImageSource)Application.Current.Resources["BackButton"];

                }
            }
        }

        // Using a DependencyProperty as the backing store for IsDisable.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsDisableBackProperty =
            DependencyProperty.Register("IsDisableBack", typeof(bool), typeof(Header), new PropertyMetadata(true));

        public bool IsDisableNext
        {
            get { return (bool)GetValue(IsDisableNextProperty); }
            set
            {
                SetValue(IsDisableNextProperty, value);
                Border bd = NextButton.Template.FindName("border", NextButton) as Border;
                if (IsDisableNext == true)
                {
                    NextButton.Cursor = Cursors.No;
                    SolidColorBrush color = (SolidColorBrush)new BrushConverter().ConvertFrom("#ffffff");
                    color.Opacity = 0.2;
                    bd.Background = color;
                    (bd.FindName("img") as Image).Source = (ImageSource)Application.Current.Resources["NextDisable"];
                }
                else
                {
                    NextButton.Cursor = Cursors.Hand;
                    bd.Background = Brushes.Black;
                    (bd.FindName("img") as Image).Source = (ImageSource)Application.Current.Resources["NextPageButton"];

                }
            }
        }

        // Using a DependencyProperty as the backing store for IsDisable.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsDisableNextProperty =
            DependencyProperty.Register("IsDisableNext", typeof(bool), typeof(Header), new PropertyMetadata(true));
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                //MessageBox.Show(ListPlaylist.Ins.ListSelectedItem[0].ToString() + ListPlaylist.Ins.ListSelectedItem[1].ToString());
               
                ViewPage.Ins.IsClick = true;
       
                int count = ViewPage.Ins.CurrentIndexView;
                Button btn = sender as Button;
                Border bd = BackButton.Template.FindName("border", BackButton) as Border;
                if (count > 0)
                {
                    object page = ViewPage.Ins.ListPage[count - 1];

                    if (page.GetType().Name != "SearchVM")
                        ViewPage.Ins.IsSearchView = false;
                    else
                        ViewPage.Ins.IsSearchView = true;
                    if (page.GetType().Name == "CreatePlaylist")
                    {

                        int CountOfId = ListPlaylist.Ins.CurrentIdPlaylist;
                        if (ViewPage.Ins.ListPage[count].GetType().Name != "CreatePlaylist")
                        {

                         
                            ListPlaylist.Ins.SelectedItem = ListPlaylist.Ins.List[ListPlaylist.Ins.ListSelectedItem[CountOfId]];
                            ListPlaylist.Ins.CurrentIdPlaylist++;
                        }
                        else
                        {
                            ListPlaylist.Ins.SelectedItem = ListPlaylist.Ins.List[ListPlaylist.Ins.ListSelectedItem[--CountOfId]];
                        }
                        ViewPage.Ins.ListPage.RemoveAt(ViewPage.Ins.ListPage.Count - 1);
                        //ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.ListSelectedItem.Count - 1);
                        ViewPage.Ins.CurrentIndexView--;
                        ListPlaylist.Ins.CurrentIdPlaylist -= 1;
                    }
                    else if (page.GetType().Name == "AlbumView")
                    {
                        ListPlaylist.Ins.SelectedItem = null;
                        int CountAlbum = ListAlbum.Ins.CurrentIdAlbum;
                        
                        if (ViewPage.Ins.ListPage[count].GetType().Name != "AlbumView")
                        {
                            int id = ListAlbum.Ins.ListSelectedItem[CountAlbum];
                            
                            ListAlbum.Ins.SelectedAlbum = DataProvider.Ins.DB.Albums.Where(a => a.ID == id).FirstOrDefault();
                            ListAlbum.Ins.CurrentIdAlbum++;
                            
                        }
                        else
                        {
                            int temp = ListAlbum.Ins.ListSelectedItem[CountAlbum - 1];
                            ListAlbum.Ins.SelectedAlbum = DataProvider.Ins.DB.Albums.Where(a => a.ID == temp).FirstOrDefault();
                        }
                        ViewPage.Ins.ListPage.RemoveAt(ViewPage.Ins.ListPage.Count - 1);
                        ViewPage.Ins.CurrentIndexView--;
                        ListAlbum.Ins.CurrentIdAlbum -= 1;

                        if (ViewPage.Ins.ListPage[count].GetType().Name == "SongView")
                        {
                           

                            if (SongSelect.Ins.CurrentIdSong > 0)
                            {
                                
                                SongSelect.Ins.CurrentIdSong--;
                            }

                        }
                    }
                    else if (page.GetType().Name == "SongView")
                    {
                        ListPlaylist.Ins.SelectedItem = null;
                        int CountSong = SongSelect.Ins.CurrentIdSong;
                       
                        if (ViewPage.Ins.ListPage[count].GetType().Name != "SongView")
                        {
                            int id = SongSelect.Ins.ListSelectedItem[CountSong];
                            var song = DataProvider.Ins.DB.Songs.Where(a => a.ID == id).FirstOrDefault();
                            SongSelect.Ins.SongName = song.SongName;
                            SongSelect.Ins.SingerName = song.SingerName;
                            SongSelect.Ins.ImageSong = song.SongImageUri;
                            SongSelect.Ins.Description = song.Descriptions;
                            SongSelect.Ins.LinkSong = song.SongLinkUri;
                            SongSelect.Ins.CurrentIdSong++;

                        }
                        else
                        {
                            int temp = SongSelect.Ins.ListSelectedItem[CountSong - 1];
                            var song = DataProvider.Ins.DB.Songs.Where(a => a.ID == temp).FirstOrDefault();
                            SongSelect.Ins.SongName = song.SongName;
                            SongSelect.Ins.SingerName = song.SingerName;
                            SongSelect.Ins.ImageSong = song.SongImageUri;
                            SongSelect.Ins.Description = song.Descriptions;
                            SongSelect.Ins.LinkSong = song.SongLinkUri;

                        }
                        ViewPage.Ins.CurrentView = ViewPage.Ins.ListPage[count - 1];

                        
                        ViewPage.Ins.CurrentIndexView--;
                        SongSelect.Ins.CurrentIdSong -= 1;

                    }
                    else
                    {
                        ListPlaylist.Ins.SelectedItem = null;
                        if (ViewPage.Ins.ListPage[count].GetType().Name == "CreatePlaylist")
                        {
                            if (ListPlaylist.Ins.CurrentIdPlaylist > 0)
                            {
                                ListPlaylist.Ins.CurrentIdPlaylist--;
                            }

                        }
                        if (ViewPage.Ins.ListPage[count].GetType().Name == "AlbumView")
                        {
                            if (ListAlbum.Ins.CurrentIdAlbum > 0)
                            {
                                ListAlbum.Ins.CurrentIdAlbum--;
                            }

                        }
                       
                        ViewPage.Ins.CurrentView = ViewPage.Ins.ListPage[count - 1];


                    }
                    ViewPage.Ins.CurrentIndexView--;
                    ViewPage.Ins.ViewPageSelected = ViewPage.Ins.CurrentView.GetType().Name;
                    if (count == 1) IsDisableBack = true;
                    IsDisableNext = false;
                }
               
                else
                {
                    IsDisableBack = true;
                }
           }
            catch { }

        }
        private void NextButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                
                ViewPage.Ins.IsClick = true;
                int count = ViewPage.Ins.CurrentIndexView;
                if (count < ViewPage.Ins.ListPage.Count - 1)
                {
                    object page = ViewPage.Ins.ListPage[count + 1];

                   
                    if (page.GetType().Name != "SearchVM")
                        ViewPage.Ins.IsSearchView = false;
                    else
                        ViewPage.Ins.IsSearchView = true;
                    if (page.GetType().Name == "CreatePlaylist")
                    {
                        int CountOfId = ListPlaylist.Ins.CurrentIdPlaylist;
                        if (ViewPage.Ins.ListPage[count].GetType().Name != "CreatePlaylist")
                        {
   
                                ListPlaylist.Ins.SelectedItem = ListPlaylist.Ins.List[ListPlaylist.Ins.ListSelectedItem[CountOfId]];
                              
                               // ListPlaylist.Ins.CurrentIdPlaylist--;
                        }
                        else
                        {
                            CountOfId++;
                          
                            ListPlaylist.Ins.SelectedItem = ListPlaylist.Ins.List[ListPlaylist.Ins.ListSelectedItem[CountOfId]];
                            ListPlaylist.Ins.CurrentIdPlaylist++;

                        }


                        //  ListPlaylist.Ins.ListSelectedItem.RemoveAt(ListPlaylist.Ins.ListSelectedItem.Count - 1);
                        ViewPage.Ins.ListPage.RemoveAt(ViewPage.Ins.ListPage.Count - 1);
                        ViewPage.Ins.CurrentIndexView--;
                        ViewPage.Ins.CurrentIndexView++;
                        if (count + 1 == ViewPage.Ins.ListPage.Count - 1) IsDisableNext = true;


                    }
                    else if (page.GetType().Name == "AlbumView")
                    {
                        ListPlaylist.Ins.SelectedItem = null;

                        int CountAlbum = ListAlbum.Ins.CurrentIdAlbum;
                       
                        if (ViewPage.Ins.ListPage[count].GetType().Name != "AlbumView")
                        {
                            int id = ListAlbum.Ins.ListSelectedItem[CountAlbum];
                            ListAlbum.Ins.SelectedAlbum = DataProvider.Ins.DB.Albums.Where(a => a.ID == id).FirstOrDefault();
                            
                        }
                        else
                        {

                            int temp = ListAlbum.Ins.ListSelectedItem[CountAlbum + 1];
                            ListAlbum.Ins.SelectedAlbum = DataProvider.Ins.DB.Albums.Where(a => a.ID == temp).FirstOrDefault();
                            ListAlbum.Ins.CurrentIdAlbum++;
                        }


                      //  ListAlbum.Ins.ListSelectedItem.RemoveAt(ListAlbum.Ins.ListSelectedItem.Count - 1);
                        ViewPage.Ins.ListPage.RemoveAt(ViewPage.Ins.ListPage.Count - 1);
                        ViewPage.Ins.CurrentIndexView--;
                        ViewPage.Ins.CurrentIndexView++;
                       
                        if (count + 1 == ViewPage.Ins.ListPage.Count - 1) IsDisableNext = true;
                        if (ViewPage.Ins.ListPage[count].GetType().Name == "SongView")
                        {
                            SongSelect.Ins.CurrentIdSong++;
                        }
                    }
                    else if (page.GetType().Name == "SongView")
                    {
                        ListPlaylist.Ins.SelectedItem = null;

                        int CountSong =SongSelect.Ins.CurrentIdSong;
                        


                        if (ViewPage.Ins.ListPage[count].GetType().Name != "SongView")
                        {
                            int id = SongSelect.Ins.ListSelectedItem[CountSong];
                            var song = DataProvider.Ins.DB.Songs.Where(a => a.ID == id).FirstOrDefault();
                            SongSelect.Ins.SongName = song.SongName;
                            SongSelect.Ins.SingerName = song.SingerName;
                            SongSelect.Ins.ImageSong = song.SongImageUri;
                            SongSelect.Ins.Description = song.Descriptions;
                            SongSelect.Ins.LinkSong = song.SongLinkUri;
                            SongSelect.Ins.CurrentIdSong--;
                        }
                        else
                        {

                            int temp = SongSelect.Ins.ListSelectedItem[CountSong + 1];
                            var song = DataProvider.Ins.DB.Songs.Where(a => a.ID == temp).FirstOrDefault();
                            SongSelect.Ins.SongName = song.SongName;
                            SongSelect.Ins.SingerName = song.SingerName;
                            SongSelect.Ins.ImageSong = song.SongImageUri;
                            SongSelect.Ins.Description = song.Descriptions;
                            SongSelect.Ins.LinkSong = song.SongLinkUri;
                        }

                        ViewPage.Ins.CurrentView = ViewPage.Ins.ListPage[count + 1];
                        // SongSelect.Ins.ListSelectedItem.RemoveAt(SongSelect.Ins.ListSelectedItem.Count - 1);
                        SongSelect.Ins.CurrentIdSong++;
                        ViewPage.Ins.CurrentIndexView++;
                     
                        if (count+ 1 == ViewPage.Ins.ListPage.Count - 1) IsDisableNext = true;

                    }
                    else
                    {
                        ListPlaylist.Ins.SelectedItem = null;

                        if (ViewPage.Ins.ListPage[count].GetType().Name == "CreatePlaylist")
                        {
                            ListPlaylist.Ins.CurrentIdPlaylist++;
                        }
                        if (ViewPage.Ins.ListPage[count].GetType().Name == "AlbumView")
                        {
                            ListAlbum.Ins.CurrentIdAlbum++;
                        }

                        ViewPage.Ins.CurrentView = ViewPage.Ins.ListPage[count + 1];
                        ViewPage.Ins.CurrentIndexView++;
                        if (count + 1 == ViewPage.Ins.ListPage.Count - 1) IsDisableNext = true;
                    }
                    ViewPage.Ins.ViewPageSelected = ViewPage.Ins.CurrentView.GetType().Name;
                    IsDisableBack = false;
                   
                }
                else
                {
                    IsDisableNext = true;
                }
            }
            catch { }
        }
        public static string RemoveSign4VietnameseString(string str)
        {
            for (int i = 1; i < VietnameseSigns.Length; i++)
            {
                for (int j = 0; j < VietnameseSigns[i].Length; j++)
                    str = str.Replace(VietnameseSigns[i][j], VietnameseSigns[0][i - 1]);
            }
            return str;
        }
        private static readonly string[] VietnameseSigns = new string[]
        {

            "aAeEoOuUiIdDyY",

            "áàạảãâấầậẩẫăắằặẳẵ",

            "ÁÀẠẢÃÂẤẦẬẨẪĂẮẰẶẲẴ",

            "éèẹẻẽêếềệểễ",

            "ÉÈẸẺẼÊẾỀỆỂỄ",

            "óòọỏõôốồộổỗơớờợởỡ",

            "ÓÒỌỎÕÔỐỒỘỔỖƠỚỜỢỞỠ",

            "úùụủũưứừựửữ",

            "ÚÙỤỦŨƯỨỪỰỬỮ",

            "íìịỉĩ",

            "ÍÌỊỈĨ",

            "đ",

            "Đ",

            "ýỳỵỷỹ",

            "ÝỲỴỶỸ"
        };

        private void SearchTextbox_TextChanged(object sender, TextChangedEventArgs e)
        {
            SearchVM.Ins.IsSearch = true;
            if (SearchTextbox.Text == "")
                SearchVM.Ins.IsSearch = false;
            SearchVM.Ins.filteredCollection = new ObservableCollection<Song>(from item in Songs.AllSong where RemoveSign4VietnameseString(item.SongName).ToUpper().Contains(RemoveSign4VietnameseString(SearchTextbox.Text).ToUpper()) select item);
        }
        private void LoginBtn_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsLogin = true;
        }
        private void SignIn_click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsSignUp = true;
        }

        private void Profile_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.IsShowDiaologAccount = !LoginStatus.Current.IsShowDiaologAccount;
        }
    }
}