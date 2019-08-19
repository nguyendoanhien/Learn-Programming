using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCode3
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = LengthOfLongestSubstring("dvdf");
        }
        public static int LengthOfLongestSubstring(string s)
        {
            int max = -9999999;
            int re = 0;
            List<char> passed = new List<char>();
            for (int i = 0; i < s.Length; i++)
            {
                passed.Clear();re = 0;
                for (int j = i; j < s.Length; j++)
                {
                    if (passed.Contains(s[j])) break;
                    else { passed.Add(s[j]); re++; }

                    if (re > max) max = re;
                }
            }
            return max;
        }
    }
}
