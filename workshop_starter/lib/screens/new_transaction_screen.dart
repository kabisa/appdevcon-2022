import 'package:flutter/material.dart';

class NewTransactionScreen extends StatelessWidget {
  NewTransactionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Award ₭udos")),
        body: Padding(
            padding: EdgeInsets.all(16),
            /* Step 3: Render a Form here. */
            child: Text("Start building the form here")));
  }
}
