import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  String name;

  @HiveField(1)
  bool isDone;

  Task({required this.name, this.isDone = false});

  void doneChange() {
    isDone = !isDone;
  }

  void updateName(String newName) {
    name = newName;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Task && other.name == name && other.isDone == isDone;
  }

  @override
  int get hashCode => name.hashCode ^ isDone.hashCode;
}

//flutter pub run build_runner build
