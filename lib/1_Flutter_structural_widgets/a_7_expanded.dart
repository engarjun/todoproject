import 'package:flutter/material.dart';
class A7Expanded extends StatelessWidget {
  const A7Expanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Expanded example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Row(
        children: [
          Expanded(child: Text('This is expanded examples')),
          Expanded(child: Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
