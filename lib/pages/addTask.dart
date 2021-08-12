import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay times = TimeOfDay.now();

  void selectStartTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (newTime != null) {
      setState(() {
        time = newTime;
      });
    }
  }

  void selectEndTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: times,
    );
    if (newTime != null) {
      setState(() {
        times = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  ElevatedButton(onPressed: () {}, child: Text('Add')),
                ],
              ),
              SizedBox(height: 40.0),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'ADD TASK ',
                      labelStyle: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      hintText: 'Enter Your Task Here',
                      hintStyle: TextStyle(fontSize: 16.0),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Start Time'),
                  TextButton(
                    child: Icon(Icons.av_timer),
                    onPressed: selectStartTime,
                  ),
                  Text(' ${time.format(context)}')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('End Time'),
                  TextButton(
                    child: Icon(Icons.av_timer),
                    onPressed: selectEndTime,
                  ),
                  Text(' ${times.format(context)}')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
