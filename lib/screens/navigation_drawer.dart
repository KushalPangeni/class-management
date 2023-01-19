import 'package:flutter/material.dart';
import 'package:class_management/screens/dashboard.dart';
import 'package:class_management/screens/login_page.dart';
import 'package:class_management/screens/student_screen.dart';
import 'package:class_management/screens/subjects.dart';
// import 'package:class_management/screens/student.dart';
import 'package:class_management/screens/teacher_screen.dart';
import 'package:class_management/screens/timetables.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.orange[50],
        child: SafeArea(
          child: SingleChildScrollView(
            //SingleChildScrollView ko replace ma ListView use garda pani hunxa
            //tara ListView ma chahi children hunxa Column use garna pardaina
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 280,
                  // height: 70,
                  decoration: BoxDecoration(
                      color: Colors.orange[200],
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildheader(context),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 0, 2.0),
                          child: Text(
                            'Kushal Pangeni',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Text("kushalpangeni03@gmail.com")
                      ],
                    ),
                  ),
                  // UserAccountsDrawerHeader(
                  //     accountName: const Text('Kushal Pangeni'),
                  //     accountEmail: const Text('kushalreigns54@gmail.com'),
                  //     currentAccountPicture: buildheader(context)
                  //     // CircleAvatar(
                  //     //   // backgroundColor: Colors.,
                  //     //   child: FittedBox(child: Text('Circle Avatar')),
                  //     // ),
                  //     ),
                ),
              ),
              // buildheader(context),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange[200],
                        borderRadius: BorderRadius.circular(14)),
                    child: buildMenuList(context),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

Widget buildheader(BuildContext context) {
  return Container(
    height: 80,
    decoration:
        const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    child: const Image(
      image: AssetImage('assets/images/haan.png'),
    ),

    // child: Image(image: AssetImage('assets/haan.png')),
    // backgroundColor: Colors.teal,
    // child: FittedBox(child: Image(image: AssetImage('../assets/haan.png'))
    // Text(
    //   "Circle Avatar",
    //   style: TextStyle(color: Colors.black),
    // ),
    // ),
  );
}

Widget buildMenuList(BuildContext context) {
  return Column(
    children: [
      ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          }),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Student'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StudentSection(),
            ),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.person),
        title: const Text('Teacher'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeacherSection()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.room),
        title: const Text('Classes'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.notifications),
        title: const Text('Notification'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.book),
        title: const Text('Subjects'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SubjectSection()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.date_range),
        title: const Text('Time tables'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TimetableSection()),
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.file_copy),
        title: const Text('Attendences'),
        onTap: () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const Profile()),
          //   );
        },
      ),
      ListTile(
        leading: const Icon(Icons.app_registration_rounded),
        title: const Text('Register Admin'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.announcement),
        title: const Text('Announcements'),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.announcement),
        title: const Text('Logout'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
      )
    ],
  );
}
