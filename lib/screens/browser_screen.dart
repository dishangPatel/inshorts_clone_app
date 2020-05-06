import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/locator/locator.dart';
import 'package:inshorts_clone/viewModels/newsModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatefulWidget {
  BrowserScreen({@required this.masterCotroller, this.sourceName,this.key})
      : assert(masterCotroller != null),
        super(key:key);

  final PageController masterCotroller;
  final String sourceName;
  final Key key;
  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  // WebViewController 
  Completer<WebViewController> _controller = Completer<WebViewController>();
  String _url;
  NewsModel _model;

  Future<bool> _backButton(Future<WebViewController> futureController) async {
    WebViewController _tempController;
    await futureController.then((value) => _tempController = value);

    if (await _tempController.canGoBack()) {
      _tempController.goBack();
      return false;
    } else {
      widget.masterCotroller
          .animateToPage(1, duration: Duration(seconds: 1), curve: Curves.ease);
      print("cant go back");
      // return true;
    }
    return false;
  }

  // Future<String> futureString;

  @override
  void initState() {
    super.initState();
    _model = locator<NewsModel>();
    _url = _model.url;
  }
  // String str= "jell";
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
              "news",
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
          initialUrl: _url,
          onWebViewCreated: (controller)=>_controller.complete(controller),
          javascriptMode: JavascriptMode.unrestricted,
          onPageStarted: (val){
            print("page started loading "+val);
          },
          onPageFinished:(val){
            print("page loaded "+val);
          },
        ),
      ),
    );
  }
}

