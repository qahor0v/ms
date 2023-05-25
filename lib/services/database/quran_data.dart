import 'package:quran_uz/quran_uz.dart';

class QuranData {
  static final QuranUz quranUz = QuranUz();

  static List<Verse> verses(int id) {
    List<Verse> verses = quranUz.getVerseListBySuraId(id);
    return verses;
  }
}