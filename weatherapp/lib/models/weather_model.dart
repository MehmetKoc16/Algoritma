class WeatherModel {
  final String date;
  final String day;
  final String icon;
  final String description;
  final String status;
  final String degree;
  final String min;
  final String max;
  final String night;
  final String humidity;

  WeatherModel(
      {required this.date,
      required this.day,
      required this.icon,
      required this.description,
      required this.status,
      required this.degree,
      required this.min,
      required this.max,
      required this.night,
      required this.humidity});

  WeatherModel.fromJson(Map<String, dynamic> json)
      : date = json["date"] ?? "Bilinmiyor",
        day = json["day"] ?? "Bilinmiyor",
        icon = json["icon"] ?? "Bilinmiyor",
        description = json["description"] ?? "Bilinmiyor",
        status = json["status"] ?? "Bilinmiyor",
        degree = json["degree"] ?? "Bilinmiyor",
        min = json["min"] ?? "Bilinmiyor",
        max = json["max"] ?? "Bilinmiyor",
        night = json["night"] ?? "Bilinmiyor",
        humidity = json["humidity"] ?? "Bilinmiyor";
}
