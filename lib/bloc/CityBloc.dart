import 'package:bloc/bloc.dart';
import 'package:flutter_doubanmovie/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityEvent {
  String _city;

  CityEvent(this._city);

  get city => _city;
}

class CityState {
  String _city;

  CityState(this._city);

  get city => _city;
}

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() {
    initData();
  }

  @override
  CityState get initialState => CityState(null);

  @override
  Stream<CityState> mapEventToState(CityEvent event) async* {
    yield new CityState(event.city);
  }

  Future initData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    var selCity = sp.getString(Constants.SP_SEL_CITY);
    dispatch(CityEvent(selCity));
  }
}
