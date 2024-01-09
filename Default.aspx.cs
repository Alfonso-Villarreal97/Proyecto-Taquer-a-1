using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using System.Configuration;


public class NuevoController : Page {
	
	protected void Page_Load(object sender, EventArgs e)
	{
		
	}
	
	protected void btnGo_Click(object sender, EventArgs e)
	{		
		Response.Redirect("Login.aspx");
	}


	
}
