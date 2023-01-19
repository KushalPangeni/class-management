import 'package:flutter/material.dart';
import 'package:class_management/screens/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //for textstyle
  final style = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/haan.png'),
                      height: 350,
                      // width: 200,
                      // fit: BoxFit.fill,
                    ),
                    Text("Login Page",
                        style: GoogleFonts.openSans(textStyle: style)),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 4),
                      child: Card(
                        color: Colors.teal[50],
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter name";
                              } else {
                                return null;
                              }
                            },
                            controller: namecontroller,
                            decoration: const InputDecoration(
                                hintText: 'User name',
                                // labelText: 'User name',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                // border: OutlineInputBorder(),
                                border: InputBorder.none),
                            keyboardType: TextInputType.name,
                            // maxLength: 25,
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                      child: Card(
                        color: Colors.teal[50],
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: TextFormField(
                            validator: (values) {
                              if (values!.isEmpty) {
                                return "Enter password";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordcontroller,
                            decoration: const InputDecoration(
                                hintText: 'Password',
                                // labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                // border: OutlineInputBorder(),
                                border: InputBorder.none),
                            keyboardType: TextInputType.name,
                            // maxLength: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: () {
                    setState(() {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                          ),
                        );
                        // if (namecontroller.text == 'admin' &&
                        //     passwordcontroller.text == 'admin') {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const Dashboard(),
                        //     ),
                        //   );
                      }
                      // else {
                      // reset1();
                      // showDialog(
                      //   context: context,
                      //   builder: ((context) {
                      //     return const AlertDialog(
                      //       title: Text('Wrong credentials!!!'),
                      //     );
                      //   }),
                      // );
                      // }
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14)),
                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //   style:
                //       ElevatedButton.styleFrom(backgroundColor: Colors.white),
                //   child: const Text(
                //     'Log In',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       final isValidForm = formKey.currentState!.validate();
                //       if (isValidForm) {
                //         Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => const Dashboard(),
                //           ),
                //         );
                //         // if (namecontroller.text == 'admin' &&
                //         //     passwordcontroller.text == 'admin') {
                //         //   Navigator.push(
                //         //     context,
                //         //     MaterialPageRoute(
                //         //       builder: (context) => const Dashboard(),
                //         //     ),
                //         //   );
                //       }
                //       // else {
                //       // reset1();
                //       // showDialog(
                //       //   context: context,
                //       //   builder: ((context) {
                //       //     return const AlertDialog(
                //       //       title: Text('Wrong credentials!!!'),
                //       //     );
                //       //   }),
                //       // );
                //       // }
                //     });
                //   },
                // ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  void reset1() {
    namecontroller.text = '';
    passwordcontroller.text = '';
    // phone.text = '';
    // address.text = '';
    // srn.text = '';
    // email.text = '';
    // birthday.text = '';
  }

  void username() {}
}
