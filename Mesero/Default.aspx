<%@ Page Language="C#"
    MasterPageFile="Main.master"
    AutoEventWireup="true"
    Src="Default.aspx.cs"
    Inherits="DefaultController"
    Title="Mesero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="banner">
        <h2>Bienvenido a la sesion, mesero</h2>        
    </div>
    
    <div class="imgInicio">
        <img src="img/Mesero.jpg" alt="Mesero">
    </div>
</asp:Content>

