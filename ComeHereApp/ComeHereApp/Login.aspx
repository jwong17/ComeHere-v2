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
                <asp:TextBox ID="passWordTxt" TextMode="Password" runat="server"></asp:TextBox></td>

        </tr>
        <tr>
            <td>
                <asp:Button ID="signUpBtn" runat="server" Text="Sign Up" 
        PostBackUrl="~/Registeration.aspx" OnClick="signUpBtn_Click" /></td>
            <td>
               <asp:Button ID="submitBtn" runat="server" Text="Submit" OnClick="submitBtn_Click" /></td>

        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>

        </tr>
    </table>

 <br />

 <br />
 


 
 
 
 
 
 
   
</asp:Content>
