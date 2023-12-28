<%@ Page Language="C#" MasterPageFile="MainAdmin.master" AutoEventWireup="true" Src="Usuarios.aspx.cs"
    Inherits="MenusController" Title="Usuarios" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <div class="usuarios">
            <div class="bannerMenus">
                <h2>Gestionar Usuarios</h2>
            </div>

            <div class="tableUser">
                <div class="searchUser">
                    <label for="txtSearchUser">Buscar usuario:</label>
                    <asp:TextBox runat="server" ID="txtSearchUser" CssClass="styled-textbox"></asp:TextBox>
                    <asp:Button runat="server" ID="btnFindUser" Text="Buscar" OnClick="btnFindUser_Click"
                        CssClass="btnBuscar" />
                </div>

                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Usuario</th>
                        <th>Tipo de usuario</th>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>

            <!-- ENLACES PARA ABRIR LOS MODALES CORRESPONDIENTES A LAS OPERACIONES-->
            <div class="links">
                <div class="modal-body">
                    <a href="#openModalAdd" class="enlacesUsuarios">Agregar usuario</a>
                    <div id="openModalAdd" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <h2>Registrar usuario</h2>
                            <div class="inputs">
                                <asp:TextBox runat="server" ID="txtNombreAlta" placeholder="Ingrese el nombre"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtApellidoAlta" placeholder="Ingrese el apellido"
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

                <div class="modal-body">
                    <a href="#openModalMod" class="enlacesUsuarios">Modificar usuario</a>
                    <div id="openModalMod" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <h2>Modificar usuario</h2>
                            <div class="inputs">

                                <asp:TextBox runat="server" ID="txtNombreMod" placeholder="Ingrese el nombre"
                                    CssClass="styled-textbox"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtApellidoMod" placeholder="Ingrese el apellido"
                                    CssClass="styled-textbox"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtUsuarioMod" placeholder="Ingrese el usuario"
                                    CssClass="styled-textbox"></asp:TextBox>

                                <asp:TextBox runat="server" ID="txtPasswordMod" TextMode="Password"
                                    placeholder="Ingrese el password" CssClass="styled-textbox"></asp:TextBox>
                                <label for="ddlCategoria">Tipo de usuario:</label>
                                <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="styled-dropdown">
                                    <asp:ListItem Text="-" Value="Default" />
                                    <asp:ListItem Text="Administrador" Value="Administrador" />
                                    <asp:ListItem Text="Mesero" Value="Mesero" />
                                </asp:DropDownList>
                            </div>
                            <asp:Button runat="server" ID="btnActualizarMenu" Text="Actualizar usuario"
                                OnClick="btnActualizarUser_Click" CssClass="styled-button" />
                        </div>
                    </div>
                </div>

                <div class="modal-body">
                    <a href="#openModalDel" class="enlacesUsuarios">Eliminar usuario</a>
                    <div id="openModalDel" class="modalDialog">
                        <div>
                            <a href="#close" title="Close" class="close">X</a>
                            <h2>Eliminar usuario</h2>
                            <div class="inputs">
                                <asp:TextBox runat="server" ID="txtNombreDel" placeholder="Ingrese el nombre"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtApellidoDel" placeholder="Ingrese el apellido"
                                    CssClass="styled-textbox"></asp:TextBox>
                                <asp:TextBox runat="server" ID="txtUsuarioDel" placeholder="Ingrese el usuario"
                                    CssClass="styled-textbox"></asp:TextBox>
                            </div>
                            <asp:Button runat="server" ID="btnEliminarMenu" Text="Eliminar usuario"
                                OnClick="btnEliminarUser_Click" CssClass="styled-button" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </asp:Content>