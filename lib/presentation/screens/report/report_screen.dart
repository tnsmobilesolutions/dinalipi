import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final dateController = TextEditingController();
  List<BottomNavigationBarItem> item = [];
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
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              'Show Month',
              style: TextStyle(fontSize: 20),
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ("Please Enter Correct Month");
                }

                return null;
              },
              onSaved: (value) {
                dateController.text = value!;
              },
              controller: dateController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? showDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(), //get today's date
                          firstDate: DateTime(
                              2023), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));
                      if (showDate != null) {
                        String formattedDate =
                            DateFormat.yMMMM().format(showDate);
                        print('formated time : $formattedDate');
                        setState(() {
                          dateController.text = formattedDate;
                        });
                      }
                    },
                    icon: Icon(Icons.timelapse)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Choose a Month',
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Generate')),
          ],
        ),
      )),
      // bottomNavigationBar: BottomNavigationBar(items: ),
    );
  }
}
