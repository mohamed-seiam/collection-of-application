// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:messanger/models/user_model.dart';

class UserScreen extends StatelessWidget {
   UserScreen({Key? key}) : super(key: key);
    List<UserModel> users = [
      UserModel(
          id: 1,
          name:'Mohamed Seiam',
          phone:'01002834247',
      ),
      UserModel(
        id: 2,
        name:'Mohamed Nowar',
        phone:'01014114670',
      ),
      UserModel(
        id: 3,
        name:'Reda Seiam',
        phone:'01142419412',
      ),
      UserModel(
        id: 1,
        name:'Mohamed Seiam',
        phone:'01002834247',
      ),
      UserModel(
        id: 2,
        name:'Mohamed Nowar',
        phone:'01014114670',
      ),
      UserModel(
        id: 3,
        name:'Reda Seiam',
        phone:'01142419412',
      ),
      UserModel(
        id: 1,
        name:'Mohamed Seiam',
        phone:'01002834247',
      ),
      UserModel(
        id: 2,
        name:'Mohamed Nowar',
        phone:'01014114670',
      ),
      UserModel(
        id: 3,
        name:'Reda Seiam',
        phone:'01142419412',
      ),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'users'
        ),
      ),
      body:ListView.separated(
          itemBuilder:(context,index)=>buildUserItem(users[index],),
          separatorBuilder:(context,index)=>Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount:users.length,
      ),
    );
  }
  Widget buildUserItem(UserModel user)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 15.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
             Text(
              '${user.name}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
              SizedBox(height: 5.0,),
              Text(
              '${user.phone}',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
