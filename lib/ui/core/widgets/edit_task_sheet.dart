import 'package:flutter/material.dart';
import '../../../models/base_task_model.dart';

class EditTaskSheet<T extends BaseTaskModel> extends StatefulWidget {
  final T task;
  final Function(T oldTask, T newTask) onSave;

  const EditTaskSheet({
    Key? key,
    required this.task,
    required this.onSave,
  }) : super(key: key);

  @override
  State<EditTaskSheet<T>> createState() => _EditTaskSheetState<T>();
}

class _EditTaskSheetState<T extends BaseTaskModel> extends State<EditTaskSheet<T>> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late DateTime _dueDate;
  late Color _priorityColor;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(text: widget.task.description);
    _dueDate = widget.task.dueDate;
    _priorityColor = widget.task.priorityColor;
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
              'Edit Task',
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
              onPressed: () {
                final newTask = widget.task.copyWith(
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dueDate: _dueDate,
                  priorityColor: _priorityColor,
                ) as T;
                widget.onSave(widget.task, newTask);
                Navigator.pop(context);
              },
              child: const Text('Save'),
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