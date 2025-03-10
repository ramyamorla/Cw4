import 'package:flutter/material.dart';
import 'swipe_complete.dart';
import 'long_press_edit.dart';
import 'double_tap_delete.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Plans App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Plan Manager')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SwipeCompleteScreen())),
            child: Text("Swipe to Complete"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LongPressEditScreen())),
            child: Text("Long Press to Edit"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DoubleTapDeleteScreen())),
            child: Text("Double Tap to Delete"),
          ),
        ],
      ),
    );
  }
}
