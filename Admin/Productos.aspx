<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Productos.aspx.cs"
    Inherits="MenusController" Title="Productos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="css/styles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="productos">
        <div class="bannerMenus">
            <h2>REGISTRO DE ALIMENTOS AL MENU DEL DIA</h2>
        </div>

        <div class="tableMenus">
            <div class="searchProd">
                <label for="txtSearchProd">Filtrar por:</label>
                <asp:DropDownList runat="server" ID="ddlCategorias" CssClass="ddlFiltrado" AutoPostBack="true">
                    <asp:ListItem Text="- Seleccionar -" Value="" />
                </asp:DropDownList>
                <asp:Button runat="server" ID="btnFindProd" Text="Buscar" OnClick="btnFindMenu_Click" CssClass="btnBuscar" />
                <div class="addMenu">
                    <a href="#openModalAdd" class="enlacesUsuarios">Agregar al menu</a>
                </div>
            </div>

            <div class="inputs">
                <label for="ddlCategoriaProd">Categoria: </label>
                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                    <asp:ListItem Text="-" Value="Default" />
                    <asp:ListItem Text="Tacos" Value="Tacos" />
                    <asp:ListItem Text="Tortas" Value="Tortas" />
                    <asp:ListItem Text="Gringas" Value="Gringas" />
                    <asp:ListItem Text="Bebidas" Value="Bebidas" />
                </asp:DropDownList>

                <label for="txtDesc">Descripcion: </label>
                <asp:TextBox runat="server" ID="txtDesc" placeholder="Breve descripcion"
                    CssClass="styled-textbox"></asp:TextBox>
                
                <label for="txtPrecio">Precio: </label>
                <asp:TextBox runat="server" ID="txtPrecio" placeholder="Precio del alimentos"
                    CssClass="styled-textbox"></asp:TextBox>
            </div>

            <div class="buttons">
                <asp:Button runat="server" ID="btnUpdate" Text="Actualizar producto"
                    OnClick="btnActualizarMenu_Click" CssClass="styled-button" />
                <asp:Button runat="server" ID="btnDelete" Text="Eliminar producto"
                    OnClick="btnEliminarMenu_Click" CssClass="styled-button" />
                <asp:Button runat="server" ID="btnLimpiar" Text="Limpiar campos"
                    OnClick="btnLimpiarMenu_Click" CssClass="styled-button" />
            </div>

            <asp:GridView ID="GridViewProductos" runat="server" AutoGenerateColumns="False" CssClass="styled-grid"
                OnRowCommand="GridViewProductos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Elegir" ShowHeader="True" Text="Elegir" />
                </Columns>
            </asp:GridView>
        </div>

        <!-- ENLACES PARA ABRIR LOS MODALES CORRESPONDIENTES A LAS OPERACIONES CRUD-->
        <div class="links">
            <div class="modal-body">
                <div id="openModalAdd" class="modalDialog">
                    <div>
                        <a href="#close" title="Close" class="close">X</a>
                        <h2>Agregar al menu</h2>
                        <div class="inputs">
                            <label for="ddlCategoriaProd">Categoria: </label>
                            <asp:DropDownList runat="server" ID="ddlCategoriaProdAlta" CssClass="styled-dropdown">
                                <asp:ListItem Text="-" Value="Default" />
                                <asp:ListItem Text="Tacos" Value="Tacos" />
                                <asp:ListItem Text="Tortas" Value="Tortas" />
                                <asp:ListItem Text="Gringas" Value="Gringas" />
                                <asp:ListItem Text="Bebidas" Value="Bebidas" />
                            </asp:DropDownList>
                            <asp:TextBox runat="server" ID="txtDescProdAlta" placeholder="Ingrese la descripcion"
                                CssClass="styled-textbox"></asp:TextBox>
                            <asp:TextBox runat="server" ID="txtPrecioProdAlta" placeholder="Ingrese el precio"
                                CssClass="styled-textbox"></asp:TextBox>
                        </div>

                        <asp:Button runat="server" ID="btnAgregarMenu" Text="Agregar"
                            OnClick="btnAgregarMenu_Click" CssClass="styled-button" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

