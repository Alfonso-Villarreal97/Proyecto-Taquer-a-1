using System;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using MySql.Data.MySqlClient;
using System.Security.Cryptography;

public class Login : Page
{
    public TextBox txtUsuario, txtPassword;
    public Label lblError;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Verifica si el usuario está autenticado
        if (Session["Mesero"] != null)
        {
            Response.Redirect("Mesero/Inicio.aspx");
        }

        // Verifica si el usuario es un administrador
        if (Session["Administrador"] != null && (bool)Session["Administrador"])
        {
            Response.Redirect("Admin/Inicio.aspx");
        }
    }

    protected void btnIngresar_Click(object sender, EventArgs e)
    {
        // Obtiene el usuario y la contraseña
        string usuario = txtUsuario.Text;
        string password = txtPassword.Text;

        // Hashea la contraseña con MD5
        string hashedPassword = GetMd5Hash(password);

        // Verifica si el usuario existe en la base de datos
        if (UserExists(usuario, password))
        {
            // Redirige a la página de inicio
            Response.Redirect("Mesero/Inicio.aspx");
        }
        else
        {
            // Muestra un mensaje de error
            lblError.Text = "Usuario o contrasenia incorrectos";
        }
    }

    private bool UserExists(string usuario, string password)
    {
        // Cadena de conexión P/Hugo
        // string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";

        // Cadena de conexión P/Diego 
        string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";

        // Conecta a la base de datos
        MySqlConnection conn = new MySqlConnection(connectionString);
        conn.Open();

        // Consulta para verificar si el usuario existe
        string query = "SELECT * FROM Usuarios WHERE Usuarios = '" + usuario + "' AND Password = '" + password + "'";

        // Ejecuta la consulta
        MySqlCommand cmd = new MySqlCommand(query, conn);
        MySqlDataReader reader = cmd.ExecuteReader();

        // Si el usuario existe, devuelve true
        if (reader.Read())
        {
            // Si el ID es igual a 1, el usuario es el administrador
            if (reader.GetInt32(0) == 1)
            {
                Session["Administrador"] = true;

                // Guarda el ID del usuario en la sesión
                Session["Id"] = reader.GetInt32(0);
                // Guarda la información del usuario en la sesión
                Session["userUsuario"] = reader.GetString(1);

                Response.Redirect("Admin/Inicio.aspx");
            }
            else
            {
                Session["Mesero"] = true;

                // Guarda el ID del usuario en la sesión
                Session["Id"] = reader.GetInt32(0);
                // Guarda la información del usuario en la sesión
                Session["userUsuario"] = reader.GetString(1);
            }

            // Cierra la conexión
            conn.Close();
            return true;
        }
        return false;
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
