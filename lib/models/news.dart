class News
{ 
  String _srcId,_srcName;
  String _author,_title,_description,_content;
  String _url,_urlToImage;
  String _publishedAt;

  News.fromJSON(Map<String,dynamic> json)
  {
    _srcId = json["source"]['id'];
    _srcName = json["source"]['name'];
    _author = json['author'];
    _content = json['content'];
    _description = json['description'];
    _publishedAt = json['publishedAt'];
    _title = json['title'];
    _url = json['url'];
    _urlToImage = json['urlToImage']; 
  }

  String get srcId => _srcId;
  String get srcName => _srcName;
  String get author => _author;
  String get title => _title;
  String get description => _description;
  String get content => _content;
  String get url => _url;
  String get urlToImage => _urlToImage;
  String get publishedAt => _publishedAt;

}