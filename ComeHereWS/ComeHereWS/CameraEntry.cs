using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ComeHereWS
{
    public class CameraEntry
    {
        public string CameraImageID { get; set; }
        public string CameraID { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }
        public string ImageURL { get; set; }
        public string CreateDate { get; set; }
    }
}