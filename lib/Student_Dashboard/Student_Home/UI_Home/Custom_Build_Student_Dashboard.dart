import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

// AppBar Profile
Widget buildProfileImage({
  required final Function() onTap,
  required final Widget buildImageUrl,
}) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: UBackgroundColor,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: buildImageUrl,
    ),
  );
}

// *@ Student Total Credit
Widget buildTotalCredit({
  required final String text,
  required final Color creditColor,
}) {
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

// Container behind Total Credit Card
Widget buildPositionWidget(final double width) {
  return Positioned(
    left: 0,
    child: Container(
      color: UPrimaryColor,
      height: 70,
      width: width,
    ),
  );
}

Widget buildTotalCreditCard({
  required final double percentIndicator,
  required final Color progressColor,
  required final String credit,
}) {
  return Card(
    elevation: 1.5,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UPdMg10),
    ),
    margin: const EdgeInsets.only(
      left: UPdMg12,
      right: UPdMg12,
      top: UPdMg15,
      bottom: UPdMg5,
    ),
    child: Container(
      padding: const EdgeInsets.all(UPdMg15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            arcType: ArcType.FULL,
            arcBackgroundColor: UBGChartColor,
            radius: 70.0,
            lineWidth: UWidth15,
            percent: percentIndicator,
            progressColor: progressColor,
            animateFromLastPercent: true,
            animation: true,
            curve: Curves.decelerate,
            circularStrokeCap: CircularStrokeCap.round,
            animationDuration: 1000,
            center: Text(
              credit,
              style: const TextStyle(
                fontSize: UTitleSize16,
                fontWeight: UTitleWeight,
                fontFamily: UEFontFamily,
                color: UPrimaryColor,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTotalCredit(
                text: '\tចំនួនក្រេឌីតសរុប',
                creditColor: UBGChartColor,
              ),
              buildHeight10(),
              buildTotalCredit(
                text: '\tចំនួនក្រេឌីតបានបំពេញ',
                creditColor: UPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Dialog Survey Card
Widget buildSurveyCard(final Function() onTap) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: UPdMg10),
    elevation: 1,
    color: UBackgroundColor,
    shadowColor: ULightGreyColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    child: InkWell(
      highlightColor: UTransParentColor,
      splashColor: UTransParentColor,
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(UPdMg10),
        child: Text(
          'សូមជួយធ្វើការវាយតម្លៃ'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: UBodySize,
            color: URedColor,
          ),
        ),
      ),
    ),
  );
}

// List of Survey inside Dialog Survey Card
Widget buildListSurvey(final Widget listView) {
  return Dialog(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(URoundedLarge),
    ),
    backgroundColor: UBackgroundColor,
    child: Container(
      margin: const EdgeInsets.all(UPdMg7),
      padding: const EdgeInsets.all(UPdMg10),
      decoration: const BoxDecoration(color: UBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'ការវាយតម្លៃ'.tr,
            style: const TextStyle(
              fontSize: UTitleSize,
              fontWeight: UTitleWeight,
            ),
          ),
          buildHeight10(),
          Text(
            'សូមជ្រើសរើសប្រភេទនៃការវាយតម្លៃ!!!'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: UBodySize,
            ),
          ),
          buildHeight15(),
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: UPdMg5),
            alignment: Alignment.center,
            child: listView,
          ),
        ],
      ),
    ),
  );
}

// Card of Gridview
Widget buildCustomCard({
  required final String image,
  name,
}) {
  return Container(
    padding: const EdgeInsets.only(left: UPdMg15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          scale: UScale6,
        ),
        buildHeight7(),
        Text(
          name,
          style: const TextStyle(fontSize: UTitleSize),
        )
      ],
    ),
  );
}
