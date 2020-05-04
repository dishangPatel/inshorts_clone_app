import 'package:flutter/material.dart';
import 'package:inshorts_clone/locator/locator.dart';
import 'package:inshorts_clone/screens/browser_screen.dart';
import 'package:inshorts_clone/screens/home_screen.dart';
import 'package:inshorts_clone/widgets/news_card.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) =>Home()},
    );
  }
}
