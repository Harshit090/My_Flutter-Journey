import 'package:flutter/material.dart';

import './widgets/Chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey)
            .copyWith(secondary: Colors.blueGrey),
        fontFamily: 'OpenSans',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'ScourceCodePro',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        // sets aa default themen that can be used by others by refering to it.
      ),
      home: HomePaage(),
    );
  }
}

class HomePaage extends StatefulWidget {
  @override
  State<HomePaage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePaage> {
  final List<Transactions> _userTransactions = [
    Transactions(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't3',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't4',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't5',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't6',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't7',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't8',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't9',
      title: 'Weekely Grocries',
      amount: 14.53,
      date: DateTime.now(),
    ),
  ];

  List<Transactions> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transactions(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext contextForModalBottomSheet) {
    showModalBottomSheet(
      context: contextForModalBottomSheet,
      builder: (builderContext) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(addNewTx: _addNewTransaction),
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Personal Expenses',
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
