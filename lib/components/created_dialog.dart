import 'package:flutter/material.dart';
import 'package:to_do_app/components/my_button.dart';

class CreatedDialog extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const CreatedDialog({super.key, required this.controller, required this.onCancel, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[200],
      content: Container(
        height: 175,

        // Prompt task
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.only(top:7, bottom: 15),
              child: 
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'New Task',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),

            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),

            // save and cancel button
            Padding(
              padding: const EdgeInsets.only(top:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
              
                // Save Button
                MyButton(text: 'Save', onPressed: onSave),

                // Space out
                const SizedBox(width:10),
                
                // Cancel Button
                MyButton(text: 'Cancel', onPressed: onCancel),
              ],),
            )
          ],
        ),

      ),
    );
  }
}