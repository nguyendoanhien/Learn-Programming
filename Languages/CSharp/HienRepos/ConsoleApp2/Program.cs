using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    class Program
    {
        public static int shortestSubstring(string s)
        {

            Dictionary<char, int> listChar = new Dictionary<char, int>();
            for (int i = 0; i < s.Length; i++)
            {
                if (!listChar.ContainsKey(s[i]))
                    listChar.Add(s[i], 0);
            }



            int min = int.MaxValue;

            for (int i = 0; i < s.Length; i++)
            {

                ResetDictionary(listChar);

                int c = 0;

                for (int j = i; j < s.Length; j++)
                {
                    char ch = s[j];
                    if (listChar.ContainsKey(s[j]))
                    {
                        listChar[s[j]] = 1;
                        c++;
                        bool full = listChar.All(m => m.Value == 1);
                        if (full)
                        {
                            if (c < min) min = c;
                            break;
                        };
                    }

                }


            }

            return min;
        }

        public static void ResetDictionary(Dictionary<char, int> listChar)
        {
            foreach (var key in listChar.Keys.ToList())
            {
                listChar[key] = 0;
            }
        }


        static void Main(string[] args)
        {
            int s = shortestSubstring("aabcce");
        }
    }
}
