<%@ Page Language="C#" MasterPageFile="Main.master" AutoEventWireup="true" Src="Menu.aspx.cs"
    Inherits="MenusController" Title="Menu" %>

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
                <label for="ddlCategoria">Servicio para:</label>                
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                    <asp:ListItem Text="-" Value="Default" />    
                <asp:ListItem Text="Mesa 1" Value="Mesa 1" />
                    <asp:ListItem Text="Mesa 2" Value="Mesa 2" />
                    <asp:ListItem Text="Mesa 3" Value="Mesa 3" />
                    <asp:ListItem Text="Mesa 4" Value="Mesa 4" />
                    <asp:ListItem Text="Mesa 5" Value="Mesa 5" />
                    <asp:ListItem Text="Mesa 6" Value="Mesa 6" />
                    <asp:ListItem Text="Mesa 7" Value="Mesa 7" />
                    <asp:ListItem Text="Mesa 8" Value="Mesa 8" />
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
                <asp:Button runat="server" ID="btnAdd" Text="Agregar a la orden" OnClick="btnEliminarMenu_Click"
                    CssClass="styled-button" />
            </div>
        </div>        
    </asp:Content>