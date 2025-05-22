import 'package:flutter/material.dart';
import '../../../models/base_task_model.dart';
import '../../core/view_models/base_task_view_model.dart';

class AddTaskSheet<T extends BaseTaskModel, V extends BaseTaskViewModel<T>> extends StatefulWidget {
  final V viewModel;
  final T Function({
    required String title,
    required String description,
    required DateTime dueDate,
    required Color priorityColor,
  }) createTask;

  const AddTaskSheet({
    Key? key,
    required this.viewModel,
    required this.createTask,
  }) : super(key: key);

  @override
  State<AddTaskSheet<T, V>> createState() => _AddTaskSheetState<T, V>();
}

class _AddTaskSheetState<T extends BaseTaskModel, V extends BaseTaskViewModel<T>> extends State<AddTaskSheet<T, V>> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late DateTime _dueDate;
  late Color _priorityColor;

  @override
  void initState() {
    super.initState();
    _dueDate = DateTime.now();
    _priorityColor = Colors.grey;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add New Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Due Date'),
              subtitle: Text(
                '${_dueDate.day}/${_dueDate.month}/${_dueDate.year}',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _dueDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (date != null) {
                  setState(() {
                    _dueDate = date;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Priority'),
              trailing: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _priorityColor,
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Select Priority'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildPriorityOption(Colors.red, 'High'),
                        _buildPriorityOption(Colors.orange, 'Medium'),
                        _buildPriorityOption(Colors.green, 'Low'),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (_titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a title'),
                    ),
                  );
                  return;
                }

                final task = widget.createTask(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dueDate: _dueDate,
                  priorityColor: _priorityColor,
                );
                await widget.viewModel.addTask(task);
                if (mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityOption(Color color, String label) {
    return ListTile(
      title: Text(label),
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      onTap: () {
        setState(() {
          _priorityColor = color;
        });
        Navigator.pop(context);
      },
    );
  }
} 