import 'package:flutter/material.dart';
import 'package:newfolder/Authintication/AuthModel.dart';
import 'package:newfolder/Screens/messengerScreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                Navigator.pushNamed(context,'p2',
                    arguments: Authmodel(Name: 'MOhamed') );
                ///what this line do ?
                /// creation of stack : contains screens :
                /// Routes : location , name
                /// what is containing routes ?
                /// MaterialPageRoute : builder : name , loc
                setState(() {

                  if(formkey.currentState!.validate()) {
                    print(fName);
                    print(SName);
                    print(email);
                    print(pass);
                    print(confirmpass);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Success')),
                    );
                  }
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
}
