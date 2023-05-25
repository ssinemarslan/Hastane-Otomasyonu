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
    public partial class SecimEkrani : Form
    {
        public SecimEkrani()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Poliklinikler giris = new Poliklinikler();
            this.Hide();
            giris.Show();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Doktorlar giris = new Doktorlar();
            this.Hide();
            giris.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Hastalar giris = new Hastalar();
            this.Hide();
            giris.Show();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Raporlar giris = new Raporlar();
            this.Hide();
            giris.Show();
        }
    }
}
