import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void onSubmit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: titleController,
                onSubmitted: (_) => onSubmit,
                // onChanged: (value) => titleInput = value, //use controller instead
                //cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  //labelStyle: TextStyle(color: Colors.purple),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.purple,
                  //     width: 2,
                  //   ),
                  // ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.purple,
                  //     width: 2,
                  //   ),
                  //),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: TextField(
                controller: amountController,
                onSubmitted: (_) => onSubmit,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                // onChanged: (value) => amountInput = value,
                cursorColor: Colors.purple,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  //labelStyle: TextStyle(color: Colors.purple),
                  // focusedBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.purple,
                  //     width: 2,
                  //   ),
                  // ),
                  // enabledBorder: OutlineInputBorder(
                  //   borderSide: BorderSide(
                  //     color: Colors.purple,
                  //     width: 2,
                  //   ),
                  // ),
                ),
              ),
            ),
            TextButton(
              onPressed: onSubmit,
              child: Text('Add Transactions'),
              //style: TextButton.styleFrom(primary: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
