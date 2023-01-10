import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:class_management/screens/navigation_drawer.dart';
import 'package:class_management/screens/profile.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Stream<QuerySnapshot> students =
      FirebaseFirestore.instance.collection('Students').snapshots();
  final Stream<QuerySnapshot> teachers =
      FirebaseFirestore.instance.collection('Teachers').snapshots();
  //for textstyle
  final style = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  Widget studentss(
    String fname,
    String lname,
    String phonee,
    String addresss,
    String gen,
    String srnn,
    String emaill,
    String bday,
    String username,
  ) {
    return ListTile(
      leading: const CircleAvatar(child: Text('Name')),
      title: Text(username),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return Profile(
                  name: username,
                  email: emaill,
                  address: addresss,
                  birthday: bday,
                  phone: phonee);
            }),
          ),
        );
      },
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
          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              final fname = '${data.docs[index]['firstname']}';
              final lname = '${data.docs[index]['lastname']}';
              final phonee = '${data.docs[index]['phone']}';
              final addresss = '${data.docs[index]['address']}';
              final gen = '${data.docs[index]['gender']}';
              final srnn = '${data.docs[index]['srn']}';
              final emaill = '${data.docs[index]['email']}';
              // final bday = DateTime.fromMillisecondsSinceEpoch(1);
              // log(DateTime.fromMillisecondsSinceEpoch(
              //         data.docs[index]['birthday'])
              //     .toString());
              final bday = '${data.docs[index]['birthday']}';
              final username = '${data.docs[index]['username']}';
              return studentss(fname, lname, phonee, addresss, gen, srnn,
                  emaill, bday, username);
            },
          );
        }
        return const Text('No data');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        children: [
          Text('Students', style: GoogleFonts.openSans(textStyle: style)),
          Expanded(child: getdatafromfirestore(students)),
          const SizedBox(
            height: 10,
          ),
          Text("Teachers", style: GoogleFonts.openSans(textStyle: style)),
          Expanded(child: getdatafromfirestore(teachers))
        ],
      ),
    );
  }
}
