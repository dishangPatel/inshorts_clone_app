import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NewsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      image:
                          "https://images.pexels.com/photos/1111369/pexels-photo-1111369.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                      fadeInCurve: ElasticInCurve(),
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
                      'Coronavirus live news: South Korea records no new domestic cases for first time since February - The Guardian',
                      style: TextStyle(fontSize: 27.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Trump claims China wants to block his re-election; 100 cases of unusual illness among children in at least six countries; UK deaths top Spain and France',
                      maxLines: 7,
                      textWidthBasis: TextWidthBasis.parent,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                    Text(
                      'published in "source name" / few hours ago',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                //open we view for this post
                print('tapped');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.095,
                child: Stack(
                  children: <Widget>[
                    ClipRect(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/1111369/pexels-photo-1111369.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                          child:
                              Container(color: Colors.black.withOpacity(0.7)),
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
