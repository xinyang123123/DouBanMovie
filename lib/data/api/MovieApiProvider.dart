import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_doubanmovie/data/bean/HotMovieBean.dart';

class MovieApiProvider {

  Future<List<HotMovieBean>> getHotMovies(String city,
      {int start, int count}) async {
    List<HotMovieBean> list = List();
    var url =
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=$city&start=${start ?? 0}&count=${count ?? 10}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      for (dynamic item in responseJson["subjects"]) {
        var bean = HotMovieBean.fromMap(item);
        list.add(bean);
      }
    }
    return list;
  }
}
