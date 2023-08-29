import 'package:flutter/material.dart';



class TaskDetail extends StatelessWidget {
  final Map<String, dynamic> taskData;
  final Function(Map<String, dynamic>) onSave;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _deadlineController = TextEditingController();

  TaskDetail(this.taskData, {required this.onSave}) {
    _titleController.text = taskData['name'];
    _descriptionController.text = taskData['description'];
    _deadlineController.text = taskData['dueDate'];
  }

  void _handleSave(BuildContext context) {
    final updatedTaskData = {
      'name': _titleController.text,
      'description': _descriptionController.text,
      'dueDate': _deadlineController.text,
    };
    onSave(updatedTaskData);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.red,
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'Task Detail',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
              ),
              Image.network('https://picsum.photos/200'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title'),
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(),
                        hintText: 'Some text',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Description'),
                    TextField(
                      controller: _descriptionController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(),
                        hintText: 'Description text',
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Deadline'),
                    TextField(
                      controller:_deadlineController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(),
                        hintText: 'Deadline text',
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red
                ),
                onPressed:
                  () => _handleSave(context), child:
                  Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
