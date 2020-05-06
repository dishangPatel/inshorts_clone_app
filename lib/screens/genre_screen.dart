import 'package:flutter/material.dart';

class GenreScreen extends StatefulWidget {

  GenreScreen({this.key,@required this.masterController}):super(key:key);
  final PageController masterController;
  final Key key;
  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.yellowAccent,
      height: double.infinity,
      width: double.infinity,
    );
  }
}