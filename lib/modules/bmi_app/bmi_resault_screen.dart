// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class BmiResaultScreen extends StatelessWidget {
  final double ? resault;
  final bool ? isMale;
  final int ? age;
   BmiResaultScreen({
     this.age,
     this.isMale,
     this.resault,
   });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('BMI Resault'),
        leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            ConditionalBuilder(
              condition: isMale!=null,
              builder:(context)=> Text(
                  'Gender: ${isMale! ?'Male':'Female'}',
                style: TextStyle(
                  fontSize:25.0 ,
                  fontWeight: FontWeight.bold,
                ),
              ),
              fallback: (context)=>Container(),
            ),
            Text(
              'Resault :${resault!.round()}',
              style: TextStyle(
                fontSize:25.0 ,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age :$age',
              style: TextStyle(
                fontSize:25.0 ,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
