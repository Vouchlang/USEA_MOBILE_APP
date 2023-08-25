import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import '/theme_builder.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ប្រវត្តិ និងអត្ថន័យរបស់និមិត្តសញ្ញា'.tr),
      body: Container(
        width: UFullWidth,
        height: UFullWidth,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 200,
                width: UFullWidth,
                color: UGreyColor,
                child: Image.asset(
                  'assets/image/usea_building.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(UPdMg_10),
                child: Text(
                  'The University of South-East Asia was established on July 7, 2006 by four dedicated Cambodian shareholders in response to the government educational development program of  building and enhancing  human resources  through higher education. It is located in Siem Reap province, Cambodia and about 314 km from Phnom Penh, the capital city of Cambodia. Siem Reap province is one of the important economic regions in Cambodia. Because it is rich in ancient temples and other resorts that attract local and international visitors. USEA was recognized by the Royal Government of Cambodia and operating through Sub-decree No. 63 duly signed by his Excellency Prime Minister Hun Sen. The Ministry of Education, Youth and Sports (MoEYS) recognized USEA by issuing Prakas No. 802 dated 09 July 2007.  USEA gained its double accreditation in 2006-2009 and 2010-13 granted by the Accreditation Committee of Cambodia (ACC).  USEA had its first enrollment of 600 bachelor students and at present with  a total enrollment of 2,980.  The enrollment in the undergraduate program is 2,780 and 200 in the MBA program. The top three faculties are: Faculty of Business and Tourism, Faculty of Art, Humanities and Languages and Faculty of Science and Technology. The graduate rate of employment is 95%.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: UTitleSize,
                    fontFamily: UEFontFamily,
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.all(UPdMg_10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset('assets/image/logo1.png'),
                    ),
                    Expanded(
                      child: Image.asset('assets/image/logo2.png'),
                    ),
                    Expanded(
                      child: Image.asset('assets/image/logo3.png'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                    UPdMg_10, UZeroPixel, UPdMg_10, UPdMg_10),
                child: Column(
                  children: [
                    buildHistory(
                      'The picture of the golden rice panicles around the circle symbolizes the university’s strength, development and sustainability.',
                    ),
                    buildHistory(
                      'The dark blue phrases written in both Khmer and English around the circle and the word USEA with the light blue color on the book symbolize the name of the University of South-East Asia.',
                    ),
                    buildHistory(
                      'The picture of the light blue globe inside the circle represents fame, national and international recognition, and regional and global integration.',
                    ),
                    buildHistory(
                      'The pictures of the blue hat and spearhead on the book symbolize high quality education and research, resulting in excellent leadership with professional ethics, creativity, social understanding, and commitment to promoting national. ',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
