import 'package:flutter/material.dart';
import 'package:inshorts_clone/screens/browser_screen.dart';
import 'package:inshorts_clone/screens/display_screen.dart';
import 'package:inshorts_clone/screens/genre_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController masterController = PageController(initialPage: 1,keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: ScrollPhysics(parent:BouncingScrollPhysics()),
        onPageChanged: (value) => print(value),
        controller: masterController,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GenreScreen(),
           DisplayScreen(
            masterController: masterController,
          ),
          BrowserScreen(
            masterCotroller: masterController,
          ),
        ],
      ),
    );
  }
}
