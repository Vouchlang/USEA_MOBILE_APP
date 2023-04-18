import 'package:flutter/material.dart';
import 'package:usea_app/Guest_Dashboard/Guest_Notification/UI_Notification/Notifications.dart';

class Student_Home extends StatefulWidget {
  const Student_Home({super.key});

  @override
  State<Student_Home> createState() => _Student_HomeState();
}

class _Student_HomeState extends State<Student_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
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
                      color: Theme.of(context).primaryColor,
                      fontSize: 10,
                      fontFamily: 'KhmerOSmuol'),
                ),
                Text('UNIVERSITY OF SOUTH-EAST ASIA',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
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
