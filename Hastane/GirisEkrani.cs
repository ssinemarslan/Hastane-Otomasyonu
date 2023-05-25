using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace En_yeni777
{
    public partial class GirisEkrani : Form
    {
        public GirisEkrani()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            SecimEkrani giris = new SecimEkrani(); //diğer sayfaya geçmek için yapılır
            this.Hide();
            giris.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox2.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            /*
            Form2 uyeol = new Form2();
            this.Hide();
            uyeol.Show();
            */
            groupBox2.Visible = false;
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked==true)
            {
                groupBox2.Visible = true;
            }
        }
    }
}
