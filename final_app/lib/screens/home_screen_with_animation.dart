import 'package:flutter/material.dart';
import 'package:flutter_workshop/data/transactions.dart';
import 'package:flutter_workshop/screens/new_transaction_screen.dart';
import 'package:flutter_workshop/widgets/open_container_fab.dart';
import 'package:flutter_workshop/widgets/transaction_grid.dart';
import 'package:provider/provider.dart';

/**
 * Alternative HomeScreen with a nice 'Open Container' animation
 */
class HomeScreenWithAnimation extends StatelessWidget {
  final String title;

  const HomeScreenWithAnimation({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final body = Consumer<Transactions>(builder: (_ctx, transactions, _child) {
      return HomeScreenBody(transactions: transactions);
    });

    final fab = Consumer<Transactions>(builder: (_ctx, transactions, _child) {
      return HomeFAB(
        transactions: transactions,
      );
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        bottomNavigationBar: NavBar(),
        body: body,
        floatingActionButton: fab);
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

class HomeFAB extends StatelessWidget {
  final Transactions transactions;

  const HomeFAB({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final openContainer = (_ctx, _) => NewTransactionScreen();

    return OpenContainerFab(
        child: Icon(Icons.add, color: Colors.white),
        openContainerBuilder: openContainer,
        onClosed: (result) {
          if (result != null) {
            this._onTransactionCreated(context);
          }
        });
  }

  _onTransactionCreated(BuildContext context) {
    // Dismiss currently displayed snackbar, if any
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('₭udos sent! 💰'),
      action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          this.transactions.undoAdd();
        },
      ),
    ));
  }
}
