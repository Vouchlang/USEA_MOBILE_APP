import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget NormalDateStudyInfo(final String text) {
  return Text(
    text.tr,
    style: const TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}

Widget RowDataStudyInfo({
  required final String title,
  tData,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: UWidth50,
        child: Text(
          title.tr,
          style: const TextStyle(
            fontSize: UBodySize,
            color: UTextColor,
            height: UTextHeight,
          ),
        ),
      ),
      Container(
        width: 190,
        alignment: Alignment.centerLeft,
        child: Text(
          tData,
          style: TextStyle(
            fontSize: UBodySize,
            color: UTextColor,
            height: UTextHeight,
          ),
        ),
      ),
    ],
  );
}

Widget buildStudyInfoLabel(final String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(
      UPdMg10,
      UPdMg15,
      UPdMg10,
      UZeroPixel,
    ),
    child: Text(
      title.tr,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
        height: UTextHeight,
      ),
    ),
  );
}

Widget buildStudyInfoExamTitle(final String examTitle) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(
      vertical: UPdMg15,
      horizontal: UPdMg10,
    ),
    width: UFullWidth,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(URoundedLarge),
      ),
      color: UBGLightBlue,
    ),
    child: Text(
      examTitle,
      style: const TextStyle(
        fontSize: UTitleSize16,
        fontWeight: UTitleWeight,
        color: UPrimaryColor,
        height: UTextHeight,
      ),
    ),
  );
}

Widget buildStudyInfoExamBody({
  required final Widget widgetMonth,
  widgetDate,
  widgetSubject,
  widgetRoom,
  widgetTime,
  widgetSeat,
  widgetTakeout,
}) {
  return IntrinsicHeight(
    child: Container(
      padding: const EdgeInsets.all(UPdMg10),
      child: Row(
        children: [
          IntrinsicHeight(
            child: Container(
              width: 55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widgetMonth,
                  buildDividerAtt(),
                  widgetDate,
                ],
              ),
            ),
          ),
          buildVerticalDividerAtt(),
          Container(
            padding: const EdgeInsets.only(left: UPdMg8),
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widgetSubject,
                  widgetRoom,
                  widgetTime,
                  widgetSeat,
                  widgetTakeout,
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

// For Study Info Assignment section
// Widget buildStudyInfoDataAssign(
//   final String textTitle,
//   textValue,
// ) {
//   return IntrinsicHeight(
//     child: Row(
//       children: [
//         Container(
//           width: 75,
//           child: Text(
//             textTitle.tr,
//             style: const TextStyle(
//               fontSize: UTitleSize,
//             ),
//           ),
//         ),
//         Expanded(
//           child: Text(
//             textValue,
//             style: const TextStyle(
//               fontSize: UTitleSize,
//               fontWeight: UBodyWeight,
//               color: UTextColor,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

 // _dataStudyInfoAssignment.isEmpty
    //     ? SizedBox.shrink()
    //     : Padding(
    //         padding: EdgeInsets.fromLTRB(
    //           UPdMg10,
    //           UZeroPixel,
    //           UPdMg10,
    //           UZeroPixel,
    //         ),
    //         child: Text(
    //           'កិច្ចការផ្ទះ និងស្រាវជ្រាវ\t (Not Available)'.tr,
    //           style: TextStyle(
    //             color: UPrimaryColor,
    //             fontSize: UTitleSize,
    //             fontWeight: UTitleWeight,
    //           ),
    //         ),
    //       ),
    // ListView.builder(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   padding: EdgeInsets.all(
    //     UPdMg5,
    //   ),
    //   itemCount: _dataStudyInfoAssignment.length,
    //   itemBuilder: (BuildContext context, index) {
    //     final isLastIndex =
    //         index == _dataStudyInfoAssignment.length - 1;
    //     return Card(
    //       elevation: 2,
    //       shadowColor: ULightGreyColor,
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(
    //           URoundedLarge,
    //         ),
    //       ),
    //       margin: isLastIndex
    //           ? EdgeInsets.fromLTRB(
    //               UPdMg5,
    //               UPdMg5,
    //               UPdMg5,
    //               UPdMg10,
    //             )
    //           : EdgeInsets.all(
    //               UPdMg5,
    //             ),
    //       child: Padding(
    //         padding: EdgeInsets.all(
    //           UPdMg10,
    //         ),
    //         child: Column(
    //           children: [
    //             Row(
    //               children: [
    //                 Flexible(
    //                   flex: 2,
    //                   child: Text(
    //                     _dataStudyInfoAssignment[index]
    //                             .expire_date
    //                             .isEmpty
    //                         ? 'ថ្ងៃផុតកំណត់៖ '.tr + 'N/A'
    //                         : 'ថ្ងៃផុតកំណត់៖ '.tr +
    //                             _dataStudyInfoAssignment[index]
    //                                 .expire_date,
    //                     style: TextStyle(
    //                       fontSize: UTitleSize,
    //                       fontWeight: UTitleWeight,
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: UWidth15,
    //                 ),
    //                 Flexible(
    //                   flex: 1,
    //                   child: Text(
    //                     _dataStudyInfoAssignment[index]
    //                             .expire_time
    //                             .isEmpty
    //                         ? 'ម៉ោង '.tr + 'N/A'
    //                         : 'ម៉ោង '.tr +
    //                             _dataStudyInfoAssignment[index]
    //                                 .expire_time,
    //                     style: TextStyle(
    //                       fontSize: UTitleSize,
    //                       fontWeight: UTitleWeight,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             Divider(),
    //             buildStudyDataAssign(
    //               'ឈ្មោះ',
    //               _dataStudyInfoAssignment[index]
    //                       .assignment_name
    //                       .isEmpty
    //                   ? 'N/A'
    //                   : _dataStudyInfoAssignment[index]
    //                       .assignment_name,
    //             ),
    //             Divider(),
    //             buildStudyDataAssign(
    //               'មុខវិជ្ជា',
    //               _dataStudyInfoAssignment[index]
    //                       .subject_name
    //                       .isEmpty
    //                   ? 'N/A'
    //                   : _dataStudyInfoAssignment[index]
    //                       .subject_name,
    //             ),
    //             Divider(),
    //             buildStudyDataAssign(
    //               'បន្ទប់',
    //               _dataStudyInfoAssignment[index]
    //                       .room_name
    //                       .isEmpty
    //                   ? 'N/A'
    //                   : _dataStudyInfoAssignment[index]
    //                       .room_name,
    //             ),
    //             Divider(),
    //             buildStudyDataAssign(
    //               'សាស្ត្រចារ្យ',
    //               _dataStudyInfoAssignment[index]
    //                       .lecturer_name
    //                       .isEmpty
    //                   ? 'N/A'
    //                   : _dataStudyInfoAssignment[index]
    //                       .lecturer_name,
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // ),
 // ignore: unused_field
  // late List<StudyInfoAssignmentData> _dataStudyInfoAssignment = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _refreshData();
  //   studyinfoExam;
  // }

  // Future<void> _refreshData() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   try {
  //     var response_assignment = await http.post(
  //       Uri.parse(
  //         Get.locale?.languageCode == 'km'
  //             ? APIStAssignmentKh
  //             : APIStAssignmentEn,
  //       ),
  //       body: {
  //         'student_id': widget.data_studentUser[0].student_id,
  //         'pwd': widget.data_studentUser[0].pwd,
  //         'guardian_id': widget.sourceScreen == guardian_sourceScreen
  //             ? widget.data_studentUser[0].guardian_id
  //             : 'N/A',
  //       },
  //     );

  //     if (response_assignment.statusCode == 200) {
  //       var data_assignment = jsonDecode(response_assignment.body);
  //       if (mounted) {
  //         setState(() {
  //           _dataStudyInfoAssignment = List<StudyInfoAssignmentData>.from(
  //             data_assignment['study_info_assignment_data'].map(
  //               (data_assignment) =>
  //                   StudyInfoAssignmentData.fromJson(data_assignment),
  //             ),
  //           );
  //           isLoading = false;
  //         });
  //       }
  //     } else {
  //       if (mounted) {
  //         setState(() {
  //           isLoading = false;
  //         });
  //       }
  //     }
  //   } catch (error) {
  //     print('Failed to fetch studt info: $error');
  //     if (mounted) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   }
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   _refreshData();
  // }