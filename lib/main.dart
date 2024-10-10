import 'package:flutter/material.dart';

import 'Screens/DBCheckerScren.dart';




void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dbcheckerscreen(),
     /* initialRoute: 'p1',
      routes: {
        'p1' :(c) => Signup() ,
        'p2' : (c) => Messengerscreen()
      },*/
    );
  }
}







