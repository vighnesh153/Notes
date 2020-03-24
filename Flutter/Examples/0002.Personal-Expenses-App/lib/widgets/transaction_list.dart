import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function deleteTransactionHandler;

  TransactionList(this._transactions, this.deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    Widget toBeRendered = LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Text(
              'No Transactions added!, yet',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ))
          ],
        );
      },
    );

    if (_transactions.isEmpty == false) {
      // ListView() is basically, Column, wrapped in SingleChildScrollView
      // ListView needs a parent that has a fixed height.
      // ListView() renders all the children even if they are not
      // in the visible window. Technically, it does not render
      // some items if they are out of the visible window, but
      // it loads them initially all at once. And it has less
      // optimizations than ListView.builder()
      toBeRendered = ListView.builder(
        itemBuilder: (context, index) {
          final tx = _transactions[index];

          return TransactionItem(tx: tx, mediaQuery: mediaQuery, deleteTransactionHandler: deleteTransactionHandler);
        },
        itemCount: _transactions.length,
      );
    }

    return toBeRendered;
  }
}
