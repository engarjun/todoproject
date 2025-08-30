import 'package:flutter/material.dart';
class A2Column extends StatelessWidget {
  const A2Column({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Column example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        //textDirection: TextDirection.ltr,
        //textDirection: TextDirection.rtl,
        //verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,



        children: [
          Text('This is Columns'),
          Text('This is Column'),
          Text('This Column'),
          Text('Column'),
        ],
      ),
    );
  }
}
