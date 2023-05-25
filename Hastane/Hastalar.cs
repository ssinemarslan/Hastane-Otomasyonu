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
    public partial class Hastalar : Form
    {
        public Hastalar()
        {
            InitializeComponent();
        }
        SqlConnection veritabani3 = new SqlConnection("Data source=DESKTOP-9KURH7U\\SQLEXPRESS;Initial Catalog=Hastane; Integrated security=true;");

        private void Hastalar_Load(object sender, EventArgs e)
        {
            veritabani3.Open();
            SqlCommand komut = new SqlCommand("select * from Doktorlar", veritabani3);
            SqlDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["DoktorNo"]);

            }
            veritabani3.Close();
        }
        public void Listeleme()
        {
            SqlCommand komut3 = new SqlCommand();
            komut3.Connection = veritabani3;
            komut3.CommandType = CommandType.StoredProcedure;
            komut3.CommandText = "HastalarListele";

            SqlDataAdapter dr = new SqlDataAdapter(komut3);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Listeleme();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            veritabani3.Open();
            SqlCommand komut3 = new SqlCommand();
            komut3.Connection = veritabani3;
            komut3.CommandType = CommandType.StoredProcedure;
            komut3.CommandText = "HastaEkle";

            komut3.Parameters.AddWithValue("AdSoyad", textBox1.Text);
            komut3.Parameters.AddWithValue("HastaTc", textBox2.Text);
            komut3.Parameters.AddWithValue("Boy", textBox3.Text);
            komut3.Parameters.AddWithValue("Yas", textBox4.Text);
            komut3.Parameters.AddWithValue("DoktorNo", comboBox1.Text);
            komut3.ExecuteNonQuery();
            veritabani3.Close();
            Listeleme();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void button3_Click(object sender, EventArgs e)
        {
            veritabani3.Open();
            SqlCommand komut3 = new SqlCommand();
            komut3.Connection = veritabani3;
            komut3.CommandType = CommandType.StoredProcedure;
            komut3.CommandText = "HastaYenile";
            komut3.Parameters.AddWithValue("HastaNo", textBox1.Tag);
            komut3.Parameters.AddWithValue("AdSoyad", textBox1.Text);
            komut3.Parameters.AddWithValue("HastaTc", textBox2.Text);
            komut3.Parameters.AddWithValue("Boy", textBox3.Text);
            komut3.Parameters.AddWithValue("Yas", textBox4.Text);
            komut3.Parameters.AddWithValue("DoktorNo", comboBox1.Text);
            komut3.ExecuteNonQuery();
            veritabani3.Close();
            Listeleme();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            veritabani3.Open();
            SqlCommand komut3= new SqlCommand();
            komut3.Connection = veritabani3;
            komut3.CommandType=CommandType.StoredProcedure;
            komut3.CommandText = "HastaSil";
            komut3.Parameters.AddWithValue("HastaNo",textBox1.Tag);
            komut3.ExecuteNonQuery();
            veritabani3.Close();
            Listeleme();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["HastaNo"].Value.ToString();
            textBox1.Text = satir.Cells["AdSoyad"].Value.ToString();
            textBox2.Text = satir.Cells["HastaTc"].Value.ToString();
            textBox3.Text = satir.Cells["Boy"].Value.ToString();
            textBox4.Text = satir.Cells["Yas"].Value.ToString();
            comboBox1.Text = satir.Cells["DoktorNo"].Value.ToString();
        }
    }
}
