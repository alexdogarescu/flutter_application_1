import 'package:flutter/material.dart';
import 'models/user.dart';
import 'models/bankaccount.dart';
import 'models/library.dart';
import 'models/book.dart';
import 'models/magazine.dart';
import 'models/library_item.dart';
import 'screens/todo_screen.dart';

void main() => runApp(MaterialApp(home: TodoPage()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADMD App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}

class UsersPage extends StatelessWidget {
  const UsersPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final List<User> users = [
      User(
        name: 'Ana Mere',
        age: 21,
        email: 'ana@gmail.com',
      ),
      User(
        name: 'Bob Ragnarson',
        age: null,
        email: 'bob@yahoo.com',
      ),
      User(
        name: 'Ion Ion',
        age: null,
        email: null,
      ),
    ];

    final acc1 = BankAccount(
      holderName: 'Mihai Viteazu',
      balance: 1500.0,
      bankBranch: 'Raiffeisen',
    );
    acc1.initializeAccount('RO123');

    final acc2 = BankAccount(
      holderName: 'Stefan cel Mic',
      balance: 500.0,
    );
    acc2.initializeAccount('MD321');

    final acc3 = BankAccount(
      holderName: 'Vlad Tepes',
      balance: 50.0,
      bankBranch: 'BCR',
    );

    final List<BankAccount> accounts = [acc1, acc2, acc3];

    List<LibraryItem> items = [
      Book(
        title: 'Ultima Carte',
        author: 'Marian Coman',
        publishDate: DateTime(2024, 1, 1), //couldn't be bothered to search
        pageCount: 200,
        isbn: '2',
      ),
      Magazine(
        title: 'Dacia',
        publisher: 'Braila Libera',
        issueNumber: 5,
        publishDate: DateTime(2025, 6, 1),
      ),
    ];
    
    final library = Library(items: items);
    library.addItem(
      Book(
        title: 'Capital',
        author: 'Karl Marx',
        publishDate: DateTime(1800, 9, 1),
        pageCount: 180,
        isbn: '1',
        borrower: users[0],
        dueDate: DateTime(2024, 6, 1),
      ),
    );
    
    if (library.items.length > 2) {
      library.returnItem(library.items[2]);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Users', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...users.map((user) => ListTile(
                title: Text(user.name),
                subtitle: Text('Age: ${user.getDisplayAge()} | Email: ${user.email ?? 'Not provided'}'),
              )),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Bank Accounts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...accounts.map((a) => ListTile(
                title: Text(a.holderName),
                subtitle: Text(
                  !a.checkInit()
                      ? 'Uninit'
                      : (a.bankBranch ?? 'Not provided'),
                ),
              )),

          const Divider(),

          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Library Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...library.items.map((item) => ListTile(
                title: Text(item.title),
                subtitle: Text('Author: ${item.author ?? 'Not provided'}'),
              )),
        ],
      ),
    );
  }
}