import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doubanmovie/data/bean/HotMovieBean.dart';
import 'package:flutter_doubanmovie/utils/ConversionUtils.dart';

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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(widget.bean.rating.average.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  Text('导演：' + getCastsName(widget.bean.directors),
                      maxLines: 2,
                      style: TextStyle(fontSize: 12, color: Colors.black54)),
                  Text(
                    '主演：' + getCastsName(widget.bean.casts),
                    maxLines: 2,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
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
                Text(
                    ConversionUtils.addUnitToNum(widget.bean.collectCount) +
                        "人看过",
                    style: TextStyle(fontSize: 12, color: Colors.red)),
                Padding(
                  padding: EdgeInsets.only(left: 18, right: 18),
                  child: OutlineButton(
                    child: Text("购票", style: TextStyle(fontSize: 12, color: Colors.red)),
                    color: Colors.red,
                    textColor: Colors.red,
                    highlightedBorderColor: Colors.red,
                    borderSide: BorderSide(color: Colors.red),
                    onPressed: () {buyTicket();},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future buyTicket() async {
   String result =  await MethodChannel('douBan.movie').invokeMethod('buyTicket',widget.bean.title);
   print(result);
  }

  String getCastsName(List<Cast> casts) {
    String castName = "";
    casts.forEach((cast) => castName += cast.name + "/");

    return castName.substring(0, castName.length - 1);
  }
}
