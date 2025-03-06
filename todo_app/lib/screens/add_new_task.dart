import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Constants/color.dart';
import 'package:todo_app/Constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';

class AddNewTask extends StatefulWidget {
  const AddNewTask({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  TextEditingController titleController = TextEditingController();
  TextEditingController useridController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TodoService todoService = TodoService();

  Tasktype tasktype = Tasktype.note;

  @override
  Widget build(BuildContext context) {
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: devicewidth,
                height: deviceheight / 10,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/image/add_new_task.png"),
                      fit: BoxFit.cover),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                        child: Text(
                      "Add new Task",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: const Text("Task title")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Category"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori seçildi."),
                          ),
                        );
                        setState(() {
                          tasktype = Tasktype.note;
                        });
                      },
                      child: Image.asset("lib/assets/image/Category1.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori seçildi."),
                          ),
                        );
                        setState(() {
                          tasktype = Tasktype.calender;
                        });
                      },
                      child: Image.asset("lib/assets/image/Category2.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text("Kategori seçildi."),
                          ),
                        );
                        setState(() {
                          tasktype = Tasktype.contest;
                        });
                      },
                      child: Image.asset("lib/assets/image/Category3.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("User ID"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: useridController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text("Time"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timeController,
                              decoration: const InputDecoration(
                                  filled: true, fillColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Description")),
              SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: const InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    saveTodo();
                    Navigator.pop(context);
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }

  void saveTodo() {
    Todo newTodo = Todo(
      id: -1,
      todo: titleController.text,
      completed: false,
      userid: int.parse(useridController.text),
    );
    todoService.addTodo(newTodo);
  }
}
