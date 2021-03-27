import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transaction.dart';
import 'package:flutter_application_2/widgets/chart.dart';
import 'package:flutter_application_2/widgets/new_transaction.dart';
import 'package:flutter_application_2/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.amberAccent[700],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   name: 'New Shoes',
    //   amount: 400.00,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   name: 'Weekly Groseries',
    //   amount: 120.00,
    //   date: DateTime.now(),
    // ),
  ];

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return SingleChildScrollView(
            child: NewTransaction(_addUserTransaction));
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addUserTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newtx = Transaction(
      id: DateTime.now().toString(),
      name: txTitle,
      amount: txAmount,
      date: chosenDate,
    );
    setState(() {
      _userTransactions.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
