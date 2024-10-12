import 'dart:core';

import 'package:newfolder/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DBHelper{

  Database? database ;

  Future <void> createdb() async{
     database = await openDatabase(
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
         getDataFormDB(database).then((val){
           test = val;
         });

         print('Database opened');
       },
     ).then((value)=> database =value);
}

void insertToDB(/*{required int id, required String name, required int value}*/)async{
    await database!.transaction((abo) => abo.rawInsert('INSERT INTO Test(id, name, value) VALUES(1,"Ahmed" , 2)')
        .then((val){
          print('$val inserted successfully');
    }).catchError((error){
      print("Ërror when inserting New Record" +error.toString());
    },),
    );
}


Future<List<Map>> getDataFormDB(database) async{
   return await database!.rawQuery('SELECT * FROM Test');
}

}