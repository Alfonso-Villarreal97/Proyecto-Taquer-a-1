<%@ Page Language="C#" Src="Login.aspx.cs" Inherits="NuevoController" Title="Login" %>
    <!DOCTYPE html>
    <html>
    <head runat="server">
        <link rel="stylesheet" type="text/css" href="css/styles.css" />
    </head>

    <body>

        <div class="formulario">
            <form method="post" runat="server">
                <asp:Image runat="server" ID="imgLogo" ImageUrl="img/Logo_Banner.jpg" AlternateText="Logo" />
                <h1>Inicio de sesion</h1>
                <div class="usuario">
                    <label>Usuario:</label>
                    <asp:TextBox runat="server" ID="txtUsuario" CssClass="txtUsuario"></asp:TextBox>
                </div>
                <div class="usuario">
                    <label>Password:</label>
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="txtUsuario">
                    </asp:TextBox>
                </div>                
                <asp:Button runat="server" ID="btnIngresar" Text="Ingresar" CssClass="btnIngresar" OnClick="btnIngresar_Click" />            
            </form>
        </div>
    </body>

    </html>