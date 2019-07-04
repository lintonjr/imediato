import 'package:flutter/material.dart';
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

    Future<VideoResponse> future = VideoService.getVideos();
    return FutureBuilder<VideoResponse>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        VideoResponse response = snapshot.data;
        List<Video> videos = response.videos;
        return Column(
          children: <Widget>[
            Expanded(
              child: _listView(context, videos),
            )
          ],
        );
      },
    );
  }
      
  _listView(context, List<Video> videos) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (ctx, idx) {
        Video video = videos[idx];
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
                              video.embedHtml,
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