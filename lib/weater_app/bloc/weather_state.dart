part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSucsess extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSucsess({required this.weatherModel});
}

final class WeatherLoaing extends WeatherState {}

final class WeatherFailure extends WeatherState {
  final String message;

  WeatherFailure(this.message);
}
