 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Modal/modal.dart';
import 'infocard.dart';


class WeatherDetail extends StatelessWidget {
  final Weather weather;
  final String formattedDate;
  final String formattedTime;
  const WeatherDetail({
    super.key,
    required this.weather,
    required this.formattedDate,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // current address
        Text(
          weather.name,
          style:  GoogleFonts.poppins(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        // current temperature
        Text(
          "${weather.temperature.current.toStringAsFixed(2)}°C",
          style:  GoogleFonts.poppins(
            fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        // weather condition
        if (weather.weather.isNotEmpty)
          Text(
            weather.weather[0].main,
            style:  GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
         SizedBox(height: scrHeight*.05),
        // date and time
        Text(
          formattedDate,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          formattedTime,
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(height: scrHeight*.03),
        Container(
          height: 200,
          width: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/th-removebg-preview.png"),
            ),
          ),
        ),
        SizedBox(height: scrHeight*.03),
        // more details
        Container(
          height: scrHeight*.265,
          decoration: BoxDecoration(
            color: Color(0xFF372367),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: scrWidth*.03, horizontal: scrHeight*.011),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wind_power,
                          color: Colors.white,
                        ),
                         SizedBox(height: scrHeight*.02),
                        InfoCard(
                          title: "Wind",
                          value: "${weather.wind.speed} km/h",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        SizedBox(height: scrHeight*.02),
                        InfoCard(
                          title: "Max",
                          value:
                          "${weather.maxTemperature.toStringAsFixed(2)}°C",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.wind_power,
                          color: Colors.white,
                        ),
                        SizedBox(height: scrHeight*.02),
                        InfoCard(
                          title: "Min",
                          value:
                          "${weather.minTemperature.toStringAsFixed(2)}°C",
                        ),
                      ],
                    ),
                  ],
                ),
                 Padding(
                   padding: EdgeInsets.symmetric(vertical: scrHeight*.0001),
                   child: Divider(),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.water_drop,
                          color: Colors.amber,
                        ),
                        SizedBox(height: scrHeight*.02),
                        InfoCard(
                          title: "Humidity",
                          value: "${weather.humidity}%",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.air,
                          color: Colors.amber,
                        ),
                        SizedBox(height: scrHeight*.02),
                        InfoCard(
                          title: "Pressure",
                          value: "${weather.pressure} hPa",
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.leaderboard,
                          color: Colors.amber,
                        ),
                        SizedBox(height: scrHeight*.02),
                        InfoCard(
                          title: "Sea-Level",
                          value: "${weather.seaLevel} m",
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}