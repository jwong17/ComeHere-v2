using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Net;
using System.IO;
using System.Xml;
using System.Text.RegularExpressions;

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
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public int multiplication(int a, int b)
        {
            return a * b;
        }

        [WebMethod]
        public List<Route> retrieveListOfRoutes(string start, string destination)
        {


                var directionStepsList = new List<Route>();
                string xmlResult = null;
                var webRequest = (HttpWebRequest)WebRequest.Create("http://maps.googleapis.com/maps/api/directions/xml?origin=" + HttpUtility.UrlEncode(start) + "&destination=" + HttpUtility.UrlEncode(destination) + "&sensor=false");
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
    }
}
