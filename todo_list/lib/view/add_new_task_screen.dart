import 'package:flutter/material.dart';
import '../controller/todo_controller.dart';
import '../models/task.dart';
import '../models/todo_model.dart';
import '../utils/app_style.dart';


class NewTaskButton extends StatefulWidget {
  final Function(TodoModel) onAdd;

  const NewTaskButton({
    Key? key,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<NewTaskButton> createState() => _NewTaskButtonState();
}

class _NewTaskButtonState extends State<NewTaskButton> {
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TodoController _todoController = TodoController();
  final List<Task> _taskList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.do_disturb,
                color: Colors.transparent,
              ),
              onPressed: () {},
 ),
            title: const Padding(
              padding: EdgeInsets.all(60.0),
              child: Text('Add Task'),
            ),
            elevation: 4,
            backgroundColor: const Color.fromARGB(255, 12, 103, 54),
            actions: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text("     Time:       "),
              Expanded(
                child: TextField(
                  controller: _timeController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.access_time),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text("Description: "),
              Expanded(
                child: TextField(
                  controller: _descriptionController,
                  maxLines: 1,
  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (_descriptionController.text.isNotEmpty) {
              setState(() {
                _taskList.add(Task(
                  name: _descriptionController.text,
                  isCompleted: false,
                ));
                _descriptionController.clear();
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 110, 243, 33)),
          ),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _taskList.length,
            itemBuilder: (context, index) {
   return ListTile(
                title: Text(_taskList[index].name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _taskList.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0, left: 60, right: 60),
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color.fromARGB(255, 33, 243, 47)),
              ),
              onPressed: () {
                if (_taskList.isNotEmpty && _timeController.text.isNotEmpty) {
                  TodoModel newList = TodoModel(
                    id: _todoController.tasks.length + 1,
                    time: _timeController.text,
                    description: _taskList,
                  );
                  _todoController.addTodoList(newList);
                  widget.onAdd(newList);
                  Navigator.pop(context);
                }
              },
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
  Center(
                      child: Text(
                        "Confirm",
                        style: AppStyle.appBar,
                      ),
                    )
                  ]),
            ),
          ),
        ),
     ],);}
}