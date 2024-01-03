<%@ Page Language="C#" MasterPageFile="MainMesero.master" AutoEventWireup="true" Src="Orden.aspx.cs"
    Inherits="OrdenController" Title="Orden" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <!--ToDo: Rediseñar vista-->
        <div class="banner">
            <h2>Visualizar resumen de orden o pedido</h2>
            <div class="imgOrden">
                <img src="img/gringa.png" alt="gringa" />
            </div>
        </div>

        <div class="cmbMesa">
            <label for="ddlMesa">Visualizar orden de la mesa:</label>
            <asp:DropDownList runat="server" ID="ddlMesa" CssClass="styled-dropdown">
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

        <div class="menu-containerOrden">

            <div class="lstComida">

                <asp:ListBox runat="server" ID="lstResumen" CssClass="styled-listbox" SelectionMode="Single">
                    <asp:ListItem Text="Orden 01" Value="Orden 01" />
                    <asp:ListItem Text="Orden 02" Value="Orden 02" />
                    <asp:ListItem Text="Orden 03" Value="Orden 03" />
                    <asp:ListItem Text="Orden 04" Value="Orden 04" />
                    <asp:ListItem Text="Orden 05" Value="Orden 05" />
                    <asp:ListItem Text="Orden 06" Value="Orden 06" />
                </asp:ListBox>
            </div>

            <div class="labels">
                <label for="txtPrecioResumen">Precio Resumen:</label>
                <asp:TextBox runat="server" ID="txtPrecioResumen" CssClass="styled-textbox"></asp:TextBox>
            </div>

            <div class="btnPedido">
                <asp:Button runat="server" ID="btnFinalizarPedido" Text="Finalizar Pedido"
                    OnClick="btnFinalizarPedido_Click" CssClass="styled-button" />
            </div>

        </div>
        </div>
    </asp:Content>