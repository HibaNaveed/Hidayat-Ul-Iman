## README: Hidayat-ul-Iman

### Introduction:
Hidayat-ul-Iman is an Islamic mobile application built using Flutter, providing essential resources like the Quran, Hadith, Prayer Times, and more. This app serves as a comprehensive spiritual companion for Muslims, offering tools to assist with daily religious practices and spiritual growth.

### Features:
1. **Quran**: 
   - Complete Quran text with translations and tafsir (commentary).
   - Audio recitations by multiple Qaris.
   - Search, bookmark, highlight, and sharing features.

2. **Hadith**: 
   - Access to authentic Hadith collections, including Sahih Bukhari and Sahih Muslim.
   - Search functionality to find specific Hadiths.
   - Bookmark and share Hadith.

3. **Prayer Times**: 
   - Real-time, location-based prayer time notifications.
   - Accurate timing for all five prayers.
   - Qibla direction finder.

4. **99 Names of Allah (Asma-ul-Husna)**: 
   - Display of Allah's 99 names with meanings and audio pronunciation.

5. **Supplications (Dua)**: 
   - Collection of daily Duas from the Quran and Sunnah, categorized for ease of use (morning, evening, travel, etc.).

6. **Quranic Search Engine**: 
   - Advanced search for specific words or themes in the Quran, with filtering by context.

7. **Hisn-ul-Muslim Duas**: 
   - A structured collection of Duas from the famous *Hisn-ul-Muslim* (Fortress of the Muslim), accessible via JSON data.
   - Categorized supplications for various occasions, including daily routines, distress, protection, and more.

### Tech Stack:
- **Frontend**: Flutter (Dart) for a responsive cross-platform experience on Android and iOS.
- **Backend**: RESTful APIs for fetching data such as prayer times, Quran, and Hadith collections.
- **Data Format**: JSON for static content including Quranic verses, Hadith collections, 99 Names of Allah, Supplications, and Hisn-ul-Muslim Duas.

### Installation:

1. Clone the repository:
   ```bash
   git clone https://github.com/username/hidayat-ul-iman.git
   ```

2. Navigate to the project directory:
   ```bash
   cd hidayat-ul-iman
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the app on a connected device or emulator:
   ```bash
   flutter run
   ```

### API and Data Sources:
- **Prayer Times API**: Retrieves accurate, real-time prayer times based on the user's current location.
- **Quran API**: Provides Quranic verses, translations, and tafsir.
- **Hadith API**: Access to a comprehensive database of Hadith collections.
- **Hisn-ul-Muslim Duas**: Structured in JSON format, the collection of Duas from Hisn-ul-Muslim is categorized for easy reference and integration into the app.
- **Search API**: Enables the search functionality for Quranic verses by keyword or topic.

### JSON Data Structure for Hisn-ul-Muslim Duas:
- **Dua Category**: Each category includes a list of Duas relevant to specific situations (e.g., morning, protection, gratitude).
- **Dua Text**: Arabic text, with English translation and transliteration.
- **References**: Source references for each Dua from the Quran or Sunnah.

Example JSON structure for Hisn-ul-Muslim Duas:
```json
{
  "category": "Morning and Evening",
  "duas": [
    {
      "text_arabic": "اللّهُمَّ أَنْتَ رَبِّي لا إِلَهَ إِلَّا أَنْتَ...",
      "translation": "O Allah, You are my Lord, there is no deity worthy of worship except You...",
      "transliteration": "Allahumma anta Rabbi la ilaha illa anta...",
      "reference": "Hisn-ul-Muslim, #1"
    },
    ...
  ]
}
```

### Contribution:
We welcome contributions! If you have suggestions, bug reports, or wish to improve the app, please submit a pull request or report an issue.

### License:
This project is licensed under the MIT License, allowing you to freely use, modify, and distribute the software under these terms.

### Installation :

📲 Download APK Version: Visit GitHub at github.com/HibaNaveed/Hidayat-Ul-Iman  
🍏 iOS version coming soon!


### Project Demo:

https://github.com/user-attachments/assets/29860db3-e899-4326-8944-4da3eeccd1dc