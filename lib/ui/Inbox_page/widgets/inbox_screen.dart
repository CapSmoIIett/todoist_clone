import 'package:flutter/material.dart';
import 'package:todoist_clone/ui/Inbox_page/view_model/inbox_model.dart';
import 'package:todoist_clone/ui/core/ui/task_list.dart';

class InboxScreen extends StatelessWidget {
  InboxScreen({required this.inboxModel, Key? key }) : super(key: key);

  final InboxModel inboxModel;

  @override
  Widget build(BuildContext context){
    return ListenableBuilder(
      listenable: inboxModel, 
      builder: (context, _){
        return TaskList(tasksList: inboxModel.getTaskList());
      }
      ); 
  }
}