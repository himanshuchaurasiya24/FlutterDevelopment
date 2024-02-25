import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'additional_info_item.dart';
import 'hourly_forcast_item.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

String kToCel(dynamic kelvin) {
  dynamic cel = (kelvin - 273.15);
  return cel.toStringAsFixed(2);
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;
  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=ghazipur,in&APPID=22ef46c7aeb0cdaff9cc149680e634f0'),
      );
      final data = jsonDecode(res.body);
      if (data['cod'] != '200') {
        throw data['message'];
      }
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  weather = getCurrentWeather();
                });
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'An Error Occured',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }

          final data = snapshot.data!;
          final currentTemp = data['list'][0]['main']['temp'];
          final currentTempInCel = kToCel(currentTemp);
          final currentSky = data['list'][0]['weather'][0]['main'];
          final currentPressure = data['list'][0]['main']['pressure'];
          final currentWindSpeed = data['list'][0]['wind']['speed'];
          final currentHumidity = data['list'][0]['main']['humidity'];
          final cityName = data['city']['name'];

          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // main card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Text(
                                  '$cityName IN',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40),
                                ),
                                Text(
                                  '$currentTempInCel C',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                                ),
                                Icon(
                                  currentSky == 'Clouds' || currentSky == 'Rain'
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 64,
                                ),
                                Text(
                                  currentSky,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Hourly Forecast',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 138,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final hourlyForecast = data['list'][index + 1];
                        final hourlySky =
                            data['list'][index + 1]['weather'][0]['main'];
                        // final time = DateTime.parse(hourlyForecast['dt_txt']);
                        final time = hourlyForecast['dt_txt'];
                        final temp1 = hourlyForecast['main']['temp'] + 0.0;
                        // data['list'][0]['main']['temp']
                        String temp = kToCel(temp1);
                        return HourlyForcastItem(
                          // time: DateFormat.jm().format(time),
                          time: time,
                          icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                              ? Icons.cloud
                              : Icons.sunny,
                          value: '$temp C',
                          currentSky: hourlySky,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // additional information
                  const Text(
                    'Additional Information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInfoItem(
                            icon: Icons.water_drop,
                            label: 'Humidity',
                            valueText: '$currentHumidity'),
                        AdditionalInfoItem(
                            icon: Icons.air,
                            label: 'Wind Speed',
                            valueText: '$currentWindSpeed'),
                        AdditionalInfoItem(
                          icon: Icons.beach_access,
                          label: 'Pressure',
                          valueText: '$currentPressure',
                        )
                      ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
