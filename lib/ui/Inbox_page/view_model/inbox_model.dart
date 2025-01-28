
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist_clone/ui/models/task_model.dart';

class InboxModel extends Cubit<List<TaskModel>>{
  
  List<TaskModel> exampleTasks = [
    TaskModel(title: 'Clean shit', descr: ' '),
    TaskModel(title: 'cook diner', descr: ' '),
    TaskModel(title: 'write book', descr: ' '),
    TaskModel(title: 'learn flutter', descr: ' ')
  ];

  InboxModel(super.initialState);

  List<TaskModel> getTaskList () =>  exampleTasks;
}