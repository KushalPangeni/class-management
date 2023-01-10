import 'package:flutter/material.dart';
import 'package:class_management/screens/dashboard.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //this will either return home page or authenticate page
    return const Dashboard();
  }
}
