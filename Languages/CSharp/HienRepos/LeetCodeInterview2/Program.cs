using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCodeInterview2
{
    class Program
    {
        static void Main(string[] args)
        {
            string res = FrequencySort("Aabb");
        }
        public static string FrequencySort(string s)
        {
            Dictionary<char, int> list = new Dictionary<char, int>();

            for (int i = 0; i < s.Length; i++)
            {

                var v = list.FirstOrDefault(m => m.Key == s[i]);
                if (v.Equals(default(KeyValuePair<char, int>))) list.Add(s[i], 1);
                else
                    list[v.Key] += 1;
            }

            List<KeyValuePair<char, int>> myList = list.ToList();
            myList.Sort(
                delegate (KeyValuePair<char, int> pair1,
                KeyValuePair<char, int> pair2)
                {
                    return pair2.Value.CompareTo(pair1.Value);
                }
            );
            string res = "";
            foreach (var v in myList)
            {
                for (int i = 0; i < v.Value; i++)
                {
                    res += v.Key;
                }
            }
            return res;
        }
    }
}
