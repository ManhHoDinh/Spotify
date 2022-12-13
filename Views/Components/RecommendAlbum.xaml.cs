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
    /// Interaction logic for RecommendAlbum.xaml
    /// </summary>
    public partial class RecommendAlbum : UserControl
    {
        public RecommendAlbum()
        {
            InitializeComponent();
            DataContext= this;
        }
        public static readonly DependencyProperty ImgSourceProperty = DependencyProperty.Register
          ("ImgSource", typeof(ImageSource), typeof(RecommendAlbum), new PropertyMetadata(null));
        public static readonly DependencyProperty TextProperty = DependencyProperty.Register
            ("Text", typeof(string), typeof(RecommendAlbum), new PropertyMetadata(null));
        private ImageSource _imageSource;
        private string _text="";
        public ImageSource ImgSource
        {
            get
            {
                return (ImageSource)GetValue(ImgSourceProperty);
            }
            set
            {
                _imageSource = value;
            }
        }
        public string Text
        {
            get
            {
                return (string)GetValue(TextProperty);
            }
            set
            {
                _text = value;
            }
        }

      
    }
}
