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
                </div>
                
                <asp:GridView ID="GridViewProductos" runat="server" AutoGenerateColumns="False" CssClass="styled-grid">
                <Columns>
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" SortExpression="Precio" />
                    <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                
                    <asp:TemplateField HeaderText="Modificar">
                        <ItemTemplate>
                            <a href="#openModalMod" style="display: flex; justify-content: center; align-items: center;">
                                <img src="../img/mod.png" alt="Modificar" width="30" height="30" style="margin: auto;"/>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <a href="#openModalDel" style="display: flex; justify-content: center; align-items: center;">
                                <img src="../img/del.png" alt="Eliminar" width="30" height="30" style="margin: auto;"/>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                
                </Columns>
				</asp:GridView>
            </div>

            <!-- ENLACES PARA ABRIR LOS MODALES CORRESPONDIENTES A LAS OPERACIONES CRUD-->
            <div class="links">
                <div class="modal-body">
                    <a href="#openModalAdd" class="enlacesUsuarios">Agregar al menu</a>
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

                <div class="modal-body">
                    <div id="openModalMod" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <h2>Modificar el menu</h2>
                            <div class="inputs">
                                <asp:TextBox runat="server" ID="txtNombreProdMod" placeholder="Ingrese el nombre del producto"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtDescProdMod" placeholder="Ingrese la descripcion"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtPrecioMod" placeholder="Ingrese el precio"
                                    CssClass="styled-textbox"></asp:TextBox>                                
                                <label for="ddlCategoriaProd">Categoria: </label>
                                <asp:DropDownList runat="server" ID="ddlCategoriaMod" CssClass="styled-dropdown">
                                    <asp:ListItem Text="-" Value="Default" />
                                    <asp:ListItem Text="Tacos" Value="Tacos" />
                                    <asp:ListItem Text="Tortas" Value="Tortas" />
                                    <asp:ListItem Text="Gringas" Value="Gringas" />
                                    <asp:ListItem Text="Bebidas" Value="Bebidas" />
                                </asp:DropDownList>
                            </div>
                            <asp:Button runat="server" ID="btnActualizarMenu" Text="Actualizar"
                                OnClick="btnActualizarMenu_Click" CssClass="styled-button" />
                        </div>
                    </div>
                </div>

                <div class="modal-body">
                    <div id="openModalDel" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <h2>Eliminar del menu</h2>
                            <div class="inputs">
                                <asp:TextBox runat="server" ID="txtNombreProdDel" placeholder="Ingrese el nombre del producto"
                                    CssClass="styled-textbox"></asp:TextBox>
                            </div>
                            <asp:Button runat="server" ID="btnEliminarMenu" Text="Eliminar"
                                OnClick="btnEliminarMenu_Click" CssClass="styled-button" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>
