import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doubanmovie/bloc/HotMoviesBloc.dart';
import 'package:flutter_doubanmovie/data/bean/HotMovieBean.dart';

import 'HotMovieItemWeiget.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<HotMoviesBloc>(context),
        builder: (context, hotMoviesState) {
          datas = hotMoviesState?.data;
          
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
        });
  }
}
