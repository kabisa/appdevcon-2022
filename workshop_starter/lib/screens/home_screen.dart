import 'package:flutter/material.dart';
import 'package:workshop_starter/data/transaction.dart';
import 'package:workshop_starter/data/transactions.dart';
import 'package:workshop_starter/screens/new_transaction_screen.dart';
import 'package:workshop_starter/widgets/navbar.dart';
import 'package:workshop_starter/widgets/transaction_widget.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        bottomNavigationBar: NavBar(),
        body: HomeScreenBody(transactions: Transactions.dummyTransactions),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (_) => NewTransactionScreen()));
          },
        ));
  }
}

class HomeScreenBody extends StatelessWidget {
  final List<Transaction> transactions;

  const HomeScreenBody({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            /* Step 2: Render a list view here. */
            child: TransactionWidget(
              transaction: transactions[0],
            )));
  }
}
