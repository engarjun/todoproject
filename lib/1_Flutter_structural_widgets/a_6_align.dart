import 'package:flutter/material.dart';
class A6Align extends StatelessWidget {
  const A6Align({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Alignment example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Align(
          alignment: Alignment.topCenter,
          child: Text('This is alignment')

      ),
    );
  }
}
