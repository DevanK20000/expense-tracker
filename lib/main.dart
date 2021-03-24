import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/new_transaction.dart';
import 'package:flutter_application_2/widgets/user_transaction.dart';

void main() => runApp(MyApp());

// void startNewTransaction(BuildContext ctx) {
//   showModalBottomSheet(
//     context: ctx,
//     builder: (_) {
//       return NewTransaction(addTx);
//     },
//   );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Charts'),
                elevation: 5,
                color: Colors.blue,
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
