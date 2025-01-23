import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
const AddTaskButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment Counter',
        shape: const CircleBorder(),
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      );
  }
}