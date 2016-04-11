<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ComeHereApp.Registeration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="Stylesheet" href="css/login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <div class="content">
                <h1>
                    REGISTER</h1>
                <asp:TextBox ID="usernameTxt" runat="server" CssClass="field" placeholder="Username"></asp:TextBox>
            
                <asp:TextBox ID="passwordTxt" runat="server" CssClass="field" placeholder="Password"></asp:TextBox>
        
                <asp:TextBox ID="cPasswordTxt" runat="server" CssClass="field" placeholder="Confirm Password"></asp:TextBox>
        
<table style="width: 100%;">
                <tr>
                    <td><asp:Button ID="submitBtn" runat="server" Text="Submit" OnClick="submitBtn_Click" CssClass="btn"/></td>
                    <td><asp:Button ID="cancelBtn" runat="server" Text="Cancel" PostBackUrl="~/Index.aspx" CssClass="btn" /> </td>
                    
                </tr>
               
            </table>
                
               
        </div>
    </div>
</asp:Content>
