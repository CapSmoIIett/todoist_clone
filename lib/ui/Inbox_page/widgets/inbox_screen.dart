import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/base_task_list.dart';
import '../../core/widgets/edit_task_sheet.dart';
import '../view_model/inbox_view_model.dart';
import '../models/inbox_task_model.dart';

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
        body: BaseTaskList<InboxTaskModel, InboxViewModel>(
          onTaskTap: (context, task) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => EditTaskSheet<InboxTaskModel>(
                task: task,
                onSave: (oldTask, newTask) {
                  context.read<InboxViewModel>().updateTask(oldTask, newTask);
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // TODO: Implement add task
          },
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}