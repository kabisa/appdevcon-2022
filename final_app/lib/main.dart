import 'package:flutter/material.dart';
import 'package:flutter_workshop/data/transactions.dart';
import 'package:flutter_workshop/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Transactions()..fetch(),
      child: MaterialApp(
        title: '₭udos',
        theme: ThemeData(
          primaryColor: Color(0xFF181e23),
          buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
              colorScheme: ColorScheme.dark()),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(title: '₭udos'),
      ),
    );
  }
}
