// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:login_page/personscreen.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/seondscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Name'),
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
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return ListTile(
                  title: Text('Person ${index + 1}'),
                  subtitle: Text(
                      'The way to get started is to quit talking and begin doing. -Walt Disney${index + 1}'),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 25,
                    backgroundImage: AssetImage(
                        'assest/image/87330817f15cf955c778db0b74739b75.jpg'),
                  ),
                  trailing: Text('$index:00'),
                  onTap: (() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const PersonScreen(
                            message:
                                'The way to get started is to quit talking and begin doing. -Walt Disney')),
                      ),
                    );
                  }),
                );
              } else {
                return ListTile(
                  title: Text('Person ${index + 1}'),
                  subtitle: Text(
                    'If life were predictable it would cease to be life, and be without flavor.  ${index + 1}',
                    style: const TextStyle(
                      fontFamily: ('Poor Story'),
                    ),
                  ),
                  leading: ClipRect(
                    child: Image.asset(
                      'assest/image/87330817f15cf955c778db0b74739b75.jpg',
                      height: 300,
                    ),
                  ),
                  trailing: Text('$index:00'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const PersonScreen(
                            message:
                                'If life were predictable it would cease to be life, and be without flavor. ')),
                      ),
                    );
                  },
                );
              }
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: 23),
      ),
    );
  }
}

signout(BuildContext ctx) async {
  final sharedpre = await SharedPreferences.getInstance();
  await sharedpre.clear();
  // ignore: use_build_context_synchronously
  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1) => const SecondScreen()),
      (route) => false);
}
