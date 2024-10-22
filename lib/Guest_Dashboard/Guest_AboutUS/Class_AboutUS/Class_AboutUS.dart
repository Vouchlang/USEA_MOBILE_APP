import 'package:flutter/material.dart';
import '../UI_AboutUS/History_LogoMeaning/History.dart';
import '../UI_AboutUS/Presiden_Message/President_Message.dart';
import '../UI_AboutUS/Recognition/Recognition.dart';
import '../UI_AboutUS/Structure/Stucture.dart';
import '../UI_AboutUS/Vision/Vision.dart';
import '../../../Custom_Widget/CustomText.dart';

class Class_AboutUS {
  late final String img, text;
  late final Widget screen;

  Class_AboutUS({
    required this.img,
    required this.text,
    required this.screen,
  });
}

final List<Class_AboutUS> about_US = [
  Class_AboutUS(
    img: imageAsset + 'AUS_History.png',
    text: 'ប្រវត្តិ និងអត្ថន័យរបស់និមិត្តសញ្ញា',
    screen: const History(),
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_Structure.png',
    text: 'រចនាសម្ព័ន្ធរបស់សាកលវិទ្យាល័យ',
    screen: const Structure(),
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_President.png',
    text: 'សាររបស់សាកលវិទ្យាធិការ',
    screen: const President(),
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_Vision.png',
    text: 'ចក្ខុវិស័យ បេសកកម្ម និងគុណតម្លៃ',
    screen: const Vision(),
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_Recognition.png',
    text: 'ការទទួលស្គាល់',
    screen: const Recognition(),
  ),
];
