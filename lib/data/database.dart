import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box("mybox");

  // First time openiing this app
  void createInitialData(){
    toDoList = [
      ["Live Laugh Love!", false],
    ];
  }

  // Load data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  // Update Database
  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }

}