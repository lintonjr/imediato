import 'package:flutter/material.dart';
import 'package:imediato/pages/videos_page.dart';
import 'imediatoHome.dart';

class Template extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TemplateState();
}

class TemplateState extends State {

  var homePage = new ImediatoHome();
  var liveVideos = new videosPage();
  var _selectedPage = 0;
  var _pages;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    _pages = [
      homePage,
      liveVideos
    ];
    return Scaffold(
      appBar: AppBar(
          title: Text("Imediato Online"), backgroundColor: Colors.orange),
      body: _body(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicio'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Text('Ao Vivo'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_upload),
            title: Text('Envie'),
          ),
        ],
        currentIndex: _selectedPage,
        selectedItemColor: Colors.amber[800],
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },
      ),
    );
  }

  _body() {
    return Container(
      child: _pages[_selectedPage],
    );
    
  }
}
