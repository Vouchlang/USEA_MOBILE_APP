import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        appBar: AppBar(
          centerTitle: false,
          title: Text('រចនាសម្ព័ន្ធរបស់សាកលវិទ្យាល័យ'.tr,
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
                    style: TextStyle(fontSize: 10, fontFamily: 'Poppins')),
              )
            ],
          ),
        ));
  }
}
