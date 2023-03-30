import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Vision extends StatefulWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  State<Vision> createState() => _VisionState();
}

class _VisionState extends State<Vision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF5F5F7FE),
      appBar: AppBar(
        centerTitle: false,
        title: Text('ចក្ខុវិស័យ បេសកកម្ម និងគុណតម្លៃ'.tr,
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
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '1. Vision ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'University of South-East Asia will develop human resources with high competency, virtue, and professional attitude in response to national and international labor market, where they can find employment and live in the era of globalization to contribute to the building of society.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '2. Mission',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'University of South-East Asia builds higher education and technical and vocational education systems at all levels in compliance with national and international standards to provide knowledge, know-how, technical skills, soft skills, and professional attitude to learners to meet the needs of national and international labor market.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '3. Educational Philosophy',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Your life will be more successful with University of South-East Asia.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '4. Core Value',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Knowledge, Skills, Excellence, Society',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '4.1. Knowledge',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/image/dot.png',
                              width: 4,
                            ),
                            margin: EdgeInsets.only(top: 7),
                          ),
                          SizedBox(width: 5,),
                          Container(
                            width: 300,
                            child: Text(
                              'Enjoy lifelong learning and research',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          )
                        ],
                      ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/image/dot.png',
                                width: 4,
                              ),
                              margin: EdgeInsets.only(top: 7),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 300,
                              child: Text(
                                    'Extensive knowledge',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/image/dot.png',
                                width: 4,
                              ),
                              margin: EdgeInsets.only(top: 7),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 300,
                              child: Text(
                                    'Knowledge of foreign languages that can be used officially',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/image/dot.png',
                                width: 4,
                              ),
                              margin: EdgeInsets.only(top: 7),
                            ),
                            SizedBox(width: 5,),
                            Container(
                              width: 300,
                              child: Text(
                                    'Self-confidence',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '4.2. Skills',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'High commitment and responsibility to perform the work',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'High commitment and responsibility in teaching',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'High commitment and responsibility in study and research',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Honesty, virtue, accountability, open communication and teamwork',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '4.4. Social',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'National Consciousness',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Participate in social activities',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Preservation and protection of national culture and traditions',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Maintain and protect the environment',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      '5. Goal & Objective',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.indigo[900],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Good management and governance',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Improving the quality of education to national and international standards',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Promoting research and development',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'International Communication and Cooperation',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/image/dot.png',
                                  width: 4,
                                ),
                                margin: EdgeInsets.only(top: 7),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                width: 300,
                                child: Text(
                                  'Recognition of quality of education nationally and internationally',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
