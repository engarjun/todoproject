import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Text example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      //TEXT Example
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Hello Flutter how are you?',style:TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.blue
        ),),
      ),

    );
  }
}
