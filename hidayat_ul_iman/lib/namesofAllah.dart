import 'package:flutter/material.dart';
import 'package:asmaulhusna/asmaulhusna.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: namesofallah(),
    );
  }
}

class namesofallah extends StatefulWidget {
  const namesofallah({Key? key}) : super(key: key);

  @override
  State<namesofallah> createState() => _namesofallahState();
}

List<Text> nintynineNamesInEnglish() {
  List<Text> names = [];
  int i = 1;
  getEveryEnglishName().forEach((element) {
    names.add(Text('${i.toString()} - $element'));
    i++;
  });
  return names;
}

class _namesofallahState extends State<namesofallah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg1.jpg"),
          fit: BoxFit.cover,
        )),
        width: double.infinity,
        height: double.infinity,
        child: PageView.builder(
          // physics: ClampingScrollPhysics(), // Disable bounce effect
          itemCount: 99,
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    getArabicName(index + 1),
                    style: GoogleFonts.amiri(fontSize: 40, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    getEnglishName(index + 1),
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    getDescritption(index + 1),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
