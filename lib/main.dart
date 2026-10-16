import 'package:flutter/material.dart';
import 'models/user.dart';
import 'models/bankaccount.dart';

void main() {
  runApp(const MyApp());
}

User user1 = User(name: 'Bjorn', age: 23, email: 'bjorn@upb.ro');
User user2 = User(name: 'Loki', age: 2);
User user3 = User(name: 'Ivar');
final List<User> users = [user1, user2, user3];

BankAccount bank1 = BankAccount(holderName: 'Bjorn');
BankAccount bank2 = BankAccount(holderName: 'Loki', bankBranch: 'VallhalaBanking');
final List<BankAccount> accounts = [bank1, bank2];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lists')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, i) {
                final user = users[i];
                return ListTile(
                  title: Text(user.getDisplayName()),
                  subtitle: Text('${user.getDisplayAge()} and ${user.getDisplayEmail()}'),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: accounts.length,
              itemBuilder: (context, i) {
                final a = accounts[i];
                return ListTile(
                  title: Text(a.holderName),
                  subtitle: Text(a.bankBranch ?? 'Not provided'), //[cite: 1]
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}