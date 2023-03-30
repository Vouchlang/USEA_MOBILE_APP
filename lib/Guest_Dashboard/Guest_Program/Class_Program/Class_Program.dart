class Program_List {
  late final String image;
  late final String title;
  late final List<Program_List> majors;

  Program_List(
      {required this.image, required this.title, this.majors = const []});
}

final program_List = <Program_List>[
  Program_List(
      image: 'assets/image/f-economic.png',
      title: 'មហាវិទ្យាល័យសេដ្ឋកិច្ច ពាណិជ្ជកម្ម និងទេសចរណ៍',
      majors: [
        Program_List(image: 'assets/image/f-economic.png', title: 'ម៉ាឃីតធីង'),
        Program_List(image: 'assets/image/f-economic.png', title: 'គ្រប់គ្រង'),
      ]),
  Program_List(
      image: 'assets/image/f-it.png',
      title: 'មហាវិទ្យាល័យវិទ្យាសាស្ត្រ និងបច្ចេកវិទ្យា',
      majors: [
        Program_List(image: 'assets/image/f-it.png', title: 'ស្ថាបត្យកម្ម'),
        Program_List(image: 'assets/image/f-it.png', title: 'ព័ត៌មានវិទ្យា'),
        Program_List(
            image: 'assets/image/f-it.png', title: 'វិស្វកម្មសំណង់សុីវិល'),
      ]),
  Program_List(
      image: 'assets/image/f-law.png',
      title: 'មហាវិទ្យាល័យវិទ្យាសាស្ត្រសង្គម និងនីតិសាស្ត្រ',
      majors: [
        Program_List(image: 'assets/image/f-law.png', title: 'នីតិសាស្ត្រ'),
        Program_List(image: 'assets/image/f-law.png', title: 'រដ្ឋបាលសាធារណៈ'),
      ]),
  Program_List(
      image: 'assets/image/f-art.png',
      title: 'មហាវិទ្យាល័យសិល្បៈ មនុស្សសាស្ត្រ និងអប់រំ',
      majors: [
        Program_List(
            image: 'assets/image/f-art.png', title: 'អក្សរសាស្ត្រខ្មែរ'),
        Program_List(image: 'assets/image/f-art.png', title: 'ប្រវិត្តវិទ្យា'),
      ]),
  Program_List(
      image: 'assets/image/fli.png',
      title: 'មហាវិទ្យាល័យអន្តរជាតិ',
      majors: [
        Program_List(image: 'assets/image/fli.png', title: 'ACCA'),
      ]),
  Program_List(
      image: 'assets/image/f-internation-college.png',
      title: 'វិទ្យាស្ថានភាសាបរទេស',
      majors: [
        Program_List(
            image: 'assets/image/f-internation-college.png',
            title: 'បង្រៀនភាសាអង់គ្លេស'),
        Program_List(
            image: 'assets/image/f-internation-college.png',
            title: 'បកប្រែភាសាអង់គ្លេស'),
      ]),
  Program_List(
      image: 'assets/image/post-graduate.png',
      title: 'សាលាថ្នាក់ក្រោយបរិញ្ញាបត្រ',
      majors: [
        Program_List(
            image: 'assets/image/post-graduate.png',
            title: 'ថ្នាក់បរិញ្ញាបត្រជាន់ខ្ពស់'),
        Program_List(
            image: 'assets/image/post-graduate.png', title: 'ថ្នាក់បណ្ឌិត'),
      ]),
];
