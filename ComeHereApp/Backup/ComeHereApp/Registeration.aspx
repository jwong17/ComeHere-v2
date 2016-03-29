<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="ComeHereApp.Registeration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td>
                Username:</td>
            <td>
                <asp:TextBox ID="usernameTxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password:</td>
            <td>
                <asp:TextBox ID="passwordTxt" runat="server"></asp:TextBox>
            </td>

        </tr>
        <tr>
            <td>
                Confirm Password:
            </td>
            <td>
                <asp:TextBox ID="cPasswordTxt" runat="server"></asp:TextBox>
            </td>

        </tr>

         <tr>
            <td>
                
            </td>
            <td>
                <asp:Button ID="submitBtn" runat="server" Text="Submit" />
             </td>

        </tr>
    </table>
</asp:Content>
