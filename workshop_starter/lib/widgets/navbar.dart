
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key key,
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
