using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCodeInterview1
{
    public class ListNode
    {
        public int val;
        public ListNode next;
        public ListNode(int x) { val = x; }
    }
    class Program
    {
        static void Main(string[] args)
        {
            ListNode l = new ListNode(-129);
            l.next = new ListNode(-129);

            IsPalindrome(l);
        }

        public static bool IsPalindrome(ListNode head)
        {
            if (head == null) return true;
            string s = head.val + ",";

            while (head.next != null)
            {
                head = head.next;
                s += head.val + ",";
            }
            s = s.Remove(s.Length - 1);

            string[] array = s.Split(',');
            int left = 0;
            int right = array.Length - 1;
            bool re = true;
            while (left <= right)
            {
                if (array[left] == array[right])
                {
                    left++;
                    right--;
                }
                else
                {
                    re = false;
                    break;
                }

            }
            return re;

        }

       

    }
}
