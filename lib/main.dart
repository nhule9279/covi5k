import 'package:flutter/material.dart';

import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'COVI 5K',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.pink,
        ),
        home: SplashScreen());
  }
}
