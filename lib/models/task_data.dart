import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [];
  late Box<Task> tasksBox;

  TaskData() {
    tasksBox = Hive.box<Task>('tasks');
    final storedTasks = tasksBox.values.toList();
    tasks = storedTasks;
    notifyListeners();
  }

  void addTask(String newTaskTitle) {
    Task newTask = Task(name: newTaskTitle);
    tasks.add(newTask);
    notifyListeners();
    tasksBox.add(newTask);
  }

  void doneTask(Task task) {
    int index = tasks.indexOf(task);
    if (index != -1) {
      task.doneChange();
      notifyListeners();
      tasksBox.putAt(index, task);
    }
  }

  void deleteTask(Task task) {
    int index = tasks.indexOf(task);
    if (index != -1) {
      tasks.removeAt(index);
      notifyListeners();
      tasksBox.deleteAt(index);
    }
  }

  void updateTask(Task task, String updatedTaskTitle) {
    int index = tasks.indexOf(task);
    if (index != -1) {
      tasks[index].name = updatedTaskTitle;
      notifyListeners();
      tasksBox.putAt(index, tasks[index]);
    }
  }
}
