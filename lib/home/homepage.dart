import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.services.dart';
import '../Modal/modal.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final WeatherServices _weatherServices = WeatherServices();
  final TextEditingController _controller = TextEditingController();
  bool _isloading = false;

  Weather? _weather;
  void _getWeather() async {
    setState(() {
      _isloading = true;
    });

    try {
      final weather = await _weatherServices.fetchWeather(_controller.text);
      setState(() {
        _weather = weather as Weather?;
        _isloading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ERROR!  fetchinng data in a while')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: _weather != null
              ? (_weather!.Description.toLowerCase().contains('rain')
              ? const LinearGradient(
              colors: [Colors.grey, Colors.blueGrey],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
              : (_weather!.Description.toLowerCase().contains('clear')
              ? const LinearGradient(
              colors: [Colors.orangeAccent, Colors.blueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
              : const LinearGradient(
              colors: [Colors.blue, Colors.indigo],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)))
              : const LinearGradient(
              colors: [Colors.blue, Colors.indigo],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Weather App",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter city',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _getWeather,
                  child: _isloading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                      : const Text('Get Weather'),
                ),
                const SizedBox(height: 20),
                if (_weather != null) ...[
                  Text(
                    'City: ${_weather!.CityName}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Temperature: ${_weather!.temp}°C',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Description: ${_weather!.Description}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
