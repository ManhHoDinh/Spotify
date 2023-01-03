//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Spotify.Models
{
    using Spotify.ViewModels.Pages;
    using System;
    using System.Collections.Generic;
    using System.Collections.ObjectModel;
    using System.Windows.Media;
    using System.Windows.Media.Imaging;

    public partial class Playlist
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Playlist()
        {
            this.Songs = new HashSet<Song>();
        }
        public static void InitUri(ref Playlist playlist)
        {
            playlist.SongsOfPlaylist = new ObservableCollection<Song>(playlist.Songs);
            //playlist.PlaylistImageSource = new BitmapImage(new Uri(playlist.PlaylistImage == null ? "" : playlist.PlaylistImage, UriKind.RelativeOrAbsolute));
        }
        public int ID { get; set; }
        public string PlaylistName { get; set; }
        public string Descriptions { get; set; }
        public string PlaylistImage { get; set; }
        public int UserID { get; set; }
        public Nullable<int> PlaylistType { get; set; }

        public virtual User User { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Song> Songs { get; set; }
        public ImageSource PlaylistImageSource { get; set; }
        public ObservableCollection<Song> SongsOfPlaylist { get; set; }
    }
}