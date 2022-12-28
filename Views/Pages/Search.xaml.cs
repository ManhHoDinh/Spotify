using Spotify.ViewModels.Pages;
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
    /// Interaction logic for Search.xaml
    /// </summary>
    public partial class Search : UserControl
    {

        protected override void OnPropertyChanged(DependencyPropertyChangedEventArgs e)
        {
            base.OnPropertyChanged(e);
            //if (e.Property == IsPlayProperty)
            //{
            //    if (IsPlay == true)
            //    {
            //        ImageBrush ImgBrush = new ImageBrush();
            //        ImgBrush.ImageSource = Pause;
            //        PlayPauseGreen.Background = ImgBrush;
            //    }
            //    else
            //    {
            //        ImageBrush ImgBrush = new ImageBrush();
            //        ImgBrush.ImageSource = Play;
            //        PlayPauseGreen.Background = ImgBrush;
            //    }
            //    // what is the code that would go here?
            //}
        }
        public Search()
        {
            InitializeComponent();

            //PreparingSearch.Visibility = Visibility.Visible;
            //BeginingSearch.Visibility = Visibility.Hidden;
        
        }

        //private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        //{
        //    if (SearchBox.Text != string.Empty)
        //    {
        //        PreparingSearch.Visibility = Visibility.Hidden;
        //        BeginingSearch.Visibility = Visibility.Visible;
        //    }
        //    else
        //    {
        //        PreparingSearch.Visibility = Visibility.Visible;
        //        BeginingSearch.Visibility = Visibility.Hidden;
        //    }
        //}
    }
       
    
}

