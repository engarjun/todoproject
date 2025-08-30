import 'package:flutter/material.dart';

class A3Row extends StatelessWidget {
  const A3Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Row example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Row(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,


        children: [

          Text('This is row'),
          Text('This is row'),

          Icon(Icons.star,color: Colors.yellow,),
          Icon(Icons.star_border,color: Colors.yellow,),
          Icon(Icons.star_half,color: Colors.yellow,),

        ],
      ),
    );
  }
}
