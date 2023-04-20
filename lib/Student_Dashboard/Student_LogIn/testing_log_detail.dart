import 'package:flutter/material.dart';
import 'package:usea_app/Student_Dashboard/Student_LogIn/testing_log_detail_a.dart';

class NextScreen extends StatelessWidget {
  final dynamic data;

  NextScreen(this.data);

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
            Image.network(
              getImage(data[0]["profile_pic"]),
              scale: 5,
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             NextScreen_More(data)));
                },
                child: Text('Next')),
          ],
        ),
      ),
    );
  }
}
