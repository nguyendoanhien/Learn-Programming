using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCode6
{
    class Program
    {
        static void Main(string[] args)
        {
            string s = Convert("PAYPALISHIRING", 3);
        }
        public static string Convert(string s, int numRows)
        {
            try
            {

                string re = "";
                int bigStep = numRows * 2 - 2;
                for (int i = 1; i <= numRows; i++)
                {
                    List<int> index = new List<int>();
                    int nextUp = (numRows - i) * 2;

                    int cur = i;
                    if (nextUp == 0 && bigStep == 0) return s;
                    index.Add(cur);
                    while ((cur + nextUp <= s.Length || cur + bigStep <= s.Length) && bigStep != 0)
                    {
                        if (cur + nextUp <= s.Length && nextUp != 0)
                            index.Add(cur + nextUp);
                        if (cur + bigStep <= s.Length && nextUp != bigStep)
                            index.Add(cur + bigStep);
                        cur += bigStep;

                    }

                    foreach (var c in index)
                    {
                        if (c <= s.Length)
                            re += s[c - 1];
                    }

                }
                return re;

            }
            catch
            {
                return "";
            }
        }
    }
}
