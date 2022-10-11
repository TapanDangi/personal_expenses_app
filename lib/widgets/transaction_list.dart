import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  TransactionList({Key key, this.transactions}) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: ((context, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    'Rs ' + '${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
        itemCount: transactions.length,
      ),
    );
  }
}
