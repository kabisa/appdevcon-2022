import 'package:flutter/material.dart';
import 'package:flutter_workshop/data/transactions.dart';
import 'package:flutter_workshop/screens/new_transaction_screen.dart';
import 'package:flutter_workshop/widgets/transaction_grid.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactions = context.watch<Transactions>();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        bottomNavigationBar: NavBar(),
        body: HomeScreenBody(transactions: transactions),
        floatingActionButton: FloatingActionButton(
            tooltip: 'Increment',
            child: const Icon(Icons.add),
            onPressed: () => this._onAddPressed(context, transactions)));
  }

  _onAddPressed(BuildContext context, Transactions transactions) async {
    final result = await Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true, builder: (_) => NewTransactionScreen()));

    if (result != null) {
      this._onTransactionCreated(context, transactions);
    }
  }

  _onTransactionCreated(BuildContext context, Transactions transactions) {
    // Dismiss currently displayed snackbar, if any
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('₭udos sent! 💰'),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          transactions.undoAdd();
        },
      ),
    ));
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      selectedItemColor: Colors.blueAccent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(label: '', icon: Icon(Icons.settings)),
        BottomNavigationBarItem(label: '', icon: Icon(Icons.show_chart)),
        BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: '', icon: Icon(Icons.notifications)),
        BottomNavigationBarItem(label: '', icon: Icon(Icons.person)),
      ],
    );
  }
}

class HomeScreenBody extends StatelessWidget {
  final Transactions transactions;

  const HomeScreenBody({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = transactions.isLoading
        ? Text(
            "Loading...",
            textAlign: TextAlign.center,
          )
        : TransactionGrid(
            transactions: transactions.get(),
            refresh: () => Future.value(transactions.fetch()),
          );

    return Center(
        child: Padding(padding: const EdgeInsets.all(8.0), child: child));
  }
}
