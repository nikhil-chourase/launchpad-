import 'package:flutter/material.dart';


class TaskScreen extends StatefulWidget {

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0,bottom: 30,right: 30,left: 30),
            child: Column(
              children: [
                CircleAvatar(
                  child: Icon(
                      Icons.list,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(height: 10,),

                Text(
                    'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                SizedBox(height: 20,),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
              ),
              child: ListView(
                children: [
                  ListTile(
                    title: Text('first exercise'),
                    leading: FloatingActionButton(
                      onPressed: (){},
                    ),

                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
