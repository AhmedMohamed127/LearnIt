import 'package:flutter/material.dart';
import 'package:newfolder/Authintication/AuthModel.dart';

class Messengerscreen extends StatelessWidget {

   Messengerscreen({super.key});



  @override
  Widget build(BuildContext context) {
    // Authmodel auth = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),)
        ),
        title:  Text('dfdsf',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_rounded),),
    IconButton(onPressed: (){}, icon: Icon(Icons.add_card_rounded),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search_off_outlined),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.1))),

                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.1))),
                  filled: true,
                  fillColor: Colors.grey[250],

                ),
              ),
              SizedBox(height: 8,),
              Container(
                height: 70,
                child: Container(
                  height: 70,
                  child: ListView.separated(
                    shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index)=> buildStoryItem(),
                      separatorBuilder: (context, index)=>SizedBox(width: 8,),
                      itemCount: 40),
                ),
              ),
              SizedBox(height: 8,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(height: 8,),
                  itemCount: 10)
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildStoryItem() => Row(
  children: [
    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/img1.jpg'),
        ),
        CircleAvatar(
          radius: 5,
          backgroundColor: Colors.green ,
        )
      ],
    ),
  ],
);

Widget buildChatItem() => Container(
  height: 80,
  child: Row(
    children: [
      CircleAvatar(radius: 100,backgroundImage: AssetImage('assets/img1.jpg'),),
      Column(
        children: [
          Text('Ahmed MO'),
          Text('Hi I am there'),
        ],
      ),
      SizedBox(width: 655,),
      Icon(Icons.check_outlined)
    ],
  ),
);
