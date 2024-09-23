import 'package:todo_list/models/todo_model.dart';
import 'package:todo_list/models/task.dart';

class TodoController {
  List<TodoModel> tasks = [
    
  ];

  List<Task> getTodoModelForIndex(int index) {
    return tasks[index].description;
  }

  void addTodoList(TodoModel todoModel) {
    tasks.add(todoModel);
  }

  void deleteTodoGroup(int index) {
    tasks.removeAt(index);
  }

  void updateTodoGroup(int index, TodoModel updatedTodoModel) {
  tasks[index] = updatedTodoModel;
  }

  void updateTodoModel(TodoModel updatedTodo) {
    int index = tasks.indexWhere((todo) => todo.id == updatedTodo.id);
    if (index != -1) {
      tasks[index] = updatedTodo;}}
}