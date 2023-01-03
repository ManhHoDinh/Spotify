using Spotify.Models;
using Spotify.ViewModels;
using Spotify.ViewModels.Pages;
using Spotify.Views.Pages;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace Spotify
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public class ViewPage : DependencyObject
    {
        public object CurrentView
        {
            get { return (object)GetValue(CurrentViewProperty); }
            set { SetValue(CurrentViewProperty, value);
            }
        }
        public bool IsDisableBack
        {
            get { return (bool)GetValue(IsDisableBackProperty); }
            set
            {
                SetValue(IsDisableBackProperty, value);
            }
        }

        // Using a DependencyProperty as the backing store for IsDisable.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsDisableBackProperty =
            DependencyProperty.Register("IsDisableBack", typeof(bool), typeof(ViewPage), new PropertyMetadata(true));
        public bool IsDisableNext
        {
            get { return (bool)GetValue(IsDisableNextProperty); }
            set
            {
                SetValue(IsDisableNextProperty, value);
            }
        }

        // Using a DependencyProperty as the backing store for IsDisable.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsDisableNextProperty =
            DependencyProperty.Register("IsDisableNext", typeof(bool), typeof(ViewPage), new PropertyMetadata(true));
        // Using a DependencyProperty as the backing store for CurrentView.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CurrentViewProperty =
            DependencyProperty.Register("CurrentView", typeof(object), typeof(ViewPage), new PropertyMetadata(0));
        public List<object> ListPage
        {
            get { return (List<object>)GetValue(ListPageProperty); }
            set { SetValue(ListPageProperty, value); }
        }

        // Using a DependencyProperty as the backing store for ListPage.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ListPageProperty =
            DependencyProperty.Register("ListPage", typeof(List<object>), typeof(ViewPage), new PropertyMetadata(new List<object> { }));

        public string ViewPageSelected
        {
            get { return (string)GetValue(ViewPageSelectedProperty); }
            set
            {
                SetValue(ViewPageSelectedProperty, value);

            }
        }

        // Using a DependencyProperty as the backing store for ViewPageSelected.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty ViewPageSelectedProperty =
            DependencyProperty.Register("ViewPageSelected", typeof(string), typeof(ViewPage), new PropertyMetadata(string.Empty));

        public int CurrentIndexView
        {
            get { return (int)GetValue(CurrentIndexViewProperty); }
            set { SetValue(CurrentIndexViewProperty, value); }
        }

        // Using a DependencyProperty as the backing store for CurrentIndexView.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CurrentIndexViewProperty =
            DependencyProperty.Register("CurrentIndexView", typeof(int), typeof(ViewPage), new PropertyMetadata(0));


        public static ViewPage Ins { get; private set; }
        static ViewPage()
        {
            Ins = new ViewPage();
           
        }
    }
    public partial class MainWindow : Window
    {
        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {

            base.OnPropertyChanged(e);
            if (e.Property == ViewPageSelectedProperty)
            {
                ViewPageSelected = ViewPageSelected;
            }
        }
        public MainWindow()
        {
            InitializeComponent();
            Binding binding = new Binding("ViewPageSelected");
            binding.Source = window;
            binding.Mode = BindingMode.TwoWay;
            BindingOperations.SetBinding(ViewPage.Ins, ViewPage.ViewPageSelectedProperty, binding);
            Songs.InitUri();
            Albums.InitUri();
            Playlists.InitUri();
            ListPlaylist.Ins.List = new ObservableCollection<Playlist>(DataProvider.Ins.DB.Playlists.Where(p=> p.PlaylistType==2).ToList());
        }
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
       
    }
}
