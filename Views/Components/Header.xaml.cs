using Spotify.ViewModels;
using Spotify.ViewModels.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
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
        public static readonly DependencyProperty TextProperty = DependencyProperty.Register
            ("UserName", typeof(string), typeof(Header), new PropertyMetadata(null));
        private string _UserName;
        public string UserName
        {
            get
            {
                return (string)GetValue(TextProperty);
            }
            set
            {
                _UserName = value;
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
        }
        public bool IsDisableBack
        {
            get { return (bool)GetValue(IsDisableBackProperty); }
            set { SetValue(IsDisableBackProperty, value);
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
            
            int count = ViewPage.Ins.CurrentIndexView;
            Button btn = sender as Button;
            Border bd = BackButton.Template.FindName("border", BackButton) as Border;
           // MessageBox.Show(bd.ToString());
            if (count > 0)
            {

                
                ViewPage.Ins.CurrentView = ViewPage.Ins.ListPage[count - 1];
                ViewPage.Ins.CurrentIndexView--;
                IsDisableNext = false;
            }
            else
            {
                IsDisableBack = true;
            }
        }
        private void SearchTextbox_TextChanged(object sender, TextChangedEventArgs e)
        {
            //if (SearchBox.Text != string.Empty)
            //{
            //    PreparingSearch.Visibility = Visibility.Hidden;
            //    BeginingSearch.Visibility = Visibility.Visible;
            //}
            //else
            //{
            //    PreparingSearch.Visibility = Visibility.Visible;
            //    BeginingSearch.Visibility = Visibility.Hidden;
            //}
        }
        private void NextButton_Click(object sender, RoutedEventArgs e)
        {

            int count = ViewPage.Ins.CurrentIndexView;
            if (count <ViewPage.Ins.ListPage.Count - 1)
            {
                ViewPage.Ins.CurrentView = ViewPage.Ins.ListPage[count + 1];
                ViewPage.Ins.CurrentIndexView++;
                if (count + 1 == ViewPage.Ins.ListPage.Count - 1) IsDisableNext = true;
            }
            else
            {
                IsDisableNext = true;
            }
        }

    }
}
