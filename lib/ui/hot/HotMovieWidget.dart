import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/bloc/CityBloc.dart';
import 'package:flutter_doubanmovie/bloc/HotMoviesBloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Constants.dart';
import '../../Routes.dart';
import 'HotMovieListWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiver/strings.dart' as strings;

class HotMovieWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotMovieWidgetState();
  }
}

class HotMovieWidgetState extends State<HotMovieWidget> {
  @override
  Widget build(BuildContext context) {
    var blocBuilder = BlocBuilder(
        bloc: CityBloc(),
        builder: (context, cityState) {
          if (strings.isEmpty(cityState?.city)) {
            return Center(child: CircularProgressIndicator());
          } else {
            BlocProvider.of<HotMoviesBloc>(context)
                .dispatch(HotMoivesEvent(cityState.city));
            return buildColumn(cityState, context);
          }
        });
    return blocBuilder;
  }

  Column buildColumn(cityState, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          height: 80,
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  cityState.city,
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () => navigationToCity(),
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
                        HotMovieListWidget(),
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

  void navigationToCity() async {
    var selCity =
        await Navigator.pushNamed(context, Routes.CITY, arguments: BlocProvider.of<CityBloc>(context).currentState.city);

    if (selCity == null) return;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.SP_SEL_CITY, selCity); //存取数据

    BlocProvider.of<CityBloc>(context).dispatch(CityEvent(selCity));
  }
}
