import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Custom_Widget/CustomText.dart';
import '/Custom_AppBar.dart';
import '/theme_builder.dart';
import '../Class_VDO/Class_Video.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Video_Display.dart';

class Video_UI extends StatefulWidget {
  const Video_UI({Key? key}) : super(key: key);

  @override
  State<Video_UI> createState() => _VideoState();
}

class _VideoState extends State<Video_UI> {
  List<VDO_Class> vdo = [];
  bool isLoading = true;

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.51/hosting_api/Guest/fetch_guest_vdo.php"),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        vdo = r.map((e) => VDO_Class.fromJson(e)).toList();
      } else {
        vdo = [
          VDO_Class.fromJson(r),
        ];
      }
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      if (mounted) {
        setState(
          () {
            isLoading = false;
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'វីដេអូ'.tr),
      body: vdo.isEmpty
          ? Center(
              child: FutureBuilder<void>(
                future: Future.delayed(Duration(seconds: 3)),
                builder: (context, snapshot) =>
                    snapshot.connectionState == ConnectionState.done
                        ? Text('No Data')
                        : CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: vdo.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Video_Display(
                              data: vdo[index],
                              vdo: vdo,
                            )),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        vdo[index].youtube_thumbnail),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  buildListText(
                                      vdo[index].title, 3, UTitleSize),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  buildListText(vdo[index].caption, 1, 10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
