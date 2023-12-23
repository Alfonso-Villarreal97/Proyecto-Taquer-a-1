<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Ventas.aspx.cs"
    Inherits="VentasController" Title="Ventas" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <div class="bannerVenta">
            <h2>Resumen de ventas</h2>
            <img src="img/ventas.jpeg" alt="ventas" />
        </div>

        <div class="menu-containerVentas">
            <div class="inputSearch">
                <label for="txtFecha">Buscar venta:</label>
                <asp:TextBox runat="server" ID="txtFecha" CssClass="styled-textbox"></asp:TextBox>
            </div>

            <div class="tableVentas">
                <table>
                    <tr>
                        <th>Numero de Orden</th>
                        <th>Fecha</th>
                        <th>Mesero</th>
                        <th>Total</th>
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
        </div>
    </asp:Content>