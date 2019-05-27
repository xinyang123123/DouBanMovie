import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/bean/HotMovieBean.dart';

class HotMovieItemWeiget extends StatefulWidget {
  final HotMovieBean bean;
  HotMovieItemWeiget(this.bean);

  @override
  State<StatefulWidget> createState() {
    return HotMovieItemState();
  }
}

class HotMovieItemState extends State<HotMovieItemWeiget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Image.network(widget.bean.images.small,
              width: 80, height: 120, fit: BoxFit.cover),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.bean.title,
                    maxLines: 2,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(widget.bean.rating.average.toString(),
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  Text('导演：' + getCastsName(widget.bean.directors),
                      maxLines: 2,
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                  Text(
                    '主演：' + getCastsName(widget.bean.casts),
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.bean.collectCount.toString() + "人看过",
                    style: TextStyle(color: Colors.red)),
                Padding(
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: OutlineButton(
                    child: Text("购票", style: TextStyle(color: Colors.red)),
                    color: Colors.red,
                    textColor: Colors.red,
                    highlightedBorderColor: Colors.red,
                    borderSide: BorderSide(color: Colors.red),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String getCastsName(List<Cast> casts) {
    String castName = "";
    casts.forEach((cast) => castName += cast.name + "/");

    return castName.substring(0, castName.length - 1);
  }
}
