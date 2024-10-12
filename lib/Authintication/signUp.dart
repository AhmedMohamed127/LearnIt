import 'package:flutter/material.dart';
import 'package:newfolder/Authintication/AuthModel.dart';
import 'package:newfolder/Helpers/Local/Sqlite.dart';
import 'package:newfolder/Screens/DBCheckerScren.dart';
import 'package:newfolder/Screens/messengerScreen.dart';
import 'package:sqflite/sqflite.dart';

import '../constants.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createdb();
  }
  Database? database ;
  GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController? fName = TextEditingController();
  TextEditingController? SName;
  TextEditingController? email;
  TextEditingController? pass;
  TextEditingController? confirmpass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('First Name:'),
                        TextFormField(
                          validator: (val){
                            if(  val == null || val!.isEmpty){
                              return 'Field Required';
                            }
                          },
                          controller: fName,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Family Name:'),
                        TextFormField(
                          validator: (val){
                            if(  val == null || val!.isEmpty){
                              return 'Field Required';
                            }
                          },
                          controller: SName,
                          decoration: InputDecoration(
                            hintText: 'Family name',
                            prefixIcon: Icon(Icons.person),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (val){
                  if(  val == null || val!.isEmpty){
                    return 'Field Required';
                  }
                },
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  label: Text('Enter Your Email'),
                  prefixIcon: Icon(Icons.password_outlined),

                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (val){
                  if(  val == null || val!.isEmpty){
                    return 'Field Required';
                  }
                },
                obscureText: true,
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  label: Text('Enter Valid Pass'),
                  prefixIcon: Icon(Icons.password_outlined),
                  suffixIcon: IconButton(onPressed: (){},
                      icon:Icon(Icons.remove_red_eye)),
                ),
              ),
              SizedBox(height: 20,),

              TextFormField(
                validator: (val){
                  if(  val == null || val!.isEmpty){
                    return 'Field Required';
                  }
                },
                controller: confirmpass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  label: Text('Confirm Pass'),
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: IconButton(onPressed: (){},
                      icon:Icon(Icons.remove_red_eye)),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
               /* Navigator.pushNamed(context,'p2',
                    arguments: Authmodel(Name: 'MOhamed') );*/
                ///what this line do ?
                /// creation of stack : contains screens :
                /// Routes : location , name
                /// what is containing routes ?
                /// MaterialPageRoute : builder : name , loc
                setState(() {

                 /* if(formkey.currentState!.validate()) {
                    print(fName);
                    print(SName);
                    print(email);
                    print(pass);
                    print(confirmpass);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success')),
                    );
                  }*/
                  insertToDB(id: 7, name: '${fName!.text}', value: 6);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>Dbcheckerscreen()));
                });
              },
                child: Text('SignUP',
              style: TextStyle(
                color: Colors.white
              ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                fixedSize: Size(200, 50),
              ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Already have an account ?...'),
                TextButton(onPressed: (){}, child:Text('Log In') ),
              ] ,
              ),
            ],
          ),
        ),
      ),
    );

  }
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

  void insertToDB({required int id, required String name, required int value})async{
    await database!.transaction((abo) => abo.rawInsert('INSERT INTO Test(id, name, value) VALUES($id,"$name" , $value)')
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



