class Weather {
  final String CityName;
  final double temp;
  final String Description;
  final int humidity;
  final double windspeed;
  final int sunset;
  final int sunrise;

  Weather(
      {required this.CityName,
      required this.Description,
      required this.humidity,
      required this.sunrise,
      required this.sunset,
      required this.temp,
      required this.windspeed});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        CityName: json['name'],
        Description: json['weather']['description'],
        humidity: json['main']['humidity'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        temp: json['main']['temp'],
        windspeed: json['wind']['speed']);
  }
}
