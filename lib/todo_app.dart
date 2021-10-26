import 'package:demo/models/todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TodoApp();
}

class _TodoApp extends State<TodoApp> {
  bool _checker = true;
  Todo _todo = Todo(
      description: "", id: "", name: "", priority: 1, dueDate: DateTime.now());

  final List<Todo> _todos = <Todo>[];
  final _todoInputNameController = TextEditingController();
  final _todoInputDateController = TextEditingController();
  DateTime initialDate = DateTime.now();
  DateTime _datePicked = DateTime.now();
  Future<void> _openDatePickerDialog(BuildContext context) async {
    _datePicked = (await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2025)))!;
    if (_datePicked != initialDate) {
      setState(() {
        _todo.dueDate = _datePicked;
      });
    }
  }

  Future<void> _openTodoAppModal(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _todoInputNameController,
                    onChanged: (text) {},
                    decoration: const InputDecoration(
                        label: Text("Todo Name"),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Due Date"),
                      TextButton(
                          onPressed: () async {
                            await _openDatePickerDialog(context);
                          },
                          child: const Icon(Icons.date_range))
                    ],
                  ),
                  Text("Deadline: ${DateFormat.yMMMd().format(_todo.dueDate)}")
                ],
              ),
            ),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () {},
                child: const Text("Submit"),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                await _openTodoAppModal(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
