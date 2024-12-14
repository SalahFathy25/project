import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';
import '../widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int totalTasks = Provider.of<TaskData>(context).tasks.length;
    int totalDoneTasks = Provider.of<TaskData>(context)
        .tasks
        .where((task) => task.isDone)
        .length;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            CupertinoDialogRoute(
              context: context,
              builder: (context) => AddTaskScreen(() {}),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(255, 187, 131, 111),
        tooltip: 'Add Task',
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 112, 95, 82),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            const Row(
              spacing: 20,
              children: [
                Icon(
                  Icons.playlist_add_check,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  'ToDayDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: '$totalDoneTasks',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 56, 56),
                    ),
                  ),
                  const TextSpan(
                    text: ' of ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: '$totalTasks',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 56, 56),
                    ),
                  ),
                  const TextSpan(
                    text: ' tasks completed',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const TasksList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
