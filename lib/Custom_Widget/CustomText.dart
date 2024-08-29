import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme_builder.dart';

// Guest API URL
String APIUrlGuest = 'https://usea.edu.kh/';

// Local Server
// String APIUrlStudent = 'http://192.168.0.192:9999/api/apidata.php?';
// String APIUrlStudentEn = 'http://192.168.0.192:9999/api/apidata_en.php?';

// Public Server
String APIUrlStudent = 'http://116.212.155.149:9999/api/apidata.php?';
String APIUrlStudentEn = 'http://116.212.155.149:9999/api/apidata_en.php?';

String st_sourceScreen = 'studentScreen';
String guardian_sourceScreen = 'guardianScreen';
String screenNav = 'presidentScreen';
String imageAsset = 'assets/image/';

// Coming Soon
Widget buildComingSoon() {
  return Center(
    child: Text(
      'មកដល់ឆាប់ៗនេះ!!!'.tr,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UTitleSize16,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}
// *@  End Coming Soon

// *@ Divider
Widget buildDivider() {
  return Container(
    width: 0.5,
    height: UHeight15,
    color: UGreyColor,
    margin: const EdgeInsets.symmetric(
      horizontal: UPdMg5,
    ),
  );
}

Widget buildDividerAtt() {
  return const Divider(
    thickness: 0.5,
    height: UHeight10,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerAtt() {
  return const VerticalDivider(
    thickness: 0.5,
    color: UGreyColor,
  );
}

Widget buildDividerStDetail() {
  return const Divider(
    thickness: 0.5,
    color: UGreyColor,
    height: UHeight30,
  );
}

Widget buildVerticalDividerW_5() {
  return const VerticalDivider(
    thickness: 0.5,
    width: UWidth5,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerW_2() {
  return const VerticalDivider(
    thickness: 0.5,
    width: 1,
    color: UGreyColor,
  );
}

Widget buildVerticalDividerH_45() {
  return Container(
    width: 0.5,
    height: UHeight35,
    color: UGreyColor,
  );
}
// *@  End Divider

// *@ Width
Widget buildWidth5() {
  return const SizedBox(
    width: UWidth5,
  );
}

Widget buildWidth7() {
  return const SizedBox(
    width: UWidth7,
  );
}

Widget buildWidth10() {
  return const SizedBox(
    width: UWidth10,
  );
}

Widget buildWidth15() {
  return const SizedBox(
    width: UWidth15,
  );
}

Widget buildWidth20() {
  return const SizedBox(
    width: UWidth20,
  );
}
// *@ End Width

// *@ Height
Widget buildHeight5() {
  return const SizedBox(
    height: UHeight5,
  );
}

Widget buildHeight7() {
  return const SizedBox(
    height: UHeight7,
  );
}

Widget buildHeight10() {
  return const SizedBox(
    height: UHeight10,
  );
}

Widget buildHeight15() {
  return const SizedBox(
    height: UHeight15,
  );
}

Widget buildHeight20() {
  return const SizedBox(
    height: UHeight20,
  );
}
// *@ End Height

// *@ Title
Widget TitleTheme(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UPrimaryColor,
    ),
  );
}
// *@  End Title

// *@ Normal Title Attendance UTextColor
Widget TitleAttendance_Theme(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize16,
      fontWeight: UTitleWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
// *@ End Normal Title 16px UTextColor

// *@ Normal Date Study Info
Widget NormalDateStudyInfo(
  String text,
) {
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
// *@ End Normal Date Study Info

// *@ Normal Data Study Info
Widget RowDataStudyInfo(
  String title,
  tData,
) {
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
            fontFamily:
                Get.locale?.languageCode == 'km' ? UKFontFamily : UEFontFamily,
            color: UTextColor,
            height: UTextHeight,
          ),
        ),
      ),
    ],
  );
}
// *@ End Normal Data Study Info

//*@ Data Study Info Assignment Row
Widget buildStudyDataAssign(
  String textTitle,
  textValue,
) {
  return IntrinsicHeight(
    child: Row(
      children: [
        Container(
          width: 75,
          child: Text(
            textTitle.tr,
            style: const TextStyle(
              fontSize: UTitleSize,
            ),
          ),
        ),
        Expanded(
          child: Text(
            textValue,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UBodyWeight,
              color: UTextColor,
            ),
          ),
        ),
      ],
    ),
  );
}
// *@ End Data Study Info Assignment Row

// *@ No Weight Title
Widget NoWeightTitleTheme(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize,
      fontWeight: UBodyWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
// *@ End No Weight Title

// *@ Scholarship Text
Widget ScholarshipTitleTheme(
  String text,
) {
  return Container(
    height: UHeight30,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
        color: UTextColor,
        height: UTextHeight,
      ),
    ),
  );
}
// *@ End Scholarship Text

// *@ Scholarship Body text
Widget ScholarshipBodyTheme(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize,
      fontWeight: UBodyWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
// *@ End Scholarship Body text

// *@Scholarship Button
Widget ScholarshipButtonTheme(
  String text,
  double size,
  Color color,
  FontWeight fontWeight,
) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
// *@ End Scholarship Button

// *@ Contact text
Widget buildTextContact(
  String text,
  double size,
  FontWeight fontWeight,
) {
  return SelectableText(
    text,
    textAlign: TextAlign.justify,
    style: TextStyle(
      fontSize: size,
      fontFamily:
          Get.locale?.languageCode == 'km' ? UKFontFamily : UEFontFamily,
      fontWeight: fontWeight,
    ),
  );
}
// *@ End Contact text

// *@ Career text
Widget CareerBody(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
// *@ End Career text

// *@ Date Schedule
Widget ScheduleDate(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize,
      fontWeight: UTitleWeight,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
// *@ End Date Scredule

// *@ Schedule Title
Widget ScheduleTitle(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize16,
      fontWeight: UTitleWeight,
      color: UPrimaryColor,
    ),
  );
}
// *@ End Schedule Title

// *@ Schedule Body
Widget ScheduleBody(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
// *@ End Schedule Body

//*@ Event Date
Widget buildEventDate(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize10,
      fontWeight: UBodyWeight,
      color: UPrimaryColor,
    ),
  );
}
// *@ End Event Date

//*@ Job History Card Row
Widget buildJobHistoryCardRow(
  String textTitle,
  textValue,
) {
  return Container(
    padding: EdgeInsets.all(
      UPdMg10,
    ),
    child: Row(
      children: [
        Container(
          width: 125,
          child: Text(
            textTitle.tr,
            style: const TextStyle(
              fontSize: UTitleSize,
            ),
          ),
        ),
        Expanded(
          child: Text(
            textValue,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UBodyWeight,
              color: UTextColor,
              fontFamily: UKFontFamily,
            ),
          ),
        ),
      ],
    ),
  );
}
// *@ End Job History Card Row

// *@ Body text
Widget BodyTheme(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize,
      color: UTextColor,
      fontFamily: UKFontFamily,
    ),
  );
}
// *@ End Body text

// *@ General custom text
Widget CustomTextTheme(
  String text,
  double size,
  Color color,
  FontWeight fontWeight,
) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
      fontFamily: UKFontFamily,
      height: UTextHeight,
    ),
  );
}
// *@ End General custom text

// *@ Performance
Widget CustomPerformanceDiaglogTextThemeTitle(
  String text,
  double size,
  Color color,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: UPdMg5,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: UTitleWeight,
        color: color,
      ),
    ),
  );
}

Widget CustomPerformanceDiaglogTextTheme(
  String text,
  double size,
  Color color,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: UPdMg5,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: UBodyWeight,
        color: color,
      ),
    ),
  );
}

Widget CustomPerformanceDiaglogTextThemeBold(
  String text,
  double size,
  Color color,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      vertical: UPdMg5,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: UBodyWeight,
        color: color,
        fontFamily: UEFontFamily,
      ),
    ),
  );
}
// *@ End Performance

// *@ Attendance custom text
Widget CustomAttTextTheme(
  String text,
  double size,
  Color color,
  FontWeight fontWeight,
) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}
// *@ End Attendance custom text

// *@ Screen_Performance widget
Widget buildTitleContainer(
  double width,
  String text,
  Alignment align,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: UPdMg10,
    ),
    width: width,
    alignment: align,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UTitleSize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}
// *@ End Screen_Performance widget

// *@ ScoreTotal
Widget buildScoreTotal(
  String text,
) {
  return Container(
    width: UWidth50,
    alignment: Alignment.centerRight,
    child: Text(
      text,
      style: const TextStyle(
        color: UPrimaryColor,
      ),
    ),
  );
}
// *@ End ScoreTotal

// *@ Attendance
Widget buildAttList(
  String text,
  Color color,
) {
  return Row(
    children: [
      Icon(
        Icons.circle,
        color: color,
        size: UBodySize,
      ),
      buildWidth5(),
      Text(
        text.tr,
        style: const TextStyle(
          color: UTextColor,
          fontSize: UBodySize,
        ),
      ),
    ],
  );
}

Widget buildCHText(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize10,
    ),
  );
}

Widget buildNumAtt(
  String text,
  Color color,
) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: UTitleSize,
      fontWeight: UBodyWeight,
      fontFamily: UEFontFamily,
    ),
  );
}

Widget buildHeaderNA(
  String text,
) {
  return Container(
    width: 75,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UTextColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildHeader(
  String text,
) {
  return Container(
    width: 80,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildAttDetailHeader(
  String text,
) {
  return Container(
    width: 100,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildTextBody(
  String text,
  Color color,
) {
  return Container(
    width: 80,
    margin: EdgeInsets.symmetric(
      vertical: UPdMg5,
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: UBodySize,
        color: color,
      ),
    ),
  );
}

Widget buildAttTextBody(
  String text,
  Color color,
) {
  return Container(
    width: 100,
    margin: EdgeInsets.symmetric(
      vertical: UPdMg5,
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: UBodySize,
        color: color,
      ),
    ),
  );
}

Widget buildTextTitle(
  String text,
  Color color,
) {
  return Container(
    width: 75,
    margin: EdgeInsets.symmetric(
      vertical: UPdMg5,
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: UTitleSize,
        color: color,
      ),
    ),
  );
}
// *@ End Card Attendance

// *@ Payments
Widget buildTitle(
  String text,
  Widget widget,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(
          UPdMg10,
          UPdMg10,
          UPdMg10,
          UPdMg5,
        ),
        child: Text(
          text.tr,
          style: const TextStyle(
            color: UPrimaryColor,
            fontSize: UTitleSize,
            fontWeight: UTitleWeight,
          ),
        ),
      ),
      SizedBox(
        child: widget,
      ),
    ],
  );
}

Widget buildHeaderTitle(
  double num,
  String text,
) {
  return SizedBox(
    width: num,
    child: Text(
      text.tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: UPrimaryColor,
        fontSize: UBodySize,
        fontWeight: UTitleWeight,
      ),
    ),
  );
}

Widget buildBody(
  double num,
  String text,
  Color color,
) {
  return Container(
    width: num,
    child: Text(
      textAlign: TextAlign.center,
      text.tr,
      style: TextStyle(
        fontSize: UBodySize,
        color: color,
      ),
    ),
  );
}

Widget buildVerticalDivider(
  double num,
) {
  return VerticalDivider(
    width: num,
    color: UGreyColor,
  );
}
// *@ End Payments

// *@ Student Detail
Widget buildHeaderDetail(
  String text,
  font,
  double size,
  FontWeight fontWeight,
) {
  return Container(
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: UPrimaryColor,
        fontFamily: font,
        fontSize: size,
        fontWeight: fontWeight,
        height: UTextHeight,
      ),
    ),
  );
}

Widget buildBodyDetail(
  String text1,
  text2,
) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        text1.tr,
        style: const TextStyle(
          fontSize: UBodySize,
          color: UPrimaryColor,
          fontWeight: UTitleWeight,
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        text2,
        style: const TextStyle(
          fontFamily: UEFontFamily,
          fontSize: UTitleSize,
        ),
      )
    ],
  );
}

Widget buildTailDetail(
  String image,
  title,
  text,
) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: UPdMg10,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          scale: UScale5,
        ),
        buildWidth10(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: UPrimaryColor,
                  fontSize: UBodySize,
                  fontWeight: UTitleWeight,
                ),
              ),
              buildHeight5(),
              Text(
                text,
                style: const TextStyle(
                  fontSize: UTitleSize,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
// *@ End Student Detail

// *@ VDO
Widget buildListText(
  String text,
  int line,
  double size,
  FontWeight fontWeight,
) {
  return Text(
    text,
    textAlign:
        Get.locale?.languageCode == 'km' ? TextAlign.left : TextAlign.justify,
    maxLines: line,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      height: UTextHeight,
      fontSize: size,
      fontFamily: UKFontFamily,
      fontWeight: fontWeight,
    ),
  );
}

Widget buildTitleBody(
  String text,
  double size,
  FontWeight fontWeight,
  TextAlign alignment,
) {
  return Text(
    text,
    textAlign: alignment,
    style: TextStyle(
      fontSize: size,
      fontFamily: UKFontFamily,
      fontWeight: fontWeight,
      height: UTextHeight,
    ),
  );
}
// *@ End VDO

// *@ History
Widget buildHistory(
  String text,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Image.asset(
          imageAsset + 'dot.png',
          width: UWidth5,
        ),
        margin: const EdgeInsets.only(
          top: UPdMg10,
        ),
      ),
      buildWidth5(),
      Expanded(
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: UTitleSize,
            fontFamily: UEFontFamily,
          ),
        ),
      ),
    ],
  );
}
// *@ End History

// *@ Vision
Widget buildTitleVision(
  String text1,
  text2,
) {
  return Container(
    margin: const EdgeInsets.fromLTRB(
      UPdMg10,
      UPdMg10,
      UPdMg10,
      UZeroPixel,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: UTitleSize,
            color: UPrimaryColor,
            fontFamily: UEFontFamily,
            fontWeight: UTitleWeight,
            height: UTextHeight,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: UPdMg12,
          ),
          child: Text(
            text2,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontFamily: UEFontFamily,
              height: UTextHeight,
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildTopBodyVision(
  String text,
) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UTitleSize,
      color: UPrimaryColor,
      fontFamily: UEFontFamily,
      fontWeight: UTitleWeight,
      height: UTextHeight,
    ),
  );
}

Widget buildLowBodyVision(
  String text,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(
          top: UPdMg10,
        ),
        child: Image.asset(
          imageAsset + 'dot.png',
          width: 4,
        ),
      ),
      buildWidth5(),
      Expanded(
        child: Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: UTitleSize,
            fontFamily: UEFontFamily,
            height: UTextHeight,
          ),
        ),
      )
    ],
  );
}
// *@ End Vision

// *@ FAQ
Widget buildFAQ(
  String text,
  TextAlign align,
) {
  return Text(
    text,
    textAlign: align,
    style: const TextStyle(
      fontSize: UTitleSize16,
      color: UTextColor,
      height: UTextHeight,
    ),
  );
}
// *@ End FAQ

// *@ PresidentMessage
Widget buildPresidentMessage(
  String text,
) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: UPdMg10,
      vertical: UPdMg10,
    ),
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: UTitleSize,
        fontFamily: UEFontFamily,
        height: UTextHeight,
      ),
    ),
  );
}
// *@ End PresidentMessage

// *@ Custom GestureDetector Social Media
Widget BuildContainerSM(
  Function()? onTap,
  String imageName,
) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Image.asset(
        imageName,
        scale: UScale5,
      ),
    ),
  );
}
// *@ End Custom GestureDetector Social Media

void pushWithTransition(BuildContext context, Widget screen) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(3.0, UZeroPixel);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        final tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        var forwardAnimation = animation.drive(tween);

        return SlideTransition(
          position: forwardAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(
        milliseconds: 100,
      ),
    ),
  );
}

// *@ Build Loading
Widget buildFutureBuild() {
  return FutureBuilder(
    future: Future.delayed(
      const Duration(
        seconds: 5,
      ),
    ),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: const CircularProgressIndicator(
            color: UPrimaryColor,
          ),
        );
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageAsset + 'no_data.png',
                scale: 3,
              ),
              buildHeight10(),
              Text(
                'គ្មានទិន្ន័យ'.tr,
                style: const TextStyle(
                  color: UPrimaryColor,
                  fontSize: UTitleSize,
                  fontWeight: UTitleWeight,
                ),
              ),
            ],
          ),
        );
      }
    },
  );
}
// *@ End Build Loading

// *@ PresidentMessage
Widget buildStudentDashboard_Name(
  String text,
  font,
) {
  return Text(
    text,
    style: TextStyle(
      color: UPrimaryColor,
      fontSize: UTitleSize16,
      fontFamily: font,
      fontWeight: UBodyWeight,
    ),
  );
}
// *@ End PresidentMessage

// *@ Contact
Widget buildContact(
  String image,
  text,
  double size,
  FontWeight fontWeight,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        width: UWidth30,
        height: UHeight30,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      buildWidth10(),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(
            top: 4,
          ),
          child: SelectableText(
            text,
            textAlign: Get.locale?.languageCode == 'km'
                ? TextAlign.left
                : TextAlign.justify,
            style: TextStyle(
              fontSize: size,
              fontWeight: fontWeight,
              height: UTextHeight,
            ),
          ),
        ),
      ),
    ],
  );
}
// *@ End Contact

// *@ Button on Map
Widget buildBtnMap(
  Function() mode,
  IconData icons,
) {
  return GestureDetector(
    onTap: mode,
    child: Container(
      width: UWidth35,
      height: UHeight35,
      decoration: BoxDecoration(
        color: UPrimaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(
          URoundedMedium,
        ),
      ),
      child: Icon(
        icons,
        size: 24.0,
        color: UBackgroundColor,
      ),
    ),
  );
}
// *@ End Button on Map

// *@ Student Total Credit
Widget buildTotalCredit(
  String text,
  Color creditColor,
) {
  return Flexible(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.circle,
          size: UBodySize,
          color: creditColor,
        ),
        Text(
          text.tr,
          style: const TextStyle(
            fontSize: UTitleSize,
            fontWeight: UTitleWeight,
          ),
        ),
      ],
    ),
  );
}
// *@ End Student Total Credit

// *@ University Name
Widget buildUniversityName(
  Color uniNameCol,
) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Card(
        //   shape: RoundedRectangleBorder(
        //     side: const BorderSide(
        //       color: UBackgroundColor,
        //       width: 1,
        //     ),
        //     borderRadius: BorderRadius.circular(
        //       50,
        //     ),
        //   ),
        //   child: Image.asset(
        //     imageAsset + 'usea_logo.png',
        //     scale: 40,
        //   ),
        // ),
        buildWidth5(),
        Image.asset(
          imageAsset + 'new_usea_logo.png',
          scale: 8,
        ),
        buildWidth5(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
                style: TextStyle(
                  color: uniNameCol,
                  fontSize: 11,
                  fontFamily: 'KhmerOSmuol',
                ),
              ),
              // buildHeight5(),
              SizedBox(
                height: 2,
              ),
              Text(
                'UNIVERSITY OF SOUTH-EAST ASIA',
                style: TextStyle(
                  color: uniNameCol,
                  fontSize: 13,
                  fontFamily: UEFontFamily,
                  fontWeight: UBodyWeight,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
// *@ End University Name

// *@ Back Button
Widget buildBackBtn(Function()? onPressed) {
  return Stack(
    children: [
      Positioned(
        top: UHeight5,
        right: 1,
        child: IconButton(
          highlightColor: UTransParentColor,
          splashColor: UTransParentColor,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UPrimaryColor,
            size: 18,
          ),
          onPressed: onPressed,
        ),
      ),
      IconButton(
        padding: EdgeInsets.only(
          top: UPdMg8,
          left: 14,
        ),
        highlightColor: UTransParentColor,
        splashColor: UTransParentColor,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: UPrimaryColor,
          size: 18,
        ),
        onPressed: onPressed,
      ),
    ],
  );
}
// *@ End Back Button

// *@ Navigate Button
Widget buildNavBtn(
  Function() setState,
  String text,
) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: setState,
    child: Card(
      elevation: 1,
      color: UBackgroundColor,
      shadowColor: ULightGreyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          URoundedMedium,
        ),
      ),
      child: Container(
        width: 100,
        height: UHeight35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            URoundedMedium,
          ),
          color: UBtnColor,
        ),
        child: CustomTextTheme(
          text.tr,
          UBodySize,
          UPrimaryColor,
          UTitleWeight,
        ),
      ),
    ),
  );
}
// *@ End Navigate Button
