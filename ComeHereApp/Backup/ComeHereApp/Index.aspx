<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ComeHereApp.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
 <script language="javascript" type="text/javascript">

     function initialize() {
         var mapProp = {
             center: new google.maps.LatLng(1.2896700, 103.8500700),
             zoom: 5,
             mapTypeId: google.maps.MapTypeId.ROADMAP
         };
         var map = new google.maps.Map(document.getElementById("DivGoogleMapCanvas"), mapProp);
     }
     google.maps.event.addDomListener(window, 'load', initialize);
 </script>
    <style type="text/css">
        .style1
        {
            height: 50px;
        }
        .style2
        {
        }
        .style3
        {
            width: 162px;
        }
        .style4
        {
            width: 252px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style4">
                Starting Point:</td>
            <td class="style3">
                <asp:TextBox ID="startTxt" runat="server"></asp:TextBox>
            </td>
  
            <td rowspan="5">
                <div id="DivGoogleMapCanvas" style="height:500px;">  </div></td>
  
        </tr>
        <tr>
            <td class="style4">
                Destination:</td>
            <td class="style3">
                <asp:TextBox ID="destinationTxt" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td colspan="2" class="style1">
                Route Option:<asp:RadioButtonList ID="routeRbl" runat="server" AutoPostBack="True" RepeatDirection="Horizontal" >
                <asp:ListItem>Fastest</asp:ListItem>
                <asp:ListItem>Shortest</asp:ListItem>
                <asp:ListItem>Cheapest</asp:ListItem>
                </asp:RadioButtonList>
            </td>

        </tr>
        <tr>
        <td class="style4">
        
            &nbsp;</td>
        <td class="style3">
        
            <asp:Button ID="searchBtn" runat="server" Text="Search" />
        
        </td>
        </tr>
       
        <tr>
        <td class="style2" colspan="2">
        
            View<asp:CheckBoxList ID="toggleCbl" runat="server" Enabled="false">
            <asp:ListItem>Speed Camera</asp:ListItem>
            </asp:CheckBoxList>
        
            </td>
        </tr>
       
    </table>
</asp:Content>
