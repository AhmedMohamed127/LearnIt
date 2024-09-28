import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  double sliderVal =100;

  double weight = 0.0;
  int? age;

  bool b = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text('BMI Calculator'),

        actions: [
          Icon(Icons.dark_mode),
          Icon(Icons.accessibility_new_sharp),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          if(!b){

                            b = !b;
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: b? Colors.blue : Colors.grey[300],
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.male),
                            Text('male')
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          if(b){
                            b = !b;
                          }
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: b? Colors.grey[300] : Colors.blue,
                        ),
                        child: Column(
                          children: [
                            Icon(Icons.female),
                            Text('Female')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[300]
                ),
                child: Column(
                  children: [
                    Text('Height',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800
                      ),),
                    Text('${sliderVal.toInt()}cm',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800
                      ),),
                    Slider(value: sliderVal, onChanged: (val){
                      setState(() {
                        sliderVal = val;
                        print(val.toInt());
                      });

                    },
                      min: 100,
                      max: 210,),

                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(/// Elevated button , textButton , floating action button
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        children: [
                          Text('Age',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800
                            ),),
                          Text('${age}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  age = (age ?? 0) + 1;
                                });
                              }, icon: Icon(Icons.add)),
                              IconButton(onPressed: (){
                                setState(() {
                                  if (age! > 0){
                                    age = (age ?? 0) - 1;
                                  }else {print('can not do this op');}

                                });
                              }, icon: Icon(Icons.minimize_sharp))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        children: [
                          Text('Weight',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800
                            ),),
                          Text('${weight}',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800
                            ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed: (){
                                setState(() {
                                  weight ++;
                                });
                              }, icon: Icon(Icons.add)),
                              IconButton(onPressed: (){
                                setState(() {
                                  if (weight > 0){
                                    weight--;
                                  }else{}

                                });
                              }, icon: Icon(Icons.minimize_rounded))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),   /// Column , Row , Container , Stack , SafeArea , Lists , SizedBox , PlaceHolder
    );
  }
}