import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Constants/color.dart';
import 'package:todo_app/Constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

/*List<String> todo = [
  "Study Lessons",
  "Run 5k",
  "Go to party",
];

List<String> completed = ["Game meetup", "Take out trash"];*/

class _homescreenState extends State<homescreen> {
  List<Task> todo = [
    Task(
        type: Tasktype.note,
        title: "Study Lessons",
        description: "Study COM117",
        isCompleted: false),
    Task(
        type: Tasktype.calender,
        title: "Go to party",
        description: "Attend to party",
        isCompleted: false),
    Task(
        type: Tasktype.contest,
        title: "Run 5k",
        description: "Run 5 kilometres",
        isCompleted: false),
  ];

  List<Task> completed = [
    Task(
        type: Tasktype.calender,
        title: "Go to party",
        description: "Attend to party",
        isCompleted: false),
    Task(
        type: Tasktype.contest,
        title: "Run 5k",
        description: "Run 5 kilometres",
        isCompleted: false),
  ];

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    TodoService todoService = new TodoService();
    double deviceheight = MediaQuery.of(context).size.height;
    double devicewidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              Container(
                width: devicewidth,
                height: deviceheight / 3,
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    image: DecorationImage(
                      image: AssetImage("lib/assets/image/header.png"),
                      fit: BoxFit.cover,
                    )),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "October 20 2020",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My Todo List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                    future: todoService.getUnCompletedTodo(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Todoitem(
                              task: snapshot.data![index],
                            );
                          },
                        );
                      }
                    },
                  )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Complited",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      child: FutureBuilder(
                    future: todoService.getCompletedTodo(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.data == null) {
                        return const CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Todoitem(
                              task: snapshot.data![index],
                            );
                          },
                        );
                      }
                    },
                  )),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewTask(
                        addNewTask: (newTask) => addNewTask(newTask),
                      ),
                    ));
                  },
                  child: Text("Add New Tas"))
            ],
          ),
        ),
      ),
    );
  }
}

extension on List<Todo> {
  bool? get isNull => null;
}
