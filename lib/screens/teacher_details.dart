import 'package:class_management/screens/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeacherDetails extends StatefulWidget {
  const TeacherDetails({Key? key}) : super(key: key);

  @override
  State<TeacherDetails> createState() => _TeacherDetailsState();
}

class _TeacherDetailsState extends State<TeacherDetails> {
  final Stream<QuerySnapshot> teachers =
      FirebaseFirestore.instance.collection('Teachers').snapshots();
  //for textstyle
  final style = const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  //Listtile
  Widget teacher(
    int no,
    String id,
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.teal[100],
        ),
        child: ListTile(
          leading: CircleAvatar(child: Text('$no')),
          title: Text(username),
          subtitle: Text(bday),
          onLongPress: () {
            final docDelete =
                FirebaseFirestore.instance.collection('Teachers').doc(id);
            docDelete.delete();
            setState(() {});
          },
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
          //final data = snapshot.data!; pani use garna sakinxa
          return ListView.builder(
            itemCount: data.size,
            itemBuilder: (context, index) {
              final no = data.size;
              final id = '${data.docs[index]['id']}';
              final fname = '${data.docs[index]['firstname']}';
              final lname = '${data.docs[index]['lastname']}';
              final phonee = '${data.docs[index]['phone']}';
              final addresss = '${data.docs[index]['address']}';
              final gen = '${data.docs[index]['gender']}';
              final srnn = '${data.docs[index]['srn']}';
              final emaill = '${data.docs[index]['email']}';
              final bday = '${data.docs[index]['birthday']}';
              final username = '${data.docs[index]['username']}';
              return teacher(no, id, fname, lname, phonee, addresss, gen, srnn,
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Teachers",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: getdatafromfirestore(teachers)),
            ],
          ),
        ));
  }
}
