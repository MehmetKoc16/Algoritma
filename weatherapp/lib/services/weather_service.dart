import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  Future<String> _getLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Konum izniniz kapalı");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error("Konum izni vermelisiniz");
      }
    }
    final Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    ));
    final List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemark.isEmpty) {
      return Future.error("Adres bilgisi bulunamadı");
    }
    final String? city = placemark[0].administrativeArea;
    if (city == null) Future.error("Bir sorun olultu");
    return city!;
  }

  Future<List<WeatherModel>> getWeatherData() async {
    final String city = await _getLocation();
    final String url =
        "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city";
    final Map<String, dynamic> headers = {
      "authorization": "apikey 1oqGF0Gn8lifA0WlvIUDW2:2LTFiBDHtghi3tSrqdceJy",
      "content-type": "application/json",
    };
    final dio = Dio();
    final response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode != 200) {
      return Future.error("Bir hata oluştu");
    }
    final List list = response.data["result"];

    final List<WeatherModel> weatherlist =
        list.map((e) => WeatherModel.fromJson(e)).toList();
    return weatherlist;
  }
}
