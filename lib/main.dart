import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doubanmovie/bloc/CityBloc.dart';
import 'package:flutter_doubanmovie/ui/hot/CitysWidget.dart';
import 'package:flutter_doubanmovie/ui/hot/HotMovieWidget.dart';
import 'package:flutter_doubanmovie/ui/mine/MyWidget.dart';
import 'package:flutter_doubanmovie/ui/movies/MoviesWidget.dart';

import 'Routes.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
        Routes.CITY: (context) => CitysWidget(),
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

  static const platfromChannel = const MethodChannel("douBan.movie");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        bloc: CityBloc(),
        child: pages[_selectedIndex],
      ),
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

  void onNavigationSel(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
