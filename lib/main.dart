import 'package:flutter/material.dart';
import 'package:newfolder/BMI/bmiScreen.dart';
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
      home: Messengerscreen(),
    );
  }
}







