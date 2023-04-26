import 'package:flutter/material.dart';

class TestCredential extends StatelessWidget {
  final Map<String, dynamic> profileData;

  const TestCredential({Key? key, required this.profileData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = profileData['position'] ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Text(
          'Name: $name',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
