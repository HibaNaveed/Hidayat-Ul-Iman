// hadith section
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Hadithindex extends StatefulWidget {
  const Hadithindex({super.key});

  @override
  State<Hadithindex> createState() => _HadithindexState();
}

class _HadithindexState extends State<Hadithindex> {
  late Map mapresp = {};
  late List listresp = [];
  Future check() async {
    var apikey =
        "\$2y\$10\$MdvmkF8IO03GeB49PKhcCOtfVdEEF5izh2XMEslCp4NmkPrQ7zu";
    http.Response response = await http
        .get(Uri.parse("https://www.hadithapi.com/api/books?apiKey=$apikey"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp = jsonDecode(response.body);
        listresp = mapresp["books"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Hadith Books"),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color(0xff0c1427),
      ),
      body: listresp.isNotEmpty
          ? ListView.builder(
              itemCount: listresp == null ? 0 : listresp.length,
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
                        var bookslug = listresp[index]["bookSlug"];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Hadithchapter(bookslug),
                            ));
                      },
                      title: Text(listresp[index]["bookName"]),
                      subtitle: Text(listresp[index]["writerName"]),
                      leading: CircleAvatar(
                        child: Text(listresp[index]["id"].toString()),
                      ),
                      trailing: Column(
                        children: [
                          Text("Hadith" +
                              " " +
                              listresp[index]["hadiths_count"]),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Chapters" +
                              " " +
                              listresp[index]["chapters_count"]),
                        ],
                      )),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class Hadithchapter extends StatefulWidget {
  var bookslug;
  Hadithchapter(this.bookslug, {super.key});

  @override
  State<Hadithchapter> createState() => _HadithchapterState();
}

class _HadithchapterState extends State<Hadithchapter> {
  late Map mapresp1 = {};
  late List listresp1 = [];
  Future check() async {
    var bookname = widget.bookslug;
    var apikey =
        "\$2y\$10\$MdvmkF8IO03GeB49PKhcCOtfVdEEF5izh2XMEslCp4NmkPrQ7zu";
    http.Response response = await http.get(Uri.parse(
        "https://www.hadithapi.com/api/$bookname/chapters?apiKey=$apikey"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp1 = jsonDecode(response.body);
        listresp1 = mapresp1["chapters"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Hadith Chapters"),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color(0xff0c1427),
      ),
      body: listresp1.isNotEmpty
          ? ListView.builder(
              itemCount: listresp1 == null ? 0 : listresp1.length,
              itemBuilder: (context, index) {
                // final book = listresp1[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color(0xffb1ccf9),
                      )),
                  child: ListTile(
                    onTap: () {
                      var bookslug = listresp1[index]["bookSlug"];
                      var chapnum = listresp1[index]["chapterNumber"];

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Hadithhadiths(bookslug, chapnum),
                          ));
                    },
                    title: Text(
                      listresp1[index]["chapterArabic"],
                      style: GoogleFonts.amiriQuran(),
                      textDirection: TextDirection.rtl,
                    ),
                    subtitle: Text(
                      listresp1[index]["chapterUrdu"],
                      style: TextStyle(fontFamily: "jameel"),
                      textDirection: TextDirection.rtl,
                    ),
                    // trailing: Text(listresp1[index]["bookSlug"]),
                    trailing: CircleAvatar(
                      child: Text(
                        listresp1[index]["id"].toString(),
                        // textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class Hadithhadiths extends StatefulWidget {
  var bookslug;
  var chapnum;
  Hadithhadiths(this.bookslug, this.chapnum, {super.key});

  @override
  State<Hadithhadiths> createState() => _HadithhadithsState();
}

class _HadithhadithsState extends State<Hadithhadiths> {
  late Map mapresp2 = {};
  late List listresp2 = [];
  Future check() async {
    var bookname = widget.bookslug;
    var chapnum = widget.chapnum;
    var apikey =
        "\$2y\$10\$MdvmkF8IO03GeB49PKhcCOtfVdEEF5izh2XMEslCp4NmkPrQ7zu";
    http.Response response = await http.get(Uri.parse(
        "https://www.hadithapi.com/api/hadiths?apiKey=$apikey&book=$bookname&chapter=$chapnum&paginate=100000"));

    if (response.statusCode == 200) {
      setState(() {
        //  responsedata=response.body;

        mapresp2 = jsonDecode(response.body);
        listresp2 = mapresp2["hadiths"]["data"];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Hadith"),
          // child: Text(listresp2[index]["chapterArabic"] ?? ""),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: const Color(0xff0c1427),
      ),
      body: listresp2.isNotEmpty
          ? ListView.builder(
              itemCount: listresp2 == null ? 0 : listresp2.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color(0xffb1ccf9),
                      )),
                  child: ListTile(
                      // onTap: () {
                      //   var bookslug = listresp2[index]["bookSlug"];
                      //   var chapnum = listresp2[index]["chapterNumber"];
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) =>
                      //             Hadithhadiths(bookslug, chapnum),
                      //       ));
                      // },
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              listresp2[index]["hadithNumber"] ?? " ",
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.amiriQuran(),
                            ),
                            SizedBox(height: 8),
                            // Text(
                            //   listresp2[index]["status"] ?? " ",
                            //   textDirection: TextDirection.rtl,
                            //   style: GoogleFonts.amiriQuran(),
                            // ),
                            Text(
                              listresp2[index]["headingArabic"] ?? " ",
                              textDirection: TextDirection.rtl,
                              style: GoogleFonts.amiriQuran(),
                            ),
                            SizedBox(
                              height: 8,
                            )
                          ]),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            listresp2[index]["hadithArabic"],
                            textDirection: TextDirection.rtl,
                            style: GoogleFonts.amiri(),
                          ),
                          SizedBox(height: 8),
                          Text(
                            listresp2[index]["hadithUrdu"],
                            textDirection: TextDirection.rtl,
                            style: TextStyle(fontFamily: "jameel"),
                          ),
                          SizedBox(height: 8),
                          Text(listresp2[index]["hadithEnglish"]),
                        ],
                      )
                      // trailing: Text(listresp1[index]["bookSlug"]),
                      // leading: CircleAvatar(
                      //   child: Text(listresp1[index]["id"].toString()),
                      // ),
                      ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
