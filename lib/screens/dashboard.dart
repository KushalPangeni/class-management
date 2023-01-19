// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:class_management/screens/add_fields.dart';
import 'package:class_management/screens/students_details.dart';
import 'package:class_management/screens/teacher_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:class_management/screens/navigation_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int count = 0;

  final Stream<QuerySnapshot> students =
      FirebaseFirestore.instance.collection('Students').snapshots();
  final Stream<QuerySnapshot> teachers =
      FirebaseFirestore.instance.collection('Teachers').snapshots();
  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Colors.orange[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //1st row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Student Details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const StudentDetails()))),
                    child: Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Students",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                          ),
                          getdatafromfirestore(students),
                        ],
                      ),
                    ),
                  ),
                ),
                //Teachers Details
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const TeacherDetails()))),
                    child: Container(
                      height: 70,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.orange[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Teachers",
                            style: TextStyle(fontSize: 20),
                          ),
                          getdatafromfirestore(teachers),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Add teacher finished
            const AddFields()
          ],
        ),
      ),
    );
  }

  Widget getdatafromfirestore(Stream<QuerySnapshot> person) {
    return StreamBuilder<QuerySnapshot>(
      stream: person,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        if (snapshot.hasData) {
          final data = snapshot.requireData;
          return Text(
            "${data.size}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          );
        }
        return const Text('No data');
      },
    );
  }
}
