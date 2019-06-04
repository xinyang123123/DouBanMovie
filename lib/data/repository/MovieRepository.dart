import 'package:flutter_doubanmovie/data/api/MovieApiProvider.dart';
import 'package:flutter_doubanmovie/data/bean/HotMovieBean.dart';

class MovieRepository {

  MovieApiProvider _movieApiProvider = MovieApiProvider();

  Future<List<HotMovieBean>> getHotMovies(String city, {int start, int count}) {
   return _movieApiProvider.getHotMovies(city, start: start, count: count);
  }
}
