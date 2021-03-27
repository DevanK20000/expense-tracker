import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _onSubmit() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
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
                controller: _titleController,
                onSubmitted: (_) => _onSubmit,
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
                controller: _amountController,
                onSubmitted: (_) => _onSubmit,
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
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: _presentDatePicker,
                child: Text(_selectedDate == null
                    ? 'No date chosen'
                    : DateFormat.yMEd().format(_selectedDate)),
              ),
            ),
            ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Add Transactions'),
              //style: TextButton.styleFrom(primary: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
