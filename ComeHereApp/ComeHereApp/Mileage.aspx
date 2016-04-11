<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Mileage.aspx.cs" Inherits="ComeHereApp.Mileage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <asp:Table ID="Table1" Width="100%" runat="server">
            <asp:TableRow>
                <asp:TableCell Width="10%">Select Car:</asp:TableCell>
                <asp:TableCell><asp:DropDownList runat="server" ID="selectCarDDL" OnSelectedIndexChanged="selectCarDDL_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList></asp:TableCell>
            </asp:TableRow>
         </asp:Table>
        <div style="float:left">
        
        <asp:Table ID="Table3" BorderStyle="Ridge" runat="server" Height="113px">
    
            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server" Text="Total Distance:"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:Label runat="server" ID ="totalDist" ForeColor="Gray"></asp:Label></asp:TableCell>
                <asp:TableCell RowSpan="3"><span style="padding-left:50px"><asp:ImageButton ID="addTrip" runat="server" OnClick="addTrip_Click" ImageUrl="~/images/26fd.png" ToolTip="Add Trip" /></span> <br /><span style="text-align:center; padding-left:50px; font-size:small; color:gray">Add Trip</span></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                <asp:Label runat="server" Text="Total Litres:"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:Label runat="server" ID ="totalLitres" ForeColor="Gray"></asp:Label></asp:TableCell>
                
            </asp:TableRow>

               <asp:TableRow>
                
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Right"><span style="width:100%;text-align:right"><asp:Label runat="server" ID ="avgMileage" ForeColor="Gray"></asp:Label></span></asp:TableCell>
                    <asp:TableCell></asp:TableCell>
                   
               </asp:TableRow>
            
            
            </asp:Table>
        </div>
    <asp:Panel ID="Panel1" runat="server" Visible="False"><asp:Table BorderStyle="Dotted" ID="Table2" Height="113px" runat="server">
            <asp:TableRow >
                <asp:TableCell></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Trip Distance(km): </asp:TableCell>
                <asp:TableCell><asp:TextBox runat="server" ID="tripDist"></asp:TextBox></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell>Petrol Quantity(litres): </asp:TableCell>
                <asp:TableCell><asp:TextBox runat="server" ID ="tripLitres"></asp:TextBox></asp:TableCell>
            </asp:TableRow>

            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server" Visible="false" ForeColor="Green" ID="newTripLbl" Text="New Trip Added!"></asp:Label></asp:TableCell>
                <asp:TableCell><asp:Button runat="server" Text="Update" OnClick="Unnamed_Click"/></asp:TableCell>
            </asp:TableRow>
        </asp:Table> </asp:Panel>

        

    
</asp:Content>
