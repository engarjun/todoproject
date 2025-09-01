import 'package:flutter/material.dart';

//import '2_Flutter_Display_&_Styling_widgets/a_6_container.dart';

//import '13_curd_class/home_screen.dart';
import 'package:todoproject/proj/app.dart';



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
      home:MyApp(),
    );
  }
}
