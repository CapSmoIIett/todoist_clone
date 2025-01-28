import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoist_clone/ui/Inbox_page/view_model/inbox_model.dart';
import 'package:todoist_clone/ui/core/ui/task_list.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({required this.inboxModel, Key? key }) : super(key: key);

  final InboxModel inboxModel;

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (_) => inboxModel, 
      child: TaskList(tasksList: inboxModel.getTaskList())
      ); 
  }
}