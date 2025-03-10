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

class LongPressEditScreen extends StatefulWidget {
  @override
  _LongPressEditScreenState createState() => _LongPressEditScreenState();
}

class _LongPressEditScreenState extends State<LongPressEditScreen> {
  List<Plan> plans = [
    Plan(name: "Hiking", description: "Mountain trip", date: DateTime.now(), priority: "High"),
    Plan(name: "Car Service", description: "Oil change", date: DateTime.now(), priority: "Low"),
  ];

  void _editPlan(int index) {
    TextEditingController nameController = TextEditingController(text: plans[index].name);
    TextEditingController descriptionController = TextEditingController(text: plans[index].description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Plan"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
              TextField(controller: descriptionController, decoration: InputDecoration(labelText: 'Description')),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  plans[index].name = nameController.text;
                  plans[index].description = descriptionController.text;
                });
                Navigator.pop(context);
              },
              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Long Press to Edit")),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () => _editPlan(index),
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
