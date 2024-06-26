import 'package:flutter/material.dart';
import 'package:ridobiko/splashScreen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Splashscreen(),
    );
  }
}
