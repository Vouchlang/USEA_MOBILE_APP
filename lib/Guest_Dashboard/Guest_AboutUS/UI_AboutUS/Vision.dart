import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';

class Vision extends StatelessWidget {
  const Vision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(
        title: 'ចក្ខុវិស័យ បេសកកម្ម និងគុណតម្លៃ'.tr,
      ),
      body: ListView(
        children: [
          buildTitleVision(
            '1. Vision',
            'University of South-East Asia will develop human resources with high competency, virtue, and professional attitude in response to national and international labor market, where they can find employment and live in the era of globalization to contribute to the building of society.',
          ),
          buildTitleVision(
            '2. Mission',
            'University of South-East Asia builds higher education and technical and vocational education systems at all levels in compliance with national and international standards to provide knowledge, know-how, technical skills, soft skills, and professional attitude to learners to meet the needs of national and international labor market.',
          ),
          buildTitleVision(
            '3. Educational Philosophy',
            'Your life will be more successful with University of South-East Asia.',
          ),
          buildTitleVision(
            '4. Core Value',
            'Knowledge, Skills, Excellence, Society',
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              UPdMg_10,
              UPdMg_10,
              UPdMg_10,
              UZeroPixel,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopBodyVision(
                  '4.1. Knowledge',
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: UPdMg_12,
                  ),
                  child: Column(
                    children: [
                      buildLowBodyVision(
                        'Enjoy lifelong learning and research',
                      ),
                      buildLowBodyVision(
                        'Extensive knowledge',
                      ),
                      buildLowBodyVision(
                        'Knowledge of foreign languages that can be used officially',
                      ),
                      buildLowBodyVision(
                        'Self-confidence',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              UPdMg_10,
              UPdMg_10,
              UPdMg_10,
              UZeroPixel,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopBodyVision(
                  '4.2. Skills',
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: UPdMg_12,
                  ),
                  child: Column(
                    children: [
                      buildLowBodyVision(
                        'High commitment and responsibility to perform the work',
                      ),
                      buildLowBodyVision(
                        'High commitment and responsibility in teaching',
                      ),
                      buildLowBodyVision(
                        'High commitment and responsibility in study and research',
                      ),
                      buildLowBodyVision(
                        'Honesty, virtue, accountability, open communication and teamwork',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              UPdMg_10,
              UPdMg_10,
              UPdMg_10,
              UZeroPixel,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopBodyVision('4.4. Social'),
                Container(
                  margin: EdgeInsets.only(
                    left: UPdMg_12,
                  ),
                  child: Column(
                    children: [
                      buildLowBodyVision(
                        'National Consciousness',
                      ),
                      buildLowBodyVision(
                        'Participate in social activities',
                      ),
                      buildLowBodyVision(
                        'Preservation and protection of national culture and traditions',
                      ),
                      buildLowBodyVision(
                        'Maintain and protect the environment',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(
              UPdMg_10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTopBodyVision(
                  '5. Goal & Objective',
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: UPdMg_12,
                  ),
                  child: Column(
                    children: [
                      buildLowBodyVision(
                        'Good management and governance',
                      ),
                      buildLowBodyVision(
                        'Improving the quality of education to national and international standards',
                      ),
                      buildLowBodyVision(
                        'Promoting research and development',
                      ),
                      buildLowBodyVision(
                        'International Communication and Cooperation',
                      ),
                      buildLowBodyVision(
                        'Recognition of quality of education nationally and internationally',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
