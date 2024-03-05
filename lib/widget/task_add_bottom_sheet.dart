import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';

class TaskAddBottomSheet extends StatelessWidget {
  const TaskAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    Tasks tasks = context.watch();

    String description = '';

    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'New Task',
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          TextField(
            autofocus: true,
            cursorColor: Colors.lightBlueAccent,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent)),
            ),
            onChanged: (value) {
              description = value;
            },
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent),
                onPressed: () {
                  tasks.add(Task(description: description));
                  Navigator.pop(context);
                },
                child: Text(
                  'Add Task',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          )
        ]),
      ),
    );
  }
}
