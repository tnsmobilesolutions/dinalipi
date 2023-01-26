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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              timelineTile('04:30 AM', 'Wake Up'),
              timeline2('05:30 AM', 'Meditation'),
              timelineTile('06:30 AM', 'Morning Puja'),
              timeline2('07:30 AM', 'Breakfast'),
              timelineTile('08:30 AM', 'Office Work'),
              timeline2('07:00 PM', 'Evening Puja'),
              timelineTile('08:00 PM', 'Meditation'),
              timeline2('09:00 PM', 'Cook'),
              timelineTile('10:00 PM', 'Dinner'),
              timeline2('10:30 PM', 'Swadhyaya'),
              timelineTile('11:00 PM', 'Sleep'),
            ],
          ),
        ),
      ),
    );
  }

  TimelineTile timeline2(String text1, String text2) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      lineXY: 0.2,
      indicatorStyle: IndicatorStyle(
        indicator: AvatarGlow(
          endRadius: 90,
          child: Icon(
            Icons.circle_rounded,
            color: Color.fromARGB(255, 104, 103, 103),
            size: 15,
          ),
        ),
        padding: EdgeInsets.all(5),
      ),
      beforeLineStyle:
          LineStyle(color: Color.fromARGB(255, 104, 103, 103), thickness: 1.5),
      isFirst: false,
      startChild: Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
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
              Text(
                text2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TimelineTile timelineTile(String text1, String text2) {
    return TimelineTile(
      alignment: TimelineAlign.center,
      indicatorStyle: IndicatorStyle(
        indicator: AvatarGlow(
          endRadius: 90,
          child: Icon(
            Icons.circle_rounded,
            color: Color.fromARGB(255, 104, 103, 103),
            size: 15,
          ),
        ),
        padding: EdgeInsets.all(5),
      ),
      beforeLineStyle:
          LineStyle(color: Color.fromARGB(255, 104, 103, 103), thickness: 1.5),
      isFirst: false,
      startChild: Padding(
        padding: const EdgeInsets.only(left: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
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
              Text(
                text2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
