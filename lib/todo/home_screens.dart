import 'package:flutter/material.dart';
import 'package:todoproject/todo/class_todo.dart';

import 'add_new_todo_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<TodoList> todoList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List Project',style: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index){
            TodoList todo = todoList[index];
            return ListTile(
              title: Text('Title: ${todo.title}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${todo.id}'),
                  Text('Name: ${todo.name}'),
                  Text('Department: ${todo.department}'),
                  Text('Description: ${todo.description}'),
                  Text('Create Date: ${todo.createDate}'),
                ],
              ),
              trailing: Text(todo.status),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
/*
            TodoList todo = TodoList(
            id: '1',
            name: 'Arjo Barman',
          department: 'IT',
            title: 'Computer issue',
            description: 'Computer does not work',
            status: 'Pending',
          createDate: DateTime.now(),
        );
        todoList.add(todo);
        setState(() {
        });*/

     TodoList? todo = await  Navigator.push(context, MaterialPageRoute(builder: (context){
         return AddNewTodoScreens(names: ((todoList.length) + 1).toString(),);
     }
     ));

     if(todo != null){
       todoList.add(todo);
       setState(() {
       });
     }

      },
        child: Icon(Icons.add),),
    );
  }
}
