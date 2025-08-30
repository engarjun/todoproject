import 'package:flutter/material.dart';
import 'package:todoproject/todo_ex/todo_class.dart';
import 'package:todoproject/todo_ex/add_new_todo_screen.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List<Todo> todoList= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color:Colors.white

        ),),
        backgroundColor: Colors.green,
        centerTitle: true,

      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index){
            Todo todo = todoList[index];
            return ListTile(
              title: Text(todo.name),
             
            );
          }) ,
      floatingActionButton: FloatingActionButton(onPressed: (){

        Todo todo = Todo(name: 'Arjo');
        todoList.add(todo);
        setState(() {

        });

        Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewTodoScreen(name: ((todoList.length) + 1).toString() ,)));
      },child: Icon(Icons.add),),
    );
  }
}
