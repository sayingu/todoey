import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    Tasks tasks = context.watch();
    Task task = context.watch();

    return ListTile(
      onLongPress: () {
        tasks.remove(task);
      },
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          task.toggleCompleted(value!);
          tasks.updatePref();
        },
      ),
      title: Text(
        task.description,
        style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? Colors.grey : Colors.black),
      ),
    );
  }
}
