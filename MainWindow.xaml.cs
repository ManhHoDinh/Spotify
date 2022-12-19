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
            set { SetValue(CurrentViewProperty, value); }
        }


        public bool IsBackHome
        {
            get { return (bool)GetValue(IsBackHomeProperty); }
            set { SetValue(IsBackHomeProperty, value); }
        }

        // Using a DependencyProperty as the backing store for IsBackHome.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty IsBackHomeProperty =
            DependencyProperty.Register("IsBackHome", typeof(bool), typeof(ViewPage), new PropertyMetadata(false));


        // Using a DependencyProperty as the backing store for CurrentView.  This enables animation, styling, binding, etc...
        public static readonly DependencyProperty CurrentViewProperty =
            DependencyProperty.Register("CurrentView", typeof(object), typeof(ViewPage), new PropertyMetadata(0));
        public static ViewPage Ins { get; private set; }
        static ViewPage()
        {
            Ins = new ViewPage();
        }


    }
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();   
        }
        private void CloseRightSideBarButton_Click(object sender, RoutedEventArgs e)
        {
            //LoadSideBar.ColumnDefinitions.RemoveAt(1);
        }


       



    }
}
