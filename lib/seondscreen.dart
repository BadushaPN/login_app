// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:login_page/homescreen.dart';
import 'package:login_page/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _dataMatched = true;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40),
        // child: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'User Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "User name can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: !_dataMatched,
                    child: const Text(
                      'Username and Password not valid',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        checkLogin(context);
                      } else {
                        print('data empty');
                      }
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Login'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // ),
    );
  }

  void checkLogin(BuildContext context) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == 'badusha' && _password == 'pn1') {
      //go to home
      final _sharedpre = await SharedPreferences.getInstance();

      await _sharedpre.setBool(SAVE_KEY, true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) => const HomeScreen(),
        ),
      );
    } else {
      // showDialog(
      //   context: context,
      //   builder: (ctx1) {
      //     return AlertDialog(
      //       title: Text('Error'),
      //       content: Text('Invalid username and password'),
      //       actions: [
      //         TextButton(
      //           onPressed: () {
      //             Navigator.of(ctx1).pop();
      //           },
      //           child: const Text('Close'),
      //         ),
      //       ],
      //     );
      //   },
      // );
      setState(() {
        _dataMatched = false;
      });
    }
  }
}
