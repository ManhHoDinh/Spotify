using Spotify.Models;
using Spotify.ViewModels;
﻿using Spotify.Views.Pages;
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
        public MainWindow()
        {
            InitializeComponent();
            Songs.InitUri();
        }
        private void CloseRightSideBarButton_Click(object sender, RoutedEventArgs e)
        {
            //LoadSideBar.ColumnDefinitions.RemoveAt(1);
        }

        private void bottomComponent_Loaded(object sender, RoutedEventArgs e)
        {

        }
       
    }
}
