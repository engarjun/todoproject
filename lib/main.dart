import 'package:flutter/material.dart';

import '13_curd_class/home_screen.dart';





void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}
