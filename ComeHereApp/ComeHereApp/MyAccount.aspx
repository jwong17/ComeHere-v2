<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MyAccount.aspx.cs" Inherits="ComeHereApp.MyAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>My Cars:</asp:TableCell>
            <asp:TableCell><asp:DropDownList runat="server" ID="showCarsDDL"></asp:DropDownList></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>Add Car:</asp:TableCell>
            <asp:TableCell><asp:DropDownList runat="server" ID="carMakeDDL"></asp:DropDownList></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell><asp:DropDownList runat="server" ID="carModelDDL"></asp:DropDownList></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell></asp:TableCell>
            <asp:TableCell><asp:Button runat="server" Text="Add Car" ID="btnAddCar" /></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
