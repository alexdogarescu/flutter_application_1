class BankAccount {
    late String? accountNumber;
    String holderName;
    double balance = 0.0;
    String? bankBranch;

    BankAccount({required this.holderName, this.bankBranch});

    void initialiseAccount(String number) {
      if(this.accountNumber == null) {
          this.accountNumber = number;
      }
    }

    String isAccount() =>
      this.accountNumber == null ? "Account initialised" : "Account not yet initialised";

}