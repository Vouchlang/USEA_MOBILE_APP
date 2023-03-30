class Contact {
  late final String icon;
  late final String text;
  late final String link;

  Contact({required this.icon, required this.text, required this.link});
}

List<Contact> contact = [
  Contact(
    icon: 'assets/image/Con_Email.png',
    text: 'info@usea.edu.kh',
    link: '',
  ),
  Contact(icon: 'assets/image/Con_Tel.png', text: '097 405 540', link: ''),
  Contact(icon: 'assets/image/Con_Tel.png', text: '027 408 438', link: ''),
  Contact(icon: 'assets/image/Con_Tel.png', text: '095 99 44 93', link: ''),
  Contact(
      icon: 'assets/image/Con_Tele.png',
      text: 'ចូលឆានែលតេឡេក្រាមរបស់សកលវិទ្យាល័យ',
      link: 'https://t.me/university_of_south_east_asia'),
  Contact(
      icon: 'assets/image/Con_Loc.png',
      text:
          'ភូមិវត្តបូព៌ សង្កាត់សាលាកំរើក ស្រុកសៀមរាប ខេត្តសៀមរាប​ ព្រះរាជាណាចក្រកម្ពុជា (ទល់មុខវិទ្យាល័យអង្គរ)។',
      link: ''),
];
