import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is DecoratedBox example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(5, 5)
            )
            ],
          ),
          child: Text('Styled Container',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),

        ),

      ),



    );
  }
}
