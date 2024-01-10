using System;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;

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
    public DropDownList ddlCategorias;
    public GridView GridViewUsuarios;

    // Conexión P/Hugo
     string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";
    //Conexión P/Diego
    //string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=;SSLMode=preferred";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarDatosEnGridView();
            CargarCategoriasEnDropDownList();
            BloquearTextFields();
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

    private void CargarCategoriasEnDropDownList()
    {
        // Limpiamos cualquier elemento previo en el DropDownList
        ddlCategorias.Items.Clear();
        // Agregamos un ítem por defecto
        ddlCategorias.Items.Add(new ListItem("- All -", ""));
        // Añadimos las categorías directamente
        ddlCategorias.Items.Add(new ListItem("Administrador", "Administrador"));
        ddlCategorias.Items.Add(new ListItem("Mesero", "Mesero"));
    }
    protected void btnAgregarUser_Click(object sender, EventArgs e)
    {
        try
        {
            string nombre = txtNombreAlta.Text;
            string usuario = txtUsuarioAlta.Text;
            string password = txtPasswordAlta.Text;
            string categoria = ddlCategoriaAlta.SelectedValue;

            if (string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(categoria))
            {
                // User tiene contenido? = No
                ScriptManager.RegisterStartupScript(this, GetType(), "alertaNullFields", "alertaNullFields();", true);
            }
            else
            {
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
            }
            LimpiarCamposAlta();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertaAltaFalse", "alertaAltaFalse();", true);
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

            if (string.IsNullOrEmpty(usuario) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(nombre) || string.IsNullOrEmpty(categoria))
            {
                // User tiene contenido? = No
                ScriptManager.RegisterStartupScript(this, GetType(), "alertaNull", "alertaNull();", true);
                ScriptManager.RegisterStartupScript(this, GetType(), "alertaNullFields", "alertaNullFields();", true);
            } else{
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
            }           
            LimpiarCampos();
        }
        catch (Exception ex)
        {
           ScriptManager.RegisterStartupScript(this, GetType(), "alertaModFalse", "alertaModFalse();", true);
        }
    }
    protected void btnEliminarUser_Click(object sender, EventArgs e)
    {
        string usuario = txtUsuario.Text;
        try
        {
            if(string.IsNullOrEmpty(usuario)){
                ScriptManager.RegisterStartupScript(this, GetType(), "alertaNull", "alertaNull();", true); 
            }else{
                // Elimina el usuario de la base de datos
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
            }
            CargarDatosEnGridView();
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "alertaDelFalse", "alertaDelFalse();", true);
        }
        LimpiarCampos();
    }


    protected void btnFindUser_click(object sender, EventArgs e)
    {
        try
        {
            string categoriaBuscar = ddlCategorias.SelectedValue;

            if (!string.IsNullOrEmpty(categoriaBuscar) && categoriaBuscar != "- Seleccionar -")
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    con.Open();

                    string query = "SELECT id, Usuarios, Password, Nombre, Rol FROM usuarios WHERE Rol = @Rol";
                    using (MySqlCommand cmd = new MySqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Rol", categoriaBuscar);

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
            else
            {
                CargarDatosEnGridView();
            }
        }
        catch (Exception ex)
        {
           //Manejo de excepcion
        }
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
        txtNombreAlta.Text = string.Empty;
        txtUsuarioAlta.Text = string.Empty;
        txtPasswordAlta.Text = string.Empty;
        ddlCategoriaAlta.SelectedIndex = 0;
    }
    private void BloquearTextFields()
    {
        txtNombre.Enabled = false;
        txtUsuario.Enabled = false;
        txtPassword.Enabled = false;
        ddlCategoria.Enabled = false;
    }
    private void DesbloquearTextFields()
    {
        txtNombre.Enabled = true;
        txtUsuario.Enabled = true;
        txtPassword.Enabled = true;
        ddlCategoria.Enabled = true;
    }
    protected void GridViewUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            DesbloquearTextFields();
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            // Aseguramos de que haya al menos una fila y la fila seleccionada sea válida
            if (GridViewUsuarios.Rows.Count > 0 && rowIndex >= 0 && rowIndex < GridViewUsuarios.Rows.Count)
            {
                // Obtenemos los valores de la fila seleccionada
                txtUsuario.Text = GridViewUsuarios.Rows[rowIndex].Cells[0].Text;  // Usuario
                txtUsuario.Enabled = false;
                txtNombre.Text = GridViewUsuarios.Rows[rowIndex].Cells[1].Text;  // Nombre 
                txtNombre.Enabled = false;
                ddlCategoria.SelectedValue = GridViewUsuarios.Rows[rowIndex].Cells[2].Text;  // Rol
            }
        }
    }    
    public string GetMd5Hash(string input)
    {
        using (MD5 md5Hash = MD5.Create())
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            StringBuilder builder = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                builder.Append(data[i].ToString("x2"));
            }

            return builder.ToString();
        }
    }
}
