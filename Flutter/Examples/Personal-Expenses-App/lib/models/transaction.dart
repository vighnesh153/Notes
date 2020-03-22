import 'package:flutter/foundation.dart';

// material.dart also works as it imports foundation.dart, but we
// are more specific here as it is provided by base flutter package

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}
