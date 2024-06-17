using System;
using MySql.Data.MySqlClient;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace _0513formulario
{
    public partial class Form1 : Form
    {
        int cR, cG, cB;
        private ConexionMySQL conexionMySQL;
        private DataTable dataTable;

        public Form1()
        {
            InitializeComponent();
            conexionMySQL = new ConexionMySQL();
            dataTable = new DataTable();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.Filter = "archivos jpg |*.jpg";
            openFileDialog1.ShowDialog();
            // Carga la imagen seleccionada en el PictureBox
            Bitmap bmp = new Bitmap(openFileDialog1.FileName);
            pictureBox1.Image = bmp;
            // Obtiene la ruta completa del archivo de la imagen
            string rutaImagen = openFileDialog1.FileName;
            // Obtiene solo el nombre del archivo
            string nombreImagen = Path.GetFileName(rutaImagen);
            Console.WriteLine(nombreImagen);
            label6.Text = nombreImagen;
        }

        private void pictureBox1_MouseClick(object sender, MouseEventArgs e)
        {
            /*Ejemplo1
             * Bitmap bmp = new Bitmap(pictureBox1.Image);
            Color c = new Color();
            c = bmp.GetPixel(e.X, e.Y);
            textBox1.Text = c.R.ToString();
            textBox2.Text = c.G.ToString();
            textBox3.Text = c.B.ToString();*/

            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Color c = new Color();
            int sR=0, sG=0, sB=0;
            for (int i = e.X; i < e.X + 10; i++)
            {
                for (int j = e.X; j < e.X + 10; j++)
                {
                    c = bmp.GetPixel(i, j);
                    sR = sR + c.R;
                    sG = sG + c.G;
                    sB = sB + c.B;
                }
                sR = sR / 100;
                sG = sG / 100;
                sB = sB / 100;
                cR = sR;
                cG = sG;
                cB = sB;
                textBox1.Text = sR.ToString();
                textBox2.Text = sG.ToString();
                textBox3.Text = sB.ToString();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Bitmap bmp2 = new Bitmap(pictureBox1.Image);
            Color c = new Color();

            for (int i=0; i<bmp.Width; i++)
            {
                for (int j=0; j<bmp.Height; j++)
                {
                    c = bmp.GetPixel(i, j);
                    if (((80<=c.R)&&(c.R<=160)) && ((84 <= c.G) && (c.G <= 154)) && ((74 <= c.B) && (c.B <= 150)))
                    {
                        bmp2.SetPixel(i, j, Color.Black);
                    }
                    else
                    {
                        bmp2.SetPixel(i, j, Color.FromArgb(c.R, c.G, c.B));
                    }
                }
            }
            pictureBox1.Image = bmp2;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(pictureBox1.Image);
            Bitmap bmp2 = new Bitmap(bmp.Width, bmp.Height);
            Color c = new Color();
            int sR, sG, sB;
            for (int i = 0; i < bmp.Width - 10; i = i + 10)
                for (int j = 0; j < bmp.Height - 10; j = j + 10)
                {
                    sR = 0; sG = 0; sB = 0;
                    for (int ip = i; ip < i + 10; ip++)
                        for (int jp = j; jp < j + 10; jp++)
                        {
                            c = bmp.GetPixel(ip, jp);
                            sR = sR + c.R;
                            sG = sG + c.G;
                            sB = sB + c.B;
                        }
                    sR = sR / 100;
                    sG = sG / 100;
                    sB = sB / 100;

                    if (((cR - 20 <= sR) && (sR <= cR + 20)) && ((cG - 20 <= sG) && (sG <= cG + 20)) && ((cB - 20 <= sB) && (sB <= cB + 20)))
                    {
                        for (int ip = i; ip < i + 10; ip++)
                            for (int jp = j; jp < j + 10; jp++)
                            {
                                bmp2.SetPixel(ip, jp, Color.Black);
                            }
                    }
                    else
                    {
                        for (int ip = i; ip < i + 10; ip++)
                            for (int jp = j; jp < j + 10; jp++)
                            {
                                c = bmp.GetPixel(ip, jp);
                                bmp2.SetPixel(ip, jp, Color.FromArgb(c.R, c.G, c.B));
                            }
                    }

                }
            pictureBox1.Image = bmp2;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            CargarDatos();
            /*MySqlConnection conexion = conexionMySQL.AbrirConexion();
            CargarDatos();*/
            //MySqlConnection conexion = conexionMySQL.AbrirConexion();
            // Ahora puedes ejecutar consultas usando esta conexión
            // Por ejemplo:
            // MySqlCommand comando = new MySqlCommand("SELECT * FROM Colores", conexion);
            // ...
            conexionMySQL.CerrarConexion();
        }

        private void CargarDatos()
        {
            MySqlConnection conexion = conexionMySQL.AbrirConexion();
            if (conexion != null)
            {
                // Consulta SQL para seleccionar todos los datos de la tabla Colores
                string consulta = "SELECT R, G, B, nombre_color FROM Colores";
                // Adaptador de datos para ejecutar la consulta y llenar el DataTable
                MySqlDataAdapter adaptador = new MySqlDataAdapter(consulta, conexion);
                // Llena el DataTable con los datos de la base de datos
                adaptador.Fill(dataTable);
                // Enlaza el DataTable al DataGridView para mostrar los datos
                dataGridView1.DataSource = dataTable;
                // Cierra la conexión
                conexionMySQL.CerrarConexion();
            }
        }

        private void ObtenerRGB(string nombreColor)
        {
            MySqlConnection conexion = conexionMySQL.AbrirConexion();
            if (conexion != null)
            {
                // Consulta SQL para seleccionar los valores de R, G, B para un color específico
                String nombre_Color = "Verde";
                string consulta = $"SELECT R, G, B FROM Colores WHERE nombre_color = '{nombre_Color}'";
                MySqlCommand comando = new MySqlCommand(consulta, conexion);

                try
                {
                    // Ejecutar la consulta y obtener un lector de datos
                    using (MySqlDataReader reader = comando.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Obtener los valores de R, G, B y guardarlos en variables
                            int r = Convert.ToInt32(reader["R"]);
                            int g = Convert.ToInt32(reader["G"]);
                            int b = Convert.ToInt32(reader["B"]);

                            // Aquí puedes usar los valores r, g, b como desees
                            // Por ejemplo, puedes mostrarlos en etiquetas de tu formulario
                            /*lblR.Text = $"Valor de R: {r}";
                            lblG.Text = $"Valor de G: {g}";
                            lblB.Text = $"Valor de B: {b}";*/
                        }
                        else
                        {
                            MessageBox.Show("El color especificado no se encontró en la base de datos.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al obtener los valores RGB: " + ex.Message);
                }
                finally
                {
                    conexionMySQL.CerrarConexion();
                }
            }
        }

        /*private void Form1_Load(object sender, EventArgs e)
        {
            //MySqlConnection conexion = conexionMySQL.AbrirConexion();
            CargarDatos();
        }*/

        private void button5_Click(object sender, EventArgs e)
        {
            MySqlConnection conexion = conexionMySQL.AbrirConexion();
            if (conexion != null)
            {
                // Consulta SQL para seleccionar los valores de R, G, B para un color específico
                string consulta = $"SELECT nombre_color FROM Colores WHERE R = '{cR}' and G = '{cG}' and B = '{cB}'";
                MySqlCommand comando = new MySqlCommand(consulta, conexion);
                

                try
                {
                    // Ejecutar la consulta y obtener un lector de datos
                    using (MySqlDataReader reader = comando.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            String nombreColor = reader["nombre_color"].ToString();
                            
                            label4.Text = $"ENCONTRADO!!!\nEs de color: {nombreColor}";
                            label5.Text = "se añadió";
                        }
                        else
                        {
                            label4.Text = $"Color no encontrado :(\nPuedes añador este color";
                            label5.Text = "Indique El nombre del color";
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al obtener los valores RGB: " + ex.Message);
                }
                finally
                {
                    conexionMySQL.CerrarConexion();
                }
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            String nombre_color = textBox4.Text.ToString();
            //Console.WriteLine(mss);

            MySqlConnection conexion = conexionMySQL.AbrirConexion();
            if (conexion != null)
            {
                // Consulta SQL para seleccionar los valores de R, G, B para un color específico
                string consulta = $"INSERT INTO Colores(R, G, B, nombre_color) VALUES({cR}, {cG}, {cB}, '{nombre_color}')";
                MySqlCommand comando = new MySqlCommand(consulta, conexion);

                try
                {
                    // Ejecutar la consulta
                    int filasAfectadas = comando.ExecuteNonQuery();
                    if (filasAfectadas > 0)
                    {
                        MessageBox.Show("Color insertado correctamente.");
                        label5.Text = "Color insertado correctamente.";
                    }
                    else
                    {
                        MessageBox.Show("No se pudo insertar el color.");
                        label5.Text = "No se pudo insertar el color.";
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al obtener los valores RGB: " + ex.Message);
                }
                finally
                {
                    conexionMySQL.CerrarConexion();
                }
            }
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            
        }
    }
}
