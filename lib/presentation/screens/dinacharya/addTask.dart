import 'package:dinalipi/DataBase/database_helper.dart';
import 'package:dinalipi/data/model/dinacharya_Model.dart';
import 'package:dinalipi/data/model/task.dart';
import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  final taskNameController = TextEditingController();
  final taskTypeController = TextEditingController();
  final taskStartTimeController = TextEditingController();
  final taskEndTimeController = TextEditingController();
  // TextEditingController _taskNameEditingController = TextEditingController();
  TimeOfDay? _startTimeTOD = TimeOfDay.now();
  TimeOfDay? _endTimeTOD;
  // TimeOfDay(hour: TimeOfDay.now().hour + 1, minute: TimeOfDay.now().minute);

  // void selectStartTime() async {
  //   final TimeOfDay? newTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (newTime != null) {
  //     setState(() {
  //       _startTimeTOD = newTime;
  //     });
  //   }
  // }

  // void selectEndTime() async {
  //   final TimeOfDay? newTime = await showTimePicker(
  //     context: context,
  //     initialTime: _endTimeTOD,
  //   );
  //   if (newTime != null) {
  //     setState(() {
  //       _endTimeTOD = newTime;
  //     });
  //   }
  // }

  var items = [
    'bool',
    'String',
    'DateTime',
    'int',
  ];
  // @override
  // void dispose() {
  //   _taskName.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 237, 222),
        title: Text(
          'Add Task',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    taskNameController.text = value!;
                  },
                  controller: taskNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Task Name',
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 325,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                contentPadding: EdgeInsets.all(16),
                                filled: true,
                                labelText: 'Task Type',
                                hintText: 'Task Type'),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                taskTypeController.text = newValue!;
                              });
                            }),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please Enter Your Email");
                    }

                    return null;
                  },
                  onSaved: (value) {
                    taskStartTimeController.text = value!;
                  },
                  controller: taskStartTimeController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () async {
                          _startTimeTOD = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (_startTimeTOD != null) {
                            String? formatedTime =
                                _startTimeTOD?.format(context);
                            print('formated time : $formatedTime');
                            setState(() {
                              taskStartTimeController.text = formatedTime ?? '';
                            });
                          }
                        },
                        icon: Icon(Icons.timelapse)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Task Start Time',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("Please Enter Your Email");
                    }
                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    taskEndTimeController.text = value!;
                  },
                  controller: taskEndTimeController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () async {
                          _endTimeTOD = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (_endTimeTOD != null) {
                            String? formatedTime = _endTimeTOD?.format(context);
                            print('formated time : $formatedTime');
                            setState(() {
                              taskEndTimeController.text = formatedTime ?? '';
                            });
                          }
                        },
                        icon: Icon(Icons.timelapse)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    labelText: 'Task End Time',
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () async {
                      final note = Dinacharjya(
                        taskName: 'walk',
                        taskType: TaskType.string,
                        id: 'abvci39b3qtg9c7tgq3',
                        taskStartTime: DateTime.now(),
                        taskEndTime: DateTime.now(),
                        tasks: [],
                      );

                      await DataBaseHelper.instance.createDinacharjya(note);
                      print('Dinacharjya: $note');
                    },
                    child: Text('Add Task')),
                // Column(
                //   children: [
                //     TextField(
                //       controller: _taskNameEditingController,
                //       decoration: InputDecoration(
                //         labelText: 'ADD TASK ',
                //         labelStyle: TextStyle(
                //             fontSize: 12.0,
                //             color: Colors.black,
                //             fontWeight: FontWeight.bold),
                //         hintText: 'Enter Your Task Here',
                //         hintStyle: TextStyle(fontSize: 12.0),
                //         border: OutlineInputBorder(
                //           borderSide:
                //               BorderSide(color: Color.fromARGB(255, 160, 11, 11)),
                //         ),
                //       ),
                //       keyboardType: TextInputType.text,
                //     ),
                //   ],
                // ),
                // SizedBox(height: 20.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Text('Start Time'),
                //     TextButton(
                //       child: Icon(Icons.hourglass_bottom),
                //       onPressed: selectStartTime,
                //     ),
                //     Text(' ${_startTimeTOD.format(context)}')
                //   ],
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Text('End Time'),
                //     TextButton(
                //       child: Icon(Icons.hourglass_bottom),
                //       onPressed: selectEndTime,
                //     ),
                //     Text(' ${_endTimeTOD.format(context)}')
                //   ],
                // ),
                // SizedBox(height: 80.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     ElevatedButton(onPressed: () {}, child: Text('Cancel')),
                //     ElevatedButton(onPressed: () {}, child: Text('Add')),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
