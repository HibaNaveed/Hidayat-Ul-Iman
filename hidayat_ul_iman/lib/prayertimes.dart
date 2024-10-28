import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Prayertimes(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Prayertimes extends StatefulWidget {
  const Prayertimes({super.key});

  @override
  State<Prayertimes> createState() => _PrayertimesState();
}

class _PrayertimesState extends State<Prayertimes> {
  var time = DateTime.now();
  final myCoordinates = Coordinates(24.8607, 67.0011);
  PrayerTimes? todayPrayerTimes;

  @override
  void initState() {
    super.initState();
    _calculatePrayerTimes();
  }

  void _calculatePrayerTimes() {
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(
      myCoordinates,
      params,
    );
    setState(() {
      todayPrayerTimes = prayerTimes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 6, 50),
        title: Center(
            child: Center(
          child: Text('Karachi, PK | کراچی، پاکستان',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        )),
      ),
      body: todayPrayerTimes == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
              padding: EdgeInsets.all(16),
              children: [
                Center(
                  child: Text(
                    DateFormat("EEEE, d MMMM yyyy | hh:mm a")
                        .format(DateTime.now()),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                _buildPrayerCard("Fajr", todayPrayerTimes!.fajr),
                _buildPrayerCard("Sunrise", todayPrayerTimes!.sunrise),
                _buildPrayerCard("Dhuhr", todayPrayerTimes!.dhuhr),
                _buildPrayerCard("Asr", todayPrayerTimes!.asr),
                _buildPrayerCard("Maghrib", todayPrayerTimes!.maghrib),
                _buildPrayerCard("Isha", todayPrayerTimes!.isha),
              ],
            ),
    );
  }

  Widget _buildPrayerCard(String title, DateTime time) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xffb1ccf9))),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        trailing: Text(DateFormat("jm").format(time)),
      ),
    );
  }
}
