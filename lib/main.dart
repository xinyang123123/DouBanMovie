import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/hot/CitysWidget.dart';

import 'MoviesWidget.dart';
import 'MyWidget.dart';
import 'Routes.dart';
import 'hot/HotMovieWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        Routes.CITYS: (context) => CitysWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final pages = [HotMovieWidget(), MoviesWidget(), MyWidget()];

  void onNavigationSel(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("热映")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("找片")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的")),
        ],
        onTap: onNavigationSel,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
