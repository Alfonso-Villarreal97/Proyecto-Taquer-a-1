using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Collections.Generic;
using MySql.Data.MySqlClient;

public class MenusController : Page
{
    private List<string> productosSeleccionados = new List<string>();

    public DropDownList ddlCategoria;
    public DropDownList ddlMesa;
    public ListBox lstMenu;
    public ListBox lstMenu2;
    public TextBox txtTotal;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarCategorias();
            CargarProductos();
        }
    }

    private void CargarCategorias()
    {
        // Puedes cargar las categorías desde la base de datos o definirlas manualmente, según tu necesidad.
        ddlCategoria.Items.Add(new ListItem("Tacos", "Tacos"));
        ddlCategoria.Items.Add(new ListItem("Tortas", "Tortas"));
        ddlCategoria.Items.Add(new ListItem("Gringas", "Gringas"));
        ddlCategoria.Items.Add(new ListItem("Bebidas", "Bebidas"));
    }

    private void CargarProductos()
    {
        string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred"; // Reemplaza con tu cadena de conexión MySQL
        string categoriaSeleccionada = ddlCategoria.SelectedValue;
        string query = string.Format("SELECT Descripcion, Precio FROM Productos WHERE Categoria = '{0}'", categoriaSeleccionada);

        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            MySqlCommand command = new MySqlCommand(query, connection);
            connection.Open();

            using (MySqlDataReader reader = command.ExecuteReader())
            {
                while (reader.Read())
                {
                    string descripcion = reader["Descripcion"].ToString();
                    decimal precio = (decimal)reader["Precio"];

                    // Agregar el producto al ListBox
                    ListItem listItem = new ListItem(string.Format("{0} - {1:C}", descripcion, precio), descripcion);
                    lstMenu.Items.Add(listItem);
                }
            }
        }
    }

    protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Al cambiar la categoría, recargar los productos
        lstMenu.Items.Clear();
        CargarProductos();
    }

    protected void btnAgregarMenu_Click(object sender, EventArgs e)
    {
        // Verificar si se ha seleccionado un producto en lstMenu
        if (lstMenu.SelectedIndex >= 0)
        {
            // Obtener el producto seleccionado y su precio
            string productoSeleccionado = lstMenu.SelectedValue;
            string precioProducto = ObtenerPrecioProducto(productoSeleccionado); // Agrega la lógica para obtener el precio

            // Agregar el producto y su precio a lstMenu2
            lstMenu2.Items.Add(new ListItem(string.Format("{0} - {1:C}", productoSeleccionado, decimal.Parse(precioProducto)), productoSeleccionado));

            // Limpiar la selección en lstMenu
            lstMenu.SelectedIndex = -1;
        }
        ActualizarTotal();
    }

    private string ObtenerPrecioProducto(string descripcion)
    {
        string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";

        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            string query = "SELECT Precio FROM Productos WHERE Descripcion = @Descripcion";
            MySqlCommand command = new MySqlCommand(query, connection);
            command.Parameters.AddWithValue("@Descripcion", descripcion);

            try
            {
                connection.Open();
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    return result.ToString();
                }
            }
            catch (Exception ex)
            {
                // Manejar la excepción según tus necesidades (por ejemplo, loggearla, mostrar un mensaje de error, etc.)
                Console.WriteLine("Error al obtener el precio: " + ex.Message);
            }

            return "0.00"; // Precio predeterminado en caso de error
        }
    }

    protected void ActualizarTotal()
    {
        decimal total = 0;

        // Sumar los precios de los productos en lstMenu2
        foreach (ListItem item in lstMenu2.Items)
        {
            string[] partes = item.Text.Split('-');
            if (partes.Length == 2)
            {
                decimal precioProducto = decimal.Parse(partes[1].Trim(), System.Globalization.NumberStyles.Currency);
                total += precioProducto;
            }
        }

        // Mostrar el total en el TextBox
        txtTotal.Text = total.ToString("C");
    }

    protected void btnFinalizarOrden_Click(object sender, EventArgs e)
    {
        // Verificar si hay algún elemento en lstMenu2
        if (lstMenu2.Items.Count > 0)
        {
            // Obtener la ganancia total y la fecha actual
            decimal gananciaTotal = decimal.Parse(txtTotal.Text, System.Globalization.NumberStyles.Currency);
            DateTime fechaActual = DateTime.Now;
            string mesero = ObtenerNombreDeUsuario();

            // Realizar la inserción en la tabla resumenVentas
            string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";
            string query = "INSERT INTO resumenVentas (NumeroDeOrden, Fecha, Mesero, Ganancia) VALUES (@NumeroDeOrden, @Fecha, @Mesero, @Ganancia)";
			
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@NumeroDeOrden", ObtenerNumeroDeOrden());
                command.Parameters.AddWithValue("@Fecha", fechaActual.ToString("yyyy-MM-dd")); // Formato de fecha compatible con MySQL
                command.Parameters.AddWithValue("@Mesero", mesero);
                command.Parameters.AddWithValue("@Ganancia", gananciaTotal);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    // Manejar la excepción según tus necesidades (por ejemplo, loggearla, mostrar un mensaje de error, etc.)
                    Console.WriteLine("Error al insertar en la tabla resumenVentas: " + ex.Message);
                }
            }

            // Limpiar los elementos en lstMenu2
            lstMenu2.Items.Clear();

            // Actualizar el total después de limpiar la orden
            ActualizarTotal();
        }
    }

    // Método para obtener un número de orden único (puedes adaptarlo según tus necesidades)
    private int ObtenerNumeroDeOrden()
    {
        string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";
        string query = "SELECT MAX(NumeroDeOrden) FROM resumenVentas";

        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            MySqlCommand command = new MySqlCommand(query, connection);

            try
            {
                connection.Open();
                var result = command.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    // Si hay órdenes existentes, incrementa el número de orden en 1
                    return Convert.ToInt32(result) + 1;
                }
            }
            catch (Exception ex)
            {
                // Manejar la excepción según tus necesidades (por ejemplo, loggearla, mostrar un mensaje de error, etc.)
                Console.WriteLine("Error al obtener el número de orden: " + ex.Message);
            }
        }

        return 1; // Si no hay órdenes existentes, retorna 1 como valor predeterminado
    }

	private string ObtenerNombreDeUsuario()
	{
		// Obtener el nombre del mesero desde la sesión
		object nombreMesero = Session["userUsuario"];

		if (nombreMesero != null)
		{
			// Si existe, convertirlo a string y devolverlo
			return nombreMesero.ToString();
		}
		else
		{
			// Si no hay valor en la sesión, puedes retornar un valor predeterminado o manejarlo según tus necesidades
			return "NombreDeUsuarioPredeterminado";
		}
	}


    protected void btnEliminarDeOrden_Click(object sender, EventArgs e)
    {
        // Verificar si hay algún elemento seleccionado en lstMenu2
        if (lstMenu2.SelectedIndex >= 0)
        {
            // Obtener el producto seleccionado
            string productoSeleccionado = lstMenu2.SelectedValue;

            // Remover el producto de la lista visual (lstMenu2)
            lstMenu2.Items.Remove(lstMenu2.SelectedItem);

            // Remover el producto de la lista de productos seleccionados
            productosSeleccionados.Remove(productoSeleccionado);
        }
        ActualizarTotal();
    }
}


