import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxChange;
  final void Function() listTileDelete;
  final void Function() listTileUpdate;

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxChange,
    required this.listTileDelete,
    required this.listTileUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decorationColor: Colors.black,
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: listTileUpdate,
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: listTileDelete,
          ),
          IconButton(
            icon: Icon(
              isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isChecked ? Colors.green : Colors.grey,
            ),
            onPressed: () => checkboxChange(!isChecked),
          ),
        ],
      ),
      // onTap: listTileUpdate,
    );
  }
}
