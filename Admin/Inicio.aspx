<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Inicio.aspx.cs"
    Inherits="InicioController" Title="Inicio" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div class="menu-container">
        <img src="img/Logo.jpg" alt="Logo" />
        <div class="banner">
            <h2>Bienvenido a la sesion, administrador</h2>           
        </div>
    </div>
    </asp:Content>