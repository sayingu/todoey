import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/page/task_page.dart';

import 'model/pick.dart';
import 'model/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          Tasks tasks = Tasks();
          tasks.init();
          return tasks;
        }),
        ChangeNotifierProvider(create: (context) => PickList())
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TaskPage(),
      ),
    );
  }
}
