using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace LeetCode8
{
    class Program
    {
        static void Main(string[] args)
        {
            int s = MyAtoi("");
        }
        public static int MyAtoi(string str)
        {


            try
            {
                str = str.Trim();
                string num = "";
                bool isAllowSpace = false;
                if ((str[0] == '-' || str[0] == '+')) isAllowSpace = true;
                for (int i = 0; i < str.Length; i++)
                {
                    if (!Char.IsDigit(str[i]) && str[i] != ' ') isAllowSpace = false;
                    if (Char.IsDigit(str[i]) || (isAllowSpace == true && str[i] == ' ') || ((str[i] == '-' || str[i] == '+') && i == 0)) num += str[i];
                    else break;
                }
                str = num;
                str = str.Trim();
                var d = double.Parse(str);

                if (d > int.MaxValue) return int.MaxValue;
                if (d < int.MinValue) return int.MinValue;
                return Convert.ToInt32(d);
            }
            catch
            {

                return 0;
            }
        }
    }
}
