// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomCalendar extends StatefulWidget {
  CustomCalendar({Key? key, this.onDateTimeChanged}) : super(key: key);
  final ValueChanged<DateTime>? onDateTimeChanged;
  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime selectedDate = DateTime.now(); // TO tracking date

  int currentDateSelectedIndex = 0; //For Horizontal Date
  ScrollController scrollController =
      ScrollController(); //To Track Scroll of ListView

  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  List<String> listOfDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //To Show Current Date
        // Container(
        //     height: 40,
        //     margin: EdgeInsets.only(left: 10),
        //     alignment: Alignment.centerLeft,
        //     child: Text(
        //       '${selectedDate.day} ${listOfMonths[selectedDate.month - 1]}, ${selectedDate.year}',
        //       style: TextStyle(
        //         fontSize: 30,
        //         fontWeight: FontWeight.bold,
        //         color: CustomColor.blackishGrey,
        //       ),
        //     )),
        SizedBox(height: 10),
        //To show CustomCalendar Widget
        SizedBox(
          height: 60,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 10);
            },
            itemCount: 90,
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentDateSelectedIndex = index;
                    selectedDate = DateTime.now().add(Duration(days: index));
                    widget.onDateTimeChanged!(selectedDate);
                  });
                },
                child: Container(
                  height: 80,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    color: currentDateSelectedIndex == index
                        ? Colors.blue
                        : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Text(
                          DateTime.now()
                              .add(Duration(days: index))
                              .day
                              .toString(),
                          style: TextStyle(
                              fontSize: 17,
                              //fontWeight: FontWeight.w700,
                              color: currentDateSelectedIndex == index
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          listOfMonths[DateTime.now()
                                      .add(Duration(days: index))
                                      .month -
                                  1]
                              .toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: currentDateSelectedIndex == index
                                  ? Colors.white
                                  : Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
