import 'package:flutter/material.dart';
import 'create_task.dart';
import 'task_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/create': (context) => CreateTask(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> tasks = [];

  void addTask(Map<String, dynamic> newTask) {
    setState(() {
      tasks.add(newTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            Image.network('https://picsum.photos/200'),
            Container(
              padding: EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              child: Text('Tasks List'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetail(task, onSave: (updatedTaskData) {
                              setState(() {
                                tasks[index] = updatedTaskData;
                              });
                            }),
                          ),
                        );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child:
                            Row(mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children:
                                [Text(task['name']),
                                 Text(task['dueDate']),
                                ],
                            ),
                      ));
                },
              ),
            ),
            Builder(builder:
                (BuildContext context) {
              return Container(
                width:
                    200,
                margin:
                    EdgeInsets.symmetric(horizontal:
                        16, vertical:
                        8),
                child:
                    ElevatedButton(style:
                        ElevatedButton.styleFrom(primary:
                            Colors.red), onPressed:
                        () async {
                      final result = await Navigator.pushNamed(context, '/create');
                      if (result != null) {
                        addTask(result as Map<String, dynamic>);
                      }
                    }, child:
                        Text('Create Task')),
              );
            }),
          ],
        ),
      ),
    );
  }
}
