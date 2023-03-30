import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Class_Career/Class_Career.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Career extends StatefulWidget {
  const Career({Key? key}) : super(key: key);

  @override
  State<Career> createState() => _CareerState();
}

class _CareerState extends State<Career> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        centerTitle: false,
        title: Text('ព័ត៌មានការងារ'.tr,
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
          onPressed: ()=> Navigator.of(context).pop(),),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: career.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: () => launchUrlString(career[index].link),
            child: Container(
              child: Column(
                children: [
                  Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(career[index].logo),
                      radius: 35,
                    ),
                    SizedBox(width: 15,),
                    Column(
                      children: [
                        Container(width: 200, child: Text( career[index].position , style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w500,)),),
                        SizedBox(height: 5,),
                        Container(width: 200, child: Text( career[index].organization , style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'KhmerOSbattambang',
                          fontWeight: FontWeight.w500,)),)
                      ],
                    ),
                  ],
                ),
                  Divider()
                ]
              ),
    ),
          );}),
      ),
    );
  }
}
