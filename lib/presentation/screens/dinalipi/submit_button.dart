import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: () {
                              
                            }, 
                            child:Text('Submit',style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,),),
                             style: TextButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 238, 238, 244),
        backgroundColor: Color.fromARGB(255, 54, 47, 147),
 ),
 ); 
 
 }
}