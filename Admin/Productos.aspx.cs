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
    public DropDownList ddlCategoriaProdAlta;
    public DropDownList ddlCategoriaMod;
    public GridView GridViewProductos;
    public TextBox txtNombre;
    public TextBox txtDesc;
    public TextBox txtPrecio;
    public DropDownList ddlCategoria;
    
    string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=;SSLMode=preferred";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
			CargarDatosEnGridView();
        }
    }

	private void CargarDatosEnGridView()
    {
        using (MySqlConnection con = new MySqlConnection(connectionString))
        {
            con.Open();
            string query = "SELECT ID, Nombre, Descripcion, Precio, Categoria FROM Productos";
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

    protected void btnAgregarMenu_Click(object sender, EventArgs e)
    {
		try
        {
            string nombre = txtNombreProdAlta.Text;
            string descripcion = txtDescProdAlta.Text;
            decimal precio = Convert.ToDecimal(txtPrecioProdAlta.Text);
            string categoria = ddlCategoriaProdAlta.SelectedValue;

            // Crear la conexión
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                // Crear el comando SQL para la inserción
                string query = "INSERT INTO Productos (Nombre, Descripcion, Precio, Categoria) VALUES (@Nombre, @Descripcion, @Precio, @Categoria)";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    // Parametrizar los valores
                    cmd.Parameters.AddWithValue("@Nombre", nombre);
                    cmd.Parameters.AddWithValue("@Descripcion", descripcion);
                    cmd.Parameters.AddWithValue("@Precio", precio);
                    cmd.Parameters.AddWithValue("@Categoria", categoria);

                    // Ejecutar la consulta
                    cmd.ExecuteNonQuery();
                    
                    // Cargar datos en GridView después de la inserción
					CargarDatosEnGridView();
                }
            }

            // Puedes realizar acciones adicionales después de la inserción si es necesario.

            LimpiarCamposAlta(); // Método para limpiar los campos después de la inserción.
        }
        catch (Exception ex)
        {
            // Manejar errores
            // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
        }
    }

	private void LimpiarCamposAlta()
    {
        // Método para limpiar los campos después de la inserción
        txtNombreProdAlta.Text = string.Empty;
        txtDescProdAlta.Text = string.Empty;
        txtPrecioProdAlta.Text = string.Empty;
        ddlCategoriaProdAlta.SelectedIndex = 0;
    }

    private void LimpiarCampos()
    {
        // Método para limpiar los campos después de la inserción
        txtNombre.Text = string.Empty;
        txtDesc.Text = string.Empty;
        txtPrecio.Text = string.Empty;
        ddlCategoria.SelectedIndex = 0;
    }

    protected void btnActualizarMenu_Click(object sender, EventArgs e)
    {
		try
		{
			string nombre = txtNombre.Text;
			string descripcion = txtDesc.Text;
			decimal precio = Convert.ToDecimal(txtPrecio.Text);
			string categoria = ddlCategoria.SelectedValue;
			// Actualiza el producto en la base de datos
			using (MySqlConnection con = new MySqlConnection(connectionString))
			{
				con.Open();
                //Corregir el query para que el PK asignado (En este caso es el nombre) deje de ser el PK y así hacer los cambios correctamente
				string query = "UPDATE Productos SET Descripcion = @Descripcion, Precio = @Precio, Categoria = @Categoria WHERE Nombre = @Nombre";
				using (MySqlCommand cmd = new MySqlCommand(query, con))
				{
					cmd.Parameters.AddWithValue("@Nombre", nombre);
					cmd.Parameters.AddWithValue("@Descripcion", descripcion);
					cmd.Parameters.AddWithValue("@Precio", precio);
					cmd.Parameters.AddWithValue("@Categoria", categoria);
					cmd.ExecuteNonQuery();
				}
			}

			// Vuelve a cargar los datos en el GridView después de la actualización
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
            string nombre = txtNombre.Text;

            // Elimina el producto de la base de datos
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                string query = "DELETE FROM Productos WHERE Nombre = @Nombre";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Nombre", nombre);
                    cmd.ExecuteNonQuery();
                }
            }

            // Vuelve a cargar los datos en el GridView después de la eliminación
            CargarDatosEnGridView();

            // Cierra el modal de eliminación
            ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseModal", "closeModal('openModalMod');", true);
        }
        catch (Exception ex)
        {
            // Manejar errores
            // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
        }
    }

    protected void btnFindMenu_Click(object sender, EventArgs e)
    {

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

        // Asegurarse de que haya al menos una fila y la fila seleccionada sea válida
        if (GridViewProductos.Rows.Count > 0 && rowIndex >= 0 && rowIndex < GridViewProductos.Rows.Count)
        {
            // Obtener los valores de la fila seleccionada
            txtNombre.Text = GridViewProductos.Rows[rowIndex].Cells[0].Text;
            txtDesc.Text = GridViewProductos.Rows[rowIndex].Cells[1].Text;
            txtPrecio.Text = GridViewProductos.Rows[rowIndex].Cells[2].Text;
            ddlCategoria.SelectedValue = GridViewProductos.Rows[rowIndex].Cells[3].Text;            
        }
    }
}


}
