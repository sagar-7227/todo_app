import 'package:flutter/material.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add ToDo'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Add Title',
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          TextField(
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
            onPressed: () {},
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
}
