<%@ Page Language="C#" MasterPageFile="MainMesero.master" AutoEventWireup="true" Src="Menu.aspx.cs"
    Inherits="MenusController" Title="Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

    <div class="Menu">
        <div class="bannerMenus">
            <h2>Seleccionar alimentos</h2>
        </div>

        <div class="menu-containerMenus">
            <div class="selectores">
                <label for="ddlCategoria">Categoria:</label>
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>

                
            </div>

            <div class="listMenus">
                <div class="div-menus">
                    <asp:ListBox runat="server" ID="lstMenu" CssClass="lstMenu" SelectionMode="Single"></asp:ListBox>
                    <asp:ListBox runat="server" ID="lstMenu2" CssClass="lstMenu" SelectionMode="Single"></asp:ListBox>
                </div>
            </div>

            <div class="button-container">
                <asp:Button runat="server" ID="btnEliminarDeOrden" Text="Eliminar de la orden" OnClick="btnEliminarDeOrden_Click" CssClass="styled-button" />
            </div>
                
            <div class="button-container">
                <asp:Button runat="server" ID="btnAdd" Text="Agregar a la orden" OnClick="btnAgregarMenu_Click" CssClass="styled-button" />

                <div class="selectores">
                    <label for="txtTotal">Total a Pagar</label>
                    <asp:TextBox runat="server" ID="txtTotal" ReadOnly="true"/>
                </div>
            </div>

            <div class="button-container">
                <asp:Button runat="server" ID="btnFin" Text="Finalizar orden" OnClick="btnFinalizarOrden_Click" CssClass="styled-button" AutoPostBack="true"/>
            </div>
        </div>
    </div>
</asp:Content>

