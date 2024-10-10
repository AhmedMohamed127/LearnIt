import 'package:flutter/material.dart';
import 'package:newfolder/Helpers/Local/Sqlite.dart';

class Dbcheckerscreen extends StatefulWidget {
  const Dbcheckerscreen({super.key});

  @override
  State<Dbcheckerscreen> createState() => _DbcheckerscreenState();
}

class _DbcheckerscreenState extends State<Dbcheckerscreen> {
  late DBHelper db;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('dhvbfret'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          setState(() {
            db.createdb();
          });
        }, child: Text('gjfhguyeftd'),

        ),
      ),
    );
  }
}
