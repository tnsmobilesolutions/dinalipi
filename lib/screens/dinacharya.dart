import 'package:dinalipi/pages/addTask.dart';
import 'package:flutter/material.dart';

class Dinacharya extends StatelessWidget {
  const Dinacharya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Text(
                "ADD TASK",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddTaskPage()),
              );
            },
          ),
        ),
      ),
    );
  }
}


