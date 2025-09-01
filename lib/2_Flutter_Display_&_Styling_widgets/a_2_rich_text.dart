import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Rich Text example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body:
      RichText(
          text: TextSpan(
              text: 'RichText Status',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),
              children: [
                TextSpan(
                    text: 'TextSpan Status',style: TextStyle(color: Colors.green,fontSize: 20,fontWeight: FontWeight.bold)
                )
              ]
          )

      ),


    );
  }
}
