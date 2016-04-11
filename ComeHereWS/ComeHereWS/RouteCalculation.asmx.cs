using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Net;
using System.IO;
using System.Xml;
using System.Text.RegularExpressions;
using System.Xml.Linq;

namespace ComeHereWS
{
    /// <summary>
    /// Summary description for RouteCalculation
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class RouteCalculation : System.Web.Services.WebService
    {

        [WebMethod]
        public List<Route> retrieveListOfRoutes(string start, string destination)
        {


                var directionStepsList = new List<Route>();
                string xmlResult = null;
                var webRequest = (HttpWebRequest)WebRequest.Create("http://maps.googleapis.com/maps/api/directions/xml?origin=" + HttpUtility.UrlEncode(start) + "&destination=" + HttpUtility.UrlEncode(destination) + "&mode=driving&alternatives=true&sensor=false");
                var webResponse = (HttpWebResponse)webRequest.GetResponse();
                StreamReader resStream = new StreamReader(webResponse.GetResponseStream());
                XmlDocument xd = new XmlDocument();
                xmlResult = resStream.ReadToEnd();
                xd.LoadXml(xmlResult);

                //reference from http://blog.saraf.me/2010/12/google-map-get-step-by-step-direction.html
                if (xd.HasChildNodes)
                {
                    var directionsResponseNode = xd.SelectSingleNode("DirectionsResponse");
                    if (directionsResponseNode != null)
                    {
                        var statusNode = directionsResponseNode.SelectSingleNode("status");
                        if (statusNode != null && statusNode.InnerText.Equals("OK"))
                        {
                            var legs = directionsResponseNode.SelectNodes("route/leg");
                            foreach (XmlNode leg in legs)
                            {
                                int stepCount = 1;
                                var stepNodes = leg.SelectNodes("step");
                                var steps = new List<RouteInfo>();
                                foreach (XmlNode stepNode in stepNodes)
                                {
                                    var di = new RouteInfo();
                                    di.Index = stepCount++;
                                    di.Distance = stepNode.SelectSingleNode("distance/text").InnerText;
                                    di.Duration = stepNode.SelectSingleNode("duration/text").InnerText;

                                    di.Description = Regex.Replace(stepNode.SelectSingleNode("html_instructions").InnerText, "<[^<]+?>", "");
                                    steps.Add(di);
                                }

                                var de = new Route();
                                de.OriginAddress = leg.SelectSingleNode("start_address").InnerText;
                                de.DestinationAddress = leg.SelectSingleNode("end_address").InnerText;
                                de.TotalDistance = leg.SelectSingleNode("distance/text").InnerText;
                                de.TotalDuration = leg.SelectSingleNode("duration/text").InnerText;
                                de.Steps = steps;

                                directionStepsList.Add(de);
                            }
                        }
                    }
                }
                return directionStepsList;

        }

        [WebMethod(Description = "Returns a list of step by step directions to travel to the destination.")]
        public List<RouteInfo> extractRouteInfo(string origins, string destination)
        {
            
                var results = new List<RouteInfo>();
                var dire = retrieveListOfRoutes(origins, destination);

                foreach (Route ds in dire)
                {
                    results = ds.Steps;
                }

                return results;
           
        }

        [WebMethod(Description = "Returns a list of information and url of image captures.")]
        public List<CameraEntry> GetCameraView()
        {


            System.Net.WebRequest wr = HttpWebRequest.Create("http://datamall.mytransport.sg/ltaodataservice.svc/CameraImageSet");
                wr.Headers.Add("AccountKey", "MjGz11eI4LGEqbKe1TC6Tw==");
                wr.Headers.Add("UniqueUserID", "23a581d3-67c3-457b-8a24-baeed5ea896b");
                wr.Method = "GET";
                WebResponse res = wr.GetResponse();
                string resStr
                 = new System.IO.StreamReader(res.GetResponseStream()).ReadToEnd();

                XNamespace atomNS
                  = "http://www.w3.org/2005/Atom";
                XNamespace dNS
                  = "http://schemas.microsoft.com/ado/2007/08/dataservices";
                XNamespace mNS
                  = "http://schemas.microsoft.com/ado/2007/08/dataservices/metadata";

                List<CameraEntry> results
                  = (from item in XElement.Parse(resStr).Descendants(atomNS + "entry")
                     let cam = item.Element(atomNS + "content").Element(mNS + "properties")
                     select new CameraEntry()
                     {
                         CameraImageID = cam.Element(dNS + "CameraImageID").Value,
                         CameraID = cam.Element(dNS + "CameraID").Value,
                         Latitude = cam.Element(dNS + "Latitude").Value,
                         Longitude = cam.Element(dNS + "Longitude").Value,
                         ImageURL = cam.Element(dNS + "ImageURL").Value,
                         CreateDate = cam.Element(dNS + "CreateDate").Value
                     }).ToList();

                return results;
           
        }

        [WebMethod(Description = "Returns a list of information and url of speed camera.")]
        public List<CameraEntry> GetSpeedCameraList()
        {


            System.Net.WebRequest wr = HttpWebRequest.Create("http://datamall.mytransport.sg/ltaodataservice.svc/CameraImageSet");
            wr.Headers.Add("AccountKey", "MjGz11eI4LGEqbKe1TC6Tw==");
            wr.Headers.Add("UniqueUserID", "23a581d3-67c3-457b-8a24-baeed5ea896b");
            wr.Method = "GET";
            WebResponse res = wr.GetResponse();
            string resStr
             = new System.IO.StreamReader(res.GetResponseStream()).ReadToEnd();

            XNamespace atomNS
              = "http://www.w3.org/2005/Atom";
            XNamespace dNS
              = "http://schemas.microsoft.com/ado/2007/08/dataservices";
            XNamespace mNS
              = "http://schemas.microsoft.com/ado/2007/08/dataservices/metadata";

            List<CameraEntry> results
              = (from item in XElement.Parse(resStr).Descendants(atomNS + "entry")
                 let cam = item.Element(atomNS + "content").Element(mNS + "properties")
                 select new CameraEntry()
                 {
                     CameraImageID = cam.Element(dNS + "CameraImageID").Value,
                     CameraID = cam.Element(dNS + "CameraID").Value,
                     Latitude = cam.Element(dNS + "Latitude").Value,
                     Longitude = cam.Element(dNS + "Longitude").Value,
                     ImageURL = cam.Element(dNS + "ImageURL").Value,
                     CreateDate = cam.Element(dNS + "CreateDate").Value
                 }).ToList();

            return results;

        }
    }
}
