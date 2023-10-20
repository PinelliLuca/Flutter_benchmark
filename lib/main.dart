import 'dart:async';
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
  int timeRemoved = 0;

  void add100Tasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 100; i++) {
      tasks.add("Task ${i + 1}");
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    timeAdded += end - start;
    time100added = end - start;
    print("Time 100 task: $time100added" );
    setState(() {});
  }

  void add250Tasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 250; i++) {
      tasks.add("Task ${i + 1}");
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    timeAdded += end - start;
    setState(() {});
  }

  void add500Tasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    for (int i = 0; i < 500; i++) {
      tasks.add("Task ${i + 1}");
    }
    int end = DateTime.now().millisecondsSinceEpoch;
    timeAdded += end - start;
    setState(() {});
  }

  void removeTasks() async {
    int start = DateTime.now().millisecondsSinceEpoch;
    tasks.clear();
    int end = DateTime.now().millisecondsSinceEpoch;
    timeRemoved += end - start;
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
              child: Icon(Icons.add_circle_2),
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