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
                    <label for="ddlMesa">Servicio para:</label>
                    <asp:DropDownList runat="server" ID="ddlMesa" CssClass="styled-dropdown">
                        <asp:ListItem Text="-" Value="Default" />
                        <asp:ListItem Text="Mesa 1" Value="Mesa 1" />
                        <asp:ListItem Text="Mesa 2" Value="Mesa 2" />
                        <asp:ListItem Text="Mesa 3" Value="Mesa 3" />
                        <asp:ListItem Text="Mesa 4" Value="Mesa 4" />
                        <asp:ListItem Text="Mesa 5" Value="Mesa 5" />
                        <asp:ListItem Text="Mesa 6" Value="Mesa 6" />
                    </asp:DropDownList>

                    <label for="ddlCategoria">Categoria:</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                        <asp:ListItem Text="-" Value="Default" />
                        <asp:ListItem Text="Tacos" Value="Tacos" />
                        <asp:ListItem Text="Tortas" Value="Tortas" />
                        <asp:ListItem Text="Gringas" Value="Gringas" />
                        <asp:ListItem Text="Bebidas" Value="Bebidas" />
                    </asp:DropDownList>
                </div>

                <!--Pending to check: Convertir la tabla en una lista
                    Para lograr seleccionar los alimentos deseados **Roy se encarga de hacer la concatenación para la lista **-->
                <div class="tableMenus">
                    <table>
                        <tr>
                            <th>Elegir</th>
                            <th>Nombre</th>
                            <th>Categoria</th>
                            <th>Precio</th>
                        </tr>
                        <tr>
                            <td><asp:CheckBox ID="chkElegir1" runat="server" /></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:CheckBox ID="chkElegir2" runat="server" /></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><asp:CheckBox ID="chkElegir3" runat="server" /></td>
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
        </div>


    </asp:Content>