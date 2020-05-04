import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/locator/locator.dart';
import 'package:inshorts_clone/viewModels/newsModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatefulWidget {
  BrowserScreen(
      {@required this.masterCotroller, this.sourceName})
      : assert(masterCotroller != null);
  final PageController masterCotroller;
  final String sourceName;
  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String _url;  
  NewsModel _model;

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
    _model = locator<NewsModel>();
    _url = _model.url;
    print("rebuild browser screen");
  }

  @override
  void dispose() {
    super.dispose();
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
          initialUrl: _url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
