import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/todo_providers/todo_provider.dart';
import 'package:provider/provider.dart';

class AddToDoDialog extends StatefulWidget {
  const AddToDoDialog({super.key});

  @override
  State<AddToDoDialog> createState() => _AddToDoDialogState();
}

class _AddToDoDialogState extends State<AddToDoDialog> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedDateTime;

  Future<void> _pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate == null) return;
    if (mounted) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime == null) return;

      setState(() {
        _selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void _addTask() {
    if (_titleController.text.isEmpty || _selectedDateTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter title and select date/time")),
      );
      return;
    }

    Provider.of<TodoProvider>(context, listen: false).addTask(
      title: _titleController.text,
      date: _selectedDateTime!,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Task"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            style: Theme.of(context).textTheme.headlineLarge,
            controller: _titleController,
            decoration: InputDecoration(labelText: "Task"),
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              labelText: _selectedDateTime == null
                  ? "Select Date & Time"
                  : "${_selectedDateTime!.toLocal()}".split('.')[0],
              labelStyle: Theme.of(context).textTheme.titleLarge,
              suffixIcon: Icon(Icons.calendar_today),
              border: OutlineInputBorder(),
            ),
            readOnly: true,
            onTap: _pickDateTime,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: _addTask,
          child: Text("Add"),
        ),
      ],
    );
  }
}
