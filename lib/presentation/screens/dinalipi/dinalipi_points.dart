import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class DinalipiPoints extends StatelessWidget {
  const DinalipiPoints({
    Key? key,
    required this.name,  required this.name2, required this.container1BackgroundColor, required this.container2BackgroundColor}) : super(key: key);
  
  final String name;
  final String name2;
  final Color  container1BackgroundColor;
  final Color  container2BackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 110,
          width: 8,
          color:container1BackgroundColor,
        ),
        Container(
          height: 110,
          width: 320,
          decoration: BoxDecoration(
            color: container2BackgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              35,
              0,
              120,
              8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${name}',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${name2}',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
