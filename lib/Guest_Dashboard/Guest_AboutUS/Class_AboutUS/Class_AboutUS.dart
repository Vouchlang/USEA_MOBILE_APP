import '../../../Custom_Widget/CustomText.dart';

class Class_AboutUS {
  late final String img, text;

  Class_AboutUS({
    required this.img,
    required this.text,
  });
}

final List<Class_AboutUS> about_US = [
  Class_AboutUS(
    img: imageAsset + 'AUS_History.png',
    text: 'ប្រវត្តិ និងអត្ថន័យរបស់និមិត្តសញ្ញា',
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_Structure.png',
    text: 'រចនាសម្ព័ន្ធរបស់សាកលវិទ្យាល័យ',
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_President.png',
    text: 'សាររបស់សាកលវិទ្យាធិការ',
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_Vision.png',
    text: 'ចក្ខុវិស័យ បេសកកម្ម និងគុណតម្លៃ',
  ),
  Class_AboutUS(
    img: imageAsset + 'AUS_Recognition.png',
    text: 'ការទទួលស្គាល់',
  ),
];
