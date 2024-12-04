import 'package:flutter/material.dart';

enum Weekday {
  mon('Mon'),
  tue('Tue'),
  wed('Wed'),
  thu('Thu'),
  fri('Fri'),
  sat('Sat'),
  sun('Sun');

  final String shortName;
  const Weekday(this.shortName);
}

enum ForecastCondition {
  sunny('assets/weather/sunny.jpg'),
  cloudy('assets/weather/cloudy.jpg'),
  rainy('assets/weather/rainy.jpg'),
  snowy('assets/weather/snowy.jpg'),
  stormy('assets/weather/stormy2.jpg');

  final String iconPath;
  const ForecastCondition(this.iconPath);
}

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    super.key,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.day,
  });

  final int minTemp;
  final int maxTemp;
  final ForecastCondition condition;
  final Weekday day;

  String get iconPath => condition.iconPath;
  String get dayLabel => day.shortName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE3F2FD), Color(0xFF90CAF9)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image.asset(iconPath, width: 42, height: 42),
              const SizedBox(height: 5),
              Text(dayLabel,
                  style: const TextStyle(fontSize: 16, color: Colors.black87)),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$minTemp°C",
                  style: TextStyle(fontSize: 18, color: Colors.grey[500])),
              const Text("Min",
                  style: TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("$maxTemp°C",
                  style: const TextStyle(fontSize: 18, color: Colors.black)),
              const Text("Max",
                  style: TextStyle(fontSize: 14, color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        title: const Text('Weekly Forecast',
            style: TextStyle(fontSize: 18, color: Colors.white)),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: const [
            ForecastCard(
                minTemp: 17,
                maxTemp: 25,
                condition: ForecastCondition.sunny,
                day: Weekday.mon),
            ForecastCard(
                minTemp: 15,
                maxTemp: 23,
                condition: ForecastCondition.cloudy,
                day: Weekday.tue),
            ForecastCard(
                minTemp: 14,
                maxTemp: 22,
                condition: ForecastCondition.rainy,
                day: Weekday.wed),
            ForecastCard(
                minTemp: 13,
                maxTemp: 21,
                condition: ForecastCondition.snowy,
                day: Weekday.thu),
            ForecastCard(
                minTemp: 12,
                maxTemp: 20,
                condition: ForecastCondition.stormy,
                day: Weekday.fri),
            ForecastCard(
                minTemp: 11,
                maxTemp: 19,
                condition: ForecastCondition.sunny,
                day: Weekday.sat),
            ForecastCard(
                minTemp: 10,
                maxTemp: 18,
                condition: ForecastCondition.cloudy,
                day: Weekday.sun),
          ],
        ),
      ),
    ),
  ));
}
