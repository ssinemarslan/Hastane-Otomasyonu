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
    public partial class Doktorlar : Form
    {
        public Doktorlar()
        {
            InitializeComponent();
        }
        SqlConnection veritabanı = new SqlConnection("data source=DESKTOP-9KURH7U\\SQLEXPRESS; Initial Catalog=Hastane; Integrated security=true;");

        private void Doktorlar_Load(object sender, EventArgs e)
        {
            veritabanı.Open();
            SqlCommand komut = new SqlCommand("select * from Poliklinikler", veritabanı);
            SqlDataReader dr = komut.ExecuteReader();
            while (dr.Read())
            {
                comboBox1.Items.Add(dr["PoliklinikNo"]);

            }
            veritabanı.Close();
        }
        public void Listeleme()
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = veritabanı;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorlarListele";

            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dr.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        //listeleme butonu
        private void button1_Click(object sender, EventArgs e)
        {
            Listeleme();
        }
        //kaydet butonu
        private void button2_Click(object sender, EventArgs e)
        {
            veritabanı.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = veritabanı;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorlarEkle";

            komut.Parameters.AddWithValue("AdSoyad", textBox1.Text);
            komut.Parameters.AddWithValue("DogumTarihi", textBox2.Text);
            komut.Parameters.AddWithValue("Adres", textBox3.Text);
            komut.Parameters.AddWithValue("Brans", textBox4.Text);
            komut.Parameters.AddWithValue("MezunOlduguOkul", textBox5.Text);
            komut.Parameters.AddWithValue("PoliklinikNo", comboBox1.Text);
            komut.ExecuteNonQuery();
            veritabanı.Close();
            Listeleme();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
          
        }
        
        //yenile butonu
        private void button3_Click(object sender, EventArgs e)
        {
            veritabanı.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = veritabanı;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorlarYenile";
            komut.Parameters.AddWithValue("DoktorNo", textBox1.Tag);
            komut.Parameters.AddWithValue("AdSoyad", textBox1.Text);
            komut.Parameters.AddWithValue("DogumTarihi", textBox2.Text);
            komut.Parameters.AddWithValue("Adres", textBox3.Text);
            komut.Parameters.AddWithValue("Brans", textBox4.Text);
            komut.Parameters.AddWithValue("MezunOlduguOkul", textBox5.Text);
            komut.Parameters.AddWithValue("PoliklinikNo", comboBox1.Text);
            komut.ExecuteNonQuery();
            veritabanı.Close();
            Listeleme();

        }

        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["DoktorNo"].Value.ToString();
            textBox1.Text = satir.Cells["AdSoyad"].Value.ToString();
            textBox2.Text = satir.Cells["DogumTarihi"].Value.ToString();
            textBox3.Text = satir.Cells["Adres"].Value.ToString();
            textBox4.Text = satir.Cells["Brans"].Value.ToString();
            textBox5.Text = satir.Cells["MezunOlduguOkul"].Value.ToString();
            comboBox1.Text = satir.Cells["PoliklinikNo"].Value.ToString();
        }
        //sil butonu
        private void button4_Click(object sender, EventArgs e)
        {
            veritabanı.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = veritabanı;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorSil";
            komut.Parameters.AddWithValue("DoktorNo", textBox1.Tag);
            komut.ExecuteNonQuery();
            veritabanı.Close();
            Listeleme();
        }
    }
}
