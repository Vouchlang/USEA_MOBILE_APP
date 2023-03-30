import 'package:flutter/material.dart';
import 'package:get/get.dart';

class President extends StatefulWidget {
  const President({Key? key}) : super(key: key);

  @override
  State<President> createState() => _PresidentState();
}

class _PresidentState extends State<President> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF5F5F7FE),
        appBar: AppBar(
          centerTitle: false,
          title: Text('សាររបស់សាកលវិទ្យាធិការ'.tr,
              style: TextStyle(
                color: Colors.indigo[900],
                fontSize: 16,
                fontFamily: 'KhmerOSbattambang',
                fontWeight: FontWeight.w600,
              )),
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData.fallback(),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo[900],
              size: 15,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          height: double.infinity,
          child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 200,
                  child: Image.asset(
                    'assets/image/president.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      'On behalf of the University of South-East Asia, would like to express my profound gratitude and warm welcome to Your Excellencies, Ladies, and Gentlemen for sending your children to our university.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 10, fontFamily: 'Poppins')),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      'The world is growing so fast in terms of science, technology, and economy that the labour market is becoming increasingly competitive and thus requires practical knowledge, experience, and skills. The university plays a vital role in developing human resources with high competency, morality, virtue, conscience, discipline, and courage to meet the national and international labour market needs and demands and to fully participate in social development in line with globalization and free market economy.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 10, fontFamily: 'Poppins')),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                      'To achieve the aforementioned goals, the university keeps strengthening seven fundamental factors: management, curricula, teaching staff, studentaffairs, discipline, academic resources, and local and international partnerships.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 10, fontFamily: 'Poppins')),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Text(
                      "I would like to inform you that your children have not yet finished their education; they need to pursue tertiary education in order to acquire knowledge, experience, and skills to respond to the labour market needs now and in the future. Please check a university thoroughly before choosing it for your children, for it is associated with your children's future. I suggest you all, the students who have already chosen the university, study hard to become outstanding students so as to bring good reputation to your parents and become good successors for your family as well as your country.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 10, fontFamily: 'Poppins')),
                )
              ],
            ),
        ));
  }
}
