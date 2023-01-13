using Spotify.ViewModels.Pages;
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
using Spotify.Models;
using Spotify.Views.Pages;
using System.Collections.ObjectModel;

namespace Spotify
{
    /// <summary>
    /// Interaction logic for MainWindowView.xaml
    /// </summary>
    public partial class MainWindowView : UserControl
    {
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {

            base.OnPropertyChanged(e);
            if (e.Property == ViewPageSelectedProperty)
            {
                ViewPageSelected = ViewPageSelected;
            }
            if(e.Property == IsLoadedProperty)
            {
                if(IsLoaded == true)
                {
                    window.window_Loaded(new object(), new RoutedEventArgs());
                    IsLoaded = false;
                }
            }
        }
        public MainWindowView()
        {
            InitializeComponent();
            Binding binding = new Binding("ViewPageSelected");
            binding.Source = window;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(ViewPage.Ins, ViewPage.ViewPageSelectedProperty, binding);
            Binding bd = new Binding("IsLoaded");
            bd.Source = window;
            bd.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(ViewPage.Ins, ViewPage.IsLoadedProperty, bd);
            Songs.InitUri();
            Albums.InitUri();
            Playlists.InitUri();
            ListPlaylist.Ins.List = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.Where(p => p.PlaylistType == 2).ToList());
            Binding bd = new Binding("IsLoaded");
            bd.Source = window;
            bd.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(ViewPage.Ins, ViewPage.IsLoadedProperty, bd);
        }


        public bool IsLoaded
        {
            get { return (bool)GetValue(IsLoadedProperty); }
            set { SetValue(IsLoadedProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsLoaded.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsLoadedProperty =
            DependencyProperty.Register("IsLoaded", typeof(bool), typeof(MainWindowView), new PropertyMetadata(false));


        public string ViewPageSelected
        {
            get { return (string)GetValue(ViewPageSelectedProperty); }
            set
            {
                SetValue(ViewPageSelectedProperty, value);
                StackPanel stack = LeftSideBar.Children[0] as StackPanel;

                foreach (object p in stack.Children)
                {
                    Button btn = p as Button;
                    ControlTemplate ct = btn.Template;
                    Image img = (Image)ct.FindName("image", btn);
                    TextBlock tb = (TextBlock)ct.FindName("name", btn);
                    string NamePage = (ViewPageSelected == "CreatePlaylist") ? "CreatePlaylist" : ViewPageSelected.Substring(0, ViewPageSelected.Length - 2);

                    if (btn.Name == NamePage)
                    {
                        tb.Foreground = Brushes.White;
                        if (btn.Name == "Home" || btn.Name == "Search" || btn.Name == "YourLibrary")
                        {

                            img.Source = (ImageSource)Application.Current.Resources[btn.Name + "FillIcon"];
                        }
                    }
                    else
                    {
                        tb.Foreground = new System.Windows.Media.SolidColorBrush(System.Windows.Media.Color.FromRgb(179, 179, 179));
                        if (ViewPageSelected != "CreatePlaylist" && ViewPageSelected != "LikedSongsVM")
                        {
                            img.Source = (ImageSource)Application.Current.Resources[btn.Name + "Icon"];

                        }

                    }
                }

            }
        }

        // Using a DependencyProperty as the backing store for ViewPageSelected.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ViewPageSelectedProperty =
            DependencyProperty.Register("ViewPageSelected", typeof(string), typeof(MainWindow), new PropertyMetadata(string.Empty));

        private void CloseRightSideBarButton_Click(object sender, RoutedEventArgs e)
        {
            //LoadSideBar.ColumnDefinitions.RemoveAt(1);
        }
        private void bottomComponent_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void LogOut_click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.IsShowDiaologAccount = false;
            LoginStatus.Current.User = DataProvider.Ins.DB.Users.Where(x => x.UserID == -1).FirstOrDefault();
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsMainView = true;
            LoginStatus.Current.HaveUser = false;
            LoginStatus.Current.NeedLogin = true;
            Properties.Settings.Default.CurrentUserID = -1;
            Properties.Settings.Default.Save();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ViewPage.Ins.UserId = 2;
            
        }
        public static int id = 0;

        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            if(id != Properties.Settings.Default.CurrentUserID)
            {
                ListPlaylist.Ins.List = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.Where(p => p.PlaylistType == 2 && p.UserID == Properties.Settings.Default.CurrentUserID).ToList());
                id = ViewPage.Ins.UserId;
                ListPlaylist.Ins.CountPlaylist = DataProvider.Ins.DB.Playlists.Where(p => p.PlaylistType == 2 && p.UserID == Properties.Settings.Default.CurrentUserID).ToList().Count;
            }

        }

        private void Account_Click(object sender, RoutedEventArgs e)
        {
            LoginStatus.Current.ResetAllView();
            LoginStatus.Current.IsAccountView=true;
        }
        
        public static int id = 0;
        private void window_Loaded(object sender, RoutedEventArgs e)
        {
            if (id != Properties.Settings.Default.CurrentUserID)
            {
                ListPlaylist.Ins.List = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.Where(p => p.PlaylistType == 2 && p.UserID == Properties.Settings.Default.CurrentUserID).ToList());
                id = Properties.Settings.Default.CurrentUserID;
                ListPlaylist.Ins.CountPlaylist = DataProvider.Ins.DB.Playlists.Where(p => p.PlaylistType == 2 && p.UserID == Properties.Settings.Default.CurrentUserID).ToList().Count + 1;
            }
        }
    }
}
