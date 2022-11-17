/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

// ignore_for_file: deprecated_member_use

import 'package:dinalipi/data/model/utility.dart';
import 'package:dinalipi/presentation/screens/dinacharya/dinacharya_screen.dart';
import 'package:dinalipi/presentation/screens/dinalipi/dinalipi_screen.dart';
import 'package:dinalipi/presentation/screens/report/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Dcolor.systemNavBarColor, // navigation bar color
    statusBarColor: Dcolor.statusBarColor, // status bar color
  ));
  return runApp(const MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Dinalipi ';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner:
          false, // This removes the debug banner in app in debug mode
      title: _title,
      theme: ThemeData(
        primaryColor:Dcolor.primaryColor,
        primaryColorDark: Dcolor.primaryColorDark,
        primaryColorLight:Dcolor.primaryColorLight,
        accentColor: Dcolor.accentColor,
        selectedRowColor:Dcolor.selectedRowColor,
        backgroundColor: Dcolor.backgroundColor,
        disabledColor: Dcolor.disabledColor,
        scaffoldBackgroundColor: Dcolor.scaffoldBackgroundColor,
        // boxDecorationColor:Dcolor.boxDecorationColor,
      ),
      home: HomeWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _HomeWidgetState extends State<HomeWidget> {
  int _selectedIndex = 0;

  static  List<Widget> _widgetOptions = <Widget>[
    DinacharyaScreen(),
    DinalipiScreen(),
    ReportScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          child: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
      ),
      bottomNavigationBar: homeNavBarWidget(context),
    );
  }

  BottomNavigationBar homeNavBarWidget(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule),
          label: 'Dinacharya',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Dinalipi',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.description),
          label: 'Report',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).buttonColor,
      onTap: _onItemTapped,
    );
  }
}
