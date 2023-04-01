import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Custom_AppBar.dart';

class Structure extends StatefulWidget {
  const Structure({Key? key}) : super(key: key);

  @override
  State<Structure> createState() => _StructureState();
}

class _StructureState extends State<Structure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xF5F5F7FE),
        appBar: Custom_AppBar(title: 'រចនាសម្ព័ន្ធរបស់សាកលវិទ្យាល័យ'.tr),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset('assets/image/usea_structure.jpg', fit: BoxFit.cover,),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                    'USEA has the Board of Trustees governing the university for its final decision on academic and administrative matters. The President is the authority in the university assisted by Assistant to the Vice President, advisors, academic board, specialized committee and three Vice Presidents managing the assigned offices. USEA has the Board of Trustees governing the university for its final decision on academic and administrative matters. The President is the authority in the university assisted by Assistant to the Vice President, advisors, academic board, specialized committee and three Vice Presidents managing the assigned offices.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14, fontFamily: 'Poppins')),
              )
            ],
          ),
        ));
  }
}
