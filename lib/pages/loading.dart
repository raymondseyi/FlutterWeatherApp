import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/pages/home.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void initState() {
    super.initState();
    fetchWeather();
  }
  void fetchWeather() async {
    WeatherModel instance = WeatherModel();
    Map data = await instance.getWeatherDetails();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyApp(weatherDetails: data),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
