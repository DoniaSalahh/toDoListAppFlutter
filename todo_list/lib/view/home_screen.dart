import 'package:flutter/material.dart';
import '../Controller/todo_controller.dart';
import '../models/todo_model.dart';
import '../utils/app_style.dart';
import 'add_new_task_screen.dart';
import 'task_list_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController _todoController = TodoController();

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('EEE, dd MMMM yyyy');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List App',
          style: AppStyle.appBar,
        ),
        backgroundColor: const Color.fromARGB(255, 79, 243, 33),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 200.0),
            child: Icon(Icons.today_sharp, color: Colors.white),
    )
        ],
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text(
              "Today",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            subtitle: Text(formatDate(DateTime.now())),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoController.tasks.length,
              itemBuilder: (context, int index) {
                return TaskListScreen(
                  todoModel: TodoModel(
                    id: index,
                    time: _todoController.tasks[index].time,
                    description: _todoController.getTodoModelForIndex(index),
                  ),
                  onDelete: () {},
                  onToggleCompleted: (taskIndex, value) {
                    setState(() {});
                  },
                  onUpdate: (updatedTasks) {
                    setState(() {});
                  },
                  todoController: _todoController,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color.fromARGB(255, 33, 243, 124)),
                ),
 onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return NewTaskButton(
                        onAdd: (newTodo) {
                          setState(() {
                            _todoController.addTodoList(newTodo);
                          });
                        },
                      );
                    },
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    Center(
                      child: Text("New Task", style: AppStyle.appBar),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
     ),);}
}