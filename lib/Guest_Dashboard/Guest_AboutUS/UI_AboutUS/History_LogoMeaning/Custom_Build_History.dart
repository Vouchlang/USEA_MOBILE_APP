import 'package:flutter/material.dart';
import '../../Class_AboutUS/Class_History.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';

Widget buildHistoryData(final Function() onTap) {
  return InkWell(
    highlightColor: UTransParentColor,
    splashColor: UTransParentColor,
    onTap: onTap,
    child: Container(
      height: 200,
      width: UFullWidth,
      color: UGreyColor,
      child: Image.asset(
        imageAsset + 'usea_building.jpg',
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget buildHistoryData1() {
  return Container(
    margin: const EdgeInsets.all(UPdMg10),
    child: const Text(
      'The University of South-East Asia was established on July 7, 2006 by four dedicated Cambodian shareholders in response to the government educational development program of  building and enhancing  human resources  through higher education. It is located in Siem Reap province, Cambodia and about 314 km from Phnom Penh, the capital city of Cambodia. Siem Reap province is one of the important economic regions in Cambodia. Because it is rich in ancient temples and other resorts that attract local and international visitors. USEA was recognized by the Royal Government of Cambodia and operating through Sub-decree No. 63 duly signed by his Excellency Prime Minister Hun Sen. The Ministry of Education, Youth and Sports (MoEYS) recognized USEA by issuing Prakas No. 802 dated 09 July 2007.  USEA gained its double accreditation in 2006-2009 and 2010-13 granted by the Accreditation Committee of Cambodia (ACC).  USEA had its first enrollment of 600 bachelor students and at present with  a total enrollment of 2,980.  The enrollment in the undergraduate program is 2,780 and 200 in the MBA program. The top three faculties are: Faculty of Business and Tourism, Faculty of Art, Humanities and Languages and Faculty of Science and Technology. The graduate rate of employment is 95%.',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: UTitleSize,
        fontFamily: UEFontFamily,
        height: UTextHeight,
      ),
    ),
  );
}

Widget buildRowImage() {
  return Container(
    height: 100,
    margin: const EdgeInsets.all(UPdMg10),
    child: Row(
      children: [
        for (var index = 0; index < getClassHistoryLogo.length; index++)
          Expanded(
            child: Image.asset(getClassHistoryLogo[index].logo),
          ),
      ],
    ),
  );
}

Widget buildColumnHistoryData() {
  return Container(
    margin: const EdgeInsets.fromLTRB(
      UPdMg10,
      UZeroPixel,
      UPdMg10,
      UPdMg10,
    ),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getClassHistoryDetail.length,
      itemBuilder: (BuildContext context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset(
                imageAsset + 'dot.png',
                width: UWidth5,
              ),
              margin: const EdgeInsets.only(top: UPdMg10),
            ),
            buildWidth5(),
            Expanded(
              child: Text(
                getClassHistoryDetail[index].data,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: UTitleSize,
                  fontFamily: UEFontFamily,
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
