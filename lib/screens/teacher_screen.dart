// ignore_for_file: prefer_const_constructors

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:class_management/screens/navigation_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

import '../models/teachermodel.dart';

class TeacherSection extends StatefulWidget {
  const TeacherSection({Key? key}) : super(key: key);

  @override
  State<TeacherSection> createState() => _TeacherSectionState();
}

class _TeacherSectionState extends State<TeacherSection> {
  final formKey = GlobalKey<FormState>();
  bool _securePassword = false;
//for dropdown of gender
  final items = ['Male', 'emale'];
  String? value = 'Male';
  //for textstyle
  final style = TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  //for datetime hai
  DateTime date = DateTime(2022, 05, 06);

  final firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController birthday = TextEditingController();
  TextEditingController srn = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber[300],
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Text('Teacher'),
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
                                Text('ADD TEACHER',
                                    style: GoogleFonts.openSans(
                                        textStyle: style, fontSize: 17))
                              ],
                            ),
                          ),
                          Divider(
                            height: 3,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Card(
                                    color: Colors.teal[50],
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                      child: TextFormField(
                                        validator: (values) {
                                          if (values!.isEmpty) {
                                            return "Enter first name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: firstname,
                                        decoration: const InputDecoration(
                                            hintText: 'First name',
                                            labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            // border: OutlineInputBorder(),
                                            border: InputBorder.none),
                                        keyboardType: TextInputType.name,
                                        // maxLength: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: Card(
                                    color: Colors.teal[50],
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                      child: TextFormField(
                                        validator: (values) {
                                          if (values!.isEmpty) {
                                            return "Enter last name";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: lastname,
                                        decoration: const InputDecoration(
                                            hintText: 'Last name',
                                            labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            // border: OutlineInputBorder(),
                                            border: InputBorder.none),
                                        keyboardType: TextInputType.name,
                                        // maxLength: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Card(
                                    color: Colors.teal[50],
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                      child: TextFormField(
                                        validator: (values) {
                                          if (values!.isEmpty) {
                                            return "Enter number";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: phone,
                                        decoration: const InputDecoration(
                                            hintText: 'Phone number',
                                            labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            // border: OutlineInputBorder(),
                                            border: InputBorder.none),
                                        keyboardType: TextInputType.number,
                                        // maxLength: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                  child: Card(
                                    color: Colors.teal[50],
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                      child: TextFormField(
                                        validator: (values) {
                                          if (values!.isEmpty) {
                                            return "Enter address";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: address,
                                        decoration: const InputDecoration(
                                            hintText: 'Address',
                                            labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            // border: OutlineInputBorder(),
                                            border: InputBorder.none),
                                        keyboardType: TextInputType.name,
                                        // maxLength: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Card(
                                      color: Colors.teal[50],
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 0, 0, 0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            dropdownColor: Colors.teal[50],
                                            value: value,
                                            isExpanded: true,
                                            items: items
                                                .map(buildMenuItems)
                                                .toList(),
                                            onChanged: (value) => setState(() {
                                              this.value = value;
                                            }),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                              // SizedBox(
                              //   width: 5,
                              // ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: Card(
                                  color: Colors.teal[50],
                                  // height: 50,
                                  // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(7),
                                  //   border: Border.all(
                                  //       color: Colors.green, width: 0.8),
                                  // ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        ' '
                                        '${date.year}/${date.month}/${date.day}',
                                        style: TextStyle(color: Colors.teal),
                                      )),
                                      Expanded(
                                          child: IconButton(
                                              icon: Icon(
                                                  Icons.edit_calendar_rounded),
                                              onPressed: () async {
                                                DateTime? newdate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: date,
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2030),
                                                );
                                                if (newdate == null) return;
                                                setState(() {
                                                  date = newdate;
                                                });
                                              }))
                                    ],
                                  ),
                                ),
                              )),
                            ],
                          ),

                          //For password hai
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: Card(
                              color: Colors.teal[50],
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                child: TextField(
                                  controller: srn,
                                  decoration: InputDecoration(
                                      hintText: 'TRN number',
                                      // labelText: 'SRN',
                                      //mathi bool securePassword pani xa hai
                                      labelStyle: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      // border: OutlineInputBorder(),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.security),
                                        onPressed: () => setState(() {
                                          _securePassword = !_securePassword;
                                        }),
                                      )),

                                  obscureText: _securePassword,
                                  keyboardType: TextInputType.name,
                                  // maxLength: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Icon(Icons.info),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "TEACHER LOGIN INFO",
                                  style: GoogleFonts.openSans(
                                      textStyle: style, fontSize: 17),
                                )
                              ]),
                            ),
                            Divider(
                              height: 3,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    color: Colors.teal[50],
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(4, 0, 0, 0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter email';
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: email,
                                        decoration: InputDecoration(
                                          hintText: 'Enter login email',
                                          // labelText: 'Email',
                                          labelStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.name,
                                        // maxLength: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      '      Choose Photo',
                                      style: GoogleFonts.openSans(
                                          textStyle: style),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    child: Text("Choose photo"),
                                    onPressed: () async {
                                      final result =
                                          await FilePicker.platform.pickFiles();
                                      if (result == null) return;

                                      //open single file
                                      final file = result.files.first;
                                      openfile(file);
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          final isValidForms = formKey.currentState!.validate();

                          if (isValidForms) {
                            final fname = firstname.text;
                            final lname = lastname.text;
                            final gen = value;
                            final phonee = phone.text;
                            final addresss = address.text;
                            final srnn = srn.text; // srn name same xa ni ta
                            final emaill =
                                email.text; //spelling same xa tei vayera ho
                            final bday =
                                '${date.year}/${date.month}/${date.day}';

                            createUser(
                              firstname: fname,
                              lastname: lname,
                              phone: phonee,
                              address: addresss,
                              gender: gen,
                              srn: srnn,
                              email: emaill,
                              birthday: bday,
                            );
                          }
                          // else{}

                          reset1();
                        },
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
                    // Container(
                    //     height: 60,
                    //     width: 150,
                    //     padding: EdgeInsets.all(10),
                    //     child: ElevatedButton(
                    //         onPressed: () {
                    //           // final fname = firstname.text;
                    //           // final lname = lastname.text;
                    //           // final gen = value;
                    //           // final srnn = srn.text; // srn name same xa ni ta
                    //           // final emaill =
                    //           //     email.text; //spelling same xa tei vayera ho
                    //           // final bday = date;

                    //         },
                    //         child: Text('Submit')))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void reset1() {
    firstname.text = '';
    lastname.text = '';
    phone.text = '';
    address.text = '';
    srn.text = '';
    email.text = '';
    birthday.text = '';
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
