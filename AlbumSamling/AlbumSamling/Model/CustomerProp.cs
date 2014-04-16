using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AlbumSamling.Model
{
    public class CustomerProp
    {
        public int CustomerId { get; set; }
        public int TelefonID { get; set; }
        public string Förnamn { get; set; }
        public string Efternamn { get; set; }
        public string Ort { get; set; }


        public int AlbumID { get; set; }
        public int AlbumTypID { get; set; }
        public int FormatID { get; set; }
        public string AlbumTitel { get; set; }
        public string ArtistTitel { get; set; }
        public string Utgivningsår { get; set; }

        public string Number { get; set; }
    }
}