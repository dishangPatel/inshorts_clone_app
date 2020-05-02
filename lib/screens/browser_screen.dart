import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatelessWidget {
  BrowserScreen({this.masterCotroller});
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final PageController masterCotroller;

  Future<bool> _backButton(Future<WebViewController> futureController) async {
    
    WebViewController _tempController;
    await futureController.then((value) => _tempController = value);
    
    if(await _tempController.canGoBack())
    {
      _tempController.goBack();
      return false;
    }
    else
    {
      masterCotroller.animateToPage(3, duration: Duration(seconds: 1), curve: Curves.ease);
      print("cant go back");
      // return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
       return _backButton(_controller.future); 
      },
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.black,
              title: Text("Source Name"),
            ),
            preferredSize: Size.fromHeight(15.0)),
        body: WebView(
          onWebViewCreated: (controller) => _controller.complete(controller),
          initialUrl: 'https://www.flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
