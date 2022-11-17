import 'package:flutter/material.dart';

class Utility {
  static String timeOfDayString(TimeOfDay time) {
    return time.toString();
  }

  static TimeOfDay getTimeOfDay(String time) {
    TimeOfDay timeOfDay = TimeOfDay(
        hour: int.parse(time.split(":")[0]),
        minute: int.parse(time.split(":")[1]));
    return timeOfDay;
  }
}

class Dcolor {
  static const systemNavBarColor =  Color(0xFFCDD0DF);
  static const statusBarColor = Color(0xFFCDD0DF);
  static const primaryColor = Color(0xFF9699D1);
  static const  primaryColorDark = Color(0xFF4E4DA8);
  static const  primaryColorLight = Color(0xFFF6F5FC);
  static const  accentColor = Color(0xFFF2B0B5);
  static const  buttonColor =  Color(0xFF4E4DA8);
  static const  backgroundColor = Color(0xFFFFFFFF);
  static const  disabledColor = Color(0xFFCCCCE8);
  static const  scaffoldBackgroundColor =  Color(0xFFF6F4FC);
  static const  selectedRowColor =  Color(0xFFED868C);
   static const boxDecorationColor = Color(0xff9598D1);
   
}
