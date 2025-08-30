import 'package:flutter/material.dart';

class AddNewTodoScreen extends StatefulWidget {

  final String name;
  const AddNewTodoScreen({super.key, required this.name});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
          ],
        ),
      ),

    );
  }
}
