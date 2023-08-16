import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import 'Components/Screen_Performance.dart';

class Performance_Demo extends StatefulWidget {
  const Performance_Demo({super.key});

  @override
  State<Performance_Demo> createState() => _Performance_DemoState();
}

class _Performance_DemoState extends State<Performance_Demo> {
  List<String> items = [
    "ឆ្នាំទី​ ១",
    "ឆ្នាំទី​ ២",
    "ឆ្នាំទី​ ៣",
    "ឆ្នាំទី​ ៤",
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ដំណើរការសិក្សា'.tr),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Container(
                height: 70,
                width: UFullWidth,
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 70,
                      width: 120,
                      decoration: BoxDecoration(
                        color:
                            current == index ? UPrimaryColor : UBackgroundColor,
                        borderRadius: BorderRadius.circular(URoundedMedium),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            color: ULightGreyColor,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(UPdMg_5),
                      child: Center(
                        child: Text(
                          items[index].toString().tr,
                          style: TextStyle(
                            fontSize: UTitleSize,
                            color: current == index
                                ? UBackgroundColor
                                : UTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// CONTENT BODY
              Container(child: Card_learning_pro_1()),

//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: UPdMg_5,
//                 horizontal: UPdMg_10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'មធ្យមភាគៈ'.tr,
//                     style: TextStyle(
//                       color: UPrimaryColor,
//                     ),
//                   ),
//                   buildScoreTotal(totalScore),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: UPdMg_5,
//                 horizontal: UPdMg_10,
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'ចំណាត់ថ្នាក់ប្រចាំថ្នាក់ៈ'.tr,
//                     style: TextStyle(
//                       color: UPrimaryColor,
//                     ),
//                   ),
//                   buildScoreTotal(rank),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: UPdMg_5,
//                 horizontal: UPdMg_10,
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'GPA:',
//                     style: TextStyle(
//                       color: UPrimaryColor,
//                     ),
//                   ),
//                   buildScoreTotal(gpa),
//                 ],
//               ),
//             ),
//           ],
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//       margin: EdgeInsets.only(bottom: 5),
//       child: Card(
//         elevation: 1,
//         shadowColor: ULightGreyColor,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: UBackgroundColor,
//             width: 0.5,
//           ),
//           borderRadius: BorderRadius.circular(URoundedLarge),
//         ),
//         margin: EdgeInsets.all(UPdMg_10),
//         color: UBackgroundColor,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: UPdMg_15,
//                 horizontal: UPdMg_10,
//               ),
//               width: UFullWidth,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(URoundedLarge),
//                   topRight: Radius.circular(URoundedLarge),
//                   bottomRight: Radius.circular(UZeroPixel),
//                   bottomLeft: Radius.circular(UZeroPixel),
//                 ),
//                 color: UBGLightBlue,
//               ),
//               child: IntrinsicHeight(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       semester.tr,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: UPrimaryColor,
//                         fontSize: UTitleSize,
//                         fontWeight: UTitleWeight,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         buildTitleContainer(
//                           100,
//                           'វត្តមាន',
//                           Alignment.centerRight,
//                         ),
//                         VerticalDivider(
//                           color: UGreyColor,
//                           thickness: 0.5,
//                         ),
//                         buildTitleContainer(
//                           50,
//                           'ពិន្ទុ',
//                           Alignment.centerLeft,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(UPdMg_10),
//               width: UFullWidth,
//               child: ListView.builder(
//                 physics: NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: itemCount,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     padding: EdgeInsets.symmetric(vertical: UPdMg_10),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IntrinsicHeight(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Expanded(
//                                 child: Text(
//                                   subject[index],
//                                   style: TextStyle(
//                                     color: UTextColor,
//                                     fontSize: UTitleSize,
//                                     fontFamily: UKFontFamily,
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   BuildAttScore(
//                                     customDialog: dialog1,
//                                     text: attend[index].toStringAsFixed(2),
//                                   ),
//                                   VerticalDivider(
//                                     color: UGreyColor,
//                                     thickness: 0.5,
//                                   ),
//                                   BuildAttScore(
//                                     customDialog: dialog2,
//                                     text: score[index].toStringAsFixed(2),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: UPdMg_5,
//                 horizontal: UPdMg_10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'មធ្យមភាគៈ'.tr,
//                     style: TextStyle(
//                       color: UPrimaryColor,
//                     ),
//                   ),
//                   buildScoreTotal(totalScore),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: UPdMg_5,
//                 horizontal: UPdMg_10,
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'ចំណាត់ថ្នាក់ប្រចាំថ្នាក់ៈ'.tr,
//                     style: TextStyle(
//                       color: UPrimaryColor,
//                     ),
//                   ),
//                   buildScoreTotal(rank),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 vertical: UPdMg_5,
//                 horizontal: UPdMg_10,
//               ),
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'GPA:',
//                     style: TextStyle(
//                       color: UPrimaryColor,
//                     ),
//                   ),
//                   buildScoreTotal(gpa),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
