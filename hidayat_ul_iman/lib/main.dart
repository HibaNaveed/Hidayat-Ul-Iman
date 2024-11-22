import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidayat_ul_iman/HadithScreen.dart';
import 'package:hidayat_ul_iman/QuranicSearchEngine.dart';
import 'package:hidayat_ul_iman/namesofAllah.dart';
import 'package:hidayat_ul_iman/Duas.dart';
import 'package:hidayat_ul_iman/JuzQuran.dart';
import 'package:just_audio/just_audio.dart';
import 'package:hidayat_ul_iman/prayertimes.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/surah_data.dart';
import 'package:hidayat_ul_iman/Tafaseer.dart';

// import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

// Home Main APP
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
      home: const Splash(),
    );
  }
}

// Title Screen
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 5),
        () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Tafaseer(),
                  ))
            });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0b1628),
        body: Center(
          child: Column(
            // alignment: Alignment.center,
            //
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/quran.png'),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(),
              Container(
                  child: Text(
                'ہدایت الایمان',
                style: GoogleFonts.amiri(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              Container(
                  child: Text(
                'Guidance of Faith',
                textAlign: TextAlign.center,
                style: GoogleFonts.caladea(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LinearProgressIndicator(),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ));
  }
}
//       body: Stack(
//         children: [
//           SizedBox(
//             height: double.infinity,
//             width: double.infinity,
//             child: Image.asset(
//               "assets/images/quran.png",
//               height: double.infinity,
//               width: double.infinity,
//               fit: BoxFit.fitHeight,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 150),
//             child: Align(
//               alignment: Alignment.center,
//               child: Column(
//                 // mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     ' ہدایت الایمان', // Arabic Text
//                     style: TextStyle(
//                       fontSize: 60,
//                       fontFamily: "diwan",
//                       color: Colors.white,
//                       // fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 10.0,
//                           color: Colors.black,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Guidance of Faith',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 10.0,
//                           color: Colors.black,
//                           offset: Offset(2.0, 2.0),
//                         ),
//                       ],
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: const Color(0xff0b1628),
//     );
//   }
// }

//Next Screen

class Nextscreen extends StatefulWidget {
  const Nextscreen({Key? key}) : super(key: key);

  @override
  State<Nextscreen> createState() => _NextscreenState();
}

class _NextscreenState extends State<Nextscreen> {
  var lt = [
    "Quran",
    "Hadith",
    "Prayer Times",
    "99 Names of Allah",
    "Supplication",
    "Quranic \n Search Engine"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "ہدایت الایمان",
            style: GoogleFonts.amiri(fontSize: 30, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff0b1628),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      child: Center(
                        child: Text(
                          "مَنْ يُرِدِ اللَّهُ بِهِ خَيْرًا يُفَقِّهْهُ فِي الدِّينِ \n (الحدیث) ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.amiri(fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  margin: EdgeInsets.only(left: 40.0, right: 15.0),
                  child: GridView.extent(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    maxCrossAxisExtent: 150,

                    // crossAxisCount: 3,
                    padding: const EdgeInsets.all(16.0),

                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageOne(),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Color(0xff0b1628),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(lt[0],
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Hadithindex(),
                              ));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4.0),
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Color(0xff0b1628),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(lt[1],
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Prayertimes(),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Color(0xff0b1628),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(lt[2],
                                    style: TextStyle(color: Colors.white))),
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => namesofallah(),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Color(0xff0b1628),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(lt[3],
                                    style: TextStyle(color: Colors.white))),
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DuaScreen(),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Color(0xff0b1628),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(lt[4],
                                    style: TextStyle(color: Colors.white))),
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Surahs(),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Color(0xff0b1628),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Center(
                              child: Text(lt[5],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white)),
                            )),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

// tabbar for index by parah & surah

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "Surah Index",
              style: TextStyle(color: Colors.white),
            )),
            backgroundColor: Color(0xff0b1628),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("By Surah"),
                ),
                Tab(
                  child: Text("ByParah"),
                )
              ],
              labelColor: Color(0xff617aea),
              unselectedLabelColor: Color(0xff97bbf9),
            ),
          ),
          body: TabBarView(children: [IndexSSCR(), QuranJuzScr()]),
        ));
  }
}

// index surah screen
class IndexSSCR extends StatefulWidget {
  const IndexSSCR({super.key});

  @override
  State<IndexSSCR> createState() => _IndexSSCRState();
}

class _IndexSSCRState extends State<IndexSSCR> {
  List<int> favoriteSurahs = [];

  void toggleFavorite(int index) {
    setState(() {
      if (favoriteSurahs.contains(index)) {
        favoriteSurahs.remove(index);
      } else {
        favoriteSurahs.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surahs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesPage(favoriteSurahs: favoriteSurahs),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final isFavorite = favoriteSurahs.contains(index + 1);
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
                          builder: (context) => PageTwo(index + 1),
                        ));
                  },
                  leading: CircleAvatar(
                      backgroundColor: Color(0xff0c1427),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(color: Colors.white),
                      )),
                  title: Text(
                      quran.getSurahName(index + 1) +
                          " | " +
                          quran.getSurahNameArabic(index + 1),
                      style: GoogleFonts.amiriQuran()),
                  subtitle: Text(quran.getSurahNameEnglish(index + 1)),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      "Verses:" + quran.getVerseCount(index + 1).toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    quran.getPlaceOfRevelation(index + 1) == 'Makkah'
                        ? Image.asset('assets/images/kaaba.png',
                            width: 25, height: 25)
                        : Image.asset('assets/images/madina.png',
                            width: 25, height: 25),
                    SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // quran.getPlaceOfRevelation(index + 1) == 'Makkah'
                        //     ? Image.asset('assets/images/kaaba.png',
                        //         width: 25, height: 25)
                        //     : Image.asset('assets/images/madina.png',
                        //         width: 25, height: 25),
                        // Text(
                        //   "Verses:" + quran.getVerseCount(index + 1).toString(),
                        //   style: TextStyle(fontSize: 12),
                        // ),

                        GestureDetector(
                          onTap: () => toggleFavorite(index + 1),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : null,
                          ),
                        ),
                      ],
                    ),
                  ])));
        },
        itemCount: quran.totalSurahCount,
      ),
    );
  }
}

// New page for displaying favorite Surahs
class FavoritesPage extends StatelessWidget {
  final List<int> favoriteSurahs;

  const FavoritesPage({super.key, required this.favoriteSurahs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Surahs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 2, 6, 50),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoriteSurahs.length,
        itemBuilder: (context, index) {
          final surahIndex = favoriteSurahs[index];
          return Card(
              margin: const EdgeInsets.all(8),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Color(0xffb1ccf9))),
              child: ListTile(
                title: Text(quran.getSurahName(surahIndex) +
                    " | " +
                    quran.getSurahNameArabic(surahIndex)),
                subtitle: Text(quran.getSurahNameEnglish(surahIndex)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageTwo(index + 1),
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}

// read and recitation screen
class PageTwo extends StatefulWidget {
  var index;
  PageTwo(this.index, {super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(255, 2, 6, 50),
            centerTitle: true,
            title: Text(
                quran.getSurahName(widget.index) +
                    " | " +
                    quran.getSurahNameArabic(widget.index),
                style: GoogleFonts.amiriQuran(
                  color: Colors.white,
                  fontSize: 12,
                )),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("Read"),
                ),
                Tab(
                  child: Text("Recitation"),
                ),
                Tab(
                  child: Text("Tafaseer"),
                )
              ],
              labelColor: Color(0xff617aea),
              unselectedLabelColor: Color(0xff97bbf9),
            ),
          ),
          body: TabBarView(
              children: [DetailSurah(widget.index), Recitation(widget.index)]),
        ));
  }
}

// read screen
class DetailSurah extends StatefulWidget {
  var index;
  DetailSurah(this.index, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: const Color.fromARGB(255, 2, 6, 50),
      //   centerTitle: true,
      //   title: Text(
      //       quran.getSurahName(widget.index) +
      //           " | " +
      //           quran.getSurahNameArabic(widget.index),
      //       style: GoogleFonts.amiriQuran(
      //         color: Colors.white,
      //         fontSize: 12,
      //       )),
      // ),
      body: Center(
          child: ListView.builder(
        itemCount: quran.getVerseCount(widget.index),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Color(0xffb1ccf9))),
            child: ListTile(
              title: Text(
                quran.getVerse(widget.index, index + 1, verseEndSymbol: true),
                style: GoogleFonts.amiriQuran(),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                quran.getVerseTranslation(widget.index, index + 1),
                style: GoogleFonts.amiriQuran(),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      )),
      // bottomSheet: Container(
      //     color: Color(0xffdde7ef),
      //     height: 50,
      //     width: double.infinity,
      //     child: Center(
      //       child: ElevatedButton(
      //         onPressed: () {},
      //         child: Icon(Icons.play_circle_fill_rounded),
      //       ),
      //     ))
    );
  }
}

// recitation screen

class Recitation extends StatefulWidget {
  final int indexSurah;
  Recitation(this.indexSurah, {super.key});

  @override
  State<Recitation> createState() => _RecitationState();
}

class _RecitationState extends State<Recitation> {
  AudioPlayer audioPlayer = AudioPlayer();
  String? audioUrl;

  @override
  void initState() {
    super.initState();
    _loadAudioUrl();
  }

  Future<void> _loadAudioUrl() async {
    try {
      audioUrl = await quran.getAudioURLBySurah(widget.indexSurah);
      await audioPlayer.setUrl(audioUrl!);
    } catch (e) {
      print("Error loading audio URL: $e");
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> togglePlayPause() async {
    try {
      if (audioUrl == null) return;

      if (audioPlayer.playing) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play();
      }
    } catch (e) {
      print("Error toggling play/pause: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "سورۃ " + quran.getSurahNameArabic(widget.indexSurah),
            style: GoogleFonts.amiriQuran(
              textStyle: const TextStyle(fontSize: 30),
            ),
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 10),
          Center(
            child: ClipRect(
              child: Image.asset(
                'assets/images/alaffasy.png',
                height: 200,
                width: 200,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Container(
            width: double.infinity,
            color: const Color(0xff0c1427),
            child: Center(
              child: StreamBuilder<PlayerState>(
                stream: audioPlayer.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  final isPlaying = playerState?.playing ?? false;
                  final icon = isPlaying
                      ? Icons.pause_circle_filled_rounded
                      : Icons.play_circle_fill_rounded;

                  return IconButton(
                    onPressed: togglePlayPause,
                    icon: Icon(icon, color: Colors.white),
                    iconSize: 80,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
