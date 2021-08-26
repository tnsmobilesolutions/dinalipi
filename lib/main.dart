/// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets, which means it defaults to [BottomNavigationBarType.fixed], and
// the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].

import 'package:dinalipi/presentation/screens/dinacharya/dinacharya_screen.dart';
import 'package:dinalipi/presentation/screens/dinalipi/dinalipi_screen.dart';
import 'package:dinalipi/presentation/screens/report/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF4E4DA8), // navigation bar color
    statusBarColor: Color(0xFFF6F5FC), // status bar color
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
        primaryColor: Color(0xFF9699D1),
        primaryColorDark: Color(0xFF4E4DA8),
        primaryColorLight: Color(0xFFF6F5FC),
        accentColor: Color(0xFFF2B0B5),
        selectedRowColor: Color(0xFFED868C),
        buttonColor: Color(0xFF4E4DA8),
        backgroundColor: Color(0xFFFFFFFF),
        disabledColor: Color(0xFFCCCCE8),
        scaffoldBackgroundColor: Color(0xFFF6F5FC),
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
