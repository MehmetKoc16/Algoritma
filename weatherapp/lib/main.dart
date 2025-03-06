import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home_page.dart';

void main() {
  runApp(const Weatherapp());
}

class Weatherapp extends StatefulWidget {
  const Weatherapp({super.key});

  @override
  State<Weatherapp> createState() => _WeatherappState();
}

class _WeatherappState extends State<Weatherapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
