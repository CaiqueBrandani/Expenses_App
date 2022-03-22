// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use, avoid_unnecessary_containers, dead_code

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'package:flutter/material.dart';
import 'components/chart.dart';
import 'models/transaction.dart';
import 'dart:math';

main() => runApp(ExpenseApp());

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.teal,
          secondary: Colors.teal[200],
        ),

        textTheme: tema.textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),

        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  } 
}


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

    List<Transaction> get _recentTransaction {
      return _transactions.where((tr) {
        return tr.date.isAfter(DateTime.now().subtract(
          Duration(days: 7),
        ));
      }).toList();
    }

    _addTransaction(String title, double value, DateTime date) {
      final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: date
      );

      setState(() {
        _transactions.add(newTransaction);
      });

      Navigator.of(context).pop();
    }

    _removeTransaction(String id) {
      setState(() {
        _transactions.removeWhere((tr) {
          return tr.id == id;
        });
      });
    }

  @override
  Widget build(BuildContext context) {

    _openTransactionForModal(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return TransactionForm(_addTransaction);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Despesa Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            onPressed: () => _openTransactionForModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransaction),
            TransactionList(_transactions, _removeTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        onPressed: () => _openTransactionForModal(context),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
