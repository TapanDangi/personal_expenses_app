import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.indigoAccent,
        ),
        //sets the color theme of the app
        fontFamily: 'Quicksand',
        //used for all fonts in the app
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        //common theme for titles of transactions
        //can be used in the style argument of widget wehere transactions are defined
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //to set the specifications of the theme of appbar different from the universal font
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'Title 1',
      amount: 4131,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Title 2',
      amount: 431,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newtx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newtx);
    });
  }

  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addtx: _addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransactions(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart'),
                color: Colors.blue,
                elevation: 10,
              ),
            ),
            TransactionList(transactions: _userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransactions(context),
        //_startAddNewTransactions function takes BuildContext argument
        //so it is passed as a functon here with argument context of type BuildContext
        //with the help of an anonymous function
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
