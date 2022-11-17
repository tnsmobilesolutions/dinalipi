import 'dart:ui';

import 'package:dinalipi/presentation/screens/dinalipi/dinalipi_addtask.dart';
import 'package:dinalipi/presentation/screens/dinalipi/dinalipi_points.dart';
import 'package:dinalipi/presentation/screens/dinalipi/submit_button.dart';
import 'package:flutter/material.dart';

class DinalipiScreen extends StatelessWidget {
  const DinalipiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 10, 0),
        child: Column(
          children: [
            SizedBox(
              
              child: Column(
                children: [
                  Container(
                    
                    child: Row(
                      children: [
                        
                        Column(
                          children: [
                            SizedBox(height: 20,),
                            DinalipiPoints(
                              name:  "Wake Up",
                              name2: 'Time:   ',
                              container1BackgroundColor:Color(0xff4D4CA6) ,
                              container2BackgroundColor:Color(0xff9598D1) ,
                            ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Meditation',
                            //   name2: "Time:    ",
                            //   container1BackgroundColor:Colors.black87 ,
                            //   container2BackgroundColor: Colors.lightBlue,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Nitya Puja',
                            //   name2: 'Time:    ',
                            //   container1BackgroundColor: Colors.brown,
                            //   container2BackgroundColor:Colors.blue ,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Swadhaya',
                            //   name2: 'Time',
                            //   container1BackgroundColor: Colors.red,
                            //   container2BackgroundColor:Colors.lightGreen ,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Satvik Food',
                            //   name2: 'YES/NO',
                            //   container1BackgroundColor:Colors.pink ,
                            //   container2BackgroundColor: Colors.teal,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Para Ninda',
                            //   name2: 'YES/NO',
                            //   container1BackgroundColor:Colors.deepOrange ,
                            //   container2BackgroundColor: Colors.indigo,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Para Charcha',
                            //    name2: 'YES/NO',
                            //    container1BackgroundColor:Colors.cyanAccent ,
                            //    container2BackgroundColor:Colors.lime ,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'MustiVikshya',
                            //    name2: 'YES/NO',
                            //    container1BackgroundColor:Colors.blue ,
                            //    container2BackgroundColor: Colors.black54,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Sangha Puja Yogdan',
                            //    name2: 'YES/NO',
                            //    container1BackgroundColor:Colors.grey ,
                            //    container2BackgroundColor:Colors.brown ,
                            // ), SizedBox(height: 20,),
                            // DinalipiPoints(
                            //   name: 'Khyama Prarthana',
                            //    name2: 'YES/NO',
                            //    container1BackgroundColor: Colors.indigoAccent,
                            //    container2BackgroundColor: Colors.tealAccent,
                            // ),
                           Row(
                             children: [
                               SubmitButton(),
                               SizedBox(width: 30,),
                                FloatingActionButton(
  backgroundColor: Color.fromARGB(255, 87, 116, 113),
  foregroundColor: Color.fromARGB(255, 243, 244, 245),
  onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  DinalipiAddTask()),
  );
    // Respond to button press
  },
  child: Icon(Icons.add),
)
                             ],
                           ),
                          
                            
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
