import 'package:flutter/material.dart';


class CreateTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MyHomePage();
  }
}
class MyHomePage extends StatelessWidget {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                    // Add functionality for back button here
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {
                    // Add functionality for three-dot menu here
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child:Center(
              child: Text(
                'Create New Task',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              )
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    _buildTextFieldWithLabel('Task Name', 'Enter task name', _taskNameController),
                    SizedBox(height: 20),
                    _buildTextFieldWithLabelAndIcon('Due Date', 'Select due date', Icons.calendar_today, _dueDateController),
                    SizedBox(height: 20),
                    _buildTextFieldWithLabel('Description', 'Enter description', _descriptionController),
                  ],
                ),
              ),
            ),
            Center(

            child:SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: ElevatedButton(
                  onPressed: () {
                    String taskName = _taskNameController.text;
                    String dueDate = _dueDateController.text;
                    String description = _descriptionController.text;
                    
                    Map<String, String> taskData = {
                      'name': taskName,
                      'dueDate': dueDate,
                      'description': description
                    };
                    
                    Navigator.pop(context, taskData);
                  },
                  child: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      
                    )
                  ),
                )
                )
            ))
          ],
        ),
      ),
    );
  }
}
Widget _buildTextFieldWithLabel(String labelText, String hintText, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red
        ),
      ),
      SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
}

Widget _buildTextFieldWithLabelAndIcon(String labelText, String hintText, IconData iconData, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.red
        ),
      ),
      SizedBox(height: 8),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: Icon(
              iconData,
              color: Colors.red,
            ),
          ),
        ),
      ),
    ],
  );
}
