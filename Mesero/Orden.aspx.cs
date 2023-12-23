using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Collections.Generic;

public class OrdenController : Page
{
    public ListBox lstComida, lstBebidas, lstResumen;
    public TextBox txtPrecioComida, txtPrecioBebidas, txtPrecioResumen;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarMenuComida();
            
        }
    }

    protected void CargarMenuComida()
    {
		
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
		
    }

    protected void btnFinalizarPedido_Click(object sender, EventArgs e)
    {

    }
}


