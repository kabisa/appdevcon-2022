import 'package:flutter/material.dart';
import 'package:workshop_starter/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '₭udos',
      theme: ThemeData(
        primaryColor: Color(0xFF181e23),
        buttonTheme: ButtonThemeData(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
            colorScheme: ColorScheme.dark()),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: '₭udos'),
    );
  }
}
