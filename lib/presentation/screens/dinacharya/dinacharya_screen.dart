import 'package:dinalipi/data/model/task.dart';
import 'package:dinalipi/presentation/screens/dinacharya/addTask.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class DinacharyaScreen extends StatefulWidget {
  const DinacharyaScreen({Key? key}) : super(key: key);

  @override
  _DinacharyaScreenState createState() => _DinacharyaScreenState();
}

class _DinacharyaScreenState extends State<DinacharyaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: Row(
              children: [
                Text('Task Name: '),
                SizedBox(width: 15),
                Text('Start Time: '),
                SizedBox(width: 15),
                Text('End Time: '),
              ],
            ),
          ),
          Divider(),

          // Timeline.tileBuilder(
          //   builder: TimelineTileBuilder.fromStyle(
          //     contentsAlign: ContentsAlign.alternating,
          //     contentsBuilder: (context, index) => Padding(
          //       padding: const EdgeInsets.all(24.0),
          //       child: Text('Timeline Event $index'),
          //     ),
          //     itemCount: 10,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    child: Text(
                      "ADD TASK",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  onPressed: () {
                    AddTaskPage();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff9598D1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
