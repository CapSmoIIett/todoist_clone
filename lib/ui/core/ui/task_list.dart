import 'package:flutter/material.dart';
import 'package:todoist_clone/ui/core/ui/add_task_button.dart';
import 'package:todoist_clone/ui/core/ui/edit_task_sheet.dart';
import 'package:todoist_clone/ui/models/task_model.dart';

class TaskList extends StatelessWidget {
  TaskList({required this.tasksList, Key? key}) : super(key: key);

  final List<TaskModel> tasksList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red, actions: [
        IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {}),
      ]),
      body: ListView.separated(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey<String>(tasksList[index].title),
            onDismissed: (DismissDirection direction) {},
            background: Row(
              children: [
                Expanded(child: Container(color: Colors.red)),
                Expanded(child: Container(color: Colors.green)),
                Expanded(child: Container(color: Colors.blue))
              ],
            ),
            child: ListTile(
                title: Text(tasksList[index].title),
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return EditTaskSheet(task: tasksList[index]);
                    })),
          );
        },
        separatorBuilder: (context, index) => Divider(
          thickness: 0.1,
        ),
      ),
      floatingActionButton: AddTaskButton(),
    );
  }
}
