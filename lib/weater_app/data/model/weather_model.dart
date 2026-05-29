import 'dart:convert';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;
  final List<HourlyForecastModel> hourlyForecasts;

  const WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyForecasts,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final currentWeather = map['list'][0];

    return WeatherModel(
      currentTemp: (currentWeather['main']['temp'] as num).toDouble(),
      currentSky: currentWeather['weather'][0]['main'] as String,
      currentPressure: currentWeather['main']['pressure'] as int,
      currentWindSpeed: (currentWeather['wind']['speed'] as num).toDouble(),
      currentHumidity: currentWeather['main']['humidity'] as int,
      hourlyForecasts: (map['list'] as List)
          .skip(1)
          .map(
            (forecast) =>
                HourlyForecastModel.fromMap(forecast as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(jsonDecode(source));
}

class HourlyForecastModel {
  final double temp;
  final String sky;
  final DateTime time;

  const HourlyForecastModel({
    required this.temp,
    required this.sky,
    required this.time,
  });

  factory HourlyForecastModel.fromMap(Map<String, dynamic> map) {
    return HourlyForecastModel(
      temp: (map['main']['temp'] as num).toDouble(),
      sky: map['weather'][0]['main'] as String,
      time: DateTime.parse(map['dt_txt'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {'temp': temp, 'sky': sky, 'time': time.toIso8601String()};
  }
}
