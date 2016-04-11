<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ComeHereApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="Stylesheet" href="css/login.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <div class="content">
                <h1>
                    LOGIN</h1>
    
                <asp:TextBox ID="userNameTxt" runat="server" CssClass="field" placeholder="Username"></asp:TextBox>

                <asp:TextBox ID="passWordTxt" TextMode="Password" runat="server"  CssClass="field" placeholder="Password"></asp:TextBox>

        
            &nbsp;<asp:Button ID="submitBtn" runat="server" Text="Submit" OnClick="submitBtn_Click" CssClass="btn" />
            
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="False"></asp:Label><br/>
           <asp:Label ID="Label2" runat="server" Text="Register for an account "></asp:Label>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registration.aspx" BorderStyle="None" ForeColor="#0066CC">here</asp:HyperLink>
           
        </div>
    </div>

 
   
</asp:Content>
