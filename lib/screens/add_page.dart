import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Add Title',
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              hintText: 'Add Description',
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 10,
          ),
          SizedBox(
            height: 20,
          ),
          // ClipRRect(
          //   child: Material(
          //     color: Colors.blue, // Button color
          //     child: InkWell(
          //       splashColor: Colors.green, // Splash color
          //       onTap: () {},
          //       child: SizedBox(width: 56, height: 56, child: Icon(Icons.save)),
          //     ),
          //   ),
          // ),
          MaterialButton(
            onPressed: saveData,
            color: Colors.green,
            textColor: Colors.white,
            child: Icon(
              Icons.save,
              size: 24,
            ),
            padding: EdgeInsets.all(16),
            shape: CircleBorder(),
          )
        ],
      ),
    );
  }

  Future<void> saveData() async {
    // get the data from form
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    // submit data to server
    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri, 
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json',}
    );

    // show success or fail message based on status
    if (response.statusCode == 201){
      print('Creation Success');
      showSuccessMessage('Saved');
    }else{
      print('Creation Failed');
      print(response.body);
      showSuccessMessage('Failed');
    }
  }

  void showSuccessMessage(String msg){
    final snackBar = SnackBar(
      content: Text(msg,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white
      ),
      ),
      backgroundColor: Colors.green,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String msg){
    final snackBar = SnackBar(
      content: Text(msg,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white
      ),
      ),
      backgroundColor: Colors.red,);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
