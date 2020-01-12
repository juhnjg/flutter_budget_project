import 'package:flutter/material.dart';
import './tansaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now())
  ];
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('CHART!'),
                  elevation: 5,
                ),
              ),
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                        onChanged: (val) {
                          titleInput = val;
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                        onChanged: (val) => amountInput = val,
                      ),
                      FlatButton(
                        child: Text('Add Transaction'),
                        textColor: Colors.purple,
                        onPressed: () {

                        },
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: transactions.map((tx) {
                  return Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.purple, width: 2)),
                          child: Text('\$ ${tx.amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                          Text(DateFormat('yyyy-MM-dd').format(tx.date),
                              style: TextStyle(color: Colors.grey))
                        ],
                      )
                    ],
                  ));
                }).toList(),
              )
            ]));
  }
}
