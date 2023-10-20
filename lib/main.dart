import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Task extends StatelessWidget{
  final int id;
  final String title;
  Function (bool?) onChanged;

  Task({
    super.key, required this.id, required this.title, required this.onChanged,
});
}

class MyApp extends StatefulWidget {
  /// Stato dell'applicazione.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// Lista delle voci.
  List<Task> tasks = [];

  /// Tempo necessario per aggiungere le voci.
  int timeAdded = 0;

  /// Tempo necessario per rimuovere le voci.
  int timeRemoved = 0;

  /// Inizializza il stato dell'applicazione.
  @override
  void initState() {
    super.initState();

    /// Aggiunge due voci di default.
    tasks.add(Task(id: 1, title: "Premi i seguenti tasti"));
    tasks.add(Task(id: 2, title: "per aggiungere voci alla lista"));
  }

  /// Aggiunge 100 voci alla lista.
  void add100Tasks() async {
    /// Inizializza il timer.
    int start = DateTime.now().millisecondsSinceEpoch;

    /// Aggiunge le voci alla lista.
    for (int i = 0; i < 100; i++) {
      tasks.add(Task(id: i + 3, title: "Task ${i + 3}"));
    }

    /// Termina il timer.
    int end = DateTime.now().millisecondsSinceEpoch;

    /// Memorizza il tempo necessario.
    timeAdded = end - start;

    /// Aggiorna lo stato dell'applicazione.
    setState(() {});
  }

  /// Aggiunge 250 voci alla lista.
  void add250Tasks() async {
    /// Inizializza il timer.
    int start = DateTime.now().millisecondsSinceEpoch;

    /// Aggiunge le voci alla lista.
    for (int i = 0; i < 250; i++) {
      tasks.add(Task(id: i + 13, title: "Task ${i + 13}"));
    }

    /// Termina il timer.
    int end = DateTime.now().millisecondsSinceEpoch;

    /// Memorizza il tempo necessario.
    timeAdded = end - start;

    /// Aggiorna lo stato dell'applicazione.
    setState(() {});
  }

  /// Aggiunge 500 voci alla lista.
  void add500Tasks() async {
    /// Inizializza il timer.
    int start = DateTime.now().millisecondsSinceEpoch;

    /// Aggiunge le voci alla lista.
    for (int i = 0; i < 500; i++) {
      tasks.add(Task(id: i + 33, title: "Task ${i + 33}"));
    }

    /// Termina il timer.
    int end = DateTime.now().millisecondsSinceEpoch;

    /// Memorizza il tempo necessario.
    timeAdded = end - start;

    /// Aggiorna lo stato dell'applicazione.
    setState(() {});
  }

  /// Rimuove tutte le voci dalla lista.
  void removeTasks() async {
    /// Inizializza il timer.
    int start = DateTime.now().millisecondsSinceEpoch;

    /// Rimuove le voci dalla lista.
    tasks.clear();

    /// Termina il timer.
    int end = DateTime.now().millisecondsSinceEpoch;

    /// Memorizza il tempo necessario.
    timeRemoved = end - start;

    /// Aggiorna lo stato dell'applicazione.
    setState(() {});
  }


  /// Costruisce l'interfaccia utente.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Benchmark todo Flutter"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(tasks[index].title),
                    value: tasks[index].isCompleted,
                    onChanged: (value) {
                      setState(() {
                      tasks[index].isCompleted = value;
                      });
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: add100Tasks,
                  tooltip: "Aggiungi 100 voci",
                  child: Icon(Icons.add, size: 60),
                ),
                FloatingActionButton(
                  onPressed: add250Tasks,
                  tooltip: "Aggiungi 250 voci",
                  child: Icon(Icons.add_circle_outline, size: 60),
                ),
                FloatingActionButton(
                  onPressed: add500Tasks,
                  tooltip: "Aggiungi 500 voci",
                  child: Icon(Icons.add_circle, size: 60),
                ),
                FloatingActionButton(
                  onPressed: removeTasks,
                  tooltip: "Rimuovi tutte le voci",
                  child: Icon(Icons.remove, size: 60),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

