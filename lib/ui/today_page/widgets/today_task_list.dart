import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/base_task_list.dart';
import '../../core/widgets/edit_task_sheet.dart';
import '../view_model/today_view_model.dart';
import '../models/today_task_model.dart';

class TodayTaskList extends StatelessWidget {
  const TodayTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodayViewModel>(
      builder: (context, viewModel, child) {
        final todayTasks = viewModel.getTodayTasks();
        
        if (todayTasks.isEmpty) {
          return const Center(
            child: Text(
              'No tasks for today',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          );
        }

        return BaseTaskList<TodayTaskModel, TodayViewModel>(
          onTaskTap: (context, task) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => EditTaskSheet<TodayTaskModel>(
                task: task,
                onSave: (oldTask, newTask) async {
                  await context.read<TodayViewModel>().updateTask(oldTask, newTask);
                },
              ),
            );
          },
        );
      },
    );
  }
} 