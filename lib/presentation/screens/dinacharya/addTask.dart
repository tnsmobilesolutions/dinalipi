import 'package:dinalipi/data/model/task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController _taskNameEditingController = TextEditingController();
  TimeOfDay _startTimeTOD = TimeOfDay.now();
  TimeOfDay _endTimeTOD =
      TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);

  final Task data = Get.find();

  void selectStartTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (newTime != null) {
      setState(() {
        _startTimeTOD = newTime;
      });
    }
  }

  void selectEndTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _endTimeTOD,
    );
    if (newTime != null) {
      setState(() {
        _endTimeTOD = newTime;
      });
    }
  }

  // @override
  // void dispose() {
  //   _taskName.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                children: [
                  TextField(
                    controller: _taskNameEditingController,
                    decoration: InputDecoration(
                      labelText: 'ADD TASK ',
                      labelStyle: TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      hintText: 'Enter Your Task Here',
                      hintStyle: TextStyle(fontSize: 12.0),
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
                  Text(' ${_startTimeTOD.format(context)}')
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
                  Text(' ${_endTimeTOD.format(context)}')
                ],
              ),
              SizedBox(height: 80.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        print(
                            '$_taskNameEditingController.task, $_startTimeTOD , $_endTimeTOD');

                        data.addDinacharyaTask(
                            _taskNameEditingController.text,
                            _startTimeTOD.format(context),
                            _endTimeTOD.format(context));

                        Get.back();
                      },
                      child: Text('Add')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
