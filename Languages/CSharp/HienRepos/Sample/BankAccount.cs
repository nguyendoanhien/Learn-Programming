using System;
using System.Collections.Generic;
using System.Text;

namespace Sample
{
    public class BankAccount
    {
        string _customername;
        double _balance;

        public BankAccount(string customername, double balance)
        {
            _customername = customername;
            _balance = balance;
        }

        public double Balance { get { return _balance; } }
        public void Debit(double amount)
        {
            if (_balance == 0)
                throw new Exception("balance = 0");
            if (amount <= 0 || amount > _balance)
                throw new ArgumentOutOfRangeException("amount<=0 || amount>_balance");
            _balance -= amount;
        }
        public void Credit(double amount)
        {
            if (amount <= 0)
                throw new ArgumentOutOfRangeException("amount <= 0");
            _balance += amount;
        }
    }
}
