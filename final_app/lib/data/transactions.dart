import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_workshop/data/transaction.dart';

class Transactions with ChangeNotifier {
  static final List<Transaction> dummyTransactions = [
    Transaction(
        fromName: "Kamryn Quin",
        toName: "Neely Florence",
        createdAt: DateTime.parse("2020-04-03T15:40:49.937988+0200"),
        kudos: 25,
        note: "being like sunshine on a rainy day."),
    Transaction(
        fromName: "Jamey Gayle",
        toName: "Grier London",
        createdAt: DateTime.parse("2020-04-02 14:37:40.669265+0200"),
        kudos: 25,
        note: "bringing out the best in other people."),
    Transaction(
        fromName: "Martie Esme",
        toName: "Vivian Casey",
        createdAt: DateTime.parse("2020-04-02T09:56:52.285789+0200"),
        kudos: 10,
        note:
            "that thing you don’t like about yourself is what makes you so interesting."),
    Transaction(
        fromName: "Kerry Kelcey",
        toName: "Leighton Dezi",
        createdAt: DateTime.parse("2020-03-31T15:22:47.209402+0200"),
        kudos: 20,
        note: "you always know just what to say."),
    Transaction(
        fromName: "Emmerson Jules",
        toName: "Chris Campbell",
        createdAt: DateTime.parse("2020-03-31T12:13:48.90337+0200"),
        kudos: 10,
        note: "being even better than a unicorn, because you're real.")
  ];

  bool _isLoading = false;
  Transaction? _lastAddedTransaction = null;
  List<Transaction> _transactions = [];

  List<Transaction> get() {
    return UnmodifiableListView(_transactions);
  }

  bool get isLoading {
    return _isLoading;
  }

  Future<void> fetch() async {
    return _withLoading(() async {
      await Future.delayed(Duration(seconds: 1));

      this._transactions = dummyTransactions;
      this._sort();
    });
  }

  void add(Transaction transaction) {
    this._lastAddedTransaction = transaction;

    this._transactions.add(transaction);
    this._sort();

    notifyListeners();
  }

  void undoAdd() {
    if (_lastAddedTransaction == null) return;
    _transactions.remove(_lastAddedTransaction);

    notifyListeners();
  }

  void _sort() {
    _transactions..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> _withLoading(AsyncCallback func) async {
    _isLoading = true;
    notifyListeners();

    await func();

    _isLoading = false;
    notifyListeners();
  }
}
