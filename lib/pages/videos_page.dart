import 'package:flutter/material.dart';
import 'package:imediato/services/videoService.dart';
import 'package:imediato/videos.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class videosPage extends StatelessWidget {
  const videosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
      body: _body(),
          );
        }
      

  _body() {

    Future future = VideoService.getVideos();

    return Container(
      padding: EdgeInsets.all(12),
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _listView(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Sem dados",style: TextStyle(
                color: Colors.grey,
                fontSize: 26,
                fontStyle: FontStyle.italic
              ),),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
      
  _listView(List<Datum> videos) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (ctx, idx) {
        final c = videos[idx];
        return Column(
          children: <Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  
                  new Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new ListTile(
                        title: new Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: new HtmlWidget(
                              c.embedHtml,
                              ),
                            ),
                      )),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}