// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/spalshscreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

const SAVE_KEY = 'UserLogged';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
