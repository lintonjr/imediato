import 'package:flutter/material.dart';

class videosPage extends StatefulWidget {
  videosPage({Key key}) : super(key: key);

  _videosPageState createState() => _videosPageState();
}

class _videosPageState extends State<videosPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         Text("Visite",
          textAlign: TextAlign.center,
         ),
         RaisedButton(
           child: Text("Imediato Online",
           textAlign: TextAlign.center,
           ),
         )
       ]
    );
  }
}
