<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Usuarios.aspx.cs"
    Inherits="MenusController" Title="Usuarios" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />        
        <script type="text/javascript">
            //Alertas Usuarios
            function alertaNull(){
                alert("Primero haga click sobre el boton 'elegir' para seleccionar un registro");
            }
            function alertaNullFields(){
                alert("No puede quedar ningun campo en blanco");
            }
            function alertaAltaFalse(){
                alert("No puede quedar ningun input en blanco");
            }
            function alertaDelTrue() {
                alert("Registro eliminado exitosamente");
            }
            function alertaDelFalse() {
                alert("Error al eliminar el registro");
            }           
            function alertaModTrue() {
                alert("Registro modificado exitosamente");
            }
            function alertaModFalse() {
                alert("Error al modificar el registro");
            }
        </script>
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <div class="usuarios">
            <div class="bannerMenus">
                <h2>Gestionar Usuarios</h2>
            </div>

            <div class="tableUser">      
                <div class="searchProd">
                    <label for="txtSearchProd">Filtrar por:</label>
                    <asp:DropDownList runat="server" ID="ddlCategorias" CssClass="ddlFiltrado" AutoPostBack="true">
                        <asp:ListItem Text="- Seleccionar -" Value="" />
                    </asp:DropDownList>
                    <asp:Button runat="server" ID="btnFindUser" Text="Buscar" OnClick="btnFindUser_click" CssClass="btnBuscar" />
                    <div class="addMenu">
                        <a href="#openModalAdd" class="enlacesUsuarios">Agregar usuario</a>
                    </div>
                </div>

                <div class="inputs">
                    <asp:TextBox runat="server" ID="txtNombre" placeholder="Ingrese el nombre"
                        CssClass="styled-textbox"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtUsuario" placeholder="Ingrese el usuario"
                        CssClass="styled-textbox"></asp:TextBox>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"
                        placeholder="Ingrese el password" CssClass="styled-textbox"></asp:TextBox>
                    <label for="ddlCategoria">Rol:</label>
                    <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                        <asp:ListItem Text="-" Value="Default" />
                        <asp:ListItem Text="Administrador" Value="Administrador" />
                        <asp:ListItem Text="Mesero" Value="Mesero" />
                    </asp:DropDownList>
                </div>

                <div class="buttons">
                    <asp:Button runat="server" ID="btnUpdate" Text="Actualizar usuario" 
                    OnClick="btnActualizarUser_Click" CssClass="styled-button" />
                    <asp:Button runat="server" ID="btnDelete" Text="Eliminar usuario" 
                    OnClick="btnEliminarUser_Click" CssClass="styled-button" />
                    <asp:Button runat="server" ID="btnLimpiar" Text="Limpiar campos" 
                    OnClick="btnLimpiar_Click" CssClass="styled-button" />
                </div>
               
                <asp:GridView ID="GridViewUsuarios" runat="server" AutoGenerateColumns="False" CssClass="styled-grid"
                 OnRowCommand="GridViewUsuarios_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Usuarios" HeaderText="Usuarios" SortExpression="Usuarios" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />                    
                    <asp:BoundField DataField="Rol" HeaderText="Rol" SortExpression="Rol" />               
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="Elegir" ShowHeader="True" Text="Elegir"/>
                </Columns>
				</asp:GridView>               
            </div>           

            <!-- ENLACES PARA ABRIR LOS MODALES CORRESPONDIENTES A LAS OPERACIONES-->
            <div class="links">
                <div class="modal-body">
                    <div id="openModalAdd" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <h2>Registrar usuario</h2>
                            <div class="inputs">
                                <asp:TextBox runat="server" ID="txtNombreAlta" placeholder="Ingrese el nombre"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtUsuarioAlta" placeholder="Ingrese el usuario"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtPasswordAlta" TextMode="Password"
                                    placeholder="Ingrese el password" CssClass="styled-textbox"></asp:TextBox>
                                <label for="ddlCategoria">Tipo de usuario:</label>
                                <asp:DropDownList runat="server" ID="ddlCategoriaAlta" CssClass="styled-dropdown">
                                    <asp:ListItem Text="-" Value="Default" />
                                    <asp:ListItem Text="Administrador" Value="Administrador" />
                                    <asp:ListItem Text="Mesero" Value="Mesero" />
                                </asp:DropDownList>
                            </div>
                            <asp:Button runat="server" ID="btnAgregarMenu" Text="Agregar usuario"
                                OnClick="btnAgregarUser_Click" CssClass="styled-button" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>