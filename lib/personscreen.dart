import 'package:flutter/material.dart';
import 'package:login_page/homescreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

class PersonScreen extends StatelessWidget {
  final String message;
  const PersonScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Are you sure?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                signout(context);
                              },
                              child: Text('Yes')),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(message),
            ],
          ),
        ),
      ),
    );
  }
}
