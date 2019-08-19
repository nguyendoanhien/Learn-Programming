using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LeetCodeInterview3
{
    public class Node
    {
        public int val;
        public Node prev;
        public Node next;
        public Node child;

        public Node() { }
        public Node(int _val, Node _prev, Node _next, Node _child)
        {
            val = _val;
            prev = _prev;
            next = _next;
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Node n1 = new Node(1, null, null, null);
            Node n2 = new Node(2, null, null, null);
            Node n3 = new Node(3, null, null, null);
            Node n4 = new Node(4, null, null, null);
            Node n5 = new Node(5, null, null, null);
            Node n6 = new Node(6, null, null, null);
            Node n7 = new Node(7, null, null, null);
            Node n8 = new Node(8, null, null, null);
            Node n9 = new Node(9, null, null, null);
            Node n10 = new Node(10, null, null, null);
            Node n11 = new Node(11, null, null, null);
            Node n12 = new Node(12, null, null, null);

            n1.next = n2;
            n2.next = n3;
            n3.next = n4;
            n4.next = n5;
            n5.next = n6;
            n7.next = n8;
            n8.next = n9;
            n9.next = n10;
            n11.next = n12;
            n2.prev = n1;
            n3.prev = n2;
            n4.prev = n3;
            n5.prev = n4;
            n6.prev = n5;
            n8.prev = n7;
            n9.prev = n8;
            n10.prev = n9;
            n12.prev = n11;
            n3.child = n7;
            n8.child = n11;

            Node res = Flatten(null);   
        }
        public static Node Flatten(Node head)
        {
            try
            {
                List<int> listInt = new List<int>();
                listInt = Play(head);
                Node parent = new Node();
                parent.val = listInt[0];
                Node saveParent = parent;
                for (int i = 1; i < listInt.Count; i++)
                {
                    Node newNode = new Node(listInt[i], parent, null, null);
                    parent.next = newNode;
                    parent = newNode;
                }
                return saveParent;
            }
            catch
            {
                return null;
            }
        }

        public static List<int> Play(Node node)
        {
            List<int> re = new List<int>();
            re.Add(node.val);
            if (Dig(node) != null)
                re.AddRange(Dig(node));
            if (Next(node) != null)
                re.AddRange(Next(node));
            return re;
        }

        public static List<int> Dig(Node node)
        {

            if (node.child != null)
                return Play(node.child);
            return null;

        }
        public static List<int> Next(Node node)
        {

            if (node.next != null)
                return Play(node.next);
            return null;


        }
    }

}
