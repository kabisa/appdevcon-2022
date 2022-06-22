import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/data/transaction.dart';
import 'package:flutter_workshop/widgets/transaction_widget.dart';

class TransactionGrid extends StatelessWidget {
  static const ITEM_MAX_HEIGHT = 170;
  static const ITEM_MIN_WIDTH = 300;

  const TransactionGrid({
    Key key,
    @required this.transactions,
    @required this.refresh,
  }) : super(key: key);

  final List<Transaction> transactions;
  final AsyncCallback refresh;

  @override
  Widget build(BuildContext context) {
    final double contextWidth = MediaQuery.of(context).size.width;

    final int gridCount = (contextWidth / ITEM_MIN_WIDTH).floor();
    final double childRatio = (contextWidth / gridCount) / ITEM_MAX_HEIGHT;

    return RefreshIndicator(
      onRefresh: this.refresh,
      child: GridView.builder(
          itemCount: transactions.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: childRatio, crossAxisCount: gridCount),
          itemBuilder: (context, index) {
            final transaction = transactions[index];
            return TransactionWidget(transaction: transaction);
          }),
    );
  }
}
