import 'package:flutter/material.dart';
class A1Container extends StatelessWidget {
  const A1Container({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is container example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: 200,
        width: 200,
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.only(left: 10,top: 10),
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text('Container',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),

    );
  }
}
