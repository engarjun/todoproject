import 'package:flutter/material.dart';
import 'package:todoproject/add_new_todo_screen.dart';
import 'package:todoproject/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<Todo> todoList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,

        ),),
        backgroundColor: Colors.orange,
        titleSpacing: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),


      body: ListView.builder(
        itemCount: todoList.length,
          itemBuilder: (context, index){
          Todo todo = todoList[index];
           return ListTile(
            title: Text('Title: ${todo.title}',style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ID: ${todo.id}',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),
                Text('Name: ${todo.name}',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),),

                Text('Department: ${todo.dpt}'),
                SizedBox(height: 5,),
                Text('Details:',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),),
                Text(todo.description),
                SizedBox(height: 10,),
                Text('Created date: ${todo.createdDate}',style: TextStyle(
                    fontWeight: FontWeight.bold
                ),)
              ],
            ),
            trailing: Text(todo.status,style: TextStyle(
                fontWeight: FontWeight.bold,
              color: Colors.red

            ),


            ),
          );
          },
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () async {
        Todo? todo = await  Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddNewTodoScreen();
          }) );

        if(todo != null){
          setState(() {
            todoList.add(todo);

          }
          );
        }
      },
    child: Icon(Icons.add),),


    );
  }
}


