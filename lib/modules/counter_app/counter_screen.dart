// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterScreen extends StatefulWidget {

   CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
              TextButton(
                  onPressed:()
                  {
                    if(counter==10)
                    {
                      Fluttertoast.showToast(
                          msg:"Great High Score",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                      setState(() {
                          counter ++;  
                      });


                  },
                  child:Text('Plus',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
              ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('$counter',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            TextButton(
                onPressed:()
                {
                  if(counter>1) {

                    setState(() {
                      counter--;
                    });
                  }
                },
                child:Text('Minus',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
