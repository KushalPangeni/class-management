import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String id;
  final String firstname;
  String lastname;
  String phone;
  String address;
  String? gender;
  String birthday;
  String srn;
  String email;
  String username;
  //for photo

  Student(
      {this.id = '',
      required this.firstname,
      required this.lastname,
      required this.phone,
      required this.address,
      required this.gender,
      required this.birthday,
      required this.srn,
      required this.email,
      required this.username});

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'address': address,
        'gender': gender,
        'birthday': birthday,
        'srn': srn,
        'email': email,
        'username': username
      };
}

Future createUser(
    {required String firstname,
    required String lastname,
    required String phone,
    required String address,
    String? gender,
    required String srn,
    required String email,
    required String birthday
    // required String username
    }) async {
  final docUser = FirebaseFirestore.instance.collection('Students').doc();
  final user = Student(
      id: docUser.id,
      firstname: firstname,
      lastname: lastname,
      phone: phone,
      address: address,
      gender: gender,
      birthday: birthday,
      srn: srn,
      email: email,
      username: firstname + " " + lastname);
  final json = user.toJson();
  await docUser.set(json);
}
