import 'package:flutter/material.dart';
import 'package:newfolder/Authintication/signUp.dart';
import 'package:newfolder/Screens/messengerScreen.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: Signup(),
      initialRoute: 'p1',
      routes: {
        'p1' :(c) => Signup() ,
        'p2' : (c) => Messengerscreen()
      },
    );
  }
}







