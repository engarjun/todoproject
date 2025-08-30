import 'package:flutter/material.dart';
class A10Stack extends StatelessWidget {
  const A10Stack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Stack example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
            //child: Text('This is container'),
          ),
          Positioned(
            right: 50,
              left: 60,
              bottom: 50,
              child: Text('on Top',style: TextStyle(color: Colors.white),)
          ),
        ],
      ),
    );
  }
}
