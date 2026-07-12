import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // ضفنا مكتبة الـ SharedPreferences
import 'package:to_do/screens/welcom.dart';
import 'package:to_do/module/bnb.dart';
import 'screen/home.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

 
  final prefs = await SharedPreferences.getInstance();
  final String? username = prefs.getString('username');

 
  Widget firstScreen;
  if (username != null && username.isNotEmpty) {
    firstScreen = const Welcome();
  } else {
    firstScreen = const Welcome();
  }


  runApp(MyApp(initialScreen: firstScreen));
}

class MyApp extends StatelessWidget {

  final Widget initialScreen;

  const MyApp({super.key, required this.initialScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tasky',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff181818),
          useMaterial3: true),

      home: initialScreen,
    );
  }
}