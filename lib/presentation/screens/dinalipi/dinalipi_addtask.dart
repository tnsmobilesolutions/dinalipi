import 'package:dinalipi/data/model/utility.dart';
import 'package:dinalipi/presentation/screens/dinalipi/dinalipi_addtask_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class DinalipiAddTask extends StatelessWidget {
   DinalipiAddTask({Key? key}) : super(key: key);
  
  final List<String> items = [
  'YES/NO',
  'YES/NO/Custom msg',
  'Time Pcker',
  'Duration Picker',
  
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dcolor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
              foregroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 5, 2, 8)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 235, 226, 225)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(
                    color: Color.fromARGB(255, 248, 242, 241),
                  ),
                ),
              ),
            ),
            onPressed: () => null,
            child: Text('Cancel'),
          ),
          Spacer(),
          TextButton(
            style: ButtonStyle(
                padding:
                    MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(12)),
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 5, 2, 8)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 235, 226, 225)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                            color: Color.fromARGB(255, 235, 231, 230))))),
            onPressed: () => null,
            child: Text('Add'),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(2),
        
        child: Column(
          
          children: [
            SizedBox(height: 40,),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Task Name'),
                SizedBox(
                  width: 50,
                ),
//                TextField(
              
//   decoration: InputDecoration(
//     labelText: 'Your Task',
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//   ),
// ),
SizedBox(height: 40,)

              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                Text('Type'),
                SizedBox(
                  width: 150,
                ),
               DropdownButton(
              value: 4,
              hint: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Select Item Type",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              items: [
                DropdownMenuItem(
                  child: Text("YES/NO"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("YES/NO/Custom Msg"),
                  
                  value: 2,
                ),
                DropdownMenuItem(
                  child: Text("Time Picker"),
                  value: 3
                ),
                DropdownMenuItem(
                    child: Text("Duration Pcker"),
                    value: 4
                )
              ], onChanged: (Object? value) {  },
            )],
            ),
            SizedBox(height: 20,),
             Row(
              children: [
                Text('Default Value'),
                SizedBox(
                  width: 150 ),
                 TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a search term',
            ),
          ),
              ],
             )
        ],
        ),
      ),
    );
  }
}
