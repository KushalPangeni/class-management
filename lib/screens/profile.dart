import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String name;
  final String email;
  final String address;
  final String birthday;
  final String phone;
  const Profile(
      {Key? key,
      required this.name,
      required this.email,
      required this.address,
      required this.birthday,
      required this.phone})
      : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = 'Kushal Pangeni';
  String email = 'kushalpangeni03@gmail.com';
  String address = 'Pokhara, Lamachaur';
  String birthday = '2057/12/26';
  String phone = '9805462063';
  @override
  void initState() {
    super.initState();
    name = widget.name;
    email = widget.email;
    address = widget.address;
    birthday = widget.birthday;
    phone = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // color: Colors.amber,
              height: screenheight / 4.5 + 75,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      color: Colors.teal,
                      height: screenheight / 4.5,
                    ),
                  ),
                  Positioned(
                    top: screenheight / 4.5 - 75,
                    left: screenwidth / 2 - 75,
                    child: Container(
                      // clipBehavior: Clip.antiAliasWithSaveLayer,
                      // clipBehavior: Clip.antiAlias,
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 199, 159, 159),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                            image: AssetImage('assets/images/haan1.png'),
                            fit: BoxFit.cover),
                      ),
                      // child: const Image(
                      //   image: AssetImage('assets/images/haan1.png'),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 35, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        size: 35,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        email,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.map,
                        size: 35,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        address,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 35,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        birthday,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 35,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        phone,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
