import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Images example',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Image.network('C:\\Users\\Administrator\\Desktop\\504001687_684997360997924_4793002081513305749_n.jpg',width: 200,),




    );
  }
}
