import 'package:flutter/material.dart';

class Plan {
  String name;
  String description;
  DateTime date;
  String priority;

  Plan({
    required this.name,
    required this.description,
    required this.date,
    required this.priority,
  });
}

class DoubleTapDeleteScreen extends StatefulWidget {
  @override
  _DoubleTapDeleteScreenState createState() => _DoubleTapDeleteScreenState();
}

class _DoubleTapDeleteScreenState extends State<DoubleTapDeleteScreen> {
  List<Plan> plans = [
    Plan(name: "Gym", description: "Workout session", date: DateTime.now(), priority: "High"),
    Plan(name: "Grocery Shopping", description: "Buy vegetables", date: DateTime.now(), priority: "Medium"),
  ];

  void _deletePlan(int index) {
    setState(() {
      plans.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Double Tap to Delete")),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () => _deletePlan(index),
            child: ListTile(
              title: Text(plans[index].name),
              subtitle: Text("${plans[index].description} - ${plans[index].date.toLocal()}"),
              trailing: Text(plans[index].priority, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}
