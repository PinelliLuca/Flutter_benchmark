import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  get items => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = [];
  final Stopwatch timer = Stopwatch();
  Map<String, dynamic> times = {
    'load100ItemsAverage': 0.0,
    'load500ItemsAverage': 0.0,
    'load1000ItemsAverage': 0.0,
    'removeAllItemsAverage': 0.0,
    'load100Items': [],
    'load500Items': [],
    'load1000Items': [],
    'removeItem': [],
  };

  List<bool> checkedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App Benchmark'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index],
              style: TextStyle(
                decoration: checkedItems[index]
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            trailing: Checkbox(
              value: checkedItems[index],
              onChanged: (bool value) {
                setState(() {
                  _updateCheckedItem(index, value);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _loadItems(100);
            },
            child: Text('100'),
          ),
          FloatingActionButton(
            onPressed: () {
              _loadItems(500);
            },
            child: Text('500'),
          ),
          FloatingActionButton(
            onPressed: () {
              _loadItems(1000);
            },
            child: Text('1000'),
          ),
          FloatingActionButton(
            onPressed: () {
              _removeAllItems();
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void _updateCheckedItem(int index, bool value) {
    if (value != null) {
      setState(() {
        checkedItems[index] = value;
      });
    }
  }
  void deleteTask(int index){
    timer.start();
    setState(() {
      widget.items.removeAt(index);
    });
    timer.stop();
    times['removeItem'] = timer.elapsedMicroseconds;
    times['removeItemAverage'] =
        times['removeItem'] / items.length;
    print(times);
  }

  void _loadItems(int count) {
    timer.start();

    setState(() {
      items = List.generate(count, (index) => 'task ${index + 1}');
      checkedItems = List.generate(count, (index) => false);
    });

    timer.stop();
    String timerKey = 'load${count}Items';
    times[timerKey].add(timer.elapsedMicroseconds);

    String averageKey = 'load${count}ItemsAverage';
    times[averageKey] =
        times[timerKey].reduce((a, b) => a + b) / times[timerKey].length;

    print(times);
  }

  void _removeAllItems() {
    timer.start();

    setState(() {
      items.clear();
      checkedItems.clear();
    });

    timer.stop();
    times['removeItem'] = timer.elapsedMicroseconds;

    times['removeItemAverage'] =
        times['removeItem'] / items.length;

    print(times);
  }
}
