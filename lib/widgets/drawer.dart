import 'package:flutter/material.dart';
import '/app.dart';


class SettingsDrawer extends StatefulWidget {  

  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}
class _SettingsDrawerState extends State<SettingsDrawer> {
bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    AppState? appState = context.findAncestorStateOfType<AppState>();
    return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: [
         SizedBox(
           child: DrawerHeader(
              child: Text('Settings', style: Theme.of(context).textTheme.headline6)),
         height: 120,),
        
         SwitchListTile(
         title:  Text('Dark Mode', style : Theme.of(context).textTheme.subtitle1), 
          value: darkMode,
          onChanged: (bool value) {
            darkMode = value;
           setTheme(appState!);
          })
       ] )
    );
  }

    void setTheme(AppState appState) {
       return appState.setTheme();
       }
  }




