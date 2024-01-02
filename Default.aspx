<%@ Page Language="C#" MasterPageFile="Main.master" AutoEventWireup="true" Src="Default.aspx.cs"
    Inherits="NuevoController" Title="Default" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <div class="default-container">
            <h1>Bienvenido</h1>
            <div class="Inicio">
                <asp:Image runat="server" ID="imgLogo" ImageUrl="img/Mesero.jpg" alt="Logo" />

                <div class="btnIngresar">
                    <asp:Button runat="server" ID="btnGo" Text="Ingresar al sistema" CssClass="btnIngresar"
                        OnClick="btnGo_Click" />
                </div>
            </div>
        </div>
    </asp:Content>