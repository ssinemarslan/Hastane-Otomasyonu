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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace En_yeni777
{
    public partial class Poliklinikler : Form
    {
        public Poliklinikler()
        {
            InitializeComponent();
        }
        SqlConnection veritabani2 = new SqlConnection("Data Source=DESKTOP-9KURH7U\\SQLEXPRESS;Initial Catalog=Hastane; Integrated security=true;");

        private void Poliklinikler_Load(object sender, EventArgs e)
        {

        }
        public void Listeleme()
        {
            SqlCommand komut2 = new SqlCommand();
            komut2.Connection = veritabani2;
            komut2.CommandType = CommandType.StoredProcedure;
            komut2.CommandText = "PolikliniklerListele";

            SqlDataAdapter dr = new SqlDataAdapter(komut2);
            DataTable dt = new DataTable();
            dr.Fill(dt); 
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Listeleme();
        }
        //poliklinik ekleme-kaydetme
        private void button2_Click(object sender, EventArgs e)
        {
            veritabani2.Open();
            SqlCommand komut2 = new SqlCommand();
            komut2.Connection = veritabani2;
            komut2.CommandType = CommandType.StoredProcedure;
            komut2.CommandText = "PoliklinikEkle";

            komut2.Parameters.AddWithValue("KlinikAdi", textBox1.Text);
            komut2.Parameters.AddWithValue("YatakSayisi", textBox2.Text);
            komut2.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            komut2.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            komut2.Parameters.AddWithValue("PoliklinikBashemsire", textBox5.Text);
            komut2.ExecuteNonQuery();
            veritabani2.Close();
            Listeleme();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }
        private void dataGridWiew1_CellClick(object sender,DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["PoliklinikNo"].Value.ToString();
            textBox1.Text = satir.Cells["KlinikAdi"].Value.ToString();
            textBox2.Text = satir.Cells["YatakSayisi"].Value.ToString();
            textBox3.Text = satir.Cells["PoliklinikUzmanSayisi"].Value.ToString();
            textBox4.Text = satir.Cells["PoliklinikBaskani"].Value.ToString();
            textBox5.Text = satir.Cells["PoliklinikBashemsire"].Value.ToString();
        }
        //poliklinik yenile butonu
        private void button3_Click(object sender, EventArgs e)
        {
            veritabani2.Open();
            SqlCommand komut2 = new SqlCommand();
            komut2.Connection = veritabani2;
            komut2.CommandType = CommandType.StoredProcedure;
            komut2.CommandText = "PoliklniklerYenile";
            komut2.Parameters.AddWithValue("PoliklinikNo", textBox1.Tag);
            komut2.Parameters.AddWithValue("KlinikAdi", textBox1.Text);
            komut2.Parameters.AddWithValue("YatakSayisi", textBox2.Text);
            komut2.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            komut2.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            komut2.Parameters.AddWithValue("PoliklinikBashemsire", textBox5.Text);
            komut2.ExecuteNonQuery();
            veritabani2.Close();
            Listeleme();
            //veritabanı.Open();
            //SqlCommand komut = new SqlCommand();
            //komut.Connection = veritabanı;
            //komut.CommandType = CommandType.StoredProcedure;
            //komut.CommandText = "DoktorlarYenile";
            //komut.Parameters.AddWithValue("DoktorNo", textBox1.Tag);
            //komut.Parameters.AddWithValue("AdSoyad", textBox1.Text);
            //komut.Parameters.AddWithValue("DogumTarihi", textBox2.Text);
            //komut.Parameters.AddWithValue("Adres", textBox3.Text);
            //komut.Parameters.AddWithValue("Brans", textBox4.Text);
            //komut.Parameters.AddWithValue("MezunOlduguOkul", textBox5.Text);
            //komut.Parameters.AddWithValue("PoliklinikNo", comboBox1.Text);
            //komut.ExecuteNonQuery();
            //veritabanı.Close();
            //Listeleme();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            veritabani2.Open();
            SqlCommand komut2 = new SqlCommand();
            komut2.Connection= veritabani2;
            komut2.CommandType= CommandType.StoredProcedure;
            komut2.CommandText = "PoliklinikSil";
            komut2.Parameters.AddWithValue("PoliklinikNo", textBox1.Tag);
            komut2.ExecuteNonQuery();
            veritabani2.Close();
            Listeleme();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Tag = satir.Cells["PoliklinikNo"].Value.ToString();
            textBox1.Text = satir.Cells["KlinikAdi"].Value.ToString();
            textBox2.Text = satir.Cells["YatakSayisi"].Value.ToString();
            textBox3.Text = satir.Cells["PoliklinikUzmanSayisi"].Value.ToString();
            textBox4.Text = satir.Cells["PoliklinikBaskani"].Value.ToString();
            textBox5.Text = satir.Cells["PoliklinikBashemsire"].Value.ToString();
        }
    }
}
