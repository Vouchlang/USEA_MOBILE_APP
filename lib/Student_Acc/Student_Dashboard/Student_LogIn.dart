import 'package:flutter/material.dart';

class Student_LogIn extends StatefulWidget {
  @override
  _Student_LogInState createState() => _Student_LogInState();
}

class _Student_LogInState extends State<Student_LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(title: Text('Student Account')),
    );
  }
}
