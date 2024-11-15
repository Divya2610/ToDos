// // import 'package:flutter/material.dart';

// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   final List<String> _tasks = []; // List to store tasks
// //   final TextEditingController _taskController = TextEditingController(); // Controller for the task input

// //   void _addTask() {
// //     if (_taskController.text.isNotEmpty) {
// //       setState(() {
// //         _tasks.add(_taskController.text); // Add the task to the list
// //         _taskController.clear(); // Clear the input field
// //       });
// //     }
// //   }

// //   void _deleteTask(int index) {
// //     setState(() {
// //       _tasks.removeAt(index); // Remove the task from the list
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('To-Do List'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.logout),
// //             onPressed: () {
// //               // Handle sign-out (optional)
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: _taskController,
// //               decoration: InputDecoration(
// //                 labelText: 'Add a new task',
// //                 suffixIcon: IconButton(
// //                   icon: Icon(Icons.add),
// //                   onPressed: _addTask,
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16.0),
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: _tasks.length,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                     title: Text(_tasks[index]),
// //                     trailing: IconButton(
// //                       icon: Icon(Icons.delete, color: Colors.red),
// //                       onPressed: () => _deleteTask(index),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'add_task_page.dart';
// import '../models/task.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<Task> tasks = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tasks'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () async {
//               final newTask = await Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AddTaskPage()),
//               );
//               if (newTask != null) {
//                 setState(() {
//                   tasks.add(newTask);
//                 });
//               }
//             },
//           ),
//         ],
//       ),
//       body: ListView.builder(
//         itemCount: tasks.length,
//         itemBuilder: (context, index) {
//           final task = tasks[index];
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             child: ListTile(
//               title: Text(task.title),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(task.description),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 10,
//                         backgroundColor: _getPriorityColor(task.priority),
//                       ),
//                       SizedBox(width: 8),
//                       Text('Priority: ${task.priority}'),
//                       SizedBox(width: 16),
//                       Text('Hours: ${task.hours}'),
//                     ],
//                   ),
//                 ],
//               ),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () {
//                   setState(() {
//                     tasks.removeAt(index);
//                   });
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Color _getPriorityColor(String priority) {
//     switch (priority) {
//       case 'High':
//         return Colors.red;
//       case 'Medium':
//         return Colors.orange;
//       case 'Normal':
//         return Colors.green;
//       default:
//         return Colors.grey;
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'add_task_page.dart';
import '../models/task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
        backgroundColor: Colors.blueAccent, // Change app bar color if needed
      ),
      body: Container(
        color: Colors.blue[50], // Light book shade
        child: tasks.isEmpty
            ? Center(
                child: Text(
                  'No tasks available.\nAdd a new task!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    elevation: 4,
                    child: ListTile(
                      title: Text(task.title, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(task.description),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: _getPriorityColor(task.priority),
                              ),
                              SizedBox(width: 8),
                              Text('Priority: ${task.priority}'),
                              SizedBox(width: 16),
                              Text('Hours: ${task.hours}'),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent, // Color for the FAB
      ),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Normal':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
