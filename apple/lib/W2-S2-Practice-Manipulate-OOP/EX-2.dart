class BankAccount {
  double _balance;
  final int accountId;
  final String accountOwner;

  BankAccount(this._balance, this.accountId, this.accountOwner);

  double balance() {
    return _balance;
  }

  void withdraw(double amount) {
    if (amount > _balance) {
      throw Exception("Insufficient balance for withdrawal!");
    }
    _balance -= amount;
  }

  void credit(double amount) {
    _balance += amount;
  }

  @override
  String toString() {
    return 'Account ID: $accountId Owner: $accountOwner Balance: \$$_balance';
  }
}

class Bank {
  final List<BankAccount> _accounts = [];

  BankAccount createAccount(int accountId, String accountOwner, double balance) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw Exception('Account with ID $accountId already exists!');
      }
    }

    var newAccount = BankAccount(balance, accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }

  BankAccount getAccount(int accountId) {
    return _accounts.firstWhere((account) => account.accountId == accountId, orElse: () {
      throw Exception('Account with ID $accountId not found.');
    });
  }

  void listAccounts() {
    for (var account in _accounts) {
      print(account);
    }
  }
}

void main() { 
  Bank myBank = Bank();
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan', 0.0);

  print(ronanAccount.balance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance()); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance()); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy', 0.0); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
