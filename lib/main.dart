//import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> tasks = [];
  int timeAdded = 0;
  int time100added = 0;
  int time250added = 0;
  int time500added = 0;
  int timeRemoved = 0;
  int indexTasks=0;
  double timeAverage=0;

  void add100Tasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 100; i++) {
      tasks.add("Task ${i + 1}");
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    timeAdded += end - start;
    time100added = end - start;
    print("Time 100 task: $time100added" );
    indexTasks+=100;
    setState(() {});
  }

  void add250Tasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 250; i++) {
      tasks.add("Task ${i + 1}");
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    timeAdded += end - start;
    time250added = end - start;
    print("Time 250 task: $time250added" );
    indexTasks+=250;
    setState(() {});
  }

  void add500Tasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 500; i++) {
      tasks.add("Task ${i + 1}");
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    timeAdded += end - start;
    time500added = end - start;
    print("Time 500 task: $time500added" );
    indexTasks+=500;
    setState(() {});
  }

  void removeTasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    tasks.clear();
    int end = DateTime.now().millisecondsSinceEpoch;
    timeRemoved += end - start;
    print("Time removed for $indexTasks: $timeRemoved" );
    indexTasks=0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(tasks[index]),
              value: tasks[index].contains("*"),
              onChanged: (value) {
                if (value=="true") {
                  tasks[index] = tasks[index] + "*";
                } else {
                  tasks[index] = tasks[index].substring(0, tasks[index].length - 1);
                }
                setState(() {});
              },
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: add100Tasks,
              tooltip: "Aggiungi 100 voci",
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: add250Tasks,
              tooltip: "Aggiungi 250 voci",
              child: Icon(Icons.add_circle_outline),
            ),
            FloatingActionButton(
              onPressed: add500Tasks,
              tooltip: "Aggiungi 500 voci",
              child: Icon(Icons.add_circle),
            ),
            FloatingActionButton(
              onPressed: removeTasks,
              tooltip: "Rimuovi tutte le voci",
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}