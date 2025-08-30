import 'package:flutter/material.dart';
class A4Center extends StatelessWidget {
  const A4Center({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Center example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('This is center text',style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,backgroundColor: Colors.green
            ),),
          )
      ),
    );
  }
}
