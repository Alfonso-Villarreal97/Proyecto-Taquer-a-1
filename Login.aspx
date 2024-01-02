<%@ Page Language="C#" MasterPageFile="Main.master" AutoEventWireup="true" Src="Login.aspx.cs"
    Inherits="NuevoController" Title="Inicio de sesion" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <div class="container">
            <div class="formulario-login">
                <asp:Image runat="server" ID="imgLogo" ImageUrl="img/Logo_Banner.jpg" alt="Logo" />
                <h1>Inicio de sesion</h1>
                <div class="usuario">
                    <asp:Label ID="lblUsuario" runat="server" Text="Usuario"></asp:Label>
                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="txtUsuario"></asp:TextBox>
                </div>
                <div class="usuario">
                    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="txtUsuario">
                    </asp:TextBox>
                </div>

                <div class="btnIngresar">
                    <asp:Button runat="server" ID="btnIngresar" Text="Ingresar" CssClass="btnIngresar"
                        OnClick="btnIngresar_Click" />
                </div>
            </div>
        </div>
     </asp:Content>