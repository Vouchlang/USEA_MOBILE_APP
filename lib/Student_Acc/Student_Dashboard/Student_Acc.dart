import 'package:flutter/material.dart';

import '../../Guest_Acc/Guest_Dashboard/Notification/Notifications.dart';

class Student_Acc extends StatefulWidget {
  const Student_Acc({super.key});

  @override
  State<Student_Acc> createState() => _Student_AccState();
}

class _Student_AccState extends State<Student_Acc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        leading: Image.asset(
          'assets/image/usea_logo.png',
          scale: 45,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                  style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 10,
                      fontFamily: 'KhmerOSmuol'),
                ),
                Text('UNIVERSITY OF SOUTH-EAST ASIA',
                    style: TextStyle(
                        color: Colors.indigo[900],
                        fontSize: 11.7,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
        actions: [
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Notifications()));
                      });
                    },
                    icon: Image.asset(
                      'assets/image/logo3.png',
                    )),
              )),
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
    );
  }
}
