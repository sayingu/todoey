import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tasks extends ChangeNotifier {
  List<Task> _tasks = [];

  late SharedPreferences prefs;
  void init() async {
    prefs = await SharedPreferences.getInstance();
    String tasksString = prefs.getString('tasks') ?? '';
    if (tasksString != '') {
      List tasks = jsonDecode(tasksString);
      List<Task> tempTasks = [];
      for (Map task in tasks) {
        tempTasks.add(Task(
            description: task['description'],
            isCompleted: task['isCompleted']));
      }
      _tasks = tempTasks;
      notifyListeners();
    }
  }

  set tasks(List<Map> tasks) {
    List<Task> tempTasks = [];
    for (Map task in tasks) {
      tempTasks.add(Task(
          description: task['description'], isCompleted: task['isCompleted']));
    }
    _tasks = tempTasks;
  }

  int get length {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get list {
    return UnmodifiableListView(_tasks);
  }

  void updatePref() {
    prefs.setString('tasks',
        jsonEncode(_tasks.map((element) => element.toJson()).toList()));
  }

  void add(Task task) {
    _tasks.add(task);
    notifyListeners();

    updatePref();
  }

  void remove(Task task) {
    _tasks.remove(task);
    notifyListeners();

    updatePref();
  }
}

class Task extends ChangeNotifier {
  final String description;
  bool isCompleted;

  Task({required this.description, this.isCompleted = false});

  void toggleCompleted(bool value) {
    isCompleted = value;
    notifyListeners();
  }

  Map toJson() {
    return {'description': description, 'isCompleted': isCompleted};
  }
}
