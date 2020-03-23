import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

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

          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(child: Text('\$${tx.amount}'))),
              ),
              title: Text(
                tx.title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat.yMMMd().format(tx.date)),
              trailing: mediaQuery.size.width > 460
                  ? FlatButton.icon(
                      onPressed: () => deleteTransactionHandler(tx.id),
                      icon: Icon(Icons.delete),
                      label: Text('Delete'),
                      textColor: Theme.of(context).errorColor,
                    )
                  : IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTransactionHandler(tx.id),
                    ),
            ),
          );
        },
        itemCount: _transactions.length,
      );
    }

    return toBeRendered;
  }
}
