import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Icon example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Icon(Icons.favorite,size: 30,color: Colors.red,),
      ),


    );
  }
}
