import 'package:flutter/material.dart';

enum WeatherCondition {
  sunny(image: 'assets/W4-S1-Practice/sunny.png'),
  rainy(image: 'assets/W4-S1-Practice/rainny.png'),
  cloudy(image: 'assets/W4-S1-Practice/cloudy.png'),
  snowy(image: 'assets/W4-S1-Practice/snowy.png');

  final String image;

  const WeatherCondition({required this.image});
}

enum DayOfWeek { 
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

class WeatherCard extends StatelessWidget {
  final WeatherCondition weatherCondition;
  final double minTemperature;
  final double maxTemperature;
  final DayOfWeek dayOfWeek;

  const WeatherCard({
    super.key,
    required this.weatherCondition,
    required this.minTemperature,
    required this.maxTemperature,
    required this.dayOfWeek,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [Colors.blue[100]!, Colors.blue[300]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            getDayOfWeekName(dayOfWeek),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            weatherCondition.image,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 5),
          Text(
            '$minTemperature°C - $maxTemperature°C',
            style: const TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  String getDayOfWeekName(DayOfWeek dayOfWeek) {
    switch (dayOfWeek) {
      case DayOfWeek.monday:
        return 'Monday';
      case DayOfWeek.tuesday:
        return 'Tuesday';
      case DayOfWeek.wednesday:
        return 'Wednesday';
      case DayOfWeek.thursday:
        return 'Thursday';
      case DayOfWeek.friday:
        return 'Friday';
      case DayOfWeek.saturday:
        return 'Saturday';
      case DayOfWeek.sunday:
        return 'Sunday';
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Weekly Weather Forecast',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 200),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherCard(
                    weatherCondition: WeatherCondition.sunny,
                    minTemperature: 15,
                    maxTemperature: 30,
                    dayOfWeek: DayOfWeek.sunday,
                  ),
                  WeatherCard(
                    weatherCondition: WeatherCondition.cloudy,
                    minTemperature: 12,
                    maxTemperature: 25,
                    dayOfWeek: DayOfWeek.monday,
                  ),
                  WeatherCard(
                    weatherCondition: WeatherCondition.cloudy,
                    minTemperature: 14,
                    maxTemperature: 26,
                    dayOfWeek: DayOfWeek.tuesday,
                  ),
                  WeatherCard(
                    weatherCondition: WeatherCondition.rainy,
                    minTemperature: 10,
                    maxTemperature: 15,
                    dayOfWeek: DayOfWeek.wednesday,
                  ),
                  WeatherCard(
                    weatherCondition: WeatherCondition.snowy,
                    minTemperature: -3,
                    maxTemperature: 4,
                    dayOfWeek: DayOfWeek.thursday,
                  ),
                  WeatherCard(
                    weatherCondition: WeatherCondition.snowy,
                    minTemperature: -2,
                    maxTemperature: 6,
                    dayOfWeek: DayOfWeek.friday,
                  ),
                  WeatherCard(
                    weatherCondition: WeatherCondition.rainy,
                    minTemperature: 12,
                    maxTemperature: 18,
                    dayOfWeek: DayOfWeek.saturday,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
