import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/hot/HotMovieListWidget.dart';

import '../Routes.dart';

class HotMovieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotMovieWidgetState();
  }
}

class HotMovieWidgetState extends State<HotMovieWidget> {
  String currentCity = "西安";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: 80,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(currentCity,style: TextStyle(fontSize: 16),),
                onTap: () => Navigator.pushNamed(context, Routes.CITY,arguments: currentCity),
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "\uE8b6 电影/电视剧/影人",
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      filled: true,
                      fillColor: Colors.black12),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 50),
                    child: TabBar(
                      tabs: <Widget>[Text("正在热映"), Text("即将上映")],
                      unselectedLabelColor: Colors.black12,
                      indicatorColor: Colors.black87,
                      labelColor: Colors.black87,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      children: <Widget>[
                        HotMovieListWidget(currentCity),
                        Center(child: Text("即将上映"))
                      ],
                    ),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
