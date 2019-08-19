using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCode22
{
    class Program
    {
        static void Main(string[] args)
        {
            GenerateParenthesis(4);
        }
        public static IList<string> GenerateParenthesis(int n)
        {
            List<string> list = new List<string>();
            string first = "";
            string findPattern = ")(";

            for (int i = 0; i < n; i++)
            {
                first += "()";
            }

            do
            {
                list.Add(first);
                List<string> listPosition = new List<string>();

                int begin = 0;
                while (first.IndexOf(findPattern, begin) > -1)
                {
                    int left = first.IndexOf(findPattern, begin);
                    int right = left + 1;
                    begin = right + 1;
                    listPosition.Add(left + "," + right);
                }

                List<string> willAdd = new List<string>();
                GenerateString(first, listPosition, null, willAdd);
                list.AddRange(willAdd);
                list = list.Distinct().ToList();
                first = first.Replace(")(", "()");
            }
            while (first.IndexOf(findPattern, 0) > -1);


            return list;
        }

        //()()()()
        //(())()()
        //(()())()
        //(()()())



        //---
        //((()))()
        //(()())  ()
        public static void GenerateString(string s, List<string> posLeft, string pos, List<string> willAdd)
        {
            if (pos != null)
            {
                int begin = int.Parse(pos.Split(',')[0] + "");
                int end = int.Parse(pos.Split(',')[1] + "");
                s = s.Remove(begin, 2);
                s = s.Insert(begin, "()");
                willAdd.Add(s);
            }
            posLeft.Remove(pos);
            if (posLeft == null || posLeft.Count == 0)
                return;
            else
            {



                for (int i = 0; i < posLeft.Count; i++)
                {
                    List<string> shadow = posLeft.ConvertAll(str => str);
                    GenerateString(s, shadow, shadow[i], willAdd);
                }
                if (pos != null)
                {
                    List<string> listPosition = new List<string>();

                    int begin = 0;
                    while (s.IndexOf(")(", begin) > -1)
                    {
                        int left = s.IndexOf(")(", begin);
                        int right = left + 1;
                        begin = right + 1;
                        if (posLeft.Contains(left + "," + right)) continue;
                        listPosition.Add(left + "," + right);
                    }
                    for (int i = 0; i < listPosition.Count; i++)
                    {

                        s = s.Remove(int.Parse(listPosition[i].Split(',')[0]), 2);
                        s = s.Insert(int.Parse(listPosition[i].Split(',')[0]), "()");
                    }
                    List<string> willAddSub = new List<string>();

                    GenerateString(s, listPosition, null, willAddSub);
                    willAdd.Add(s);
                }
            }
        }

    }
}
