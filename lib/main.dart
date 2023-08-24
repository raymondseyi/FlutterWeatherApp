import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/loading.dart';
import 'package:weatherapp/pages/search_by_city.dart';
void main() async{
  await dotenv.load();
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
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context)=>Loading(),
        "/home":(context)=>MyApp(),
        "/seachbycity":(context)=>SearchByCity()
      },
    );
  }
}

