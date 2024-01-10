using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Main : MasterPage {

    protected void lnkInicio_Click(object sender, EventArgs e) {
        Response.Redirect("Inicio.aspx"); // Reemplaza "Inicio.aspx" con la página correspondiente
    }

    protected void lnkMenu_Click(object sender, EventArgs e) {
        Response.Redirect("Orden.aspx"); // Reemplaza "Tacos.aspx" con la página correspondiente
    }

    protected void lnkSalir_Click(object sender, EventArgs e) {
        // Cierra la sesión y redirige a la página de inicio de sesión
		Session.Abandon();
		Response.Redirect("~/Login.aspx"); // Reemplaza "Login.aspx" con la página correspondiente
    }
}
