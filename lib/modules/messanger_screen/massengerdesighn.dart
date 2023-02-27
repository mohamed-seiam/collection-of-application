// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class Massenger extends StatelessWidget {
  const Massenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/img/medo.jpg"),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Chats",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 16,
            child: Icon(
              color: Colors.white,
              Icons.camera_alt,
              size: 15,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            margin: EdgeInsetsDirectional.only(end: 15),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 16,
              child: Icon(
                color: Colors.white,
                Icons.edit,
                size: 15,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    Text("Search"),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index) =>buildStoryItem(),
                    separatorBuilder: (context,index) =>SizedBox(width: 20.0,),
                    itemCount: 7,
                ),
              ),
              SizedBox(height: 30.0,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:(context,index) => buildChatItem(),
                  separatorBuilder: (context,index)=>SizedBox(height: 10.0,),
                  itemCount: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() =>  Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage:
            AssetImage("assets/img/so3ad.jpeg"),
          ),
          Padding(
            padding:
            EdgeInsetsDirectional.only(end: 5, bottom: 5),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "So3ad Mohamed ",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                      "Hello My Name Is So3ad Mohamed",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle),
                  ),
                ),
                Text("02:30 PM"),
              ],
            ),
          ],
        ),
      ),
    ],
  );


  Widget buildStoryItem() => Container(
    width: 70.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage:
              AssetImage("assets/img/medo.jpg"),
            ),
            Padding(
              padding:
              EdgeInsetsDirectional.only(end: 5, bottom: 5),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          'Mohamed Seiam Mohamed Seiam Mohamed Seiam',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
    ),
  );
}
