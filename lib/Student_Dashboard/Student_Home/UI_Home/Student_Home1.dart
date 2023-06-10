import 'package:flutter/material.dart';
import 'package:usea_app/theme_builder.dart';
import '/Guest_Dashboard/Guest_Notification/UI_Notification/Notifications.dart';

class Student_Home2 extends StatefulWidget {
  const Student_Home2({super.key});

  @override
  State<Student_Home2> createState() => _Student_HomeState();
}

class _Student_HomeState extends State<Student_Home2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
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
                      color: UPrimaryColor,
                      fontSize: 10,
                      fontFamily: 'KhmerOSmuol'),
                ),
                Text('UNIVERSITY OF SOUTH-EAST ASIA',
                    style: TextStyle(
                        color: UPrimaryColor,
                        fontSize: 11.7,
                        fontFamily: 'Poppins',
                        fontWeight: UBodyWeight)),
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
                  setState(
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Notifications(),
                        ),
                      );
                    },
                  );
                },
                icon: Image.asset(
                  'assets/image/logo3.png',
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: UBackgroundColor,
        elevation: 1,
      ),
    );
  }
}
