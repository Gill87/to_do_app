import 'package:flutter/material.dart';
import 'package:to_do_app/components/created_dialog.dart';
import 'package:to_do_app/components/to_do_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("mybox");
  ToDoDatabase db = ToDoDatabase();


  @override
  void initState() {

    // If first time opening app, then create default data
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();

    db.updateDatabase();
  }

  // checkbox tapped
  void checkboxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  final _controller = TextEditingController();

  // Create New Task
  void createNewTask() async{
    showDialog(
      context: context, 
      builder: (context) {
        return CreatedDialog(
          controller: _controller, 
          onSave: saveNewTask, 
          onCancel: () => Navigator.of(context).pop(),
        );
      }
    );
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        title: Center(child: Text('To-Do List')),
        elevation: 0,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
        return ToDoTile(
          taskName: db.toDoList[index][0], 
          taskCompleted: db.toDoList[index][1], 
          onChanged: (value) => checkboxChanged(value, index),
          deleteFunction: (context) => deleteTask(index),
        );
      }),
    );
  }
}