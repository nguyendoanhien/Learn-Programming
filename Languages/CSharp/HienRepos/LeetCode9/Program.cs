using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCode9
{
    class Program
    {
        static void Main(string[] args)
        {
            IsPalindrome(121);
        }
        public static bool IsPalindrome(int x)
        {
           
            bool isNegative = (x < 0) ? true : false;
            int oldX = x;
            if (isNegative) return false;
            int rev = 0;
            while (x != 0)
            {
                rev = rev * 10 + x % 10;
                x = x / 10;
            }
            return (rev == oldX) ? true : false;
        }
    }
}
