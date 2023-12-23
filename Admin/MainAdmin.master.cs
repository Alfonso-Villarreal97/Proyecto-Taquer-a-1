using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Main : MasterPage {

    protected void lnkInicio_click(object sender, EventArgs e) {
        Response.Redirect("Inicio.aspx"); // Reemplaza "Inicio.aspx" con la página correspondiente
    }

    protected void lnkVentas_click(object sender, EventArgs e) {
        Response.Redirect("Ventas.aspx"); // Reemplaza "Orden.aspx" con la página correspondiente
    }

    protected void lnkProductos_click(object sender, EventArgs e) {
        Response.Redirect("Productos.aspx"); // Reemplaza "Tacos.aspx" con la página correspondiente
    }

    protected void lnkUsers_click(object sender, EventArgs e) {
        Response.Redirect("Usuarios.aspx"); // Reemplaza "Tacos.aspx" con la página correspondiente
    }

    protected void lnkSalir_click(object sender, EventArgs e) {
        // Agrega aquí el código para manejar la acción de salir
    }
}

