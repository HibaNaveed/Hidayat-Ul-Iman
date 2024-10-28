import 'dart:convert';

import 'package:flutter/material.dart';
// for json data
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DuaScreen extends StatefulWidget {
  const DuaScreen({super.key});

  @override
  State<DuaScreen> createState() => _DuaScreenState();
}

class _DuaScreenState extends State<DuaScreen> {
  List duas = [];
  Future<void> duaData() async {
    final String response =
        await rootBundle.loadString('assets/jsonData/chapters.json');
    duas = jsonDecode(response);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Supplications")),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color(0xff0c1427),
      ),
      body: ListView.builder(
        itemCount: duas.length,
        itemBuilder: (context, index) {
          return Card(
              margin: const EdgeInsets.all(8),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color(0xffb1ccf9),
                  )),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailDuas(duas[index]["chapter_number"]),
                        // builder: (context) => DetailDuas(index),
                      ));
                },
                leading: CircleAvatar(
                  child: Text(duas[index]["chapter_number"]),
                ),
                title: Text(
                  duas[index]["arabic_name"],
                  style: GoogleFonts.amiriQuran(),
                ),
                subtitle: Text(duas[index]["english_name"]),
              ));
        },
      ),
    );
  }
}

class DetailDuas extends StatefulWidget {
  var indexnum;
  DetailDuas(this.indexnum, {super.key});

  @override
  State<DetailDuas> createState() => _DetailDuasState();
}

class _DetailDuasState extends State<DetailDuas> {
  Map duas = {};
  List duasList = [];

  Future<void> duaData() async {
    final String response =
        await rootBundle.loadString('assets/jsonData/hisn_ul_muslim.json');
    String chapter_number = "(" + widget.indexnum + ")";
    duas = jsonDecode(response);
    duasList = duas[chapter_number]["hadiths"];
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    duaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Supplications")),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color(0xff0c1427),
      ),
      body: ListView.builder(
        itemCount: duasList.length,
        itemBuilder: (context, index) {
          return Card(
              margin: const EdgeInsets.all(8),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color(0xffb1ccf9),
                  )),
              child: ListTile(
                title: Text(
                  duasList[index]["arabic_hadith"],
                  style: GoogleFonts.amiriQuran(),
                  textDirection: TextDirection.rtl,
                ),
                subtitle: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      duasList[index]["english_hadith"],
                      // style: GoogleFonts.roboto(),
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
