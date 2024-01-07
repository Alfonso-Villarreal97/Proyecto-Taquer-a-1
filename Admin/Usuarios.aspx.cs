using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

public class MenusController : Page
{

    public TextBox txtNombreAlta;
    public TextBox txtUsuarioAlta;
    public TextBox txtPasswordAlta;
    public DropDownList ddlCategoriaAlta;
    public TextBox txtNombre;
    public TextBox txtUsuario;
    public TextBox txtPassword;
    public DropDownList ddlCategoria;
    public GridView GridViewUsuarios;
    
    // Conexión P/Hugo
    // string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";
    //Conexión P/Diego
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
            string query = "SELECT id, Usuarios, Password, Nombre, Rol FROM usuarios";
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                DataTable dt = new DataTable();
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
                GridViewUsuarios.DataSource = dt;
                GridViewUsuarios.DataBind();
            }
        }
    }
    protected void btnAgregarUser_Click(object sender, EventArgs e)
    {
        try
        {
            string nombre = txtNombreAlta.Text;
            string usuario = txtUsuarioAlta.Text;
            string password = txtPasswordAlta.Text;
            string categoria = ddlCategoriaAlta.SelectedValue;

            // Crear la conexión
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                // Crear el comando SQL para la inserción
                string query = "INSERT INTO usuarios (Usuarios, Password, Nombre, Rol) VALUES (@Usuarios, @Password, @Nombre, @Rol)";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    // Parametrizar los valores
                    cmd.Parameters.AddWithValue("@Usuarios", usuario);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Nombre", nombre);
                    cmd.Parameters.AddWithValue("@Rol", categoria);

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

    protected void btnActualizarUser_Click(object sender, EventArgs e)
{
    try
    {
        string nombre = txtNombre.Text;
        string usuario = txtUsuario.Text;
        string password = txtPassword.Text;
        string categoria = ddlCategoria.SelectedValue;

        // Crear la conexión
        using (MySqlConnection con = new MySqlConnection(connectionString))
        {
            con.Open();

            // Crear el comando SQL para la actualización
            string query = "UPDATE Usuarios SET Usuarios = @NuevoUsuario, Password = @Password, Rol = @Rol WHERE Usuarios = @UsuarioExistente";
            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                // Parametrizar los valores
                cmd.Parameters.AddWithValue("@NuevoUsuario", usuario);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Rol", categoria);
                cmd.Parameters.AddWithValue("@UsuarioExistente", usuario);

                // Ejecutar la consulta
                cmd.ExecuteNonQuery();
                
                // Cargar datos en GridView después de la actualización
                CargarDatosEnGridView();
            }
        }
        // Puedes realizar acciones adicionales después de la actualización si es necesario.
        LimpiarCampos();
    }
    catch (Exception ex)
    {
        // Manejar errores
        // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
    }
}


    protected void btnEliminarUser_Click(object sender, EventArgs e)
    {
         try
        {
            string usuario = txtUsuario.Text;

            // Elimina el producto de la base de datos
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();

                string query = "DELETE FROM Usuarios WHERE Usuarios = @Usuarios";
                using (MySqlCommand cmd = new MySqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Usuarios", usuario);
                    cmd.ExecuteNonQuery();
                }
            }

            // Vuelve a cargar los datos en el GridView después de la eliminación
            CargarDatosEnGridView();
        }
        catch (Exception ex)
        {
            // Manejar errores
            // Puedes mostrar un mensaje de error o realizar acciones adicionales según sea necesario.
        }
        LimpiarCampos();
    }

    protected void btnFindUser_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        LimpiarCampos();
    }
     private void LimpiarCampos()
    {
        txtNombre.Text = string.Empty;
        txtUsuario.Text = string.Empty;
        txtPassword.Text = string.Empty;
        ddlCategoria.SelectedIndex = 0;
    }
    private void LimpiarCamposAlta()
    {
        // Método para limpiar los campos después de la inserción
        txtNombreAlta.Text = string.Empty;
        txtUsuarioAlta.Text = string.Empty;
        txtPasswordAlta.Text = string.Empty;
        ddlCategoriaAlta.SelectedIndex = 0;
    }

    protected void GridViewUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
{
    if (e.CommandName == "Select")
    {
        int rowIndex = Convert.ToInt32(e.CommandArgument);

        // Asegurarse de que haya al menos una fila y la fila seleccionada sea válida
        if (GridViewUsuarios.Rows.Count > 0 && rowIndex >= 0 && rowIndex < GridViewUsuarios.Rows.Count)
        {
            // Obtener los valores de la fila seleccionada
            txtUsuario.Text = GridViewUsuarios.Rows[rowIndex].Cells[0].Text;  // Usuario
            txtUsuario.Enabled = false;
            txtNombre.Text = GridViewUsuarios.Rows[rowIndex].Cells[1].Text;  // Nombre 
            txtNombre.Enabled = false;           
            ddlCategoria.SelectedValue = GridViewUsuarios.Rows[rowIndex].Cells[2].Text;  // Rol
        }
    }
}

}
