import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Guest_Class_Model/Class_Registration.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF5F5F7FE),
        appBar: AppBar(
          centerTitle: false,
          title: Text('ការចុះឈ្មោះ'.tr,
              style: TextStyle(
                color: Colors.indigo[900],
                fontSize: 16,
                fontFamily: 'KhmerOSbattambang',
                fontWeight: FontWeight.w600,
              )),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData.fallback(),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo[900],
              size: 15,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
            child: buildList()
        ));
  }
  Widget buildList(){
    return ListView.builder(
        itemCount: registration.length,
        itemBuilder: (context, index) {
          return Card(
            // margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            elevation: 3,
            shadowColor: Colors.grey[200],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      registration[index].title,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'KhmerOSbattambang',
                        fontWeight: FontWeight.w600,


                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                              'assets/image/date_time.png'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 285,
                          child: Text(
                            registration[index].date,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'assets/image/detail.png',
                            scale: 15,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 270,
                          child: Text(
                            registration[index].bachelor1,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 240,
                          child: Text(
                            registration[index].detail1,
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            'assets/image/detail.png',
                            scale: 15,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 270,
                          child: Text(
                            registration[index].bachelor1,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 240,
                          child: Text(
                            registration[index].detail2,
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                              'assets/image/date_time.png'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 285,
                          child: Text(
                            registration[index].time,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(35, 0, 0, 0),
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          width: 210,
                          child: Text(
                            registration[index].detail3,
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'KhmerOSbattambang',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
