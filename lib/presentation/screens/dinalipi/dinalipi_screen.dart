import 'dart:ui';

import 'package:dinalipi/presentation/screens/dinacharya/addTask.dart';
import 'package:dinalipi/presentation/screens/dinacharya/custom_calender.dart';
import 'package:dinalipi/presentation/screens/dinalipi/dinalipi_addtask.dart';
import 'package:dinalipi/presentation/screens/dinalipi/dinalipi_points.dart';
import 'package:dinalipi/presentation/screens/dinalipi/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DinalipiScreen extends StatelessWidget {
  const DinalipiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 247, 237, 222),
        title: Text(
          'Dinacharya',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddTaskPage();
              }));
            },
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          CustomCalendar(
            onDateTimeChanged: (value) {
              selectedDate = value;
            },
          ),
          SizedBox(
            height: 15,
          ),
          timelineTile('2:00 am', ''),
          timelineTile('3:00 am', ''),
          timelineTile('4:00 am', ''),
          timelineTile('5:00 am', ''),
        ],
      ),
      // body: Padding(
      //   padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
      //   child: Column(
      //     children: [
      //       SizedBox(
      //         child: Column(
      //           children: [
      //             Container(
      //               child: Row(
      //                 children: [
      //                   Column(
      //                     children: [
      //                       SizedBox(
      //                         height: 20,
      //                       ),
      //                       // DinalipiPoints(
      //                       //   name:  "Wake Up",
      //                       //   name2: 'Time:   ',
      //                       //   container1BackgroundColor:Color(0xff4D4CA6) ,
      //                       //   container2BackgroundColor:Color(0xff9598D1) ,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Meditation',
      //                       //   name2: "Time:    ",
      //                       //   container1BackgroundColor:Colors.black87 ,
      //                       //   container2BackgroundColor: Colors.lightBlue,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Nitya Puja',
      //                       //   name2: 'Time:    ',
      //                       //   container1BackgroundColor: Colors.brown,
      //                       //   container2BackgroundColor:Colors.blue ,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Swadhaya',
      //                       //   name2: 'Time',
      //                       //   container1BackgroundColor: Colors.red,
      //                       //   container2BackgroundColor:Colors.lightGreen ,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Satvik Food',
      //                       //   name2: 'YES/NO',
      //                       //   container1BackgroundColor:Colors.pink ,
      //                       //   container2BackgroundColor: Colors.teal,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Para Ninda',
      //                       //   name2: 'YES/NO',
      //                       //   container1BackgroundColor:Colors.deepOrange ,
      //                       //   container2BackgroundColor: Colors.indigo,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Para Charcha',
      //                       //    name2: 'YES/NO',
      //                       //    container1BackgroundColor:Colors.cyanAccent ,
      //                       //    container2BackgroundColor:Colors.lime ,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'MustiVikshya',
      //                       //    name2: 'YES/NO',
      //                       //    container1BackgroundColor:Colors.blue ,
      //                       //    container2BackgroundColor: Colors.black54,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Sangha Puja Yogdan',
      //                       //    name2: 'YES/NO',
      //                       //    container1BackgroundColor:Colors.grey ,
      //                       //    container2BackgroundColor:Colors.brown ,
      //                       // ), SizedBox(height: 20,),
      //                       // DinalipiPoints(
      //                       //   name: 'Khyama Prarthana',
      //                       //    name2: 'YES/NO',
      //                       //    container1BackgroundColor: Colors.indigoAccent,
      //                       //    container2BackgroundColor: Colors.tealAccent,
      //                       // ),
      //                       Row(
      //                         crossAxisAlignment: CrossAxisAlignment.end,
      //                         children: [
      //                           SubmitButton(),
      //                           SizedBox(
      //                             width: 30,
      //                           ),
      //                           FloatingActionButton(
      //                             backgroundColor:
      //                                 Color.fromARGB(255, 87, 116, 113),
      //                             foregroundColor:
      //                                 Color.fromARGB(255, 243, 244, 245),
      //                             onPressed: () {
      //                               Navigator.push(
      //                                 context,
      //                                 MaterialPageRoute(
      //                                     builder: (context) =>
      //                                         DinalipiAddTask()),
      //                               );
      //                               // Respond to button press
      //                             },
      //                             child: Icon(Icons.add),
      //                           )
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  TimelineTile timelineTile(String text1, String text2) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      lineXY: 1,
      indicatorStyle: IndicatorStyle(
        width: 13,
        indicator: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border:
                  Border.all(width: 5, color: Color.fromARGB(255, 94, 94, 94))),
        ),
      ),
      beforeLineStyle:
          LineStyle(color: Color.fromARGB(255, 104, 103, 103), thickness: 1.5),
      isFirst: false,
      startChild: Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromARGB(255, 105, 104, 104),
              ),
            ),
          ],
        ),
      ),
      endChild: SizedBox(
        height: 80,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 140,
                color: Color.fromARGB(255, 220, 239, 253),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Wake Up'),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  ],
                ),
              ),
              Text(
                text2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 105, 105, 105),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
