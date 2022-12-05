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

namespace Spotify.Views.Components
{
    /// <summary>
    /// Interaction logic for NavigateButton.xaml
    /// </summary>
    public partial class NavigateButton : UserControl
    {
        public static readonly DependencyProperty ImageProperty = DependencyProperty.Register
            ("IconSource", typeof(ImageSource), typeof(NavigateButton), new PropertyMetadata(null));
        public static readonly DependencyProperty TextProperty = DependencyProperty.Register
            ("NavigateText", typeof(string), typeof(NavigateButton), new PropertyMetadata(null));
        private ImageSource _iconSource;
        private string _navigateText;
        public ImageSource IconSource { 
                get{
                    return (ImageSource)GetValue(ImageProperty);
                }
                set
                {
                    _iconSource = value;
                }
            }
        public string NavigateText {
            get{
                return (string)GetValue(TextProperty);
               }
            set
            {
                _navigateText = value;
            }
        }
        
        public NavigateButton()
        {
            DataContext = this;
            InitializeComponent();
        }
    }
}
