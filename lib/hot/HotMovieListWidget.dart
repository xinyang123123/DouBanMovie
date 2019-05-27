import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/bean/HotMovieBean.dart';
import 'package:flutter_doubanmovie/hot/HotMovieItemWeiget.dart';
import 'package:http/http.dart' as http;

class HotMovieListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotMovieListState();
  }
}

class HotMovieListState extends State<HotMovieListWidget> {
  List<HotMovieBean> datas = List();

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    if (datas == null || datas.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.separated(
          itemCount: datas?.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                color: Colors.black12,
              ),
          itemBuilder: (BuildContext context, int index) =>
              HotMovieItemWeiget(datas.elementAt(index)),
        ),
      );
    }
  }

  void _requestData() async {
    List<HotMovieBean> list = List();
    var url =
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=广州&start=0&count=10';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      for (dynamic item in responseJson["subjects"]) {
        var bean = HotMovieBean.fromMap(item);
        list.add(bean);
      }

      setState(() {
        datas = list;
      });
    }
  }
}
