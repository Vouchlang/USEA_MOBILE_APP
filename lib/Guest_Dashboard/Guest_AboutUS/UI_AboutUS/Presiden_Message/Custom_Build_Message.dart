import 'package:flutter/material.dart';

import '../../../../Custom_Widget/CustomText.dart';
import '../../../../theme_builder.dart';
import '../Build_Custom_AboutUS.dart';

// President Message
Widget buildPresidentMessageData(final Function() onTap) {
  return ListView(
    physics: const ClampingScrollPhysics(),
    children: [
      InkWell(
        highlightColor: UTransParentColor,
        splashColor: UTransParentColor,
        onTap: onTap,
        child: Image.asset(
          imageAsset + 'president.png',
          fit: BoxFit.fitHeight,
        ),
      ),
      buildMessage(
        "On behalf of the University of South-East Asia, would like to express my profound gratitude and warm welcome to Your Excellencies, Ladies, and Gentlemen for sending your children to our university.\nThe world is growing so fast in terms of science, technology, and economy that the labour market is becoming increasingly competitive and thus requires practical knowledge, experience, and skills. The university plays a vital role in developing human resources with high competency, morality, virtue, conscience, discipline, and courage to meet the national and international labour market needs and demands and to fully participate in social development in line with globalization and free market economy.\nTo achieve the aforementioned goals, the university keeps strengthening seven fundamental factors: management, curricula, teaching staff, studentaffairs, discipline, academic resources, and local and international partnerships.\nI would like to inform you that your children have not yet finished their education; they need to pursue tertiary education in order to acquire knowledge, experience, and skills to respond to the labour market needs now and in the future. Please check a university thoroughly before choosing it for your children, for it is associated with your children's future. I suggest you all, the students who have already chosen the university, study hard to become outstanding students so as to bring good reputation to your parents and become good successors for your family as well as your country.",
      ),
    ],
  );
}
