import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/widgets.dart';
import 'app.dart';
import 'db/database_manager.dart';



void main() async {
WidgetsFlutterBinding.ensureInitialized();
await SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.landscapeLeft,
  DeviceOrientation.landscapeRight]);



await DatabaseManager.initialize();
runApp(App(preferences: await SharedPreferences.getInstance()));
}
