import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../../Class_AboutUS/Class_Vision.dart';

Widget buildVision() {
  return ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.only(bottom: UPdMg10),
    children: [
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: visionListData.length,
        itemBuilder: (BuildContext context, index) {
          return buildTitleVision(
            text1: visionListData[index].title,
            text2: visionListData[index].description,
          );
        },
      ),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: visionDetailData.length,
        itemBuilder: (BuildContext context, index) {
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
                buildTopBodyVision(visionDetailData[index].title),
                Container(
                  margin: const EdgeInsets.only(left: UPdMg12),
                  child: Column(
                    children: visionDetailData[index].detailData.map((data) {
                      return buildLowBodyVision(data.data);
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}

Widget buildTitleVision({
  required final String text1,
  text2,
}) {
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
          margin: const EdgeInsets.only(left: UPdMg12),
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

Widget buildTopBodyVision(final String text) {
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

Widget buildLowBodyVision(final String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: UPdMg10),
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
