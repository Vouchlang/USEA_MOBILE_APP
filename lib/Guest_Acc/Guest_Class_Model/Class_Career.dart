import 'package:flutter/material.dart';


class Career {
  late final String logo;
  late final String position;
  late final String organization;
  late final String link;


  Career({required this.logo, required this.position, required this.organization,  required this.link});
}

List<Career> career = [
  Career(
      logo:'assets/image/1.jpg',
      position: 'ជ្រើសរើសបុគ្គលិកផ្នែក Cashier',
      organization: 'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
      link: 'https://www.youtube.com/watch?v=x4uC3sl0cNk&t=92s'),
  Career(
      logo:'assets/image/2.jpg',
      position: 'ជ្រើសរើសបុគ្គលិកផ្នែក HR',
      organization: 'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
      link: 'https://www.usea.edu.kh/en/Pages/index.php#'),
  Career(
      logo:'assets/image/3.jpg',
      position: 'ជ្រើសរើសបុគ្គលិកផ្នែកលក់សៀវភៅ',
      organization: 'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
      link: 'https://www.usea.edu.kh/en/Pages/index.php#'),
  Career(
      logo:'assets/image/4.jpg',
      position: 'ជ្រើសរើសបុគ្គលិកផ្នែកថែសម្រស់',
      organization: 'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
      link: 'https://www.usea.edu.kh/en/Pages/index.php#'),
  Career(
      logo:'assets/image/5.jpg',
      position: 'ជ្រើសរើសបុគ្គលិកផ្នែកបោកខោអាវ',
      organization: 'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
      link: 'https://www.usea.edu.kh/en/Pages/index.php#'),
  Career(
      logo:'assets/image/6.jpg',
      position: 'ជ្រើសរើសបុគ្គលិកផ្នែកសម្អាតមនុស្ស',
      organization: 'សាកលវិទ្យាល័យ សៅស៍អុីសថ៍អេយសៀ',
      link: 'https://www.usea.edu.kh/en/Pages/index.php#'),
];