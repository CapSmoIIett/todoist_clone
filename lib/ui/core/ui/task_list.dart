import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

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
    );
  }
}
