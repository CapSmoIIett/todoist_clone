import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';
import '../models/home_task_model.dart';
import '../../core/widgets/add_task_sheet.dart';
import 'home_task_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Home'),
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
        body: const HomeTaskList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => AddTaskSheet<HomeTaskModel>(
                onSave: (task) {
                  context.read<HomeViewModel>().addTask(task);
                },
                createTask: ({
                  required String title,
                  required String description,
                  required DateTime dueDate,
                  required Color priorityColor,
                }) => HomeTaskModel(
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
