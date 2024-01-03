<%@ Page Language="C#" 
    MasterPageFile="MainMesero.master"
    AutoEventWireup="true"
    Src="Inicio.aspx.cs" 
    Inherits="InicioController" 
    Title="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">   
    <div class="menu-container">
        <img src="../img/Mesero.jpg" alt="Mesero">
    </div>
</asp:Content>


