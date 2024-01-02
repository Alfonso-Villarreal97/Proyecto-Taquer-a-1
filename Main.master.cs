using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Main : MasterPage {

    protected void lnkInicio_click(object sender, EventArgs e) {
        Response.Redirect("Default.aspx"); // Reemplaza "Inicio.aspx" con la página correspondiente
    }
}

