import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/base_task_list.dart';
import '../../core/widgets/edit_task_sheet.dart';
import '../view_model/inbox_view_model.dart';
import '../models/inbox_task_model.dart';
import '../../core/widgets/add_task_sheet.dart';
import 'inbox_task_list.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InboxViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Inbox'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // TODO: Implement search
              },
            ),
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {
                // TODO: Implement filtering
              },
            ),
          ],
        ),
        body: const InboxTaskList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskSheet<InboxTaskModel>(
                onSave: (task) {
                  context.read<InboxViewModel>().addTask(task);
                },
                createTask: ({
                  required String title,
                  required String description,
                  required DateTime dueDate,
                  required Color priorityColor,
                }) => InboxTaskModel(
                  title: title,
                  description: description,
                  dueDate: dueDate,
                  priorityColor: priorityColor,
                ),
              ),
            );
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}