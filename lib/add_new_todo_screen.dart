import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoproject/todo.dart';

final _formKey = GlobalKey<FormState>();

class AddNewTodoScreen extends StatefulWidget{
  const AddNewTodoScreen({super.key});



  @override
  State<StatefulWidget> createState() {
   return _AddNewTodoScreen();
  }

}

class _AddNewTodoScreen extends State<AddNewTodoScreen>{

  final TextEditingController _idTEController = TextEditingController();
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _dptTEController = TextEditingController();
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();

  int count = 0;

  @override
  Widget build(BuildContext context) {


   return Scaffold(
     appBar: AppBar(
       title: Text('Add new Todo'),
     ),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(16),
         child: Form(
           key: _formKey,
           child: Column(

             children: [
               TextFormField(


           
                 controller: _idTEController,
                 decoration: InputDecoration(
                   hintText: 'Id',
                   border:  OutlineInputBorder(
                     borderRadius: BorderRadius.circular(50),
                   ),
                   enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(50),
                         borderSide: BorderSide(color: Colors.orange,width: 2)
                     ),
           
           
           
                 ),
                 validator: (value){
                   if(value == null || value.isEmpty){
                     return 'Please the ID number!';
                   }
                 },


           
               ),
               SizedBox(height: 7,),
               TextFormField(
                 controller: _nameTEController,
                 decoration: InputDecoration(
                     hintText: 'Name',
                   border:  OutlineInputBorder(
                     borderRadius: BorderRadius.circular(50),
                   ),
                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50),
                       borderSide: BorderSide(color: Colors.orange,width: 2)
                   ),
                 ),
                 validator: (value){
                   if(value == null || value.isEmpty){
                     return 'Please enter your name';
                   }
                 },
               ),
               SizedBox(height: 7,),
               TextFormField(
                 validator: (value){
                   if(value == null || value.isEmpty){
                     return 'Enter your department name';
                   }
                 },
                 controller: _dptTEController,
                 decoration: InputDecoration(
                     hintText: 'Department',
                   border:  OutlineInputBorder(
                     borderRadius: BorderRadius.circular(50),
                   ),
                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50),
                       borderSide: BorderSide(color: Colors.orange,width: 2)
                   ),
                 ),
               ),
               SizedBox(height: 7,),
               TextFormField(
                 validator: (value){
                   if(value == null || value.isEmpty){
                     return 'Please enter the title name of your problem';
                   }
                 },
                 controller: _titleTEController,
                 decoration: InputDecoration(
                     hintText: 'Title',
                   border:  OutlineInputBorder(
                     borderRadius: BorderRadius.circular(50),
                   ),
                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50),
                       borderSide: BorderSide(color: Colors.orange,width: 2)
                   ),
                 ),
               ),
               SizedBox(height: 7,),

               TextFormField(
                 validator: (value){
                   if(value == null || value.isEmpty){
                     return 'Please describe details of your problem';
                   }
                 },
                 controller: _descriptionTEController,
                 decoration: InputDecoration(
                     hintText: 'Description',
                   border:  OutlineInputBorder(
                     borderRadius: BorderRadius.circular(50),
                   ),
                   enabledBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(50),
                       borderSide: BorderSide(color: Colors.orange,width: 2)
                   ),
                 ),
               ),
                SizedBox(height: 16,),
               ElevatedButton(onPressed: (){
                 if(_formKey.currentState!.validate()){
                   Todo todo = Todo(
                     id: _idTEController.text, name: _nameTEController.text, dpt: _dptTEController.text,
                     title: _titleTEController.text.trim(),
                     description: _descriptionTEController.text.trim(), status: 'Pending', createdDate: DateTime.now(), );
                   Navigator.pop(context, todo);
                 }

               }, child: Text('Save')),
               SizedBox(height: 10,),

               Text(count.toString()),

               SizedBox(height: 10,),

               ElevatedButton(onPressed: (){
                 count++;
                 setState(() {

                 });
               }, child: Text('Count'))
                  
             ],
           ),
         ),
       ),
     ),
   );
  }

}