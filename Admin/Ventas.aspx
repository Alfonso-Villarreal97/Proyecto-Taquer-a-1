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
                    
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />

                    
                </div>

                <div class="tableVentas">
                    <asp:GridView ID="GridViewVentas" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                    <Columns>
                        <asp:BoundField DataField="NumeroDeOrden" HeaderText="Numero de Orden" SortExpression="NumeroDeOrden" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" DataFormatString="{0:d}"/>
                        <asp:BoundField DataField="Mesero" HeaderText="Mesero" SortExpression="Mesero" />
                        <asp:BoundField DataField="Ganancia" HeaderText="Total" SortExpression="Ganancia" />
                    </Columns>
                    <HeaderStyle CssClass="gridview-header" />
                    <RowStyle CssClass="gridview-row" />
                </asp:GridView>
                </div>
            </div>
        </div>
    </asp:Content>
