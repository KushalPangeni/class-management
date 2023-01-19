// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:class_management/screens/login_page.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.orange[200]),
            titleSpacing: 0,
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.orange[200],
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          // primarySwatch: Colors.teal,
          cardColor: Colors.orange[100],
          shadowColor: Colors.orange,
          iconTheme: IconThemeData(color: Colors.black),
          scaffoldBackgroundColor: Colors.orange[200]),
      home: SafeArea(
        child: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                //ignore: avoid_print
                print("Error");
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return LoginPage();
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}
