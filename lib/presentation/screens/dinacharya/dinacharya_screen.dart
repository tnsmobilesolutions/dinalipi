import 'package:avatar_glow/avatar_glow.dart';
import 'package:dinalipi/presentation/screens/dinacharya/addTask.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
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
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicator: AvatarGlow(
                endRadius: 90,
                glowColor: Colors.blue,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.blue,
                  size: 10,
                ),
              ),
              padding: EdgeInsets.all(5),
            ),
            beforeLineStyle: LineStyle(color: Colors.blue, thickness: 1.5),
            isFirst: true,
            endChild: SizedBox(
              height: 80,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_clock),
                    SizedBox(width: 15),
                    Text(
                      '04:00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicator: AvatarGlow(
                endRadius: 90,
                glowColor: Colors.blue,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.blue,
                  size: 10,
                ),
              ),
              padding: EdgeInsets.all(5),
            ),
            beforeLineStyle: LineStyle(color: Colors.blue, thickness: 1.5),
            isFirst: false,
            endChild: SizedBox(
              height: 80,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_clock),
                    SizedBox(width: 15),
                    Text(
                      '04:30',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicator: AvatarGlow(
                endRadius: 90,
                glowColor: Colors.blue,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.blue,
                  size: 10,
                ),
              ),
              padding: EdgeInsets.all(5),
            ),
            beforeLineStyle: LineStyle(color: Colors.blue, thickness: 1.5),
            isFirst: false,
            endChild: SizedBox(
              height: 80,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_clock),
                    SizedBox(width: 15),
                    Text(
                      '05:00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicator: AvatarGlow(
                endRadius: 90,
                glowColor: Colors.blue,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.blue,
                  size: 10,
                ),
              ),
              padding: EdgeInsets.all(5),
            ),
            beforeLineStyle: LineStyle(color: Colors.blue, thickness: 1.5),
            isFirst: false,
            endChild: SizedBox(
              height: 80,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_clock),
                    SizedBox(width: 15),
                    Text(
                      '05:30',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          TimelineTile(
            indicatorStyle: IndicatorStyle(
              indicator: AvatarGlow(
                endRadius: 90,
                glowColor: Colors.blue,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Icon(
                  Icons.circle_rounded,
                  color: Colors.blue,
                  size: 10,
                ),
              ),
              padding: EdgeInsets.all(5),
            ),
            beforeLineStyle: LineStyle(color: Colors.blue, thickness: 1.5),
            isFirst: false,
            isLast: true,
            endChild: SizedBox(
              height: 80,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.lock_clock),
                    SizedBox(width: 15),
                    Text(
                      '06:00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                ElevatedButton(
                  child: Text(
                    "ADD TASK",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
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
