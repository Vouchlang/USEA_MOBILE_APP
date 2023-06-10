import 'package:flutter/material.dart';
import '/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/President_Message.dart';
import '/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Recognition.dart';
import '/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Stucture.dart';
import '/Guest_Dashboard/Guest_AboutUS/UI_AboutUS/Vision.dart';
import '../UI_AboutUS/History.dart';

class AboutUS {
  late final String img, text;
  late final Widget screen;

  AboutUS({
    required this.img,
    required this.text,
    required this.screen,
  });
}

List<AboutUS> aboutUS = [
  AboutUS(
    img: 'assets/image/AUS_History.png',
    text: 'ប្រវត្តិ និងអត្ថន័យរបស់និមិត្តសញ្ញា',
    screen: History(),
  ),
  AboutUS(
    img: 'assets/image/AUS_Structure.png',
    text: 'រចនាសម្ព័ន្ធរបស់សាកលវិទ្យាល័យ',
    screen: Structure(),
  ),
  AboutUS(
    img: 'assets/image/AUS_President.png',
    text: 'សាររបស់សាកលវិទ្យាធិការ',
    screen: President(),
  ),
  AboutUS(
    img: 'assets/image/AUS_Vision.png',
    text: 'ចក្ខុវិស័យ បេសកកម្ម និងគុណតម្លៃ',
    screen: Vision(),
  ),
  AboutUS(
    img: 'assets/image/AUS_Recognition.png',
    text: 'ការទទួលស្គាល់',
    screen: Recognition(),
  ),
];
