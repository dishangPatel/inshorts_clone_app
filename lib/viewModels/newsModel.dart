import 'dart:convert';
import 'package:inshorts_clone/constants.dart';
import 'package:inshorts_clone/models/news.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

enum ViewState { ideal, busy }

class NewsModel extends Model {
  static List<News> _newsList = [];
  String _url;
  ViewState _currentState = ViewState.ideal;

  List<News> get newsList => _newsList;
  ViewState get currentState => _currentState;
  String get url => _url;

  void setUrl(String value) {
    _url = value;
  }

  void setState(ViewState state) {
    _currentState = state;
    notifyListeners();
  }

  Future<List<News>> fetchNews(int page) async {
    try {
      setState(ViewState.busy);

      var response =
          await http.get("$kBaseURLTopHeadlines+&country=in&page=$page");
      if (response.statusCode == 200) {
        var responseJson = jsonDecode(response.body);
        List<dynamic> articles = responseJson["articles"];

        articles.forEach((article) {
          _newsList.add(News.fromJSON(article));
        });

        setState(ViewState.ideal);
      } else {
        setState(ViewState.ideal);
        throw Exception("Something went wrong");
      }
    } catch (e) {
      throw e;
    }

    return _newsList;
  }
}
