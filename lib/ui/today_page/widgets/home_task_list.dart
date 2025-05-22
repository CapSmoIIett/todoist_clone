import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/base_task_list.dart';
import '../../core/widgets/edit_task_sheet.dart';
import '../view_model/home_view_model.dart';
import '../models/home_task_model.dart';

class HomeTaskList extends StatelessWidget {
  const HomeTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTaskList<HomeTaskModel, HomeViewModel>(
      onTaskTap: (context, task) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => EditTaskSheet<HomeTaskModel>(
            task: task,
            onSave: (oldTask, newTask) {
              context.read<HomeViewModel>().updateTask(oldTask, newTask);
            },
          ),
        );
      },
    );
  }
} 