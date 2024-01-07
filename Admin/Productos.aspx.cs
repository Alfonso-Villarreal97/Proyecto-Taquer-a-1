using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

public class MenusController : Page
{
    public TextBox txtNombreProdAlta;
    public TextBox txtNombreProdMod;
    public TextBox txtDescProdAlta;
    public TextBox txtDescProdMod;
    public TextBox txtPrecioProdAlta;
    public TextBox txtPrecioMod;
    public TextBox txtSearchProd;
    public DropDownList ddlCategoriaProdAlta;
    public DropDownList ddlCategoriaMod;
    public GridView GridViewProductos;
    public TextBox txtNombre;
    public TextBox txtDesc;
    public TextBox txtPrecio;
    public DropDownList ddlCategoria;
    public DropDownList ddlCategorias;

    private string selectedCategoria;

    // Conexión P/Hugo
    // string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";
    //Conexión P/Diego
    string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=;SSLMode=preferred";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarDatosEnGridView();
            CargarCategoriasEnDropDownList();
        }
    }

    private void CargarDatosEnGridView()
    {
        using (MySqlConnection con = new MySqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT ID, Categoria, Descripcion, Precio FROM Productos";
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                DataTable dt = new DataTable();
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
                GridViewProductos.DataSource = dt;
                GridViewProductos.DataBind();
            }
        }
    }

    private void CargarCategoriasEnDropDownList()
	{
		// Limpiar cualquier elemento previo en el DropDownList
		ddlCategorias.Items.Clear();
		
		// Agregar un ítem por defecto
		ddlCategorias.Items.Add(new ListItem("- TODOS -", ""));

		// Añadir las categorías directamente
		ddlCategorias.Items.Add(new ListItem("Tacos", "Tacos"));
		ddlCategorias.Items.Add(new ListItem("Tortas", "Tortas"));
		ddlCategorias.Items.Add(new ListItem("Gringas", "Gringas"));
		ddlCategorias.Items.Add(new ListItem("Bebidas", "Bebidas"));
	}


    protected void btnAgregarMenu_Click(object sender, EventArgs e)
    {
        try
        {
            string descripcion = txtDescProdAlta.Text;
            decimal precio = Convert.ToDecimal(txtPrecioProdAlta.Text);
            string categoria = ddlCategoriaProdAlta.SelectedValue;

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                string query = "INSERT INTO Productos (Descripcion, Precio, Categoria) VALUES (@Descripcion, @Precio, @Categoria)";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                    cmd.Parameters.AddWithValue("@Precio", precio);
                    cmd.Parameters.AddWithValue("@Categoria", categoria);

                    cmd.ExecuteNonQuery();

                    CargarDatosEnGridView();
                }
            }

            LimpiarCamposAlta();
        }
        catch (Exception ex)
        {
            // Manejar errores
            // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
        }
    }

    private void LimpiarCamposAlta()
    {
        txtDescProdAlta.Text = string.Empty;
        txtPrecioProdAlta.Text = string.Empty;
        ddlCategoriaProdAlta.SelectedIndex = 0;
    }

    private void LimpiarCampos()
    {
        txtDesc.Text = string.Empty;
        txtPrecio.Text = string.Empty;
        ddlCategoria.SelectedIndex = 0;
    }

    protected void btnActualizarMenu_Click(object sender, EventArgs e)
    {
        try
        {
            string categoria = ddlCategoria.SelectedValue;
            string descripcion = txtDesc.Text;
            decimal precio = Convert.ToDecimal(txtPrecio.Text);

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                string query = "UPDATE Productos SET Categoria = @Categoria, Descripcion = @Descripcion, Precio = @Precio  WHERE Categoria = @Categoria";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Categoria", categoria);
                    cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                    cmd.Parameters.AddWithValue("@Precio", precio);
                    cmd.ExecuteNonQuery();
                }
            }

            CargarDatosEnGridView();
            LimpiarCampos();
        }
        catch (Exception ex)
        {
            // Manejar errores
            // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
        }
    }

    protected void btnEliminarMenu_Click(object sender, EventArgs e)
    {
        try
        {
            string descripcion = txtDesc.Text;

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                string query = "DELETE FROM Productos WHERE Descripcion = @Descripcion";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                    cmd.ExecuteNonQuery();
                }
            }

            CargarDatosEnGridView();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseModal", "closeModal('openModalMod');", true);
        
			// Limpia los campos después de eliminar
			LimpiarCampos();
        
        }
        catch (Exception ex)
        {
            // Manejar errores
            // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
        }
    }

    protected void btnFindMenu_Click(object sender, EventArgs e)
    {
        try
        {
            string categoriaBuscar = ddlCategorias.SelectedValue;

            if (!string.IsNullOrEmpty(categoriaBuscar) && categoriaBuscar != "- Seleccionar -")
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();

                    string query = "SELECT ID, Categoria, Descripcion, Precio FROM Productos WHERE Categoria = @Categoria";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Categoria", categoriaBuscar);

                        DataTable dt = new DataTable();
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }

                        GridViewProductos.DataSource = dt;
                        GridViewProductos.DataBind();
                    }
                }
            }
            else
            {
                CargarDatosEnGridView();
            }
        }
        catch (Exception ex)
        {
            // Manejar errores
            // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
        }
    }

    protected void btnLimpiarMenu_Click(object sender, EventArgs e)
    {
        LimpiarCampos();
    }

    protected void GridViewProductos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            if (GridViewProductos.Rows.Count > 0 && rowIndex >= 0 && rowIndex < GridViewProductos.Rows.Count)
            {
                ddlCategoria.SelectedValue = GridViewProductos.Rows[rowIndex].Cells[0].Text;
                ddlCategoria.Enabled = false;
                txtDesc.Text = GridViewProductos.Rows[rowIndex].Cells[1].Text;
                txtPrecio.Text = GridViewProductos.Rows[rowIndex].Cells[2].Text;

                selectedCategoria = GridViewProductos.Rows[rowIndex].Cells[0].Text;
            }
        }
    }
}
