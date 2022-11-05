import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {Key key, this.transactions, this.deleteTx, this.isLandscape})
      : super(key: key);

  final List<Transaction> transactions;
  final Function deleteTx;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: ((context, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.15,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            }),
          )
        : ListView.builder(
            itemBuilder: ((context, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  isLandscape: isLandscape,
                  deleteTx: deleteTx);
            }),
            itemCount: transactions.length,
          );
  }
}
