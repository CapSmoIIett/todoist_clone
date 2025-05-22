import 'package:flutter/material.dart';
import '../../models/base_task_model.dart';

class AddTaskSheet<T extends BaseTaskModel> extends StatefulWidget {
  final Function(T) onSave;
  final T Function({
    required String title,
    required String description,
    required DateTime dueDate,
    required Color priorityColor,
  }) createTask;

  const AddTaskSheet({
    Key? key,
    required this.onSave,
    required this.createTask,
  }) : super(key: key);

  @override
  State<AddTaskSheet<T>> createState() => _AddTaskSheetState<T>();
}

class _AddTaskSheetState<T extends BaseTaskModel> extends State<AddTaskSheet<T>> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  Color _priorityColor = Colors.grey;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  void _showPriorityPicker() {
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
            _buildPriorityOption(Colors.grey, 'None'),
          ],
        ),
      ),
    );
  }

  Widget _buildPriorityOption(Color color, String label) {
    return ListTile(
      leading: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
      title: Text(label),
      onTap: () {
        setState(() {
          _priorityColor = color;
        });
        Navigator.pop(context);
      },
    );
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
              onTap: _showDatePicker,
            ),
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
              onTap: _showPriorityPicker,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty) {
                  final task = widget.createTask(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    dueDate: _dueDate,
                    priorityColor: _priorityColor,
                  );
                  widget.onSave(task);
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
} 