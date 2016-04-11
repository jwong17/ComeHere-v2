<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ComeHereApp.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
 <script language="javascript" type="text/javascript">

     var directionsDisplay = new google.maps.DirectionsRenderer;
     var directionsService = new google.maps.DirectionsService;
     //var directionsResult = new google.maps.DirectionsResult;
     var markers = [];
     var map;
     var cameraLocations = [{ lat:1.308094739302259, lng:103.8101809717971},
                            { lat:1.308067608612278, lng:103.8102079284798},
                            { lat:1.415298196118805, lng:103.8322852028067},
                            { lat:1.41532532704901, lng:103.8323121604223},
                            { lat:1.361947995843499, lng:103.7415209692295},
                            { lat:1.361975127772033, lng:103.7415479251913},
                            { lat:1.344737303653458, lng:103.7254913108929},
                            { lat:1.344746348480353, lng:103.725518267281},
                            { lat:1.298236739726613, lng:103.7816792401399},
                            { lat:1.2982186533609, lng:103.7817241677078},
                            { lat:1.38232437354741, lng:103.775486299165},
                            { lat:1.382224894418002, lng:103.7755222445539},
                            { lat:1.335252812589951, lng:103.8107378259928},
                            { lat:1.335216638343102, lng:103.8107737686255},
                            { lat:1.408198802340066, lng:103.8081492175769},
                            { lat:1.386883042162874, lng:103.8203521162467},
                            { lat:1.386864955127723, lng:103.8203970451815},
                            { lat:1.413896418436688, lng:103.8413160031825},
                            { lat:1.369207875504802, lng:103.9700987935173},
                            ];
     
     

     function initialize() {
         var location = {lat: 1.362856, lng: 103.807056};

         var mapProp = {
             center: new google.maps.LatLng(1.362193, 103.820613),
             zoom: 12,
             mapTypeId: google.maps.MapTypeId.ROADMAP
         };
         map = new google.maps.Map(document.getElementById("DivGoogleMapCanvas"), mapProp);
         directionsDisplay.setMap(map);
         directionsDisplay.setPanel(document.getElementById('dvPanel'));

         //Autocomplete function for the start and destination textboxes. 
         var startInput = document.getElementById('<%= startTxt.ClientID %>');
         var endInput = document.getElementById('<%= destinationTxt.ClientID %>');

         var startAutocomplete = new google.maps.places.Autocomplete(startInput);
         var endAutocomplete = new google.maps.places.Autocomplete(endInput);

         //adding our list of cameras to the map
         for(i=0;i<cameraLocations.length;i++)
         {
             addMarker(cameraLocations[i], map);
         }
         
         //addMarker(location,map);
         setMapOnAll(null);
         
     }

     function addMarker(location,map) {
         var marker = new google.maps.Marker({
             position: location,
             map: map,
             icon: '/images/1f4f8.png'
         });
         markers.push(marker);
     }

     function setMapOnAll(map) {
         for (var i = 0; i < markers.length; i++) {
             markers[i].setMap(map);
         }
     }
     var toggle = false;
     function showMarkers() {
         toggle = !toggle;
         if (toggle) {
             setMapOnAll(map);
         }
         else {
             setMapOnAll(null);
         }
     }

     function calculateAndDisplayRoute() {
         var start = document.getElementById('<%= startTxt.ClientID %>').value;
         var end = document.getElementById('<%= destinationTxt.ClientID %>').value;
         directionsService.route({
             origin: start,
             destination: end,
             travelMode: google.maps.TravelMode.DRIVING,
             //drivingOptions: DrivingOptions,
             //unitSystem: METRIC,
             region: "SG",
             provideRouteAlternatives: true,
         
             
         }, function (response, status) {
             if (status === google.maps.DirectionsStatus.OK) {
                 directionsDisplay.setDirections(response);
             } else {
                 window.alert('Directions request failed due to ' + status);
             }
         });
     }
     google.maps.event.addDomListener(window, 'load', initialize);
 </script>
    <style type="text/css">

        .auto-style2 {
            width: 271px;
        }
        .auto-style3 {
            width: 89px;
        }
        .auto-style4 {
            width: 203px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style3">
                Starting Point:</td>
            <td class="auto-style4">
                <asp:TextBox ID="startTxt" runat="server" Width="183px"></asp:TextBox>
            </td>
  
            <td rowspan="6">
                <div id="DivGoogleMapCanvas" style="height:100vh;">  </div></td>
  
        </tr>
        <tr>
            <td class="auto-style3">
                Destination:</td>
            <td class="auto-style4">
                <asp:TextBox ID="destinationTxt" runat="server" Width="179px"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td colspan="2" class="style1">
                Route Option:<asp:RadioButtonList ID="routeRbl" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" >
                <asp:ListItem Selected="True">Fastest</asp:ListItem>
                <asp:ListItem>Shortest</asp:ListItem>
                <asp:ListItem>Cheapest</asp:ListItem>
                </asp:RadioButtonList>
            </td>

        </tr>
        <tr>
        <td class="auto-style2" colspan="2" align="center">
        
            <asp:Button ID="searchBtn" runat="server" onclientclick="calculateAndDisplayRoute();" Text="Search" OnClick="searchBtn_Click" style="height: 26px" />
        
            </td>
        </tr>
       
        <tr>
        <td class="style2" colspan="2">
        
            View Options<br />
        
            <asp:Button ID="Button1"  onclientclick="showMarkers(); return false;" runat="server" Text="Show Speed Cameras" CausesValidation="False" />
        
            </td>
        </tr>
       
        <tr>
        <td colspan="2">
        <div id="dvPanel"></div>
            &nbsp;</td>
        </tr>
       
    </table>
</asp:Content>
