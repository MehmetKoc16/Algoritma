import 'package:flutter/material.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeatherModel> _weathers = [];
  void _getWeatherData() async {
    _weathers = await WeatherService().getWeatherData();
    setState(() {});
  }

  @override
  void initState() {
    _getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _weathers.length,
          itemBuilder: (context, index) {
            final WeatherModel model = _weathers[index];
            return Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Image.network(
                    model.icon,
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 25),
                    child: Text(
                      "${model.date} ${model.day}\n ${model.description} ${model.degree}° ${model.status}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Min: ${model.min} °"),
                          Text("Max: ${model.max} °"),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Gece: ${model.night}°"),
                          Text("Nem: ${model.humidity}")
                        ],
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
