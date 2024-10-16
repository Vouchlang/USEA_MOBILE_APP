import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../Guest_API.dart';
import '../../Class_AboutUS/Class_Recognition.dart';
import '/theme_builder.dart';
import '/Custom_AppBar.dart';
import '/Custom_Widget/CustomText.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Custom_Build_Recognition.dart';

class Recognition extends StatefulWidget {
  const Recognition({Key? key}) : super(key: key);

  @override
  State<Recognition> createState() => _RecognitionState();
}

class _RecognitionState extends State<Recognition> {
  late List<Class_Recognition> recognition = [];
  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: USecondaryColor,
      appBar: Custom_AppBar(title: 'ការទទួលស្គាល់'.tr),
      body: recognition.isEmpty ? buildFutureBuilder() : buildRecognition(),
    );
  }

  Future<void> getData() async {
    try {
      var res = await http.get(
        Uri.parse(
          Get.locale?.languageCode == 'km' ? APIGuestRecogKh : APIGuestRecogEn,
        ),
      );
      var r = json.decode(res.body);
      if (r is List<dynamic>) {
        recognition = r.map((e) => Class_Recognition.fromJson(e)).toList();
      } else {
        recognition = [Class_Recognition.fromJson(r)];
      }
    } catch (e) {
      print('Failed to fetch recognition: $e');
      // handle the error here
    } finally {
      if (mounted) {
        setState(
          () => isLoading = false,
        );
      }
    }
  }

  Widget buildRecognition() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: UPdMg15,
        horizontal: UPdMg10,
      ),
      children: [
        StaggeredGrid.count(
          crossAxisCount: 2,
          crossAxisSpacing: UPdMg5,
          mainAxisSpacing: UPdMg5,
          children: List.generate(
            recognition.length,
            growable: true,
            (index) {
              return buildRecognitionCard(
                image: recognition[index].image.isEmpty ? Image.asset(imageAsset + 'Error_Image.jpg') : CachedNetworkImage(imageUrl: recognition[index].image),
                title: recognition[index].title.isEmpty ? 'N/A' : recognition[index].title,
                btnNav: buildNavBtn(
                  onTap: () {
                    void _launchRecognitionUrl() async {
                      if (await canLaunchUrlString(
                        recognition[index].link,
                      )) {
                        await launchUrlString(
                          recognition[index].link,
                        );
                      } else {
                        throw 'Could not launch ${recognition[index].link}';
                      }
                    }

                    _launchRecognitionUrl();
                  },
                  text: 'អានបន្ថែម',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
