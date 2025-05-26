import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  ToDoTile({
      super.key, 
      required this.taskName, 
      required this.taskCompleted, 
      required this.onChanged,
      required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
              SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              ),
          ]
        ),

        child: Container(
          child: Row(
            children: [
        
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
        
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  taskName,
                  style: TextStyle(
                    decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none
                  )
                ),
              ),
        
        
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green[300],
          ),
        
        ),
      ),
    );
  }
}