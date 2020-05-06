import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:inshorts_clone/models/news.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsCard extends StatelessWidget {
  NewsCard({@required this.news,@required this.masterController})
    :assert(news!=null),
     assert(masterController!=null);

    
  final News news;
  final PageController masterController;

  @override
  Widget build(BuildContext context) {
    int _getTime(String time) {
      return DateTime.now().difference(DateTime.parse(time)).inHours + 5;
    }

    int hoursDiff = _getTime(news.publishedAt);
    // if(hoursDiff > 24) 
    String time = (hoursDiff > 2) ? (hoursDiff<24)?'$hoursDiff hours ago' :'${hoursDiff~/24} day ago' : 'few hours ago';
    // TimeOfDay.fromDateTime();
  
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: Colors.black,
      body: Container(
        // padding: EdgeInsets.all(10.0),
        child: Column(
          
          children: <Widget>[
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  //hero animation with url
                },
                child: Hero(
                  tag: 'newsImage',
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)),
                    ),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: news.urlToImage,
                      fadeInCurve: Curves.ease,
                      placeholderScale: 2.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      news.title,
                      style: TextStyle(fontSize: 27.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      news.description,
                      maxLines: 8,
                      textWidthBasis: TextWidthBasis.parent,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                    Text(
                      'published in ${news.srcName} / $time',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //open we view for this post
                masterController.animateToPage(2, duration: Duration(seconds: 1), curve: Curves.easeOut);
                print('tapped');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.095,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),  
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                              image: NetworkImage(news.urlToImage),
                              fit: BoxFit.cover),
                          
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 25,
                            sigmaY: 25,
                          ),
                          child: Container(
                            color: Colors.black.withOpacity(0.65),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.095 / 3,
                      left: 8,
                      child: Text(
                        'Tap to read more about the post.',
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
