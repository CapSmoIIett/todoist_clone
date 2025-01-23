
import 'package:todoist_clone/ui/models/task_model.dart';

class InboxModel {
  
  List<TaskModel> exampleTasks = [
    TaskModel(title: 'Clean shit', descr: ' '),
    TaskModel(title: 'cook diner', descr: ' '),
    TaskModel(title: 'write book', descr: ' '),
    TaskModel(title: 'learn flutter', descr: ' ')
  ];

  List<TaskModel> getTaskList () =>  exampleTasks;
}