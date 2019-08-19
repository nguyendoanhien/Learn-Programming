using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCode7
{
    class Program
    {
        static void Main(string[] args)
        {
            Reverse(1563847412);
        }
        public static int Reverse(int x)
        {
            try
            {
                bool negative = (x < 0) ? true : false;
                int len = x.ToString().Replace("-", "").Length - 1;
                int re = 0;
                while (len >= 0)
                {
                    
                    re = Convert.ToInt32(re+(x % 10) * Math.Pow(10, len));
                    x /= 10; len--;
                }

                return Convert.ToInt32(re);
            }
            catch
            {
                return 0;
            }
        }
    }
}
