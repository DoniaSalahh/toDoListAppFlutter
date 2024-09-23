import 'task.dart';

class TodoModel {
  int id;
  String time;
  List<Task> description;

  TodoModel({
    required this.id,
    required this.time,
    required this.description,
});
}