import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTX;

  TransactionList(this.transactions, this.deletTX);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "No trasnsactions addded!",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
            itemBuilder: (ctx, index) {
              return Dismissible(
                key: Key(transactions[index].id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => deletTX(transactions[index].id),
                background: Card(
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                child: Card(
                  //elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].name,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(transactions[index].date),
                    ),
                    // trailing: IconButton(
                    //   onPressed: () => deletTX(transactions[index].id),
                    //   icon: Icon(
                    //     Icons.delete,
                    //     color: Colors.red,
                    //   ),
                    // ),
                  ),
                ),
              );

              // return Card(
              //   elevation: 5,
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.symmetric(
              //           vertical: 20,
              //           horizontal: 15,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColor,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '???${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 19,
              //             color: Theme.of(context).primaryColorDark,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             transactions[index].name,
              //             style: Theme.of(context).textTheme.headline6,
              //           ),
              //           Text(
              //             DateFormat.yMMMEd()
              //                 .format(transactions[index].date),
              //             style: TextStyle(
              //               fontSize: 13,
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
            },
            itemCount: transactions.length,
          );
  }
}
