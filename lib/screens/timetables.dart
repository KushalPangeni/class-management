// ignore_for_file: prefer_const_constructors, unnecessary_this

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:class_management/screens/navigation_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

class TimetableSection extends StatefulWidget {
  const TimetableSection({Key? key}) : super(key: key);

  @override
  State<TimetableSection> createState() => _TimetableSectionState();
}

class _TimetableSectionState extends State<TimetableSection> {
//for dropdown of class
  final classes = ['Class 8', 'Class 9', 'Class 10', 'Class 11', 'Class 12'];
  String? valueOfClass = 'Class 8';

  //for dropdown of section
  final section = [
    'Section A',
    'Section B',
    'Section C',
    'Section D',
    'Section E'
  ];
  String? valueOfSection = 'Section A';

  //for dropdown of day
  final days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];
  String? valueOfDays = 'Sunday';

  //for textstyle
  final style = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  //for datetime hai
  DateTime date = DateTime(2022, 05, 06);

  //for start-time
  TimeOfDay? starttime;

  String getStartTime() {
    if (starttime == null) {
      return 'Start Time';
    } else {
      final hours = starttime!.hour.toString().padLeft(2, '0');
      final minutes = starttime!.minute.toString().padLeft(2, '0');
      return '$hours : $minutes';
    }
  }

//for end-time
  TimeOfDay? endtime;
  String getEndTime() {
    if (endtime == null) {
      return 'End Time';
    } else {
      final hours = endtime!.hour.toString().padLeft(2, '0');
      final minutes = endtime!.minute.toString().padLeft(2, '0');
      return '$hours : $minutes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[300],
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(5, 10, 5, 5),
              child: Column(
                children: [
                  Card(
                    // color: Color.fromARGB(255, 236, 231, 231),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('ADD TIMETABLE',
                                    style: GoogleFonts.openSans(
                                        textStyle: style, fontSize: 17))
                              ],
                            ),
                          ),
                          Divider(
                            height: 3,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Card(
                                color: Colors.teal[50],
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: DropdownButtonHideUnderline(
                                    //class ko lagi
                                    child: DropdownButton<String>(
                                      value: valueOfClass,
                                      isExpanded: true,
                                      items: classes
                                          .map(buildClassesItems)
                                          .toList(),
                                      onChanged: (value) => setState(() {
                                        this.valueOfClass = value;
                                      }),
                                    ),
                                  ),
                                ),
                              )),
                              Expanded(
                                  child: Card(
                                color: Colors.teal[50],
                                // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(7),
                                //   border: Border.all(
                                //       color: Colors.green, width: 0.8),
                                // ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: DropdownButtonHideUnderline(
                                    //section
                                    child: DropdownButton<String>(
                                      value: valueOfSection,
                                      isExpanded: true,
                                      items: section
                                          .map(buildSectionItems)
                                          .toList(),
                                      onChanged: (value) => setState(() {
                                        this.valueOfSection = value;
                                      }),
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  color: Colors.teal[50],
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Subject',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.name,
                                      // maxLength: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: DropdownButtonHideUnderline(
                                //day
                                child: Card(
                                  color: Colors.teal[50],
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                    child: DropdownButton<String>(
                                      //days
                                      value: valueOfDays,
                                      isExpanded: true,
                                      items: days.map(buildDaysItems).toList(),
                                      onChanged: (value) => setState(() {
                                        this.valueOfDays = value;
                                      }),
                                    ),
                                  ),
                                ),
                              )),
                            ],
                          ),
                          // const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  pickStartTime(context);
                                },
                                child: Card(
                                  color: Colors.teal[50],
                                  // child: Text(
                                  //   getStartTime(),
                                  // ),
                                  child: Row(
                                    //Start time
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 0, 0, 0),
                                        child: Text(getStartTime()),
                                      )),
                                      Expanded(
                                        child: IconButton(
                                          icon: Icon(Icons.timer_outlined),
                                          onPressed: () =>
                                              pickStartTime(context),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                              // SizedBox(width: 5),
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  pickEndTime(context);
                                },
                                child: Card(
                                  color: Colors.teal[50],
                                  child: Row(
                                    //end time
                                    children: [
                                      Expanded(
                                          child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 0, 0, 0),
                                        child: Text(getEndTime()),
                                      )),
                                      Expanded(
                                          child: IconButton(
                                              icon: Icon(Icons.timer_outlined),
                                              onPressed: () =>
                                                  pickEndTime(context)))
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          //For teacher hai
                          Card(
                            color: Colors.teal[50],
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Teacher Name',
                                  // labelText: 'Teacher name',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.name,
                                // maxLength: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14)),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  void openfile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  //for start time picker
  Future pickStartTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context, initialTime: starttime ?? initialTime);
    if (newTime == null) return;
    setState(() {
      starttime = newTime;
    });
  }

  //for end time picker
  Future pickEndTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
        context: context, initialTime: endtime ?? initialTime);
    if (newTime == null) return;
    setState(() {
      endtime = newTime;
    });
  }
}

//for dropdown of class
DropdownMenuItem<String> buildClassesItems(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}

//for dropdown of section
DropdownMenuItem<String> buildSectionItems(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}

//for dropdown of days
DropdownMenuItem<String> buildDaysItems(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}
