import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatefulWidget {
  BrowserScreen(
      {@required this.masterCotroller, @required this.url, this.sourceName})
      : assert(masterCotroller != null);
        // assert(url != null);
  final PageController masterCotroller;
  final String url;
  final String sourceName;
  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Future<bool> _backButton(Future<WebViewController> futureController) async {
    WebViewController _tempController;
    await futureController.then((value) => _tempController = value);

    if (await _tempController.canGoBack()) {
      _tempController.goBack();
      return false;
    } else {
      widget.masterCotroller.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.ease);
      print("cant go back");
      // return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    print("rebuild browser screen");
  }

  @override
  Widget build(BuildContext context) {

    // print("news url "+widget.url);
    return WillPopScope(
      onWillPop: () {
        return _backButton(_controller.future);
      },
      child: Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              widget.sourceName,
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            centerTitle: true,
          ),
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.039),
        ),
        body: WebView(
          onWebViewCreated: (controller) => _controller.complete(controller),
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
