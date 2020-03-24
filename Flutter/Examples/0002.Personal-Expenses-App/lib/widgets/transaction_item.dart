import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.tx,
    @required this.mediaQuery,
    @required this.deleteTransactionHandler,
  }) : super(key: key);

  final Transaction tx;
  final MediaQueryData mediaQuery;
  final Function deleteTransactionHandler;

  @override
  Widget build(BuildContext context) {
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
  }
}