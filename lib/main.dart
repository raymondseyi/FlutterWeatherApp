import 'package:flutter/material.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/loading.dart';
import 'package:weatherapp/pages/search_by_city.dart';
void main() {

  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        "/":(context)=>Loading(),
        "/home":(context)=>MyApp(),
        "/seachbycity":(context)=>SearchByCity()
      },
    );
  }
}

