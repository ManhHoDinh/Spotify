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
    using System;
    using System.Collections.Generic;
    using System.Collections.ObjectModel;

    public partial class Album
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Album()
        {
            this.Songs = new HashSet<Song>();
        }
        public static void InitUri(ref Album album)
        {
            album.AlbumImageUri = new Uri(album.AlbumImage == null ? "" : album.AlbumImage, UriKind.RelativeOrAbsolute);
            album.SongsOfAlbum = new ObservableCollection<Song>(album.Songs);
        }
        public int ID { get; set; }
        public string AlbumName { get; set; }
        public string Descriptions { get; set; }
        public string AlbumImage { get; set; }
        public string AlbumColor { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Song> Songs { get; set; }
        public Uri AlbumImageUri { get; set; }
        public ObservableCollection<Song> SongsOfAlbum { get; set; }
    }
}