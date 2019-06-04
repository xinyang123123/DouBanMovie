import 'package:bloc/bloc.dart';
import 'package:flutter_doubanmovie/data/bean/HotMovieBean.dart';
import 'package:flutter_doubanmovie/data/repository/MovieRepository.dart';

class HotMoivesEvent{
 String _city;

  HotMoivesEvent(this._city);

  get city => _city;
}

class HotMoviesState{
  List<HotMovieBean> _list;

  HotMoviesState(this._list);

  get data => _list;
}

class HotMoviesBloc extends Bloc<HotMoivesEvent,HotMoviesState> {

  var _movieRepository = MovieRepository();

  @override
  HotMoviesState get initialState => HotMoviesState(null);

  @override
  Stream<HotMoviesState> mapEventToState(HotMoivesEvent event) async*{
    List<HotMovieBean> hotMovies = await _movieRepository.getHotMovies(event.city);
    yield HotMoviesState(hotMovies);
  }
  
}
