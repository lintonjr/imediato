import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ImediatoPost extends StatelessWidget {

  var post;
  ImediatoPost({Key key, @required var this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(post['title']['rendered']),
        backgroundColor: Colors.orange,
      ),
      body: new Padding(
        padding: EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            Text(post["title"]["rendered"],
              textAlign: TextAlign.center,
              style:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12.0,
            ),
            new FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: post["featured_media"] == 0
                  ? 'images/placeholder.png'
                  : post["_embedded"]["wp:featuredmedia"][0]["source_url"],
            ),
            SizedBox(
              height: 12.0,
            ),
            HtmlWidget(
              post['content']['rendered'],
              webView: true,
            )
          ],
        ),
      ),
    );
  }
}