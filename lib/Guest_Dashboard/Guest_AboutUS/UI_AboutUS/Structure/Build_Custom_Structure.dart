import 'package:flutter/material.dart';
import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../Build_Custom_AboutUS.dart';

// Structure
Widget buildStructure(final Function() onTap) {
  return ListView(
    physics: const ClampingScrollPhysics(),
    padding: const EdgeInsets.only(bottom: UPdMg10),
    children: [
      InkWell(
        highlightColor: UTransParentColor,
        splashColor: UTransParentColor,
        onTap: onTap,
        child: Image.asset(
          imageAsset + 'usea_structure.jpg',
          fit: BoxFit.cover,
        ),
      ),
      buildHeight10(),
      buildMessage(
        'USEA has the Board of Trustees governing the university for its final decision on academic and administrative matters. The President is the authority in the university assisted by Assistant to the Vice President, advisors, academic board, specialized committee and three Vice Presidents managing the assigned offices. USEA has the Board of Trustees governing the university for its final decision on academic and administrative matters. The President is the authority in the university assisted by Assistant to the Vice President, advisors, academic board, specialized committee and three Vice Presidents managing the assigned offices.',
      ),
    ],
  );
}
