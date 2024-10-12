import 'package:flutter/material.dart';
import 'package:newfolder/Helpers/Local/Sqlite.dart';
import 'package:newfolder/constants.dart';

import 'messengerScreen.dart';

class Dbcheckerscreen extends StatefulWidget {
  const Dbcheckerscreen({super.key});

  @override
  State<Dbcheckerscreen> createState() => _DbcheckerscreenState();
}

class _DbcheckerscreenState extends State<Dbcheckerscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dhvbfret'),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) => Text(test[index]['name']),
          separatorBuilder: (context,index) => SizedBox(height: 10,),
          itemCount: test.length)
    );
  }
}
