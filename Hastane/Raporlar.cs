using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace En_yeni777
{
    public partial class Raporlar : Form
    {
        public Raporlar()
        {
            InitializeComponent();
        }
        SqlConnection veritabani4 = new SqlConnection("data source=DESKTOP-9KURH7U\\SQLEXPRESS;Initial Catalog=Hastane; Integrated security=true;");
        private void button1_Click(object sender, EventArgs e)
        {
            Listele();
        }
        public void Listele()
        {
            SqlCommand komut4=new SqlCommand();
            komut4.Connection = veritabani4;
            komut4.CommandType= CommandType.StoredProcedure;
            komut4.CommandText = "Doktaradsoyadveklinikad";

            SqlDataAdapter dr = new SqlDataAdapter(komut4);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void Raporlar_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
            

        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlCommand komut4 = new SqlCommand();
            komut4.Connection = veritabani4;
            komut4.CommandType = CommandType.StoredProcedure;
            komut4.CommandText = "Poliklinikyataksayisi";

            SqlDataAdapter dr = new SqlDataAdapter(komut4);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            SqlCommand komut4 = new SqlCommand();
            komut4.Connection = veritabani4;
            komut4.CommandType = CommandType.StoredProcedure;
            komut4.CommandText = "Hastalaryas";

            SqlDataAdapter dr = new SqlDataAdapter(komut4);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            SqlCommand komut4 = new SqlCommand();
            komut4.Connection = veritabani4;
            komut4.CommandType = CommandType.StoredProcedure;
            komut4.CommandText = "Poliklinikuzmansayisinagore";

            SqlDataAdapter dr = new SqlDataAdapter(komut4);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }
    }
}
