import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/data/transaction.dart';
import 'package:flutter_workshop/widgets/transaction_widget.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key key,
    @required this.transactions,
    @required this.refresh,
  }) : super(key: key);

  final List<Transaction> transactions;
  final AsyncCallback refresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: this.refresh,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionWidget(transaction: transaction);
          }),
    );
  }
}
