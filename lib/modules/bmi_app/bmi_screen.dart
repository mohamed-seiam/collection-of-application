// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:messanger/modules/bmi_app/bmi_resault_screen.dart';

class BminScreen extends StatefulWidget {

   BminScreen({Key? key}) : super(key: key);

  @override
  State<BminScreen> createState() => _BminScreenState();
}

class _BminScreenState extends State<BminScreen> {
  bool ismale = true;
  int weight = 40;
  int age = 20;
  double height = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(()
                        {
                          ismale= true;
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration
                          (
                            borderRadius: BorderRadius.circular(10.0),
                            color:ismale ? Colors.blue: Colors.grey[400],
                          ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(
                               image:AssetImage('assets/images/male.png'),
                             width: 90.0,
                             height: 90.0,
                           ),
                            SizedBox(height: 15.0,),
                            Text(
                                'MALE',
                              style:TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(()
                        {
                          ismale = false;
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration
                          (
                          borderRadius: BorderRadius.circular(10.0),
                          color:!ismale ? Colors.blue  :Colors.grey[400] ,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image:AssetImage('assets/images/female3_1.png'),
                              width: 90.0,
                              height: 90.0,
                            ),
                            SizedBox(height: 15.0,),
                            Text(
                              'FEMALE',
                              style:TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
            Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration
                  (
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    Text(
                      'HEIGHT',
                      style:TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Text(
                          '${height.round()}',
                          style:TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Text(
                          'CM',
                          style:TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value:height,
                      min: 80,
                      max: 220,
                      onChanged:(value)
                      {
                       setState(() {
                         height = value;
                       });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row
                (
                  children:
                  [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration
                          (
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],
                        ),
                        child: Column
                          (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text(
                              'WEIGHT',
                              style:TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$weight',
                              style:TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                FloatingActionButton(
                                  onPressed:()
                                  {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  heroTag: 'weight--',
                                  mini: true,
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed:()
                                  {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  heroTag: 'weight++',
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration
                          (
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[400],
                        ),
                        child: Column
                          (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text(
                              'AGE',
                              style:TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$age',
                              style:TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                FloatingActionButton(
                                  onPressed:()
                                  {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: 'age--',
                                  mini: true,
                                  child: Icon(Icons.remove),
                                ),
                                FloatingActionButton(
                                  onPressed:()
                                  {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'age++',
                                  mini: true,
                                  child: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: MaterialButton(
                onPressed:()
                {
                  double resault = weight / pow(height/100, 2);
                  Navigator.push
                    (context,
                     MaterialPageRoute(
                         builder:(context)=> BmiResaultScreen
                           (
                           age: age,
                           isMale:ismale,
                           resault: resault,
                         ),
                     ) ,
                  );
                },
              color: Colors.blue,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }
}
