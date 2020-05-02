import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inshorts_clone/Models/newsModel.dart';
import 'package:inshorts_clone/widgets/news_card.dart';

class DisplayScreen extends StatefulWidget {
  DisplayScreen({@required this.setURL, @required this.masterController});
  final PageController masterController;
  final Function setURL;
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List<NewsModel> newsList;
  bool newsDataFetched = false;
  static int page = 1;
  final int pageSize = 25;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // fetchNews(page);
    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        //fetchNews(page++);
      }
    });
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (!newsDataFetched)
        ? CircularProgressIndicator()
        : PageView.builder(
            onPageChanged: (val) => widget.setURL(newsList[val].url),
            controller: _pageController,
            itemCount: newsList.length,
            itemBuilder: (context, index) => NewsCard(
              news: newsList[index],
              masterController: widget.masterController,
            ),
            scrollDirection: Axis.vertical,
          );
  }
}
