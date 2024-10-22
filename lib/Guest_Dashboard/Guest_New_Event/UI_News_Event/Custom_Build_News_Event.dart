import 'package:flutter/material.dart';
import '../../../Custom_Widget/CustomText.dart';
import '../../../theme_builder.dart';

Widget buildEventDate(final String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: UBodySize10,
      fontWeight: UBodyWeight,
      color: UPrimaryColor,
    ),
  );
}

Widget buildCardContainer({
  required final Function() onTap,
  required final Widget cachedNetworkImage,
  required final String eventTitle,
  description,
  date,
  time,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: UPdMg10),
    child: Card(
      color: UBackgroundColor,
      margin: const EdgeInsets.only(bottom: UPdMg10),
      elevation: 1.5,
      shadowColor: ULightGreyColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(URoundedLarge),
      ),
      child: InkWell(
        highlightColor: UTransParentColor,
        splashColor: UTransParentColor,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(URoundedLarge),
                ),
                child: cachedNetworkImage,
              ),
            ),
            buildHeight5(),
            Container(
              padding: const EdgeInsets.fromLTRB(
                UPdMg10,
                UZeroPixel,
                UPdMg10,
                UPdMg10,
              ),
              child: Column(
                children: [
                  Container(
                    width: UFullWidth,
                    alignment: Alignment.center,
                    child: Text(
                      eventTitle,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: UTitleSize,
                        fontWeight: UTitleWeight,
                        fontFamily: UKFontFamily,
                        height: UTextHeight,
                      ),
                    ),
                  ),
                  buildHeight5(),
                  Container(
                    width: UFullWidth,
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: UBodySize,
                        fontWeight: UBodyWeight,
                        fontFamily: UKFontFamily,
                        height: UTextHeight,
                      ),
                    ),
                  ),
                  buildHeight5(),
                  Row(
                    children: [
                      buildEventFlexDateTime(
                        flex: 2,
                        image: imageAsset + 'Event_Date.png',
                        dateTime: buildEventDate(date),
                      ),
                      buildWidth10(),
                      buildEventFlexDateTime(
                        flex: 1,
                        image: imageAsset + 'Event_Time.png',
                        dateTime: buildEventDate(time),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget buildEventFlexDateTime({
  required final int flex,
  required final String image,
  required final Widget dateTime,
}) {
  return Flexible(
    flex: flex,
    child: Row(
      children: [
        Image.asset(
          image,
          width: UWidth15,
        ),
        buildWidth5(),
        dateTime,
      ],
    ),
  );
}
