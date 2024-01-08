using System;
using System.Web.UI;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.WebControls;  // Agregamos la directiva para TextBox

public class VentasController : Page
{
    public GridView GridViewVentas;
    public TextBox txtFechaDel;
    public TextBox txtFechaAl;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CargarDatosVentas();
        }
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        BuscarVentasPorFechas();
    }

    private void CargarDatosVentas()
    {
        string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";
        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            string query = "SELECT NumeroDeOrden, Fecha, Mesero, Ganancia FROM resumenVentas";

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                connection.Open();
                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridViewVentas.DataSource = dt;
                GridViewVentas.DataBind();
            }
        }
    }

    private void BuscarVentasPorFechas()
{
    string connectionString = "Server=localhost;Database=bdtaque;Uid=root;Pwd=toor;SSLMode=preferred";
    using (MySqlConnection connection = new MySqlConnection(connectionString))
    {
        string formatoFecha = "yyyy-MM-dd"; // Formato de fecha esperado

        DateTime fechaDel, fechaAl;
        if (DateTime.TryParseExact(txtFechaDel.Text, formatoFecha, null, System.Globalization.DateTimeStyles.None, out fechaDel) &&
            DateTime.TryParseExact(txtFechaAl.Text, formatoFecha, null, System.Globalization.DateTimeStyles.None, out fechaAl))
        {
            string query = "SELECT NumeroDeOrden, Fecha, Mesero, Ganancia FROM resumenVentas " +
                           "WHERE Fecha BETWEEN @FechaDel AND @FechaAl";

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@FechaDel", fechaDel);
                command.Parameters.AddWithValue("@FechaAl", fechaAl);

                connection.Open();
                MySqlDataAdapter adapter = new MySqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridViewVentas.DataSource = dt;
                GridViewVentas.DataBind();
            }
        }
        else
        {
            // Manejar el caso en que las fechas no son válidas
            // Puedes mostrar un mensaje de error o realizar alguna acción adicional
            // También puedes utilizar un control de validación para garantizar fechas válidas en la interfaz de usuario
        }
    }
}


}



