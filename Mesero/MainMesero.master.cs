using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Main : MasterPage {

    protected void lnkInicio_Click(object sender, EventArgs e) {
        Response.Redirect("Inicio.aspx"); // Reemplaza "Inicio.aspx" con la página correspondiente
    }

    protected void lnkOrden_Click(object sender, EventArgs e) {
        Response.Redirect("Orden.aspx"); // Reemplaza "Orden.aspx" con la página correspondiente
    }

    protected void lnkMenu_Click(object sender, EventArgs e) {
        Response.Redirect("Menu.aspx"); // Reemplaza "Tacos.aspx" con la página correspondiente
    }

    protected void lnkSalir_Click(object sender, EventArgs e) {
        Response.Redirect("Salir.aspx"); // Reemplaza "Tacos.aspx" con la página correspondiente
    }
}