import 'package:flutter/material.dart';
import 'package:weatherapp/models/weathermodel.dart';
import 'package:weatherapp/pages/search_by_city.dart';

class MyApp extends StatefulWidget {
  final weatherDetails;
  MyApp({this.weatherDetails});
  // const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  WeatherModel weather = WeatherModel();
  double temp = 0;
  String town = "";
  String main = "";
  String description = "";
  String icon = "";
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherDetails);
  }

  void updateUI(weatherDetails) {
    setState(() {
      temp = weatherDetails["main"]["temp"];
      town = weatherDetails["name"];
      main = weatherDetails["weather"][0]["main"];
      description = weatherDetails["weather"][0]["description"];
      icon = weatherDetails["weather"][0]["icon"];
      print(temp);
      print(town);
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Blood.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Text(
                        '${temp.toString()}°C',
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                      Text(
                        '${town}',
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 30,
                              image: NetworkImage(
                                  "https://openweathermap.org/img/wn/${icon}@2x.png"),
                            ),
                            Text(
                              '${main}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                           
                            
                          ],
                        ),
                      ),
                       Text(
                              '${description}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.0),
                            ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size.infinite),
                    maximumSize: MaterialStatePropertyAll(Size.infinite),
                    backgroundColor: MaterialStatePropertyAll(
                      Color(0xFF2D2758),
                    ),
                  ),
                  onPressed: () async {
                    var cityname = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchByCity(),
                      ),
                    );

                    if (cityname != null) {
                      var data = await weather.getByCity(cityname);
                      updateUI(data);
                    }
                  },
                  child: Text("Search by City Name"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
