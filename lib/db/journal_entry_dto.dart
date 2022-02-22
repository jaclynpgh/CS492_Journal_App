class JournalEntryDTO {
   late  String title;
   late  String body; 
   late  int rating;
   late  DateTime date;

  @override
  String toString() {
    return 'Title: $title, Body: $body Rating: $rating, Date: $date';

  }
}