import 'package:flutter/material.dart';

class Plan {
  String name;
  String description;
  DateTime date;
  String priority;
  bool isCompleted;

  Plan({
    required this.name,
    required this.description,
    required this.date,
    required this.priority,
    this.isCompleted = false,
  });
}

class SwipeCompleteScreen extends StatefulWidget {
  @override
  _SwipeCompleteScreenState createState() => _SwipeCompleteScreenState();
}

class _SwipeCompleteScreenState extends State<SwipeCompleteScreen> {
  List<Plan> plans = [
    Plan(name: "Trip to Paris", description: "Book tickets", date: DateTime.now(), priority: "High"),
    Plan(name: "Dog Adoption", description: "Visit the shelter", date: DateTime.now(), priority: "Medium"),
  ];

  void _toggleComplete(int index) {
    setState(() {
      plans[index].isCompleted = !plans[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swipe to Complete")),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(plans[index].name),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) => _toggleComplete(index),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.check, color: Colors.white),
            ),
            child: ListTile(
              title: Text(
                plans[index].name,
                style: TextStyle(
                  decoration: plans[index].isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text("${plans[index].description} - ${plans[index].date.toLocal()}"),
              trailing: Text(plans[index].priority, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
