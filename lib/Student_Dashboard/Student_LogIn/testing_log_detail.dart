import 'package:flutter/material.dart';

class TTT extends StatelessWidget {
  final dynamic user;

  TTT({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Welcome ${user['name_en']} to the Home screen!'),
      ),
    );
  }
}
