import 'package:flutter/material.dart';

import '../../Custom_AppBar.dart';

class Student_LogIn extends StatefulWidget {
  @override
  State<Student_LogIn> createState() => _Student_LogInState();
}

class _Student_LogInState extends State<Student_LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF5F5F7FE),
        appBar: Custom_AppBar(title: 'title'));
  }
}
