import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/new_transaction.dart';
import 'package:flutter_application_2/widgets/transaction_list.dart';
import 'package:flutter_application_2/models/transaction.dart';

class UserTransaction extends StatefulWidget {
  UserTransaction({Key key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      name: 'New Shoes',
      amount: 400.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      name: 'Weekly Groseries',
      amount: 120.00,
      date: DateTime.now(),
    ),
  ];

  void _addUserTransaction(String txTitle, double txAmount) {
    final newtx = Transaction(
      id: DateTime.now().toString(),
      name: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newtx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addUserTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
