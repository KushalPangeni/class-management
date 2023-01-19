// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:class_management/screens/student_screen.dart';
import 'package:class_management/screens/subjects.dart';
import 'package:class_management/screens/teacher_screen.dart';
import 'package:class_management/screens/timetables.dart';
import 'package:flutter/material.dart';

class AddFields extends StatelessWidget {
  const AddFields({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12.0),
      child: Container(
        height: 270,
        width: screenwidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14), color: Colors.orange[50]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 0, 2),
              child: Text(
                "Add Fields",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              color: Colors.black,
              // height: 10,
              // thickness: 1,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
              child: Row(
                children: [
                  iconsScroll(context, "Add Students"),
                  iconsScroll(context, "Add Teachers"),
                  iconsScroll(context, "Add Subjects"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
              child: Row(
                children: [
                  iconsScroll(context, "Add Timetables"),
                ],
              ),
            ),

            //View More Button
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 30, 0, 8.0),
            //   child: Center(
            //     child: InkWell(
            //       onTap: () {},
            //       child: Container(
            //         height: 50,
            //         width: screenwidth - 220,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12),
            //           color: Colors.orange[200],
            //         ),
            //         //Buttons
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text('View More'),
            //             Icon(Icons.arrow_drop_down)
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget iconsScroll(context, String text) {
    return InkWell(
      onTap: () {
        switch (text) {
          case "Add Students":
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const StudentSection())));
            }
            break;
          case "Add Teachers":
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const TeacherSection())));
            }
            break;
          case "Add Subjects":
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const SubjectSection())));
            }
            break;
          case "Add Timetables":
            {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const TimetableSection())));
            }
            break;
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 0, 2.0),
          child: Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                // height: 10,
                // width: 70,
                child: Text(
                  text,
                  maxLines: 2,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
