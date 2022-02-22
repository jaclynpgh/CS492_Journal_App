
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/new_entry.dart';
import 'screens/journal_entries_list.dart';


class App extends StatefulWidget {  
   final SharedPreferences preferences;
   
  const App({Key? key, required this.preferences}) : super(key: key);


  static final routes = {
          NewEntry.routeName: (context) =>  const NewEntry(),
          JournalEntriesScreen.routeName: (context) => const JournalEntriesScreen(),
      };

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {

  static const darkKey = 'darkMode';
  bool get darkMode => widget.preferences.getBool(darkKey) ?? false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
       theme: ThemeData(
         brightness: darkMode? Brightness.dark : Brightness.light),
      routes: App.routes,     
        );   
  }

    void setTheme() {
    setState(() {
      widget.preferences.setBool(darkKey, !darkMode);
    });
  }

  }








