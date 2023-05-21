import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todo_app/screens/add_page.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('ToDo List'),  
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigatetoToAddPage,
        label: Text('ToDo'),
      ),
    );
  }

  void navigatetoToAddPage(){
    final route = MaterialPageRoute(
      builder: (context) => AddToDoPage(),
    );
    Navigator.push(context, route);
  }
}