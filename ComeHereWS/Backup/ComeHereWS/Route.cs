using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ComeHereWS
{
    public class Route
    {
        public string TotalDuration { get; set; }
        public string TotalDistance { get; set; }
        public string OriginAddress { get; set; }
        public string DestinationAddress { get; set; }
        public List<RouteInfo> Steps { get; set; }
    }
}