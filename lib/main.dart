import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 12.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 15.53,
        date: DateTime.now())
  ];
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.amber,
                  elevation: 5,
                  child: Text("CHART!"),
                ),
              ),
              Column(
                children: transactions.map((e) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          child: Text(e.amount.toString()),
                        ),
                        Column(
                          children: <Widget>[
                            Text(e.title),
                            Text(e.date.toString())
                          ],
                        )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}
