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
    _description = json['description'] ?? "Please try detailed read";
    _publishedAt = json['publishedAt'];
    _title = json['title'];
    _url = json['url'];
    _urlToImage = json['urlToImage'] ?? "https://lh3.googleusercontent.com/3oizzXFrBNU1qzCcRXNpMTkvT1yRbV9g20ATp8AseG4n5FNLrHD9eXrUJzDOXxZVijbNrKtfgWk=w640-h400-e365"; 
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