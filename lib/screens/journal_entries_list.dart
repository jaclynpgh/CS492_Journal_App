import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project4_journal/screens/entry_detail_screen.dart';
import 'package:project4_journal/widgets/detail_display.dart';
import '/db/database_manager.dart';
import '/models/journal.dart';
import '/models/journal_entry.dart';
import '/widgets/journal_scaffold.dart';
import '/widgets/welcome.dart';



class JournalEntriesScreen extends StatefulWidget {

  
  const JournalEntriesScreen({ Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<JournalEntriesScreen> createState() => _JournalEntriesScreenState();
}

class _JournalEntriesScreenState extends State<JournalEntriesScreen> {

 late Journal journal;
 final format = DateFormat('EEEE, MMMM d, y'); 



  @override
  void initState(){
    super.initState();
    journal = Journal(entries: []);   // initialzes journal to avoid late initalizer error
    loadJournal();
  }

   void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    List<JournalEntry> journalRecords = await databaseManager.journalEntries();
    setState(() {
      journal = Journal(entries: journalRecords);
    });
  }

  // go to welcome screen if there are not any journal entries, else populate list of journal entiries
  // ignore: unnecessary_null_comparison
  
     @override
  Widget build(BuildContext context) {

    if (journal == null){
      return const JournalScaffold(title: 'Loading...',
      body: Center(child: CircularProgressIndicator()));
      
    } else{
    return JournalScaffold(
      button: const AddEntryButton(),
      title:  journal.isEmpty ? 'Welcome' : 'Journal Entries',
      body: journal.isEmpty ? const Welcome() : journalView(context),
      );
    
    }
    
      }

Widget journalView(BuildContext context){
   return MediaQuery.of(context).orientation == Orientation.portrait ? journalList(context)
   : detailedList(context);
}

// detailed list view for when device is in landscape mode
Widget detailedList(BuildContext context){
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: ListView.builder(itemCount: journal.numberOfEntries, itemBuilder: (context, index){
       return Row(
         children: [
           Padding(
             padding: const EdgeInsets.only(left:50.0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Text(journal.entries[index].title,style: Theme.of(context).textTheme.headline6 ),
               Text(format.format(journal.entries[index].date), style: Theme.of(context).textTheme.subtitle2),
             ]),
           ),
          Flexible(child: DetailDisplay(entry: journal.entries[index])
          ),
         ],);
     }),
   );
  }


// list view for when device is in portrait mode
Widget journalList(BuildContext context){
    return ListView.builder(itemCount: journal.numberOfEntries, itemBuilder: (context, index){  // UPDATE itemCount: itemCount, which is the number of items in the list of data. 
        return ListTile(
            title: Text(journal.entries[index].title),
            subtitle: Text(format.format(journal.entries[index].date)),
            onTap: () {
             Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailScreen(),
            settings: RouteSettings(
              arguments: journal.entries[index],
            ),
          ),
             );
      }, 
          );
      });
  } 
}








 