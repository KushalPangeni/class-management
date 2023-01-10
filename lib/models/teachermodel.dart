import 'package:cloud_firestore/cloud_firestore.dart';

class Teacher {
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

  Teacher(
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
  final docUser = FirebaseFirestore.instance.collection('Teachers').doc();
  final user = Teacher(
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
  // final json = {'name': name, 'age': 21, 'address': 'lamachaur'};
  await docUser.set(json);
}
