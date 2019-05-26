import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/bean/HotMovieBean.dart';
import 'package:flutter_doubanmovie/hot/HotMovieItemWeiget.dart';

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
    HotMovieBean bean = HotMovieBean("阿拉丁", 7.8, "盖·里奇", "保罗·加索尔/科比·布莱恩特/威尔·史密斯", 33000, "https://img1.doubanio.com/view/photo/l/public/p2552189198.webp");
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
    datas.add(bean);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
        itemCount: datas?.length,
        separatorBuilder: (BuildContext context, int index) => Divider(height: 1,color: Colors.black12,),
        itemBuilder: (BuildContext context, int index) => HotMovieItemWeiget(datas.elementAt(index)),
      ),
    );
  }
}
