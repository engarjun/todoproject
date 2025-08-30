import 'package:flutter/material.dart';
import 'package:todoproject/todo/class_todo.dart';
import 'package:todoproject/todo/home_screens.dart';

final _formKey = GlobalKey<FormState>();

class AddNewTodoScreens extends StatefulWidget {
  final String names;
  const AddNewTodoScreens({super.key, required this.names});

  @override
  State<AddNewTodoScreens> createState() => _AddNewTodoScreensState();
}

class _AddNewTodoScreensState extends State<AddNewTodoScreens> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _dtpEditingController = TextEditingController();
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add new Todo Task')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                readOnly: true,

                controller: TextEditingController(text: widget.names),
                decoration: InputDecoration(
                  hintText: 'Id',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ID';
                  }
                },
              ),

              SizedBox(height: 7),
              TextFormField(
                controller: _nameEditingController,

                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                   _nameEditingController.text = 'Not found!';
                  }
                },
              ),
              SizedBox(height: 7),
              TextFormField(
                controller: _dtpEditingController,
                decoration: InputDecoration(
                  hintText: 'Department',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _dtpEditingController.text = 'Not found!';
                  }
                },
              ),
              SizedBox(height: 7),
              TextFormField(
                controller: _titleEditingController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _titleEditingController.text = 'Not found!';
                  }
                },
              ),
              SizedBox(height: 7),

              TextFormField(
                controller: _descEditingController,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _descEditingController.text = 'Not found!';
                  }
                },
              ),
              SizedBox(height: 7),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final TextEditingController idEditingController =
                        TextEditingController(text: widget.names);

                    TodoList todo = TodoList(
                      id: idEditingController.text,

                      name: _nameEditingController.text,
                      department: _dtpEditingController.text,
                      title: _titleEditingController.text,
                      status: 'Pending',
                      description: _descEditingController.text,
                      createDate: DateTime.now(),
                    );

                    Navigator.pop(context, todo);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
