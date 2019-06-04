import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoviesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoviesWidgetState();
  }
}

class MoviesWidgetState extends State<MoviesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: 80,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                hintText: "\uE8b6 电影/电视剧/影人",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                filled: true,
                fillColor: Colors.black12),
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: TabBar(
                    tabs: <Widget>[Text("电影"), Text("电视")],
                    indicatorColor: Colors.black87,
                    unselectedLabelColor: Colors.black12,
                    labelColor: Colors.black87,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Center(child: Text("电影")),
                      Center(child: Text("电视"))
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
