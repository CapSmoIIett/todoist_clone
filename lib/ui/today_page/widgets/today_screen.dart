import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/today_view_model.dart';
import '../models/today_task_model.dart';
import '../../core/widgets/add_task_sheet.dart';
import '../../../data/repositories/task_repository.dart';
import '../widgets/today_task_list.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodayViewModel(TaskRepository()),
      child: Consumer<TodayViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              title: const Text('Today'),
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
            body: viewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : const TodayTaskList(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => AddTaskSheet<TodayTaskModel, TodayViewModel>(
                    viewModel: viewModel,
                    createTask: ({
                      required String title,
                      required String description,
                      required DateTime dueDate,
                      required Color priorityColor,
                    }) {
                      return TodayTaskModel(
                        title: title,
                        description: description,
                        dueDate: dueDate,
                        priorityColor: priorityColor,
                      );
                    },
                  ),
                );
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
} 