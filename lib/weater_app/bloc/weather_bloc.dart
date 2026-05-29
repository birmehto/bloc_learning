import 'package:bloc_learning/weater_app/data/model/weather_model.dart';
import 'package:bloc_learning/weater_app/data/repository/weather_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFeached>(_getWeather);
  }

  Future<void> _getWeather(WeatherFeached event, Emitter emit) async {
    emit(WeatherLoaing());
    try {
      final weather = await weatherRepository.getCurrentWeather();

      emit(WeatherSucsess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
