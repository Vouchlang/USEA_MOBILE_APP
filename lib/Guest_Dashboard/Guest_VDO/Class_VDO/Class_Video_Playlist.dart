class Video_PlayList {
  late final String youtube_thumbnail;
  late final String title;
  late final String caption;
  late final String link;

  Video_PlayList(
      {required this.youtube_thumbnail,
      required this.title,
      required this.caption,
      required this.link});
}

List<Video_PlayList> video_playlist = [
  Video_PlayList(
      youtube_thumbnail:
          'https://i.ytimg.com/vi/HmA1WGoDi30/hqdefault.jpg?sqp=-oaymwE2COADEI4CSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgBuAiAAtAFigIMCAAQARhlIFQoSjAP&rs=AOn4CLBiWKXRLIuQiGQLnfFpkEbaNyUMXw',
      title:
          'សកម្មភាពនៃការចុះកម្មសិក្សាបង្រៀននិស្សិតថ្នាក់បរិញ្ញាបត្រ មុខជំនាញបង្រៀនភាសាអង់គ្លេស',
      caption:
          'សកម្មភាពនៃការចុះកម្មសិក្សាបង្រៀននិស្សិតថ្នាក់បរិញ្ញាបត្រ មុខជំនាញបង្រៀនភាសាអង់គ្លេស',
      link: 'https://www.youtube.com/watch?v=HmA1WGoDi30'),
  Video_PlayList(
      youtube_thumbnail:
          'https://i.ytimg.com/vi/HmA1WGoDi30/hqdefault.jpg?sqp=-oaymwE2COADEI4CSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgBuAiAAtAFigIMCAAQARhlIFQoSjAP&rs=AOn4CLBiWKXRLIuQiGQLnfFpkEbaNyUMXw',
      title: 'វីដេអូទាក់ទងនឹងការចុះឈ្នោះចូលរៀនថ្នាក់បរិញ្ញបត្រ',
      caption: 'វីដេអូទាក់ទងនឹងការចុះឈ្នោះចូលរៀនថ្នាក់បរិញ្ញបត្រ',
      link: 'https://www.youtube.com/watch?v=HmA1WGoDi30'),
];
