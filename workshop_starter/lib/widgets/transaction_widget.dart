import 'package:flutter/material.dart';
import 'package:workshop_starter/data/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Step 1: Return a Card here. */
    return Text("$transaction");
  }
}
