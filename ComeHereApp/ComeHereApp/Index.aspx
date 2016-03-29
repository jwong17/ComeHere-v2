<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ComeHereApp.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
 <script language="javascript" type="text/javascript">

     var directionsDisplay = new google.maps.DirectionsRenderer;
     var directionsService = new google.maps.DirectionsService;

     

     function initialize() {
        

         var mapProp = {
             center: new google.maps.LatLng(1.2896700, 103.8500700),
             zoom: 12,
             mapTypeId: google.maps.MapTypeId.ROADMAP
         };
         var map = new google.maps.Map(document.getElementById("DivGoogleMapCanvas"), mapProp);
         directionsDisplay.setMap(map);
         directionsDisplay.setPanel(document.getElementById('dvPanel'));

         //Autocomplete function for the start and destination textboxes. 
         var startInput = document.getElementById('<%= startTxt.ClientID %>');
         var endInput = document.getElementById('<%= destinationTxt.ClientID %>');

         var startAutocomplete = new google.maps.places.Autocomplete(startInput);
         var endAutocomplete = new google.maps.places.Autocomplete(endInput);

  

     }

     function calculateAndDisplayRoute() {
         var start = document.getElementById('<%= startTxt.ClientID %>').value;
         var end = document.getElementById('<%= destinationTxt.ClientID %>').value;
         directionsService.route({
             origin: start,
             destination: end,
             travelMode: google.maps.TravelMode.DRIVING
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
        
            View<asp:CheckBoxList ID="toggleCbl" runat="server" Enabled="false">
            <asp:ListItem>Speed Camera</asp:ListItem>
            </asp:CheckBoxList>
        
            </td>
        </tr>
       
        <tr>
        <td colspan="2">
        <div id="dvPanel"></div>
            &nbsp;</td>
        </tr>
       
    </table>
</asp:Content>
