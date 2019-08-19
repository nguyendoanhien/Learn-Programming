using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCode13
{
    class Program
    {
        static void Main(string[] args)
        {
            int re = RomanToInt("MCMXCIV");
        }
        public static int RomanToInt(string s)
        {
            string[] symbol = new string[] { "I", "V", "X", "L", "C", "D", "M", "IV", "IX", "XL", "XC", "CD", "CM" };
            int[] val = new int[] { 1, 5, 10, 50, 100, 500, 1000, 4, 9, 40, 90, 400, 900 };

            int re = 0;
            for (int i = 0; i < s.Length; i++)
            {
                if (s[i] == 'I' || s[i] == 'X' || s[i] == 'C')
                {
                    if (i + 1 < s.Length && Array.IndexOf(symbol, s[i].ToString() + s[i + 1].ToString()) > -1)
                    {
                        re += val[Array.IndexOf(symbol, s[i].ToString() + s[i + 1].ToString())];
                        ++i;
                    }
                    else
                    {
                        re += val[Array.IndexOf(symbol, s[i] + "")];
                    }
                }
                else
                {
                    re += val[Array.IndexOf(symbol, s[i] + "")];
                }


            }
            return re;
        }

    }
}
