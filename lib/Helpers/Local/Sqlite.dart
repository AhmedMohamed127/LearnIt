import 'dart:core';
import 'package:sqflite/sqflite.dart';

class DBHelper{

   late Database database ;


  void createdb() async{
     openDatabase(
       //DB file name
       'test.db',
       //version
       version: 1,
       onCreate: (database, version) async{
         print('database created');
         // DB Table Naaaaaaammmmmmeee yaaaaa mohamed (: (Added by joseph)
        await database.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER)")
             .then((Value){
           print('table created');
         }).catchError((error){
           print('Failed to create table');
         });
       },
       onOpen: (database)
       {
         // waiting get DB method
         print('Database opened');
       },
     ).then((value){
       database =value;
     });
}

void insertToDB({required int id, required String name, required int value})async{
    await database.transaction((abo) => abo.rawInsert('INSERT INTO Test(id, name, value) VALUES($id,"$name" , $value)')
        .then((val){
          print('$val inserted successfully');
    }).catchError((error){
      print("Ërror when inserting New Record" +error.toString());
    },),
    );
}

}