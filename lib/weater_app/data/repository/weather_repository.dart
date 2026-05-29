import 'dart:convert';

import 'package:bloc_learning/weater_app/data/model/weather_model.dart';
import 'package:bloc_learning/weater_app/data/provider/weather_data_provider.dart';

class WeatherRepository {
  WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeather(
        'Ahmedabad',
      );
      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
