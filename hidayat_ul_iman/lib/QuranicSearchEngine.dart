import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const Surahs(),
//     );
//   }
// }

class Surahs extends StatefulWidget {
  const Surahs({super.key});

  @override
  State<Surahs> createState() => _SurahsState();
}

class _SurahsState extends State<Surahs> {
  List<String> surahList = [];
  List<String> filteredSurahList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Populate the surahList with all surah names
    for (int i = 1; i <= quran.totalSurahCount; i++) {
      surahList
          .add("${quran.getSurahName(i)} | ${quran.getSurahNameArabic(i)}");
    }
    filteredSurahList = surahList; // Initially show all surahs
  }

  // Method to filter the Surahs based on search input
  void filterSurahs(String query) {
    List<String> tempList = [];
    if (query.isNotEmpty) {
      for (var surah in surahList) {
        if (surah.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(surah);
        }
      }
    } else {
      tempList = surahList;
    }
    setState(() {
      filteredSurahList = tempList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surah List"),
      ),
      body: Column(
        children: [
          // Search bar for Surahs
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterSurahs(value); // Filter Surahs as the user types
              },
              decoration: InputDecoration(
                labelText: "Search Surah",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSurahList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(
                      filteredSurahList[index],
                      style: GoogleFonts.amiriQuran(fontSize: 18),
                    ),
                    onTap: () {
                      // Get the original Surah index from filtered list
                      int surahIndex =
                          surahList.indexOf(filteredSurahList[index]) +
                              1; // +1 to match the Surah numbering
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailSurah(surahIndex),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DetailSurah extends StatefulWidget {
  final int surahIndex;
  const DetailSurah(this.surahIndex, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  List<String> verses = [];
  List<String> versesT = [];
  List<String> filteredVerses = [];
  List<String> filteredVersesT = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //  verses list for the given surah
    for (int i = 1; i <= quran.getVerseCount(widget.surahIndex); i++) {
      verses.add(quran.getVerse(widget.surahIndex, i, verseEndSymbol: true));
      versesT.add(quran.getVerseTranslation(widget.surahIndex, i,
          translation: quran.Translation.enClearQuran));
    }
    filteredVerses = verses; // by  default   show all verses
    filteredVersesT = versesT; // by  default  show all translations
  }

  // search input based surah
  void filterVerses(String query) {
    List<String> tempList = [];
    List<String> tempListTranslation = [];
    if (query.isNotEmpty) {
      for (int i = 0; i < verses.length; i++) {
        if (verses[i].toLowerCase().contains(query.toLowerCase()) ||
            versesT[i].toLowerCase().contains(query.toLowerCase())) {
          tempList.add(verses[i]);
          tempListTranslation.add(versesT[i]);
        }
      }
    } else {
      tempList = verses;
      tempListTranslation = versesT;
    }
    setState(() {
      filteredVerses = tempList;
      filteredVersesT = tempListTranslation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Surah Details"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                filterVerses(value); // Filter verses and translation
              },
              decoration: InputDecoration(
                labelText: "Search Verse or Translation",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredVerses.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        filteredVerses[index],
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.amiriQuran(),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        filteredVersesT[index],
                        textDirection: TextDirection.ltr,
                        style: GoogleFonts.roboto(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
