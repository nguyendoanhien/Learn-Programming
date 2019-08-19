using System;
using System.Drawing;
using System.Windows.Forms;

namespace captchar
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        // khai báo chuỗi dùng tạo captcha
        private string captchaText;        
        private Bitmap drawImage(string txt, int w, int h)
        {
            Bitmap bt = new Bitmap(w, h);
            Graphics g = Graphics.FromImage(bt);
            SolidBrush sb = new SolidBrush(Color.White);
            g.FillRectangle(sb, 0, 0, bt.Width, bt.Height);
            System.Drawing.Font font = new System.Drawing.Font("Tahoma", 30);
            sb = new SolidBrush(Color.Blue);
            g.DrawString(txt, font, sb, bt.Width/2 - (txt.Length/2)*font.Size, (bt.Height/2)-font.Size );
            // Tạo hiệu ứng cho captcha
            // vẽ dấu chấm
            int count = 0;
            Random rand = new Random();
            while(count<1000)
            {
                sb = new SolidBrush(Color.YellowGreen);
                g.FillEllipse(sb, rand.Next(0, bt.Width), rand.Next(0, bt.Height), 4, 2);
                count++;
            }
            count = 0;
            // vẽ đường gạch ngang
            while (count < 25)
            {
                g.DrawLine(new Pen(Color.Pink), rand.Next(0, bt.Width), rand.Next(0, bt.Height), rand.Next(0, bt.Width), rand.Next(0, bt.Height));
                count++;
            }
            // End tạo hiệu ứng
            return bt;
        }
        public String randomString()
        {
            Random rnd = new Random();
            int number = rnd.Next(10000, 99999);           
            string text = md5(number.ToString());
            text = text.ToUpper();
            text = text.Substring(0, 6);
            return text;

        }
        private void Reset()
        {
            captchaText = this.randomString();         
            textBox1.Text = "";
            // vẽ captcha lên panel 1
            panel1.BackgroundImage = drawImage(captchaText, panel1.Width, panel1.Height);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Reset();
        }
        //hàm tạo mã hóa chuỗi md5
        public static byte[] encryptData(String data)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md5Hasher = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] hashedBytes;
            System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
            hashedBytes = md5Hasher.ComputeHash(encoder.GetBytes(data));
            return hashedBytes;
        }
        public static string md5(String data)
        {
            return BitConverter.ToString(encryptData(data)).Replace("-","").ToLower();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Reset();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("http://www.laptrinhvb.net");
        }
        //kiểm tra nhập captchar
        private void button3_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == captchaText)
            {
                MessageBox.Show("Bạn đã nhập chính xác!");
            }
            else
            {
                MessageBox.Show("Bạn đã nhập không chính xác!");
            }
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
