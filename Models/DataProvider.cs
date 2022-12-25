using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Spotify.Models
{
    public class DataProvider
    {
        private static DataProvider _ins;
        public static DataProvider Ins { 
            set {
               _ins = value;
            } 
            get {
                if (_ins == null) 
                    _ins = new DataProvider(); 
                return _ins; 
            } 
        }
        public SpotifyEntities DB { get; set; }
        private DataProvider() 
        {
            DB = new SpotifyEntities();
        }
    }
}
