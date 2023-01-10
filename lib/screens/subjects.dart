// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:class_management/screens/navigation_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

class SubjectSection extends StatefulWidget {
  const SubjectSection({Key? key}) : super(key: key);

  @override
  State<SubjectSection> createState() => _SubjectSectionState();
}

class _SubjectSectionState extends State<SubjectSection> {
  final formKey = GlobalKey<FormState>();
//for dropdown of class
  final items = ['Class 8', 'Class 9', 'Class 10', 'Class 11', 'Class 12'];
  String? value = 'Class 8';

  //for section
  final section = [
    'Section A',
    'Section B',
    'Section C',
    'Section D',
    'Section E'
  ];
  String? valuee = 'Section A';

  //for textstyle
  final style = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  //for datetime hai
  DateTime date = DateTime(2022, 05, 06);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[300],
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Subject'),
      ),
      body: Form(
        key: formKey,
        child: ListView(
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
                            Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('ADD SUBJECT',
                                    style:
                                        GoogleFonts.openSans(textStyle: style))
                              ],
                            ),
                            Divider(
                              height: 3,
                            ),
                            // SizedBox(
                            //   height: 15,
                            // ),
                            Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    color: Colors.teal[50],
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter subject name";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        // label: Row(
                                        //   children: const [
                                        //     Icon(Icons.person),
                                        //     Text('  First Name')
                                        //   ],
                                        // ),
                                        hintText: ' Subject Name',
                                        // labelText: 'Subject name',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        border: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.name,
                                      // maxLength: 25,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    color: Colors.teal[50],
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter subject code";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        hintText: ' Subject Code',
                                        // labelText: 'Subject Code',
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
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            Row(
                              children: [
                                Expanded(
                                  child: Card(
                                      color: Colors.teal[50],
                                      // padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.circular(7),
                                      //   border: Border.all(
                                      //       color: Colors.green, width: 0.8),
                                      // ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: value,
                                          isExpanded: true,
                                          items: items
                                              .map(buildMenuItems)
                                              .toList(),
                                          onChanged: (value) => setState(() {
                                            this.value = value;
                                          }),
                                        ),
                                      )),
                                ),
                                Expanded(
                                    child: Card(
                                  color: Colors.teal[50],
                                  // padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(7),
                                  //   border: Border.all(
                                  //       color: Colors.green, width: 0.8),
                                  // ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: valuee,
                                      isExpanded: true,
                                      items:
                                          section.map(buildMenuItems1).toList(),
                                      onChanged: (value) => setState(() {
                                        // ignore: unnecessary_this
                                        this.valuee = value;
                                      }),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Card(
                              color: Colors.teal[50],
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Description";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  // labelText: 'Description',
                                  hintText: 'Description',
                                  labelStyle: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.name,
                                maxLength: 250,
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: 60,
                        width: 150,
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                            onPressed: () {
                              final isValidForm =
                                  formKey.currentState!.validate();
                              if (isValidForm) {
                                log('Validated');
                              } else {
                                log('Not validate data');
                              }
                            },
                            child: Text('Submit')))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void openfile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
}

//for dropdown of gender
DropdownMenuItem<String> buildMenuItems(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}

DropdownMenuItem<String> buildMenuItems1(String item) {
  return DropdownMenuItem(
    value: item,
    child: Text(item),
  );
}
