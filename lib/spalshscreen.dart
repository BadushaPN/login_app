import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_page/homescreen.dart';
import 'package:login_page/main.dart';
import 'package:login_page/seondscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    checkLogged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FlutterLogo(
        size: MediaQuery.of(context).size.height,
      ),
    );
  }

  void gotoLog() async {
    await Future.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: ((context) => SecondScreen()),
      ),
    );
  }

  void checkLogged() async {
    final _sharedPref = await SharedPreferences.getInstance();
    final _userLogged = _sharedPref.getBool(SAVE_KEY);
    if (_userLogged == null || _userLogged == false) {
      gotoLog();
    } else {
      // ignore: use_build_context_synchronously
      // await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => const HomeScreen(),
        ),
      );
    }
  }
}
