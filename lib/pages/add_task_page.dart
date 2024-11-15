
// import 'package:flutter/material.dart';
// import '../models/task.dart';

// class AddTaskPage extends StatefulWidget {
//   @override
//   _AddTaskPageState createState() => _AddTaskPageState();
// }

// class _AddTaskPageState extends State<AddTaskPage> {
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   String _selectedPriority = 'Normal';
//   int _selectedHours = 1; // Default value

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Task'),
//       ),
//       body: Center(
//         child: Container(
//           width: 450,
//           child: Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Add a New Task',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   TextField(
//                     controller: _titleController,
//                     decoration: InputDecoration(
//                       labelText: 'Task Title',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   TextField(
//                     controller: _descriptionController,
//                     decoration: InputDecoration(
//                       labelText: 'Description',
//                       border: OutlineInputBorder(),
//                     ),
//                     maxLines: 2,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Priority:',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   DropdownButton<String>(
//                     value: _selectedPriority,
//                     isExpanded: true,
//                     items: <String>['High', 'Medium', 'Normal'].map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedPriority = newValue!;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Hours dedicated:',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   DropdownButton<int>(
//                     value: _selectedHours, // Show the selected value
//                     isExpanded: true,
//                     items: List.generate(10, (index) => index + 1).map((int value) {
//                       return DropdownMenuItem<int>(
//                         value: value,
//                         child: Text(value.toString()),
//                       );
//                     }).toList(),
//                     onChanged: (int? newValue) {
//                       setState(() {
//                         _selectedHours = newValue!; // Update selected hours
//                       });
//                     },
//                   ),
//                   SizedBox(height: 16),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Handle adding the task with the new properties
//                         Task newTask = Task(
//                           title: _titleController.text,
//                           description: _descriptionController.text,
//                           priority: _selectedPriority,
//                           hours: _selectedHours,
//                         );

//                         // Navigate back with the task
//                         Navigator.pop(context, newTask);
//                       },
//                       child: Text('Add Task'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedPriority = 'Normal';
  int _selectedHours = 1; // Default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
        backgroundColor: Colors.blueAccent,
      ),
        backgroundColor: Colors.blue[50], 
      body: Center(
        
        child: Container(
          width: 450,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add a New Task',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Task Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Priority:',
                    style: TextStyle(fontSize: 10),
                  ),
                  DropdownButton<String>(
                    value: _selectedPriority,
                    isExpanded: true,
                    items: <String>['High', 'Medium', 'Normal'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedPriority = newValue!;
                      });
                    },
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hours dedicated:',
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton<int>(
                    value: _selectedHours, // Show the selected value
                    isExpanded: true,
                    items: List.generate(10, (index) => index + 1).map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedHours = newValue!; // Update selected hours
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle adding the task with the new properties
                        Task newTask = Task(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          priority: _selectedPriority,
                          hours: _selectedHours,
                        );

                        // Navigate back with the task
                        Navigator.pop(context, newTask);
                      },
                      child: Text('Add Task'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

