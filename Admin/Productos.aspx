<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Productos.aspx.cs"
    Inherits="MenusController" Title="Productos" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <div class="bannerMenus">
            <h2>Registro de alimentos y bebidas al menu del dia</h2>
            <img src="img/agregar.jpeg" alt="menus" />
        </div>

        <div class="menu-containerMenus">

            <div class="inputs">
                <label for="txtNombre">Nombre:</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="styled-textbox"></asp:TextBox>
                <label for="txtPrecio">Precio:</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="styled-textbox"></asp:TextBox>
                <label for="ddlCategoria">Categoria:</label>
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                    <asp:ListItem Text="Categoria 1" Value="1" />
                    <asp:ListItem Text="Categoria 2" Value="2" />
                </asp:DropDownList>
            </div>

            <div class="tableMenus">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Categoria</th>
                        <th>Precio</th>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>

            <div class="button-container">
                <asp:Button runat="server" ID="btnAgregarMenu" Text="Agregar al menu" OnClick="btnAgregarMenu_Click"
                    CssClass="styled-button" />
                <asp:Button runat="server" ID="btnActualizarMenu" Text="Actualizar" OnClick="btnActualizarMenu_Click"
                    CssClass="styled-button" />
                <asp:Button runat="server" ID="btnEliminarMenu" Text="Eliminar del menu" OnClick="btnEliminarMenu_Click"
                    CssClass="styled-button" />
            </div>
        </div>        
    </asp:Content>