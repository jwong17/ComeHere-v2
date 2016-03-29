<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ComeHereApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table style="width:100%;">
        <tr>
            <td>
               Username: </td>
            <td>
                <asp:TextBox ID="userNameTxt" runat="server"></asp:TextBox></td>

        </tr>
        <tr>
            <td>
                Password:</td>
            <td>
                <asp:TextBox ID="passWordTxt" runat="server"></asp:TextBox></td>

        </tr>
        <tr>
            <td>
                <asp:Button ID="signUpBtn" runat="server" Text="Sign Up" 
        PostBackUrl="~/Registeration.aspx" /></td>
            <td>
               <asp:Button ID="submitBtn" runat="server" Text="Submit" /></td>

        </tr>
    </table>

 <br />

 <br />
 


 
 
 
 
 
 
   
</asp:Content>
