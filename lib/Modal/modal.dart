class Weather {
  final String name;
  final Temperature temperature;
  final int humidity;
  final Wind wind;
  final double maxTemperature;
  final double minTemperature;
  final int pressure;
  final int seaLevel;
  final List<WeatherInfo> weather;

  Weather({
    required this.name,
    required this.temperature,
    required this.humidity,
    required this.wind,
    required this.maxTemperature,
    required this.minTemperature,
    required this.pressure,
    required this.seaLevel,
    required this.weather,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'] ?? '',
      temperature: Temperature.fromJson(json['main']['temp']),
      humidity: json['main']['humidity'] ?? 0,
      wind: Wind.fromJson(json['wind']),
      maxTemperature: (json['main']['temp_max'] ?? 0.0) - 273.15,
      minTemperature: (json['main']['temp_min'] ?? 0.0) - 273.15,
      pressure: json['main']['pressure'] ?? 0,
      seaLevel: json['main']['sea_level'] ?? 0,
      weather: (json['weather'] as List<dynamic>?)
          ?.map((w) => WeatherInfo.fromJson(w))
          .toList() ??
          [],
    );
  }
}

class WeatherInfo {
  final String main;

  WeatherInfo({required this.main});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      main: json['main'] ?? '',
    );
  }
}

class Temperature {
  final double current;

  Temperature({required this.current});

  factory Temperature.fromJson(dynamic json) {
    return Temperature(
      current: ((json ?? 0.0) - 273.15),
    );
  }
}

class Wind {
  final double speed;

  Wind({required this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(speed: (json['speed'] ?? 0.0).toDouble());
  }
}
