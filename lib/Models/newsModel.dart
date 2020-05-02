class NewsModel
{ 
  //Request Parameters 
      
      /*
      country{two later nation name abbreviation},
      category{entertainment,health,science,sports,bussiness,technology},
      q{phrase and keywords},
      page{use page number to page through results},
      pageSize{number of results to return per page},
      apikey
      */

  //Response Object Contains these parameters

  String _srcId,_srcName;
  String _author,_title,_description,_content;
  String _url,_urlToImage;
  String _publishedAt;

  NewsModel.fromJSON(Map<String,dynamic> json)
  {
    _srcId = json['sourceId'];
    _srcName = json['sourceName'];
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