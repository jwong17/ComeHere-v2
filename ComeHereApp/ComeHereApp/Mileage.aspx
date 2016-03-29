<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Mileage.aspx.cs" Inherits="ComeHereApp.Mileage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        
        <asp:Table ID="Table1" runat="server">
            <asp:TableRow>
                <asp:TableCell>Select Car:</asp:TableCell>
                <asp:TableCell><asp:DropDownList runat="server" ID="selectCarDDL" OnSelectedIndexChanged="selectCarDDL_SelectedIndexChanged" AutoPostBack="True" ></asp:DropDownList></asp:TableCell>
            </asp:TableRow>
         

            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server" ID ="totalDist"></asp:Label></asp:TableCell>
                <asp:TableCell></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell><asp:Label runat="server" ID ="totalLitres"></asp:Label></asp:TableCell>
                <asp:TableCell></asp:TableCell>
            </asp:TableRow>

               <asp:TableRow>
                
                <asp:TableCell><asp:Label runat="server" ID ="avgMileage"></asp:Label></asp:TableCell>
                   <asp:TableCell><asp:Label runat="server" ID ="carName"></asp:Label></asp:TableCell>
            </asp:TableRow>
            </asp:Table>

        <asp:Table ID="Table2" runat="server">
            <asp:TableRow >
                <asp:TableCell>Add New Trip :</asp:TableCell>
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
                <asp:TableCell></asp:TableCell>
                <asp:TableCell><asp:Button runat="server" Text="Update" OnClick="Unnamed_Click"/></asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    </p>
</asp:Content>
