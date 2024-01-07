<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Productos.aspx.cs"
    Inherits="MenusController" Title="Productos" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <div class="productos">
            <div class="bannerMenus">
                <h2>Registro de alimentos y bebidas al menu del dia</h2>
            </div>

            <div class="tableMenus">
                <div class="searchProd">
                    <label for="txtSearchProd">Buscar productos:</label>
                    <asp:TextBox runat="server" ID="txtSearchProd" CssClass="styled-textbox"></asp:TextBox>
                    <asp:Button runat="server" ID="btnFindProd" Text="Buscar" OnClick="btnFindMenu_Click"
                        CssClass="btnBuscar" />                    
                    <div class="addMenu">
                        <a href="#openModalAdd" class="enlacesUsuarios">Agregar al menu</a>
                    </div>                    
                </div>    
                
                <div class="inputs">
                    <asp:TextBox runat="server" ID="txtNombre" placeholder="Ingrese el nombre del producto"
                        CssClass="styled-textbox"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtDesc" placeholder="Ingrese la descripcion"
                        CssClass="styled-textbox"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtPrecio" placeholder="Ingrese el precio"
                        CssClass="styled-textbox"></asp:TextBox>                                
                    <label for="ddlCategoriaProd">Categoria: </label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                        <asp:ListItem Text="-" Value="Default" />
                        <asp:ListItem Text="Tacos" Value="Tacos" />
                        <asp:ListItem Text="Tortas" Value="Tortas" />
                        <asp:ListItem Text="Gringas" Value="Gringas" />
                        <asp:ListItem Text="Bebidas" Value="Bebidas" />
                    </asp:DropDownList>
                </div>

                <div class="buttons">
                    <asp:Button runat="server" ID="btnUpdate" Text="Actualizar menu" 
                    OnClick="btnActualizarMenu_Click" CssClass="styled-button" />
                    <asp:Button runat="server" ID="btnDelete" Text="Eliminar del menu" 
                    OnClick="btnEliminarMenu_Click" CssClass="styled-button" />
                    <asp:Button runat="server" ID="btnLimpiar" Text="Limpiar campos" 
                    OnClick="btnLimpiarMenu_Click" CssClass="styled-button" />
                </div>
               
                <asp:GridView ID="GridViewProductos" runat="server" AutoGenerateColumns="False" CssClass="styled-grid"
                 OnRowCommand="GridViewProductos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />                
                   <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Elegir" ShowHeader="True" Text="Elegir"/>
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
                                <asp:TextBox runat="server" ID="txtNombreProdAlta" placeholder="Ingrese el nombre del producto"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtDescProdAlta" placeholder="Ingrese la descripcion"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtPrecioProdAlta" placeholder="Ingrese el precio"
                                    CssClass="styled-textbox"></asp:TextBox>                                
                                <label for="ddlCategoriaProd">Categoria: </label>
                                <asp:DropDownList runat="server" ID="ddlCategoriaProdAlta" CssClass="styled-dropdown">
                                    <asp:ListItem Text="-" Value="Default" />
                                    <asp:ListItem Text="Tacos" Value="Tacos" />
                                    <asp:ListItem Text="Tortas" Value="Tortas" />
                                    <asp:ListItem Text="Gringas" Value="Gringas" />
                                    <asp:ListItem Text="Bebidas" Value="Bebidas" />
                                </asp:DropDownList>
                            </div>
                            <asp:Button runat="server" ID="btnAgregarMenu" Text="Agregar"
                                OnClick="btnAgregarMenu_Click" CssClass="styled-button" />
                        </div>
                    </div>
                </div>

              
            </div>
        </div>
    </asp:Content>
