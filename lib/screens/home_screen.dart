import 'package:flutter/material.dart';
import 'package:inshorts_clone/screens/browser_screen.dart';
import 'package:inshorts_clone/screens/display_screen.dart';
import 'package:inshorts_clone/screens/genre_screen.dart';

class Home extends StatelessWidget {
  String _url;

  void setUrl(value) => _url = value;

  @override
  Widget build(BuildContext context) {
    final PageController masterController = PageController();

    void app() {
      // masterController.attach(ScrollPosition(physics: ScrollPhysics(), context: ));
    }
    //have to pass this controller in each page
    //coz using that will be moving around pages
    //i'll use master controller to listen for change and whenever it happens
    //ill animate to next screen and send url string to next page
    
  }
}


/*PageView(
      onPageChanged: (value) => print(value),
      controller: masterController,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        GenreScreen(),
        DisplayScreen(),
        BrowserScreen(),
      ],
    );*/