using System;
using System.Text;
using System.Numerics;

namespace ConsoleApp1
{
    class Program
    {
        public class ListNode
        {
            public int val;
            public ListNode next;
            public ListNode(int x) { val = x; }
        }
        static void Main(string[] args)
        {
            ListNode l1 = new ListNode(1);


            ListNode l2 = new ListNode(9);

            l2.next = new ListNode(9);
            ListNode ln = AddTwoNumbers(l1, l2);


            //Rotate(new int[] { 1, 2, 3, 4, 5, 6, 7 }, 3);
            //Console.ReadLine();
        }
        public static ListNode AddTwoNumbers(ListNode l1, ListNode l2)
        {
            string s = Reverse((GetNum(l1) + GetNum(l2)) + "");
            ListNode lastNode = new ListNode(0);
            ListNode re = BuildNode(new ListNode(int.Parse(s[s.Length - 1].ToString())), s, s.Length - 1);
            return re;
        }

        public static ListNode BuildNode(ListNode l, string s, int i)
        {

            if (i == 0) return l;
            ListNode lNext = new ListNode(int.Parse(s[i - 1].ToString()));
            lNext.next = l;
            return BuildNode(lNext, s, --i);




        }

        public static BigInteger GetNum(ListNode l)
        {
            string s = "";
            ListNode cur = l;
            s += cur.val;
            while (cur.next != null)
            {
                cur = cur.next;
                s += cur.val;
            }


            return BigInteger.Parse(Reverse(s));
        }
        public static string Reverse(string s)
        {
            char[] charArray = s.ToCharArray();
            Array.Reverse(charArray);
            return new string(charArray);
        }



        public static void Rotate(int[] nums, int k)
        {
            int[] array = new int[nums.Length];
            for (int i = 0; i < nums.Length; i++)
            {
                array[i] = nums[i];
            }
            for (int i = 0; i < nums.Length; i++)
            {
                array[ValuePosition(nums, i, k)] = nums[i];
            }
            nums = array;

            Console.Write(nums);
        }
        public static int ValuePosition(int[] nums, int c, int k)
        {
            int pos = (c + 1) + k;
            while (pos > nums.Length)
            {
                k = pos - nums.Length;
                pos = k;
            }

            return pos - 1;
        }
    }
}
