import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          color: Colors.cyan,
          height: double.infinity,
          width: double.infinity,
        ),
        Container(
      color:Colors.indigo,
      height: double.infinity,
      width: double.infinity,
    ),
    Container(
      color:Colors.orange,
      height: double.infinity,
      width: double.infinity,
    )
      ],
    );
  }
}
