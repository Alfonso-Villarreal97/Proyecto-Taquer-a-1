<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Usuarios.aspx.cs"
    Inherits="MenusController" Title="Usuarios" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">

        <div class="bannerMenus">
            <h2>Registro de Usuarios</h2>
            <img src="img/agregar.jpeg" alt="menus" />
        </div>

        <div class="menu-containerUser">

            <div class="inputs">
                <label for="txtNombre">Nombre:</label>
                <asp:TextBox runat="server" ID="txtNombre" CssClass="styled-textbox"></asp:TextBox>
                <label for="txtApellido">Apellido:</label>
                <asp:TextBox runat="server" ID="txtPrecio" CssClass="styled-textbox"></asp:TextBox>
                <label for="txtUsuario">Usuario:</label>
                <asp:TextBox runat="server" ID="txtUsuario" CssClass="styled-textbox"></asp:TextBox>
                <label for="txtPassword">Password:</label>
                <asp:TextBox runat="server" ID="txtPassword" CssClass="styled-textbox"></asp:TextBox>
                <label for="txtPassword">Accesa como:</label>
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                    <asp:ListItem Text="-" Value="Default" />
                    <asp:ListItem Text="Administrador" Value="Administrador" />
                    <asp:ListItem Text="Mesero" Value="Mesero" />
                </asp:DropDownList>
            </div>

            <div class="tableUser">
                <table>
                    <tr>                        
                        <th>Nombre</th>
                        <th>Usuario</th>
                        <th>Tipo de usuario</th>
                    </tr>
                    <tr>                        
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>                        
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>                        
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>

            <div class="button-container">
                <asp:Button runat="server" ID="btnAgregarMenu" Text="Agregar usuario" OnClick="btnAgregarUser_Click"
                    CssClass="styled-button" />
                <asp:Button runat="server" ID="btnActualizarMenu" Text="Actualizar usuario" OnClick="btnActualizarUser_Click"
                    CssClass="styled-button" />
                <asp:Button runat="server" ID="btnEliminarMenu" Text="Eliminar usuario" OnClick="btnEliminarUser_Click"
                    CssClass="styled-button" />
            </div>
        </div>        
    </asp:Content>