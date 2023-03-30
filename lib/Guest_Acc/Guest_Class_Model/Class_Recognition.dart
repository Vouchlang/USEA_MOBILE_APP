import 'package:flutter/material.dart';

class Recognition {
  late final String image;
  late final String description;
  late final String link;

  Recognition(
      {required this.image, required this.description, required this.link});
}

List<Recognition> recognition = [
  Recognition(
      image: 'assets/image/recognition1.jpg',
      description:
          'Goverment There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,',
      link: 'https://www.usea.edu.kh/en/Pages/recognition.php'),
  Recognition(
      image: 'assets/image/recognition2.jpg',
      description:
          'Goverment There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,',
      link: 'https://www.usea.edu.kh/en/Pages/recognition.php'),
  Recognition(
      image: 'assets/image/recognition2.jpg',
      description:
      'Goverment There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,',
      link: 'https://www.usea.edu.kh/en/Pages/recognition.php'),
];
