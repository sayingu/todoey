import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/task.dart';
import 'package:todoey/widget/task_add_bottom_sheet.dart';

import '../widget/task_tile.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  String tasksString = '';

  @override
  Widget build(BuildContext context) {
    Tasks tasks = context.watch();

    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => const TaskAddBottomSheet(),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Icon(
                    Icons.list,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${tasks.length} tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 20),
                children: tasks.list
                    .map(
                      (e) => ChangeNotifierProvider<Task>.value(
                        value: e,
                        child: TaskTile(),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
