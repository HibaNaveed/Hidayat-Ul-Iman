import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class Tafaseer extends StatefulWidget {
  const Tafaseer({super.key});

  @override
  State<Tafaseer> createState() => _TafaseerState();
}

class _TafaseerState extends State<Tafaseer> {
  List listresp = [];

  Future check() async {
    try {
      http.Response response =
          await http.get(Uri.parse("http://api.quran-tafseer.com/tafseer/"));

      if (response.statusCode == 200) {
        setState(() {

          var name= utf8.decode(response.bodyBytes) ;
          print("SEHN=>"+name);
          listresp =  jsonDecode(name) ;
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Tafaseer Books"),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color(0xff0c1427),
      ),
      body: listresp.isNotEmpty
          ? ListView.builder(
              itemCount: listresp.length,
              itemBuilder: (context, index) {

                print(listresp[index]["name"]);
                return Card(
                  margin: const EdgeInsets.all(8),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color(0xffb1ccf9),
                      )),
                  child: ListTile(
                    onTap: () {
                      var bookslug = listresp[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TafseerDetail(book: bookslug),
                        ),
                      );
                    },
                    title: Text(listresp[index]["name"], style: GoogleFonts.amiri(),textDirection: TextDirection.rtl,),
                    subtitle: Text(listresp[index]["author"] ?? "Unknown Author"),
                    leading: CircleAvatar(
                      child: Text(listresp[index]["id"].toString()),
                    ),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class TafseerDetail extends StatelessWidget {
  final dynamic book;

  const TafseerDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tafseer Details")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${book['name']}"),
            Text("Author: ${book['author']}"),
          ],
        ),
      ),
    );
  }
}

