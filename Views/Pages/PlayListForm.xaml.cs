using Microsoft.Win32;
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
using System.Windows.Shapes;

namespace Spotify.Views.Pages
{
    /// <summary>
    /// Interaction logic for PlayListForm.xaml
    /// </summary>
    public partial class PlayListForm : Window
    {
        public PlayListForm()
        {
            InitializeComponent();
        }


        public bool IsVisible
        {
            get { return (bool)GetValue(IsVisibleProperty); }
            set { SetValue(IsVisibleProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsVisible.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsVisibleProperty =
            DependencyProperty.Register("IsVisible", typeof(bool), typeof(PlayListForm), new PropertyMetadata(true));


        private void Button_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog a = new OpenFileDialog();
            if (a.ShowDialog() == true)
            {
                img.Source = new BitmapImage(new Uri(a.FileName));
                ListPlaylist.Ins.Image = a.FileName;
                ContentPresenter x = (btn.Template.FindName("content", btn) as ContentPresenter);
                Image imageInit = VisualTreeHelper.GetChild(x, 0) as Image;
                imageInit.Opacity = 0;
                //(x.Content.FindName("ImgInitial", x) as Image).Opacity = 0;


            }

        }
       
    }
}
