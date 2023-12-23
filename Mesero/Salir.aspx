<% @Page Language="C#" 
	MasterPageFile="Main.master"
	AutoEventWireup="true"
	Src="NuevoRegistro.aspx.cs" 
	Inherits="NuevoController" 
	Title = "Nuevo Registro" %>
	
	
	<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	
	<link rel="stylesheet" type="text/css" href="estilos.css" />
	
	</asp:Content>

	
	<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <br /><br />
    <div class="form-container custom-font">
        <h2>Ingrese un registro nuevo</h2><br />
        <div class="form-group">
            <label for="txtNombre">Nombre:</label>
            <asp:TextBox runat="server" ID="txtNombre" CssClass="styled-textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtApellido">Apellido:</label>
            <asp:TextBox runat="server" ID="txtApellido" CssClass="styled-textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtEmail">Email:</label>
            <asp:TextBox runat="server" ID="txtEmail" CssClass="styled-textbox"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtTelefono">Telefono:</label>
            <asp:TextBox runat="server" ID="txtTelefono" CssClass="styled-textbox"></asp:TextBox>
        </div>
        <asp:Button runat="server" ID="btnGuardar" Text="Guardar" OnClick="btnGuardar_Click" CssClass="styled-button" />
    </div>
    
    <style>
        .form-container {
            text-align: left;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 15px;
        }

        .form-group label {
            width: 100px;
            margin-bottom: 5px;
        }

        .styled-textbox {
            width: 200px;
        }
    </style>
</asp:Content>





