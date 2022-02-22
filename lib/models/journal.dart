import 'journal_entry.dart';

class Journal {

  List<JournalEntry> entries = [];

  Journal({required this.entries});

  int get numberOfEntries => entries.length;

  bool get isEmpty => entries.isEmpty;

}


