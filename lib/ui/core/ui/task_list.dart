import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  TaskList({Key? key}) : super(key: key);

  List<String> exampleTask = ['Clean shit', 'cook diner', 'write book', 'learn flutter'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, 
        actions: [
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {}
        ),
        IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {}
        ),
      ]),
      body: ListView.separated(
        itemCount: exampleTask.length,
        itemBuilder: (context, index){
          return Dismissible(
            key: ValueKey<String>(exampleTask[index]), 
            child: ListTile(
              title: Text (exampleTask[index]),
            ), 
            onDismissed: (DismissDirection direction) {

            },
            background: Row(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.green)),
                Expanded(child: Container(color: Colors.blue))
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          thickness: 0.1,
        ),
      ),
    );
  }
}
