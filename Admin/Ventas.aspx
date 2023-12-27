<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Ventas.aspx.cs"
    Inherits="VentasController" Title="Ventas" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>



    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <div class="ventas">
            <div class="bannerVenta">
                <h2>Resumen de ventas</h2>
            </div>

            <div class="contenido-ventas">
                <div class="search">
                    <label>Buscar venta:</label>
                </div>

                <div class="calendarios">
                    <div class="fechaDel">
                        <label for="txtFechaDel">Del:</label>
                        <asp:TextBox ID="txtFechaDel" runat="server" type="date"></asp:TextBox>
                    </div>

                    <div class="fechaAl">
                        <label for="txtFechaAl">Al:</label>
                        <asp:TextBox ID="txtFechaAl" runat="server" type="date"></asp:TextBox>
                    </div>
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
        </div>
    </asp:Content>