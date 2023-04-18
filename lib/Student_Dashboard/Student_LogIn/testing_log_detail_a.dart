import 'package:flutter/material.dart';

class NextScreen_More extends StatelessWidget {
  final dynamic data;

  NextScreen_More(this.data);

  String getImage(String image) {
    return 'http://192.168.3.34/hosting_api/Student/profile_pic/$image';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${data[0]["faculty_name"]}'),
            Text('Name: ${data[0]["degree_name"]}'),
            Text('Name: ${data[0]["major_name"]}'),
            Text('Name: ${data[0]["year_name"]}'),
            Text('Name: ${data[0]["semester_name"]}'),
            Text('Name: ${data[0]["name"]}'),
            Text('Name: ${data[0]["stage_name"]}'),
            Text('Name: ${data[0]["academic_year"]}'),
            Text('Name: ${data[0]["shift_name"]}'),
            Image.network(
              getImage(data[0]["profile_pic"]),
              scale: 10,
            ),
          ],
        ),
      ),
    );
  }
}
