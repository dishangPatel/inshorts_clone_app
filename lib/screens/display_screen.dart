import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inshorts_clone/models/news.dart';
import 'package:inshorts_clone/viewModels/newsModel.dart';
import 'package:inshorts_clone/widgets/news_card.dart';
import 'package:inshorts_clone/locator/locator.dart';
import 'package:scoped_model/scoped_model.dart';

class DisplayScreen extends StatefulWidget {
  DisplayScreen({@required this.setURL, @required this.masterController});
  final PageController masterController;
  final Function setURL;
  @override
  _DisplayScreenState createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  List<News> newsList;
  static int page = 1;
  final int pageSize = 25;
  final PageController _pageController = PageController();
  NewsModel newsModel = locator<NewsModel>();

  @override
  void initState() {
    super.initState();
    newsModel.fetchNews(page);
    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        newsModel.fetchNews(++page);
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
    return ScopedModel<NewsModel>(
      model: newsModel,
      child: ScopedModelDescendant<NewsModel>(
        builder: (context, child, model) {
          newsList = model.newsList;
          return (model.currentState == ViewState.busy)
              ? CircularProgressIndicator()
              : PageView.builder(
                  onPageChanged: (val) {
                    // print("url set" + newsList[val].url);
                    widget.setURL(newsList[val].url);
                  },
                  controller: _pageController,
                  itemCount: newsList.length,
                  itemBuilder: (context, index) => NewsCard(
                    news: newsList[index],
                    masterController: widget.masterController,
                  ),
                  scrollDirection: Axis.vertical,
                );
        },
      ),
    );
  }
}
